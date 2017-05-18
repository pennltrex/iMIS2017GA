function Asi_Web_iParts_Fundraising_RecurringDonationCreatorDisplay(containerId, fixedAnnualRecurrence) {

    // Onload
    jQuery(document).ready(function ($) {
        // Code using $ as usual goes here.
        var container = $('#' + containerId);

        var recurringRadio = container.find('input[name$=RecurringDonationOption]');
        //fire the event on start up

        var singlePaymentRadio = container.find('input[id$=RecurringDonationOption_0]');
         firePaymentCreatorBankDraftOptionCheck(fixedAnnualRecurrence || !singlePaymentRadio.is(':checked'));

        //fire custom event we can hookup to in payment creator
        recurringRadio.on('change', function () {
            firePaymentCreatorBankDraftOptionCheck(!singlePaymentRadio.is(':checked'));
        });

        // This event is fired if the javascript onready in PaymentCreator finishes before this onready
        $(document).on('OnloadLoopBack-RecurringDonation', function (e) {
            var singlePaymentRadio = container.find('input[id$=RecurringDonationOption_0]');
            //var recurringRadio = container.find('input[name$=RecurringDonationOption]');
            var selected = fixedAnnualRecurrence
                || recurringRadio.length > 0 && !singlePaymentRadio.is(':checked');
            firePaymentCreatorBankDraftOptionCheck(selected);
        });

    });

    // called on initial load and when radio buttons clicked
    function firePaymentCreatorBankDraftOptionCheck(recurringOption) {
        jQuery(document).trigger(
        {
            type: "toggle-Bank-Drafts",
            isRecurring: recurringOption
        });
    }

}
