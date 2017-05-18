function Asi_Web_iParts_Events_AccountingInformation(taxInfoId, fairMarketValueLabelId, fairMarketValueId) {
    var eventsAttached = false;

    // called when all the controls have been initialised and loaded
    jQuery(document).ready(function () {

        // attach events
        if (!eventsAttached) {
            // Find the charitable item checkbox by class, which because it's a BusinesItemCheckbox, gets
            // us to the span with that class name.
            jQuery("#" + taxInfoId + " .jsIsCharitableCheckbox :checkbox").change(this, OnCharitableItemChanged);
            eventsAttached = true;
        }
    });

    // private functions

    // when the Charitable Item checkbox changes, enable or disable/clear
    // out the Fair Market Value textbox based on the current checkbox state.
    function OnCharitableItemChanged() {
        var fmvLabel = jQuery("#" + fairMarketValueLabelId);
        var fmvTextbox = jQuery("#" + fairMarketValueId);
        if (this.checked) {
            fmvLabel.removeClass("aspNetDisabled");
            fmvTextbox.attr('disabled', false);
            fmvTextbox.removeClass("aspNetDisabled");
        } else {
            fmvLabel.addClass("aspNetDisabled");
            fmvTextbox.attr('disabled', true);
            fmvTextbox.addClass("aspNetDisabled");
            fmvTextbox.val("");
        }
    }
}

