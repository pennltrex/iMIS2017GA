function Asi_Web_iParts_Events_LocationAdd(hiddenPartyIdClientId) {

    var internalHiddenPartyIdClientId = hiddenPartyIdClientId;
    var partyId = null;

    this.CommitHandler = function () {
        var oWindow = GetRadWindow();
        if (oWindow == null)
            return;

        var partyIdClientId = jQuery('#' + internalHiddenPartyIdClientId).eq(0);
        if (partyIdClientId && partyIdClientId.val().length > 0) {
            partyId = partyIdClientId.val();
        }

        var form = jQuery(oWindow.BrowserWindow.document).find('#aspnetForm');
        if (form != null && partyId != null) {
            var field = form.find("input[id$='HiddenAddressSelectedId']");
            var btn = form.find("input[id$='ButtonAddressSelected']");
            field.val(partyId);
            if (btn != null) {
                btn.trigger('click');
            }
        }
    };

}