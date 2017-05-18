
function Asi_Web_iParts_Common_Task(taskNotificationDefaultTemplateHtml, 
                                    taskNotificationPersonalizedTemplateHtml, 
                                    contactViewingOwnRecordCheckBox, 
                                    taskNotificationPersonalizedDiv, 
                                    baseUrl,
                                    addToNotificationSetCheckBox,
                                    notificationSetDiv)
{

    var checkbox2 = jQuery('#' + addToNotificationSetCheckBox);
    var panel2 = jQuery('#' + notificationSetDiv);
    if (checkbox2 != null && panel2 != null) {
        if (checkbox2.is(':checked')) {
            panel2.show();
        } else {
            panel2.hide();
        }
    }

    this.InsertPlaceHolder = function (commandName, editor, args) {
        editor.pasteHtml(args.get_value());
    };

    this.InsertLinksPlaceHolder = function (commandName, editor, args) {
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

        var callbackFunction = function (sender, args) {
            var linkUrl = args._argument;
            if (linkUrl != null && linkUrl.attributes != undefined) {
                var hrefString = linkUrl.getAttribute("href");
                if (hrefString.toLowerCase().indexOf("website/") >= 0) {
                    //Do this for a shortcut
                    hrefString = "[Website]/" + hrefString.substring(8);
                }
                if (hrefString.indexOf("~/") >= 0) {
                    //Do this for a shortcut
                    hrefString = "[~]/" + hrefString.substring(2).replace(".aspx", "") + ".aspx";
                }
                if (hrefString.indexOf("@/") >= 0) {
                    //Do this for a content record
                    hrefString = "[@]/" + hrefString.substring(2).replace(".aspx", "") + ".aspx";
                }
                editor.getSelection().selectRange(cursorPosition);//restore cursor position 
                //args.href
                var href = null;
                if (hrefString.indexOf("?") >= 0 && linkUrl.qsParam != "" && linkUrl.qsParam != null) {
                    if (linkUrl.sourceCode != "" && linkUrl.sourceCode != null)
                        href = String.format("{0}&amp;{1}&amp;SourceCode={2}", hrefString, linkUrl.qsParam, linkUrl.sourceCode);
                    else
                        href = String.format("{0}&amp;{1}", hrefString, linkUrl.qsParam);
                }
                else if (linkUrl.qsParam != "" && linkUrl.qsParam != null) {
                    if (linkUrl.sourceCode != "" && linkUrl.sourceCode != null)
                        href = String.format("{0}?{1}&amp;SourceCode={2}", hrefString, linkUrl.qsParam, linkUrl.sourceCode);
                    else {
                        href = String.format("{0}?{1}", hrefString, linkUrl.qsParam);
                    }
                }
                else {

                    if (linkUrl.sourceCode != "" && linkUrl.sourceCode != null)
                        href = String.format("{0}?SourceCode={1}", hrefString, linkUrl.sourceCode);
                    else
                        href = String.format("{0}", hrefString);
                }
     
                editor.pasteHtml(String.format("<a href=\"{0}\">{1}</a> ", href, linkUrl.name));
            }
        };

        //open the dialog--do not use the editor's showExternalDialog method, it doesn't play nice w/our dialogs when using +1 times
        ShowDialog(baseUrl + 'NotificationLinkEdit.aspx', argument,
                '90%', '90%', 'Alert Hyperlink', null, "E", callbackFunction, null, true, true, null, null);
    };

    this.DisableSaveButtons = function () {
        if (!Page_ClientValidate('')) return;
        var saveButton = jQuery('input[id$=TaskUserControl_SaveButton]');
        var saveAsButton = jQuery('input[id$=TaskUserControl_SaveAs]');
        if (saveButton != 'undefined' && saveAsButton != 'undefined') {
            saveButton.attr('disabled', 'true');
            saveAsButton.attr('disabled', 'true');    		
        }	    
    };
    this.EnableSaveButtons = function () {
        var saveButton = jQuery('input[id$=TaskUserControl_SaveButton]');
        var saveAsButton = jQuery('input[id$=TaskUserControl_SaveAs]');
        if (saveButton != 'undefined' && saveAsButton != 'undefined') {
            saveButton.removeAttr('disabled');
            saveAsButton.removeAttr('disabled');
        }
    };
    this.AddDataSource = function(url) {
        Dialog(url, '90%', 'Add Data Source', 'datasource');
    };
    this.AddTrigger = function (url) {
        Dialog(url, '90%', 'Add Trigger', 'trigger');
    };
    this.AddAction = function (url) {
        Dialog(url, '90%', 'Add Action', 'action');
    };
    this.AddAlertSet = function (url) {
        Dialog(url, '90%', 'Add Alert Set', 'notification');
    };

    function Dialog(url, size, title, type) {
        ShowDialog_NoReturnValue(url, type, size, size, title, null, 'E', null, null, false, true, CloseWindowCallBackFunction, null);
    }

}

function CheckboxValueChanged(checkBoxControl, divControl)
{
    var checkbox = jQuery('#' + checkBoxControl);
    if (divControl.substring(19, divControl.length) == "TaskUserControl_NotificationSetDiv") {
        var panel = jQuery('#' + divControl);
        if (checkbox != null && panel != null) {
            if (checkbox.is(':checked')) {
                panel.show();
            } else {
                panel.hide();
            }
        }
    } else {
        var tabStripClientId = $telerik.$(".RadTabStripAlerts");
        tabStripClientId = tabStripClientId.attr("id");
        var tabStrip = $find(tabStripClientId);
        if (tabStrip != null)
            var tab0 = tabStrip.get_tabs().getTab(0);
            var tab1 = tabStrip.get_tabs().getTab(1);
            if (checkbox != null && tab1 != null) {
                if (checkbox.is(':checked')) {
                    tab1.set_enabled(true);
                    tab1.set_text("Personalized");
                } else {
                    tab0.set_selected(true);
                    tab1.set_enabled(false);
                    tab1.set_text("");
                }
            }
    }
}
addLoadEvent(HookEndRequest);
function HookEndRequest() {
    var tabStripClientId = $telerik.$(".RadTabStripAlerts");
    tabStripClientId = tabStripClientId.attr("id");
    var tabStrip = $find(tabStripClientId);
    if (tabStrip != null)
        var tab1 = tabStrip.get_tabs().getTab(1);
        var checkbox = jQuery('input[id$=TaskUserControl_ContactViewingOwnRecordCheckBox]');
        if (checkbox != null && tab1 != null) {
            if (checkbox.is(':checked')) {
                tab1.set_enabled(true);
                tab1.set_text("Personalized");
            } else {
                tab1.set_enabled(false);
                tab1.set_text("");
            }
        }
}