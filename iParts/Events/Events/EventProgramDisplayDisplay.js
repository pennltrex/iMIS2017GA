// Global variable to hold responses for a given event function.
var FormFieldResponseData = [];

// Update a global collection with the formFieldDefinition's property ID and the value of the control
// so that a function's responses can be persisted.
this.SaveFormFieldValue = function (inputControl, fieldPropertyId) {
    var myValue = '';
    if (inputControl.id.indexOf('radioButtonList') > -1) {
        myValue = inputControl.rows[0].cells[0].firstChild.checked ? 'True' : 'False';
    }
    else if (inputControl.type != null
        && (inputControl.type == 'text' || inputControl.type == 'textarea' || inputControl.type == 'select-one')) {

        myValue = inputControl.value;
    }
    else return;

    // FormFieldResponseData is a global var, defined in EventProgramDisplayDisplay.js
    FormFieldResponseData[fieldPropertyId] = myValue;
};

function Asi_Web_iParts_Events_EventProgramDisplayDisplay(
    refreshButtonId, registerButtonId, unregisterButtonId, deleteRegOptionButtonId, saveFunctionResponseButtonHiddenId,
    functionKeyHiddenId, functionRegistrationQuanityHiddenId, formEventFunctionHiddenId, formFunctionResponseValuesHiddenId, saveMessageLabelHiddenId,
    registerFunctionHyperlinkMarkerClass, eventSetupMode, groupWrapperId, hiddenScrollToElementId, hiddenWaitListChoiceId,hdnAddFromWaitListBrn) {

    // public functions
    var hiddenScrollToElement = jQuery("#" + hiddenScrollToElementId); //hidden field containing target element id for auto-scrolling
    var waitListSelected = false;

    // on ajax panel sync or asyinc postback (acts like document ready) , finds and scrolls to previously registered function
    Sys.Application.add_load(function () {
        RepositionScrollBar();
        FormFieldResponseData = [];
        DisplaySavedFormMessage();
        DisableScrollDivTabStops();
        CheckConflictWarningMessage();    
    });

    // Process responses to a function's questions
    this.SubmitResponses = function (sender, eventFunctionId, eventFormSectionId, saveMessageLabelId) {
        if (typeof Page_ClientValidate == "function" && !Page_ClientValidate(eventFormSectionId))      // Only fire off the validators for the form field(s) for this function.
            return;
        if (formEventFunctionHiddenId != null)
            $(formEventFunctionHiddenId).value = eventFunctionId;
        if (saveMessageLabelHiddenId != null)
            $(saveMessageLabelHiddenId).value = saveMessageLabelId;
        if (formFunctionResponseValuesHiddenId != null) {
            // flatten the global FormFieldResponseData array and save it for access by the code-behind.
            var flattened = '';

            for (key in FormFieldResponseData) {
                if (FormFieldResponseData.hasOwnProperty(key)) {
                    flattened += key + '--ffrdkv--' + FormFieldResponseData[key] + '--ffrdentry--';
                }
            }
            $(formFunctionResponseValuesHiddenId).value = flattened;
        }
        if (saveFunctionResponseButtonHiddenId != null) {
            DisableRegisterFunctionHyperLinks();            // Just for consistency with, e.g., RegisterFunction in this file.
            var attr = document.createAttribute("testtest");
            attr.value = sender.id;
            $(saveFunctionResponseButtonHiddenId).attributes.setNamedItem(attr);
            $(saveFunctionResponseButtonHiddenId).click();
            StoreButtonIdForScrolling(sender.id);
        }
    };


    // display a function
    this.DisplayFunction = function (eventKey, functionKey, registrantId, url, isTemplate) {
        if (url == null || url == "") return;
        if (url.indexOf("?") >= 0)
            url += "&EventKey=" + eventKey + "&FunctionKey=" + functionKey + "&RegistrantId=" + registrantId;
        else
            url += "?EventKey=" + eventKey + "&FunctionKey=" + functionKey + "&RegistrantId=" + registrantId;
        url += "&IsTemplate=" + isTemplate;
        ShowDialog(url, null, "95%", "95%", "Display Program Item", null, "E", null, null, false, false, DisplayFunctionOnClose, null);

        if (functionKeyHiddenId != null)
            $(functionKeyHiddenId).value = functionKey;
    };

    // add a function
    this.AddFunction = function (eventKey, url, refreshButtonId) {
        if (url == null || url == "") return;

        var windowTitle = "Add Program Item";
        if (eventSetupMode == "True")
            windowTitle = "Add Registration Option";

        if (eventKey == "")
            eventKey = jQuery("input[type=hidden][name$=HiddenEventCode]").val();

        if (url.indexOf("?") >= 0)
            url += "&EventKey=" + eventKey;
        else
            url += "?EventKey=" + eventKey;
        var dialog = ShowDialog(url, null, "95%", "95%", windowTitle, null, "E", null, null, false, false, AddFunctionOnClose, null);
    };

    // edit a registration option
    this.EditRegistrationOption = function (eventKey, functionKey, registrantId, url) {
        if (url == null || url == "") return;
        if (url.indexOf("?") >= 0)
            url += "&EventKey=" + eventKey + "&FunctionKey=" + functionKey + "&RegistrantId=" + registrantId + "&RegOpt=true";
        else
            url += "?EventKey=" + eventKey + "&FunctionKey=" + functionKey + "&RegistrantId=" + registrantId + "&RegOpt=true";
        var dialog = ShowDialog(url, null, "95%", "95%", "Edit Registration Option", null, "E", null, null, false, false, AddFunctionOnClose, null);
    };

    // register for a function or add to itinerary
    this.RegisterFunction = function (eventKey, functionKey, quantityInputId, inItineraryId, programQuantityId, isStaffUser, sender, divWaitListId, hiddenWaitlistButtonId) {

        var isStaff = false;
        if (typeof (isStaffUser) == "string") {
            isStaff = isStaffUser.toUpperCase() === "TRUE";
        } else if (typeof (isStaffUser) == "boolean") {
            isStaff = isStaffUser;
        }

        // record scroll position
        if (sender != "undefined" && sender != null) {
            if (jQuery(sender).length > 0) {
                StoreButtonIdForScrolling(jQuery(sender).attr('id'));
            }
        }
        //clear the hidden waitlist value so it's not picked up mistakingly in following function
        jQuery("#" + hiddenWaitListChoiceId).val("");

        var $waitListDiv = jQuery('#' + divWaitListId);
        if ($waitListDiv != null && $waitListDiv.is(":visible")) {
            var $waitListChoiceDiv = $waitListDiv.find("div[id$='DivWaitList']");
            if ($waitListChoiceDiv.length > 0 && !$waitListChoiceDiv.is(":visible")) {
                $waitListChoiceDiv.show(); 
                var $waitListRadioButtons = $waitListChoiceDiv.find("input[name$='WaitListRadioButtons']");
                if ($waitListRadioButtons != null) {
                    $waitListRadioButtons.change(function () {
                        if (jQuery(this).is(":checked")) {
                            jQuery("#" + hiddenWaitListChoiceId).val(jQuery(this).val());
                            jQuery("#" + hiddenWaitlistButtonId).click();
                        }
                    });
                }
            }
            return;
        }

        this.RegisterFunctionActual(eventKey, functionKey, quantityInputId, inItineraryId, programQuantityId, isStaff);
    };

    this.RegisterOrWaitListFunction = function (eventKey, functionKey, quantityInputId, inItineraryId, programQuantityId, isStaffUser) {
        var isStaff = false;

        if (typeof (isStaffUser) == "string") {
            isStaff = isStaffUser.toUpperCase() === "TRUE";
        } else if (typeof (isStaffUser) == "boolean") {
            isStaff = isStaffUser;
        }
        this.RegisterFunctionActual(eventKey, functionKey, quantityInputId, inItineraryId, programQuantityId, isStaff);
    };

    this.RegisterFunctionActual = function (eventKey, functionKey, quantityInputId, inItineraryId, programQuantityId, isStaff) {
        var isValid = true;

        if (quantityInputId != null && typeof Page_ClientValidate === "function" && !isStaff)
            isValid = Page_ClientValidate(quantityInputId); //Using quantityInputId as the validation group name
        if (quantityInputId != null && typeof Page_ClientValidate === "function" && isStaff)
            isValid = true; //For staff user override the client side validation for quantity
        if (isValid == true) {
            if (functionKeyHiddenId != null)
                $(functionKeyHiddenId).value = functionKey;
            if (programQuantityId != null && quantityInputId != null) {
                if ($(quantityInputId) != null) {
                    $(programQuantityId).value = $(quantityInputId).value;
                    $(functionRegistrationQuanityHiddenId).value = $(quantityInputId).value;
                } else {
                    $(programQuantityId).value = 1;
                    $(functionRegistrationQuanityHiddenId).value = 1;
                }
            }
            if (registerButtonId != null) {
                DisableRegisterFunctionHyperLinks();
                $(registerButtonId).click();
                // update the cart item count 
                updateCartItemCount();
            }
        }
    };


    // unregister for a function or remove from itinerary
    this.UnregisterFunction = function (eventKey, functionKey, buttonId) {
        if (functionKeyHiddenId != null)
            $(functionKeyHiddenId).value = functionKey;
        if (unregisterButtonId != null) {
            DisableRegisterFunctionHyperLinks();
            StoreButtonIdForScrolling(buttonId);
            if (typeof (Page_ValidationActive) != "undefined") {
                Page_ValidationActive = false;
            }
            $(unregisterButtonId).click();
            updateCartItemCount();
            CheckConflictWarningMessage();
        }
    };
    // switch a function registration from the waitlist...force into a regular registration
    this.RegisterFromWaitListFunction = function (eventKey, functionKey, buttonId) {
        if (functionKeyHiddenId != null)
            $(functionKeyHiddenId).value = functionKey;
        if (hdnAddFromWaitListBrn != null) {
            DisableRegisterFunctionHyperLinks();
            StoreButtonIdForScrolling(buttonId);
            if (typeof (Page_ValidationActive) != "undefined") {
                Page_ValidationActive = false;
            }
            $(hdnAddFromWaitListBrn).click();
            updateCartItemCount();
        }
    };


    // delete registration option
    this.DeleteRegistrationOption = function (eventKey, functionKey) {
        if (functionKeyHiddenId != null)
            $(functionKeyHiddenId).value = functionKey;
        if (deleteRegOptionButtonId != null && confirm('Are you sure you want to delete this item?')) {
            $(deleteRegOptionButtonId).click();
        }
    };

    // private functions

    function CheckConflictWarningMessage() {
        var messagesExist = jQuery('span[id$=ConflictWarningMessage]');
        if (messagesExist.length == 0)
            jQuery('div[id$=ConflictWarningMessage]').hide();
    }

    // Show form save success or save failure message 
    function DisplaySavedFormMessage() {
        if (jQuery('input[data-jQueryId="SaveMessagesLabelId"]').length < 1) {
            return;
        }
        if (jQuery('input[data-jQueryId="SaveFormSuccess"]').length < 1) {
            return;
        }
        var messageLabelId = jQuery('input[data-jQueryId="SaveMessagesLabelId"]').val();
        var saveSuccessMessage = jQuery('input[data-jQueryId="SaveFormSuccess"]').val();

        if (typeof (messageLabelId) == "undefined" ||
            typeof (saveSuccessMessage) == "undefined" ||
            messageLabelId.length < 1 ||
            saveSuccessMessage.length < 1) {
            return;
        }

        if (jQuery("#" + messageLabelId).length < 1) {
            return;
        }

        // Clear out message so its blank next time we do a postback
        jQuery("#" + messageLabelId).text(saveSuccessMessage);
        jQuery('input[data-jQueryId="SaveMessagesLabelId"]').val("");
    }

    //For WCAG compliance, we do not want to tab onto programs containers as they do nothing
    function DisableScrollDivTabStops() {
        //change radgrid tabindex to skip it
        var radGrids = jQuery('#' + groupWrapperId).find(".RadGrid");
        if (!radGrids || radGrids.length < 1) return;
        radGrids.each(function () {
            jQuery(this).attr("tabindex", '-1');
        });
    }

    //upon refresh we need to reposition scrolling div to show function just added/removed 
    function RepositionScrollBar() {
        if (typeof (hiddenScrollToElement) === "undefined") {
            return;
        }

        // Get positioning details
        var position = hiddenScrollToElement.value;
        hiddenScrollToElement.value = "";
        if (typeof (position) === "undefined" || position.length < 2)//stored value doesn't exist or is blank
        {
            return;
        }

        // Separate the elements of the position value
        var panelId, containerId, scrollPos, top;
        var elements = position.split("||");
        if (elements.length != 4) return;
        panelId = elements[0];
        scrollPos = parseInt(elements[1]);
        containerId = elements[2];
        top = parseInt(elements[3]);
        if (isNaN(scrollPos) || scrollPos <= 0) return;
        if (isNaN(top) || top <= 0) return;

        // Look for the panel using the custom attribute
        var panel = jQuery("div[data-scrollingpanel-id=\"" + panelId + "\"]").eq(0);
        if (panel == null || panel.length == 0)
            return;

        // Mow look for the container within it
        var container = panel.find("div[data-programitemcontainer-id=\"" + containerId + "\"]").eq(0);
        if (container == null || container.length == 0)
            return;

        // The first thing we do is scroll to the previous scroll position
        panel.scrollTop(scrollPos);

        // Now we check to see if the div containing the program item has the same top position as it had before.
        // Most the time it will. 
        // If it doesn't it means that the contents of the program item list have changed during the postback.
        // This is unlikely but theoretically possible e.g.
        // One of the Program Items in the list has had its description changed (e.g. it requires more room), or its date/time changed
        // which would affect the sort order etc.
        // If we detect a difference the we attempt to correct for it.
        var diff = parseInt(container.position().top) - top;
        if (diff != 0) {
            // correct the scroll position
            scrollPos = scrollPos + diff;
            panel.scrollTop(scrollPos > 0 ? scrollPos : 0);
        }

    }

    //called when registering or removing a function - supports auto-scroll and WCAG focusing
    //this sets what button id we need to look for on refresh (add or remove) to anchor on
    function StoreButtonIdForScrolling(buttonId) {
        if (typeof (hiddenScrollToElement) !== "undefined" && typeof (buttonId) !== "undefined") {
            var lastButtonId = buttonId;
            var useButtonId = false;
            if (buttonId.indexOf("AddButton") > -1) {
                lastButtonId = buttonId.replace("AddButton", "RemoveLinkButton");
                useButtonId = true;
            }
            else if (buttonId.indexOf("RemoveLinkButton") > -1) {
                lastButtonId = buttonId.replace("RemoveLinkButton", "AddButton");
                useButtonId = true;
            }
            else if (buttonId.indexOf("DisplayLink") > -1 || buttonId.indexOf("SaveResponses") > -1) {
                useButtonId = true;

            }
            // Find the programitemcontainer div the button is in
            hiddenScrollToElement.value = "";
            var container = jQuery("#" + buttonId).closest("div[data-programitemcontainer-id]");
            if (container && container.length > 0) {

                // now get the scrolling panel that the container is in
                var panel = container.closest("div[data-scrollingpanel-id]");
                if (panel && panel.length > 0) {

                    // store the positions
                    hiddenScrollToElement.value = panel.attr("data-scrollingpanel-id") + "||" + panel.scrollTop() + "||" + container.attr("data-programitemcontainer-id") + "||" + container.position().top;
                    lastButtonId += "||" + panel.scrollTop() + "||" + container.attr("data-programitemcontainer-id") + "||" + container.position().top;
                }

            }

            //set focus
            var hiddenLastClickedElement = jQuery("[id*='lastClickedElementId']").eq(0);
            if (hiddenLastClickedElement && hiddenLastClickedElement.length > 0) {
                if (useButtonId) {
                    hiddenLastClickedElement.val("id|" + lastButtonId + "|no_overwrite");
                }
                else {
                    hiddenLastClickedElement.val("id|" + hiddenScrollToElement.value + "|no_overwrite");
                }
            }
        }
    }

    // called when closing the function edit popup
    function AddFunctionOnClose(radWin) {
        var refresh = false;
        if (radWin != null && typeof (radWin.IsDirty) == 'boolean') {
            refresh = radWin.IsDirty;
        }
        else {
            // if for some reason we dont get a rad window then assume we should refresh
            refresh = true;
        }
        if (refresh) {
            if(refreshButtonId != null)
                $(refreshButtonId).click();
            //fix for pricing losing context
            var pricingRefreshButton = jQuery("[id$='Pricing_RefreshTrigger']");
            if (pricingRefreshButton != null)
                pricingRefreshButton.click();
        }            
    };

    // called when closing the function display popup
    function DisplayFunctionOnClose(radWin) {
        var refresh = false;
        if (radWin != null && typeof (radWin.IsDirty) == 'boolean') {
            refresh = radWin.IsDirty;
        }
        else {
            // if for some reason we dont get a rad window then assume we should refresh
            refresh = true;
        }
        if (refresh && refreshButtonId != null)
            $(refreshButtonId).click();
    };

    // disable the add/remove registration/itinerary hyperlinks in the program listing
    // permanently disables them, the page must postback in order for them to be restored
    function DisableRegisterFunctionHyperLinks() {
        jQuery("." + registerFunctionHyperlinkMarkerClass).removeAttr("href").css("color", "#bebebe");
    }

}