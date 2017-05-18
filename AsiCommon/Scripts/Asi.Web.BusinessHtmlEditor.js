// ###########################################################
// JavaScript functions necessary for use with 
// Asi.Web.UI.WebContols.BusinessHtmlEditor
// ###########################################################

function OnHTMLEditorClientLoad(editor, args) {
    // The first function here is to avoid inserting tabs into HTML editor controls. For 
    // accessibility we want to be able to tab through to the text entry field to get to
    // the next field.
    // This approach from http://www.telerik.com/community/forums/aspnet-ajax/editor/radeditor-tab-key-focus-on-another-control-in-firefox-while-in-ie-it-inserts-whitespace.aspx
    // The idea is, if a tab is pressed, force browsers that do not support the "removeShortCut" code below to ignore a tab in the HTML editor 
    // and focus on the next PanelFieldValue control that can receive focus below the editor.

    editor.attachEventHandler("onkeydown", function (event) {
        var key = event.keyCode ? event.keyCode : event.which;
        if (key == '9') {
            //This editor is contained in an IFrame so need to find it within the document
            var searchBody = jQuery(event.target).closest("body");
            var frames = document.getElementsByTagName("iframe");
            for (var i = 0; i < frames.length; i++) {
                if (jQuery(frames[i].contentWindow.document.body).is(searchBody)) {
                    //This is the IFrame of interest so find its containing PanelFieldValue
                    var closestPanelFieldValue = jQuery(frames[i]).closest(".PanelFieldValue");
                    //Find the index of the closestPanelFieldValue within the entire document
                    var indexOfClosestPanelFieldValue = jQuery(".PanelFieldValue").index(closestPanelFieldValue);
                    //Find the next PanelFieldValue in the document that contains a control that we can set focus on
                    var panelFieldValues = jQuery(".PanelFieldValue");
                    //If this isn't the last PanelFieldValue on the page the look for the next one with a control we can set focus
                    if (indexOfClosestPanelFieldValue < panelFieldValues.length) {
                        //Start searching, begining with the very next PanelFieldValue to the last one on the page
                        for (var j = indexOfClosestPanelFieldValue + 1; j < panelFieldValues.length; j++) {
                            //Get the controls that could accept focus
                            var valueControls = jQuery(panelFieldValues[j]).find('input[type=text], input[type=radio], input[type=checkbox], textarea');
                            if (valueControls != null && valueControls.length > 0) {
                                //Get the first visible control (tried to filter using :visble above but it didn't work so doing this way)
                                for (var k = 0; valueControls.length; k++) {
                                    var control = valueControls[k];
                                    if ((control.style == undefined || control.style['visibility'] == undefined || control.style['visibility'] != 'hidden') &&
                                        (control.style == undefined || control.style['display'] == undefined || control.style['display'] != 'none') &&
                                        (control.css == undefined || control.css['display'] == undefined || control.css['display'] != 'none')) {
                                        //Found a PanelFieldValue that has a visible control we can set focus on
                                        $telerik.cancelRawEvent(event); //Cancel further execution of the event
                                        control.focus();
                                        return false;
                                    }
                                }
                            }
                        }
                    }
                }
            }
            return true;
        }
    });
    editor.removeShortCut("InsertTab");
    // RadEditor rendering depends on the initially set wrapper element and its position in the DOM. In scenarios where the editor 
    // is moved or appended dynamically or initially hidden, Telerik recommends further customization by calling this method.
    editor.onParentNodeChanged();
}

function HTMLEditorSetupInsertContentLink(fileUploadAllowed) {
    if (fileUploadAllowed == null)
        fileUploadAllowed = true;
    else
        fileUploadAllowed = (fileUploadAllowed.toLowerCase() === 'true');

    var isIE;
    //for Internet Explorer versions prior to version 10
    /*@cc_on
        isIE = @_jscript_version;
    @*/
    //for Internet Explorer 10 and Internet Explorer 11
    if (!isIE) {
        isIE = !!window.MSStream;
    }

    // This function is to hook up the custom "InsertContentLink" to open the link insert 
    // window and handle the return value.
    Telerik.Web.UI.Editor.CommandList["InsertContentLink"] = function(commandName, editor, args) {
        var elem = editor.getSelectedElement(); //returns the selected element.
        var cursorPosition = (isIE) ? editor.getSelection().getRange() : undefined; //store cursor position for IE issues

        if (elem == null) return;
        if (elem.tagName == "A") {
            editor.selectElement(elem);
            argument = elem;
        } else {
            //remove links if present from the current selection - because of JS error thrown in IE
            editor.fire("Unlink");

            //remove Unlink command from the undo/redo list
            var commandsManager = editor.get_commandsManager();
            var commandIndex = commandsManager.getCommandsToUndo().length - 1;
            commandsManager.removeCommandAt(commandIndex);
            var content = editor.getSelectionHtml();
            var link = editor.get_document().createElement("A");
            link.innerHTML = content;
            argument = link;
        }

        var callbackFunction = function(sender, args) {
            var linkUrl = args._argument;
            if (linkUrl != null && linkUrl.attributes != undefined) {
                var hrefString = linkUrl.getAttribute("href");
                if (hrefString) {
                    if (hrefString.toLowerCase().indexOf("www") == 0) {
                        hrefString = "http://" + hrefString;
                    }
                    if (hrefString.indexOf("@/") == 0) {
                        var websiteUrl = linkUrl.websiteUrl;
                        if (websiteUrl != null) {
                            hrefString = websiteUrl + "/" + hrefString.substring(2).replace(".aspx", "") + ".aspx";
                        } else {
                            hrefString = "[@]" + hrefString.substring(2).replace(".aspx", "") + ".aspx";
                        }
                    }
                    if (hrefString.indexOf("~/") >= 0) {
                        //Do this for a shortcut
                        var websiteSelectedUrl = linkUrl.websiteUrl;
                        if (websiteSelectedUrl != null) {
                            hrefString = websiteSelectedUrl + "/" + hrefString.substring(2);
                        }
                    }
                } else {
                    hrefString = "http://";
                }

                if (hrefString.indexOf("?") >= 0 && linkUrl.qsParam != "" && linkUrl.qsParam != null) {
                    if (linkUrl.sourceCode != "" && linkUrl.sourceCode != null)
                        hrefString = String.format("{0}&amp;{1}&amp;SourceCode={2}", hrefString, linkUrl.qsParam, linkUrl.sourceCode);
                    else
                        hrefString = String.format("{0}&amp;{1}", hrefString, linkUrl.qsParam);
                } else if (linkUrl.qsParam != "" && linkUrl.qsParam != null) {
                    if (linkUrl.sourceCode != null && linkUrl.sourceCode != "")
                        hrefString = String.format("{0}?{1}&amp;SourceCode={2}", hrefString, linkUrl.qsParam, linkUrl.sourceCode);
                    else {
                        hrefString = String.format("{0}?{1}", hrefString, linkUrl.qsParam);
                    }
                } else {
                    if (linkUrl.sourceCode != null && linkUrl.sourceCode != "") {
                        if (hrefString.indexOf("?") >= 0) {
                            hrefString = String.format("{0}&amp;SourceCode={1}", hrefString, linkUrl.sourceCode);
                        } else {
                            hrefString = String.format("{0}?SourceCode={1}", hrefString, linkUrl.sourceCode);
                        }
                    } else
                        hrefString = String.format("{0}", hrefString);
                }

                if (isIE)
                    editor.getSelection().selectRange(cursorPosition); //restore cursor position 
                //args.href
                var html = String.format("<a href='{0}' class='{1}'>{2}</a> ", hrefString, linkUrl.className, linkUrl.name);
                editor.pasteHtml(html);
            }
        };
   
        //open the dialog--do not use the editor's showExternalDialog method, it doesn't play nice w/our dialogs when using +1 times
        ShowDialog(gWebRoot + '/AsiCommon/controls/ContentManagement/ContentDesigner/ContentLinkDialog.aspx?ShowTypes="y"&FileUploadAllowed=' + fileUploadAllowed + '&', argument,
            800, 500, 'Insert a link to content', null, "E", callbackFunction, null, true, true, null, null);
    };
}