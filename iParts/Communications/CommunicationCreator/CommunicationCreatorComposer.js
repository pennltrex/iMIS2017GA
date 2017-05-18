function Asi_Web_iParts_Communications_CommunicationCreator_Composer(
                                                            iPartContainerId,
                                                            url,
                                                            sendEmailButtonId,
                                                            saveCommunicationButtonId,
                                                            saveAsCommunicationButtonId,
                                                            loadCommunicationButtonId,
                                                            documentPathHiddenId,
                                                            documentFileHiddenId,
                                                            documentIdHiddenId,
                                                            attachmentKeyHiddenId,
                                                            attachmentPathHiddenId,
                                                            attachmentFileTypeHiddenId,
                                                            attachmentRunOnceHiddenId,
                                                            attachmentListId,
                                                            clientId,
                                                            attachmentNameHiddenId
                                                            ) {

    // constructor

    var self = this;
    jQuery(function () { OnLoad(); });

    // used for disabling enter key for form submit on email address fields (make them press one of the buttons)
    window.disableEnterKey = function disableEnterKey(sender, event) {
        if (event.keyCode === 13) {
            event.preventDefault();
            event.stopPropagation();
        }
    }


    this.ContentHtmlEditor = null;

    this.OpenConfirmation = function () {
        var dialog = ShowDialog(url + 'Confirmation.aspx', null, 550, 200, 'Communication Suite', null, 'E', null, null, false, true, self.Confirmation_OnClose, null);
        // set the dialog to destroy on close
        // this is important for multiple reasons
        // 1. So the events don't stack up each subsequent time you open it.
        //    i.e. on the second opening, the close event would be called twice, 3rd opening 3 times etc
        // 2. So the return value is cleared
        dialog.set_destroyOnClose(true);
    };

    this.OpenPreview = function () {
        var dialog = ShowDialog(url + 'CommunicationPreview.aspx', null, 800, 500, 'Communication Preview', null, 'E', null, null, false, true, self.Close_Preview, null);
        // remove the reload feature until we can resolve the 19 postbacks issue
        dialog.set_behaviors(Telerik.Web.UI.WindowBehaviors.Close + Telerik.Web.UI.WindowBehaviors.Resize + Telerik.Web.UI.WindowBehaviors.Maximize + +Telerik.Web.UI.WindowBehaviors.Move);
        dialog.set_destroyOnClose(true);
    };

    this.Confirmation_OnClose = function (dialogWindow) { };

    this.InsertPlaceHolder = function (commandName, editor, args) {
        editor.pasteHtml(args.get_value());
    };

    this.InsertLinksDropDown = function (commandName, editor, args) {
        // Which kind of link are we trying to add?
        switch (args.get_value()) {
            case 'CommunicationPreferencesLink':
                SaveCursorPosition();
                var dialog = ShowDialog(url + 'CommunicationLinkEdit.aspx', null, 800, 500, 'Communication Preferences Link', null, 'E', null, null, false, true, self.Close_InsertPreferencesLink, null);
                dialog.set_destroyOnClose(true);
                break;
            case 'ContentOrURL':
                ShowInsertLinkDialog(editor);
                break;
            default:
                alert("Valid Insert Link option not received.");
                break;
        }
    };

    function ShowInsertLinkDialog(editor) {
        var elem = editor.getSelectedElement(); //returns the selected element.
        var cursorPosition = editor.getSelection().getRange();//store cursor position for IE issues

        if (elem == null) return;
        if (elem.tagName == "A") {
            editor.selectElement(elem);
            argument = elem;
        }
        else {
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

        var callbackFunction = (function (sender, args) {
            var linkUrl = args._argument;
            var hrefString;
            if (linkUrl != null && linkUrl.attributes != undefined) {
                hrefString = linkUrl.getAttribute("href");
                if (hrefString) {
                    if (hrefString.toLowerCase().indexOf("www") == 0) {
                        hrefString = "http://" + hrefString;
                    }
                    if (hrefString.indexOf("@/") == 0) {
                        hrefString = hrefString.replace("@/", "").replace(".aspx", "") + ".aspx";;

                        var websiteUrl = linkUrl.websiteUrl;
                        if (websiteUrl != null) {
                            hrefString = websiteUrl + "/" + hrefString;
                        }
                    }
                    if (hrefString.indexOf("~/") == 0) {
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

                editor.getSelection().selectRange(cursorPosition); //restore cursor position 

                var html = String.format("<a href='{0}' class='{1}'>{2}</a> ", hrefString, linkUrl.className, linkUrl.name);
                editor.pasteHtml(html);
            }
        });

        //open the dialog--do not use the editor's showExternalDialog method, it doesn't play nice w/our dialogs when using +1 times
        ShowDialog(gWebRoot + '/AsiCommon/controls/ContentManagement/ContentDesigner/ContentLinkDialog.aspx?LinksAreRelative=false', argument,
                800, 500, 'Insert a link to content', null, "E", callbackFunction, null, true, true, null, null);
    };

    this.SaveCommunication = function (commandName, editor, args, WindowTitle) {

        // if we are doing a save as, then prompt for a path
        if (this.IsSaveAs) {
            var dialog = OpenObjectBrowserSized("Mode=SelectContainer&ShowFilename=true&TypeFilter=COM&iRootFolder=" + this.DocumentRoot + "&DocumentPath=" + this.DocumentRoot, ObjectBrowserClose_Save, true, true, null, 800, 600, false, WindowTitle);
            // essential to destroy on close or return values wont be accurate if we close
            dialog.set_destroyOnClose(true);
        } else {
            Save("", "");
        }
    };

    this.SaveAsCommunication = function (commandName, editor, args, WindowTitle) {
        var dialog = OpenObjectBrowserSized("Mode=SelectContainer&ShowFilename=true&TypeFilter=COM&iRootFolder=" + this.DocumentRoot + "&DocumentPath=" + this.DocumentRoot, ObjectBrowserClose_SaveAs, true, true, null, 800, 600, false, WindowTitle);
        // essential to destroy on close or return values wont be accurate if we close
        dialog.set_destroyOnClose(true);
    };

    this.LoadCommunication = function (commandName, editor, args, WindowTitle) {
        var dialog = OpenObjectBrowser("TypeFilter=COM&iRootFolder=" + this.DocumentRoot + "&DocumentPath=" + this.DocumentRoot, ObjectBrowserClose_Load, true, true, null, WindowTitle);
        // essential to destroy on close or return values wont be accurate if we close
        dialog.set_destroyOnClose(true);

    };

    this.AddAttachmentPopup = function (WindowTitle) {
        OpenObjectBrowser('DocumentPath=$&iShowFolderTree=1&iAllowUpwardNavigation=1&AllowMultiSelect=false&ShowMenu=true&iTypeFilter=RDL,PDF', BSABrowserCallback, null, null, null, WindowTitle);
    };

    this.Close_Preview = function (dialogWindow) {
        if (typeof (dialogWindow.AsiResults) == 'undefined') return;
        if (dialogWindow.AsiResults.Action == "SendEmails") {
            $get(sendEmailButtonId).click();
        }
    };

    this.Close_InsertPreferencesLink = function (dialogWindow) {
        if (typeof (dialogWindow.AsiResults) == 'undefined') return; // dialogWindow is a reference to the Radwindow, and AsiResults is a variable in that window
        if ((dialogWindow.AsiResults.CommunicationPreferencesLink !== 'undefined')
            && (dialogWindow.AsiResults.CommunicationPreferencesLink != null)) {
            // Insert value into the page
            RestoreCursorPosition();
            self.ContentHtmlEditor.pasteHtml(dialogWindow.AsiResults.CommunicationPreferencesLink);
        }
    };

    this.IsSaveAs = true;

    this.DocumentRoot = "$/";

    this.BuildAttachmentTable = function () {

        // get the rows from the table
        var tableRows = document.getElementById(attachmentListId).rows.length;
        var fileNames = document.getElementById(attachmentNameHiddenId).value.split(";");

        // reset count
        Asi_Web_iParts_Communications_CommunicationCreator_rowCount = fileNames.length - 1;

        if (tableRows == fileNames.length) return;

        // rebuild table from hidden data
        if (tableRows > 1) {
            for (var i = 1; i < tableRows; i++) {
                jQuery("#" + clientId + "Attachment_Row_" + i).remove();
            }
        }

        // get the other values
        var fileRunOnce = document.getElementById(attachmentRunOnceHiddenId).value.split(";");
        var fileType = document.getElementById(attachmentFileTypeHiddenId).value.split(";");

        // reset count
        Asi_Web_iParts_Communications_CommunicationCreator_rowCount = 0;

        // add rows
        for (var i = 1; i < fileNames.length; i++) {
            AddRow(fileRunOnce[i], fileNames[i], fileType[i]);
        }

        // display attachment table header only if there is more than one table row
        DisplayAttachmentTableHeader();
    };
    this.BuildAttachmentTable();

    this.DeleteAttachmentAndRebuildTable = function (id) {

        var keyControl = document.getElementById(attachmentKeyHiddenId);
        var pathControl = document.getElementById(attachmentPathHiddenId);
        var fileTypeControl = document.getElementById(attachmentFileTypeHiddenId);
        var runOnceControl = document.getElementById(attachmentRunOnceHiddenId);
        var nameControl = document.getElementById(attachmentNameHiddenId);

        var keys = keyControl.value.split(";");
        var paths = pathControl.value.split(";");
        var types = fileTypeControl.value.split(";");
        var runOnces = runOnceControl.value.split(";");
        var names = nameControl.value.split(";");

        keyControl.value = "";
        pathControl.value = "";
        fileTypeControl.value = "";
        runOnceControl.value = "";
        nameControl.value = "";

        if (keys.length > 1) {
            for (var i = 1; i < keys.length; i++) {
                if (i != id) {
                    keyControl.value += ";" + keys[i];
                    pathControl.value += ";" + paths[i];
                    fileTypeControl.value += ";" + types[i];
                    runOnceControl.value += ";" + runOnces[i];
                    nameControl.value += ";" + names[i];
                }
            }
        }

        // rebuild table
        this.BuildAttachmentTable();
    }
    // private

    function OnLoad() {
        jQuery(window).resize(Window_OnResize);

        jQuery(window).bind("load", function () {
            Window_OnResize();
        });

        // display attachment table header only if there is more than one table row
        DisplayAttachmentTableHeader();
    }

    function Window_OnResize() {
        if (self.ContentHtmlEditor == null) return;
        RadEditorSetSize();
    }

    function ObjectBrowserClose_Save(result) {
        // the only way to test for a cancel/close is to check for the existance of a property
        // GetFullPath(result.SelectedDocumentPath);
        if (typeof result.Filename !== "undefined") {
            // check a filename was specified
            if (result.SelectedDocumentPath.length == 0 || result.Filename.length == 0) {
                alert("You did not specify a name. This Communication was not saved.");
                return;
            }
            Save(GetRootedPath(result.SelectedDocumentPath), result.Filename);
        }
    }

    function ObjectBrowserClose_SaveAs(result) {
        // the only way to test for a cancel/close is to check for the existance of a property
        if (typeof result.Filename !== "undefined") {
            // check a filename was specified
            if (result.SelectedDocumentPath.length == 0 || result.Filename.length == 0) {
                alert("You did not specify a name. This Communication was not saved.");
                return;
            }

            //we only need the directory path selected and not the file selected which ObjectBrowser2.js appends to the path 
            if (result.UserSelectedAPathAndFile) {
                result.SelectedDocumentPath = result.SelectedDocumentPath.substring(0, result.SelectedDocumentPath.length - result.SelectedDocumentName.length);
            }

            SaveAs(GetRootedPath(result.SelectedDocumentPath), result.Filename);
        }
    }

    function ObjectBrowserClose_Load(result) {
        // the only way to test for a cancel/close is to check for the existance of a property
        if (typeof result.result !== "undefined") {
            // check a filename was specified
            if (result.result.length > 0)
                Load(result.result);
        }
    }

    // Initiate a save
    function Save(path, name) {
        jQuery("#" + documentPathHiddenId).val(path);
        jQuery("#" + documentFileHiddenId).val(name);
        jQuery("#" + saveCommunicationButtonId).click();
    }

    // Initiate a save as
    function SaveAs(path, name) {
        jQuery("#" + documentPathHiddenId).val(path);
        jQuery("#" + documentFileHiddenId).val(name);
        jQuery("#" + saveAsCommunicationButtonId).click();
    }

    // Initiate a load
    function Load(documentId) {
        jQuery("#" + documentIdHiddenId).val(documentId);
        jQuery("#" + loadCommunicationButtonId).click();
    }

    // calculate the full document path from the root
    // the path returned from the objectbrowser excludes any virtual root we projected
    function GetRootedPath(path) {

        // tidy the root
        var root = self.DocumentRoot;
        if (root.substring(root.length - 1) != "/") root = root + "/";

        // the first element of the path will be the last element of the root
        // so we can ignore the first element of the path
        var i = path.indexOf("/");
        if (i > 0)
            path = path.substring(i + 1);
        else
            path = "";

        return root + path;

    }

    // Set the size of the RadEditor so that it fills the available space inside a popup
    function RadEditorSetSize() {

        if (self.ContentHtmlEditor == null) return;

        var htmlEditorBody = jQuery("#" + self.ContentHtmlEditor._contentAreaElement.id).contents().find("body");
        htmlEditorBody.attr("style", "overflow-y: auto!important;");
    }

    // Attachment code
    var Asi_Web_iParts_Communications_CommunicationCreator_rowCount;

    BSABrowserCallback = function (window) {

        if (!window.result)
            return;

        var key = window.result;
        var path = window.SelectedDocumentPath;
        var name = window.SelectedDocumentName;
        var fileType = "Template";
        var runOnce = false;

        if (path.slice(-4).toUpperCase() == ".PDF") {
            fileType = "File";
            runOnce = true;
        }
        AddAttachment(key, path, fileType, runOnce, name);

        // clear variables - otherwise cancel has the same values passed through
        window.result = null;
        window.SelectedDocumentPath = null;
        window.SelectedDocumentName = null;
    };

    function AddAttachment(fileKey, filePath, fileType, runOnce, fileName) {

        // check for multiple files selected - if this is the case there will be comma delimited keys
        // but only one file path
        var keyList = fileKey.split(',');
        if (keyList.length > 1) {
            alert("Only one file can be selected at a time");
            fileKey = keyList[0];
        }

        // add the data to the hidden fields
        document.getElementById(attachmentKeyHiddenId).value += ";" + fileKey;
        document.getElementById(attachmentPathHiddenId).value += ";" + filePath;
        document.getElementById(attachmentFileTypeHiddenId).value += ";" + fileType;
        document.getElementById(attachmentRunOnceHiddenId).value += ";" + runOnce;
        document.getElementById(attachmentNameHiddenId).value += ";" + fileName;

        // add the row
        AddRow(runOnce, fileName, fileType);
    }

    function AddRow(runOnce, fileName, fileType) {

        // key the row count
        Asi_Web_iParts_Communications_CommunicationCreator_rowCount++;
        var rowCount = Asi_Web_iParts_Communications_CommunicationCreator_rowCount;

        // add the data to the table
        var runOnceYesNo = runOnce ? "Yes" : "No";
        var html = "<tr id='" + clientId + "Attachment_Row_" + rowCount + "'><td>" + fileName + "</td><td>" + fileType + "</td>"
            + "<td><a href='Javascript:" + clientId + "_DeleteAttachment(" + rowCount + ")'>remove</a></td></tr>";

        jQuery("#" + attachmentListId + ' >  tbody:last').append(html);

        // display attachment table header only if there is more than one table row
        DisplayAttachmentTableHeader();
    }

    function DisplayAttachmentTableHeader() {
        // get the number of rows in the attachments table
        var tableRows = document.getElementById(attachmentListId).rows.length;
        // only show the attachments table header if there are attachments
        if (tableRows > 1) {
            jQuery("#" + clientId + "_AttachmentListHeader").css("display", "table-row");
            jQuery("#" + clientId + "_AttachmentsHeader").attr('colspan', 3);
        } else {
            jQuery("#" + clientId + "_AttachmentListHeader").css("display", "none");
        }
    }

    this.CursorPosition = null;

    // Cache the current position of the cursor in the RadEditor.
    // Use RestoreCursorPosition() to restore the position.
    function SaveCursorPosition() {
        if (self.ContentHtmlEditor == null) {
            self.CursorPosition = null;
            return;
        }
        try {
            self.CursorPosition = self.ContentHtmlEditor.getSelection().getRange();
        } catch (e) {
            self.CursorPosition = null;
        }
    }

    // Restores the position of the cursor in the RadEditor.
    // Uses the position that was saved using SaveCursorPosition().
    function RestoreCursorPosition() {
        if (self.ContentHtmlEditor == null || self.CursorPosition == null) return;
        try {
            self.ContentHtmlEditor.getSelection().selectRange(self.CursorPosition);
        } catch (e) {
            // ignore, will leave cursor at current position
        }
    }

    // Functions used by the HtmlSanitizerFilter
    this.HtmlSanitizer = {
        unescapeSquareBrackets: function (content) {
            if (!content) return content;
            return content.replace(/%5B/g, "[").replace(/%5D/g, "]");
        },
        removeContentEditableFromBodyTag: function (content) {
            if (!content) return content;
            var regex = /<body(?:\s[^>]*\s|\s+)(contenteditable=['"]true['"])[^<]*>/ig;
            var match;
            var newContent = "";
            var lastIndex = 0;
            while ((match = regex.exec(content)) !== null) {
                // match[0] contains the entire matched body tag
                // match[1] contains the matched contenteditable attribute and value (using a capturing group)
                if (match.index > lastIndex) newContent += content.substring(lastIndex, match.index);
                newContent += match[0].replace(match[1], "").replace(/\s+>$/,">");
                lastIndex = match.index + match[0].length;
            }
            newContent += content.substr(lastIndex);
            return newContent;
        }
    }

}
