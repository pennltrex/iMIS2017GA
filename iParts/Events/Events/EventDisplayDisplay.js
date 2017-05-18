
//We may have invalid .net validators when we want to submit the page for registering another, so we must ensure 
//that these validators are reset so they will not still carry their previous error messages and yet be active.
//As this method is only called AFTER a successful post, it will not interfere with normal validation behavior which would stop posting.
jQuery(document).ready(function () { ResetValidators(); });

//This method will make validator error messages go away
function ResetValidators() {
    if (typeof (Page_Validators) != "undefined") {
        if (Page_IsValid) return;
        for (var i = 0; i < Page_Validators.length; i++) {
            var validator = Page_Validators[i];
            validator.isvalid = true;
            ValidatorUpdateDisplay(validator);
        }
    }
}

function Asi_Web_iParts_Events_EventDisplayDisplay(registrationOptionsGridId, selectedRegistrationOptionHiddenId, updateRegistrationOptionButtonId, selectedOptionHiddenId, isTemplate, pageTitleContainer, waitListButtonId, hiddenWaitListChoiceId, cancelAttendeeButtonId, registerButtonId) {

    var RefreshButtonId = null;
    var SelectedContactId = null; // ID of the hidden control that contains a party id or contact key. Used with register someone else.
    var AddressId = null; // ID of the hidden control that contains a address id. Used with register someone else.
    var EditAddressId = null; //same as AddressId but for passing back edited address id.  Used when editing registration+
    var IsGuestId = null; // ID of hidden control that contains a boolean telling whether we're registering a guest.
    var RefreshRedirectButtonId = null;

    this.OnLoad = function() {
        if (isTemplate == 'True' && pageTitleContainer != "") {
            jQuery("#" + pageTitleContainer + " h2.PanelTitle").addClass("TemplateTitleIcon");
        }
    }
    // public functions
    //open the address edit for primary registrant
    this.RegistantInfoEdit_Clicked = function(editUrl, dialogTitle, clientId) {
        EditAddressId = clientId;
        var dialog = ShowDialog(editUrl, null, 900, 850, dialogTitle, null, 'E', this.RegistrantInfoEdit_Callback, null, false, true, null, null);
    };

    //callback for registrant address edit
    this.RegistrantInfoEdit_Callback = function (dialogWindow) {
        if (typeof (dialogWindow.AddressId) == 'undefined') return;
        $get(EditAddressId).value = dialogWindow.AddressId;
        jQuery('#' + EditAddressId).change();
    };

    //Reister button state
    this.RegisterButtonState = function() {
        EventDisplayButtonsState();
    }

    //clear any validation errors on page so we can perform submit
    this.ClearPageValidation = function () {
        EventDisplayButtonsState();
        if (typeof(Page_ValidationActive) != "undefined") {
            Page_ValidationActive = false;          
        }
    };

    this.ConfirmCancellation = function() {
        var answer = confirm('Cancelling this registration will also cancel all guest registrations.');
        if (answer)
            this.ClearPageValidation();
        return answer;
    };

    // edit an event
    this.EditEvent = function (eventKey, url, refreshButtonId, refreshRedirectButtonId, isTemplate, windowTitle) {
        if (url == null || url == "") return;
        if (url.indexOf("?") >= 0)
            url += "&EventKey=" + eventKey;
        else
            url += "?EventKey=" + eventKey;
        url += "&IsTemplate=" + isTemplate;
        RefreshButtonId = refreshButtonId;
        RefreshRedirectButtonId = refreshRedirectButtonId;
        var dialog = ShowDialog(url, null, "95%", "95%", windowTitle, null, "E", null, null, false, false, EventEditOnClose, null);

        // dialog.set_destroyOnClose(true);
    };

    // delete an event
    this.DeleteEvent = function (deleteButtonId, confirmMessage) {
        if (confirm(confirmMessage)) {
            $(deleteButtonId).click();
        }
    };

    // register someone else
    this.RegisterSomeoneElse = function (url, selectedContactId, addressId, pageTitle, isGuestClientId, guestAddModeClientId, mode) {
        EventDisplayButtonsState();
        SelectedContactId = selectedContactId;
        AddressId = addressId;
        IsGuestId = isGuestClientId;
        if (guestAddModeClientId != null)
            $(guestAddModeClientId).value = mode;
        ShowDialog(url, null, 900, 850, pageTitle, null, 'E', RegisterSomeOneElseCallback, 'ObjectBrowser', false, true);
    };

    //cancel attendee registration
    this.CancelAttendee = function() {
        jQuery("#" + cancelAttendeeButtonId).click();
    };

    this.ConfirmAttendeeCancellation = function () {
        var answer = confirm('Cancelling this registration will also cancel all guest registrations.');
        if (answer)
            this.CancelAttendee();
        return answer;
    };

    this.SingleRegistrationOptionOnClick = function() {
                var $waitListRadioButton = jQuery("input[name$='WaitListRadioButtons']");
                if ($waitListRadioButton != null) {
                    $waitListRadioButton.change(function() {
                        if (jQuery(this).is(":checked")) {
                            jQuery("#" + hiddenWaitListChoiceId).val(jQuery(this).val());
                            jQuery("#" + registerButtonId).click();
                        }
                    });
                }
    }
    // a registration option radio button has been clicked
    this.RegistrationOptionOnClick = function(sender, functionId) {
        // ensure only the sender radio button is checked
        jQuery("#" + registrationOptionsGridId + " [type=radio]").removeAttr("checked");
        sender.checked = true;
        // send back the id of the option selected so we can focus on it again
        var $hiddenTxtBox = jQuery('#' + selectedOptionHiddenId);
        if ($hiddenTxtBox && $hiddenTxtBox.length > 0) {
            $hiddenTxtBox.val(sender.id);
        }
        // if the selected function hasn't changed then there is nothing to do
        if ($(selectedRegistrationOptionHiddenId).value == functionId) return;
        // save the selected function
        $(selectedRegistrationOptionHiddenId).value = functionId;
        // hunt for any waitlist active division in Telerik grid's current row and show options  
        var $owningRow = jQuery("#" + sender.id).closest(".rgRow");
        if ($owningRow != null) {
            var $waitListDiv = $owningRow.find("div[id$='OptionDivRegistrationFull']");
            if ($waitListDiv != null && $waitListDiv.is(":visible")) {
                var $waitListChoiceDiv = $waitListDiv.find("div[id$='OptionDivWaitList']");
                if ($waitListChoiceDiv != null && !$waitListChoiceDiv.is(":visible")) {
                    $waitListChoiceDiv.show();
                    //now have any choice in options perform the postback click instead
                    var $waitListRadioButton = $waitListChoiceDiv.find("input[name$='OptionWaitListRadioButtons']");
                    if ($waitListRadioButton != null) {
                        $waitListRadioButton.change(function() {
                            if (jQuery(this).is(":checked")) {
                                jQuery("#" + hiddenWaitListChoiceId).val(jQuery(this).val());
                                jQuery("#" + waitListButtonId).click();
                            }
                        });
                        var $addButton = jQuery("input[id$='AddButton']");
                        if ($addButton != null) {
                            $addButton.hide();
                        }
                    }
                }
                return;
            }
        }
        $(updateRegistrationOptionButtonId).click();
    };

    // private functions

    // called when closing the event edit popup
    function EventEditOnClose(radWin) {
        var refresh = false;
        var redirect = false;
        if (radWin != null) {
            if (typeof (radWin.IsDirty) == 'boolean') refresh = radWin.IsDirty;
            if (radWin.hasOwnProperty("AsiRedirectToLayout") && typeof (radWin.AsiRedirectToLayout) == 'boolean') redirect = radWin.AsiRedirectToLayout;
        }
        else {
            // if for some reason we dont get a rad window then assume we should refresh
            refresh = true;
        }
        if (refresh)
        {
            if (redirect && RefreshRedirectButtonId != null) {
                $(RefreshRedirectButtonId).click();
            } else if (RefreshButtonId != null) {
                $(RefreshButtonId).click();
            }
        }
    };
    
    // called when selecting or creating a contact in the register someone else pop-up
    function RegisterSomeOneElseCallback(radwindow) {
        if (AddressId != null) {
            if (radwindow.addressId != null) {
                $(AddressId).value = radwindow.addressId;
            }
            else {
                $(AddressId).value = null;
            }
        }

        // IsGuestId will be null if we're doing a "non-guest" register someone else
        if (IsGuestId != null && radwindow.registeredSomeone)
            $(IsGuestId).value = "true";

        $hiddenWaitListChoice = jQuery("input[id$='HiddenWaitListChoice']");
        $hiddenWaitListChoice.val(" ");
        if (radwindow.onWaitList)
            $hiddenWaitListChoice.val("GuestWaitlist");

        if (SelectedContactId != null) {
            // Here radWindow is a ContactAccountCreator and we've
            // just created a new account. Register someone else uses the party id.
            if (radwindow.newPartyId != null) {
                $(SelectedContactId).value = radwindow.newPartyId;
            }
                // fallback
            else {
                $(SelectedContactId).value = null;
            }
  
            document.forms[0].submit();
        }
    }

    function EventDisplayButtonsState() {
        var forms = document.getElementsByTagName('form');
        for (var i = 0; i < forms.length; i++) {
            var input = forms[i].getElementsByTagName('input');
            for (var y = 0; y < input.length; y++) {
                if (input[y].type == 'button') {
                    input[y].disabled = 'disabled';
                }
            }
        }
    }
        
}
