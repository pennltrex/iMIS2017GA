function Asi_Web_iParts_Commerce_PaymentCreatorDisplay(containerId, areProductsWithAutoRenewalInTheCart, checkPanelState) {

    var payPanelInitiallyHidden;

    this.Onload = function () {

        jQuery(document).on('toggle-Bank-Drafts', function (e) {
            hideShowBankDraft(e.isRecurring);
        });

        jQuery(document).on('toggle-PayPal', function (e) {
            hideShowPayPal(e.showPayPal);
        });

        if (areProductsWithAutoRenewalInTheCart) hideShowBankDraft(true);

        var container = jQuery('#' + containerId);
        var printButton = container.find('input[id$=btnPrintMandate]');

        var panelPayPal = container.find('div[id$=PanelPayPal]');
        payPanelInitiallyHidden = panelPayPal.length == 0 || panelPayPal.css('visibility') == 'hidden';

        jQuery(document).trigger("OnloadLoopBack-RecurringDonation");
        jQuery(document).trigger("OnloadLoopBack-PayPal");

        printButton.on('click', printDirectDebitForm);

    }

    function hideShowBankDraft(showOption) {
         
        var container = jQuery('#' + containerId);
        var dropdown = container.find('select[id$=PaymentMethodDropDown]');

        // basically hide and disable all the options, then show and enable the ones we want
        dropdown.find('option').hide().prop('disabled', true);

        var shownOptions;
        if (showOption) {
            // if autopay only show those with DataVault keys
            shownOptions = dropdown.find("option[data-datavaultgatewayaccountid]").show().prop('disabled', false);
        } else {
            // * 4 FEB 2016 update hide ALL DD until fully implemented
            // if single pay, hide UK direct debits - note ^= is beginning with $= is ending with
            // shownOptions = dropdown.find(":not(option[value^='UKDirectDebit'])").show().prop('disabled', false);

            // if single pay, show those without direct debits - note ^= is beginning with $= is ending with
            shownOptions = dropdown.find(":not(option[value^='CanadianBankDraft(iATS)']," +
                "option[value^='UKDirectDebit']," +
                "option[value^='DirectDebit (SecurePay)']," +
                "option[value^='USBankDraft(iATS)']," +
                "option[value^='USBankDraft(Payflow)']," +
                "option[value^='DirectDebit'])").show().prop('disabled', false);
        }

        if (dropdown.find('option:selected').attr('style') === "display: none;") {
            shownOptions.first().attr('selected', true);
            dropdown.children().first().change();
        }

        // Instead of firing another event, just look for this control and if it exists toggle it
        jQuery("#PadAgreement").toggle(showOption && shownOptions.length !== 0 && shownOptions.is(':selected'));
    }

    function hideShowPayPal(showOption) {
        if (payPanelInitiallyHidden)
            return;

        var container = jQuery('#' + containerId);
        var payPalSection = container.find('div[id$=PanelPayPal]');
        // PayPal may not appear on the page if autopay is active
        if (payPalSection.length > 0) {
            payPalSection.css("display", showOption ? "block" : "none");
            payPalSection.css("visibility", showOption ? "" : "hidden");
            hideShowOtherOptions(showOption);
        }
    }

    function hideShowOtherOptions(showOption) {
        var container = jQuery('#' + containerId);
        var otherOptionsSection = container.find('div[id$=OtherPaymentOptionsDiv]');
        otherOptionsSection.attr("class", showOption ? "ShowFieldset" : "");
    }

    function printDirectDebitForm() {

        var printwin = window.open('', '');
        var html = '<!DOCTYPE html><html><head><title>Direct Debit Instruction</title><head><body>';
        var container = jQuery('#' + containerId);
        var mandate = container.find('div[id$=CustomDDHtml]');
        html += mandate.html();
        html += '</body></html>';        
        if (typeof printwin != 'undefined') {
            printwin.document.write(html);
            var img = printwin.document.getElementById('directDebitImage');
            if (typeof img != 'undefined') {
                var imageUrl = img.src;
                img.src = imageUrl;               
            }
            printwin.focus();
            printwin.print();
        } 
    }

    function checkState() {

        var panelControl = jQuery('div[id$=PurchaseOrderPanel]');
        if (panelControl.length > 0 && !panelControl.is(':visible')) {
            var radioInputControl = jQuery('input[id$=PaymentMethodRadioButtonList_1]');
            if (radioInputControl != null && radioInputControl.length > 0 && radioInputControl.attr('checked')) {
                radioInputControl.blur();
                setTimeout(function () {
                    setButtonFocus();
                }, 400);
            }
        }

        function setButtonFocus() {
            var commonControl = jQuery('div[id$=SubmitOrderButtonLinkCommon]');
            if (commonControl != null) {
                var submitButton = commonControl.find('input[id$=SubmitCartOrderButton]');
                submitButton.focus();
            }
        }
    }

    if (checkPanelState)
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () { checkState(); });

}