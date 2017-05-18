function Asi_Web_iParts_Events_RegisterSomeoneElse(contactComboBoxClientId, hiddenPartyIdClientId, hiddenAddressIdClientId) {
    var internalContactComboBoxClientId = contactComboBoxClientId;
    var internalHiddenPartyIdClientId = hiddenPartyIdClientId;
    var internalHiddenAddressIdClientId = hiddenAddressIdClientId;

    this.ContactComboBoxKeyPressing = function (sender, args) {
        if (args.get_domEvent().keyCode == 8 || args.get_domEvent().keyCode == 127) { // Backspace or Delete key pressed
            sender._markFirstMatch = false; //This allows users to enter values not in combo, but shortened versions of existing items. Turns off autocomplete 
        } else {
            sender._markFirstMatch = true;
        }
    };

    this.ContactComboBoxOnClientBlur = function(sender, args) {
        var target = $find(internalContactComboBoxClientId);

        var selectedItemValue = target.get_value();
                
        if(selectedItemValue == "")
        {
            target.clearSelection();
            target.set_text("");
        } 
    };

    this.CommitHandler = function(onWaitList) {
        var oWindow = GetRadWindow();
        if (oWindow == null)
            return;
        
        var partyIdClientId = jQuery('#' + internalHiddenPartyIdClientId).eq(0);
        if (partyIdClientId && partyIdClientId.val().length > 0) {
            var partyId = partyIdClientId.val();
            oWindow.newPartyId = partyId;
        }

        var addressIdClientId = jQuery('#' + internalHiddenAddressIdClientId).eq(0);
        if (addressIdClientId && addressIdClientId.val().length > 0) {
            var addressId = addressIdClientId.val();
            oWindow.addressId = addressId;
        }
        if (onWaitList === "True")
            oWindow.onWaitList = true;

        oWindow.registeredSomeone = true;

        oWindow.Close();
    };
}
