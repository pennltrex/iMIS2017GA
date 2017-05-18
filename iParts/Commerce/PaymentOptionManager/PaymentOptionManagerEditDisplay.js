function Asi_Web_iParts_Commerce_PaymentOptionManagerEditDisplay() {
    
    var _this = this;
    this.IsEditMode;
    this.PaymentMethodDropdownList;
    this.CardAddressPanel;
    this.ExpiryMonthValue;
    this.ExpiryYearValue;
    this.ExpiryMonthControl;
    this.ExpiryYearControl;

    this.OnLoad = function () {

        if (_this.IsEditMode === "True") {
            /* Hide fields that are unavailable within the edit mode, display their value within read-only labels. */
            jQuery('#' + _this.PaymentMethodDropdownList).hide();
            jQuery('#' + _this.BillToPanel).hide();
            jQuery('label[for="' + _this.PaymentMethodDropdownList + '"]').hide();
            if (_this.ExpiryMonthValue !== null && _this.ExpiryYearValue) {
                jQuery('#' + _this.ExpiryMonthControl).val(_this.ExpiryMonthValue);
                jQuery('#' + _this.ExpiryYearControl).val(_this.ExpiryYearValue);
            }
        }
        jQuery('#' + _this.CardAddressPanel).hide();
    }
}
