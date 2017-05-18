
function Asi_Web_iParts_Commerce_AutoPayEnrollmentsEditDisplay() {

    var _this = this;
    this.PanelDonationSpecificFields;
    this.PanelMembershipSpecificFields;
    this.PanelViewTransactions;
    this.PanelAddPaymentOption;
    this.ListDonationPaymentOption;
    this.LinkViewTransactions;
    this.PaymentCreatorContainer;
    this.ValidationGroup;

    this.OnLoad = function() {
        jQuery("#" + this.PanelViewTransactions).hide();
        /// On page load, disable the payment creator iPart's validators
        if (jQuery('#' + this.ListDonationPaymentOption + " option:selected").val() !== "new") {
            validationGroupEnable(_this.ValidationGroup, false);
        }
        else {
            jQuery('#' + _this.PanelAddPaymentOption).show();
            validationGroupEnable(_this.ValidationGroup, true);
        }

        jQuery('#' + this.ListDonationPaymentOption).on("change", function (e) {
            if (this.options[this.selectedIndex].value === "new") {
                jQuery('#' + _this.PanelAddPaymentOption).show();
                validationGroupEnable(_this.ValidationGroup, true);
            }
            else {
                jQuery('#' + _this.PanelAddPaymentOption).hide();
                validationGroupEnable(_this.ValidationGroup, false);
            }
        });


        function HasPageValidators() {
            var hasValidators = false;
            try {
                if (Page_Validators.length > 0) {
                    hasValidators = true;
                }
            }
            catch (error) { }
            return hasValidators;
        }

        function validationGroupEnable(validationGroupName, isEnable) {
            if (HasPageValidators()) {
                for (i = 0; i < Page_Validators.length; i++) {
                    if (Page_Validators[i].validationGroup == validationGroupName) {
                        ValidatorEnable(Page_Validators[i], isEnable);
                    }
                }
            }
        }
    }

    this.ShowHideTransactionGrid = function(sender, showText, hideText) {
        if (jQuery("#" + this.PanelViewTransactions).is(":visible")) {
            jQuery("#" + this.PanelViewTransactions).hide();
            jQuery("#" + this.LinkViewTransactions).html(showText);
        }
        else {
            jQuery("#" + this.PanelViewTransactions).show();
            jQuery("#" + this.LinkViewTransactions).html(hideText);
        }
    }

    this.EditCallBack = function (radWin) {
        var refresh = false;
        if (radWin != null && typeof (radWin.IsDirty) == 'boolean') {
            refresh = radWin.IsDirty;
        }
        else {
            // if for some reason we dont get a rad window then assume we should refresh
            refresh = true;
        }
        if (refresh)
            window.location.reload();
    };
}