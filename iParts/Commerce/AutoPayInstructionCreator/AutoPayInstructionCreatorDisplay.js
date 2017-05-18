function Asi_Web_iParts_Commerce_AutoPayInstructionCreatorDisplay(containerId, usingAutoPayMsg) {
    jQuery(document).ready(function ($) {
        var container = jQuery('#' + containerId);

        // Onload
        jQuery(document).ready(function ($) {
            // Code using $ as usual goes here.
            var container = $('#' + containerId);

            var recurringRadio = container.find('input[name$=RecurringPaymentOptions]');
            //fire the event on start up
            firePaymentCreatorBankDraftOptionCheck(recurringRadio.filter(':checked').val());

            //fire custom event we can hookup to in payment creator
            recurringRadio.on('change', function () {
                firePaymentCreatorBankDraftOptionCheck($(this).filter(':checked').val());
            });

            // This event is fired if the javascript onready in PaymentCreator finishes before this onready
            $(document).on('OnloadLoopBack-RecurringDonation', function (e) {
                var selected = container.find('input[name$=RecurringPaymentOptions]').filter(':checked').val();
                firePaymentCreatorBankDraftOptionCheck(selected);
            });

        });        
    });

    // called on initial load and when radio buttons clicked
    function firePaymentCreatorBankDraftOptionCheck(recurringOption) {
        jQuery(document).trigger(
        {
            type: "toggle-Bank-Drafts",
            isRecurring: recurringOption == "auto"
        });
    }

    function changeTextWithFade(span, newText) {
        span.fadeOut(300, function () {
            jQuery(this).text(newText).fadeIn(300);
        });
    }
}
