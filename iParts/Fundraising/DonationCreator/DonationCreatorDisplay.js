/// <reference path="Scripts/jquery-1.6.4-vsdoc.js" />

function Asi_Web_iParts_Fundraising_DonationCreatorDisplay(containerId, otherRadioVal, decimalNumberSeparator, setSoftCreditContactKeyButton, softCreditContactKeyField) {

    var container;
    var pendingTriggerBackToServer = false;

    this.OnLoad = function () {
        container = jQuery('#' + containerId);

        jQuery(document).ready(function () {
            var giftAmount2 = container.find('input[id$=GiftAmount2]');
            var giftAmount = container.find('input[id$=GiftAmount]');
            var premiumPagerKeyPressedTextBox = container.find('input[id$=PremiumPagerKeyPressed]');
            var giftAmountSelection = container.find('input[name$=GiftAmountSelection]');

            // This javascript ensures we remember which control we last selected when calling a postback
            // upon exiting the GiftAmount2 text box
            var lastSelectedControlIdTextBox = container.find('input[id$=LastSelectedElementIdAfterGiftAmountBlur]');
            if (lastSelectedControlIdTextBox &&
                lastSelectedControlIdTextBox.val() &&
                lastSelectedControlIdTextBox.val().length > 1) {

                var lastControlId = lastSelectedControlIdTextBox.val();
                var lastControl = document.getElementById(lastControlId);
                lastControl.focus();
                lastSelectedControlIdTextBox.val(' ');

                // clear out lastClickedElementId to prevent us from reselecting the GiftAmount2 text box
                var hiddenField = document.getElementById('lastClickedElementId');
                if (hiddenField != null) {
                    hiddenField.value = '';
                }

                // this is a work around to remove any anchors in the URL, such as the anchor you go to when clicking on the "Skip to main content" link
                location.hash = '';
                window.history.pushState('donationCreatorNoAnchorState', '', location.href);
            }

            if (premiumPagerKeyPressedTextBox && premiumPagerKeyPressedTextBox.val() && premiumPagerKeyPressedTextBox.val().length > 1) {
                premiumPagerKeyPressedTextBox.val(' ');
                jQuery('html, body').animate({
                    scrollTop: container.offset().top
                }, 100);
            }

            giftAmount2.blur(function () { giftBlur(jQuery(this).get(0)); });
            giftAmount.blur(function () { giftBlur(jQuery(this).get(0)); });
            giftAmount2.blur(function () { fireCustomValidator(); });



            giftAmountSelection.change(function () {
                fireCustomValidator();
                jQuery(this).each(function () {
                    if (jQuery(this).prop('selected', true)) {
                        if (jQuery(this).val() !== otherRadioVal) {
                            // clicked on a radio button that isn't "Other"
                            giftAmount2.val('');

                            //find required field validator and disable
                            // NOTE: ValidatorEnable causes the validator run, so when we enable we don't use ValidatorEnable, otherwise
                            // we end up with the validator behaving slightly differently to the others and displaying immediately.
                            ValidatorEnable(container.find('[id$=GiftAmountRequiredFieldValidator2]')[0], false);
                        } else {
                            // re-enable validator
                            container.find('[id$=GiftAmountRequiredFieldValidator2]')[0].enabled = true;
                        }
                    }
                });

                sendTriggerBackToServer();
            });

            var singlePaymentButton = container.find('input[id$=PaymentOptions_0]');        // Single payment option, use id instead of name due to RadioButtonList 
            if (singlePaymentButton.length > 0) {

                singlePaymentButton.on('change', function () {
                    firePayPalVisibility(jQuery(this).is(':checked'));
                });

                firePayPalVisibility(singlePaymentButton.is(':checked'));
            }

            // This event is fired if the javascript onready in PaymentCreator finishes before this onready
            jQuery(document).on('OnloadLoopBack-PayPal', function (e) {
                var singlePaymentRadio = container.find('input[id$=PaymentOptions_0]'); // Single payment option, use id instead of name due to RadioButtonList 
                if (singlePaymentRadio.length > 0) {
                    firePayPalVisibility(singlePaymentRadio.is(':checked'));
                }
            });
        });
    };

    // called on initial load and when radio buttons clicked
    function firePayPalVisibility(showPayPal) {
        jQuery(document).trigger(
        {
            type: "toggle-PayPal",
            showPayPal: showPayPal
        });
    }

    // tidy up amount if more than 2 dp
    function giftBlur(amountControl) {
        var value = amountControl.value;

        if (value === null) return;

        if (value === "0") {
            amountControl.focus();
            return;
        }

        if (decimalNumberSeparator === "") {
            decimalNumberSeparator = ".";
        }

        if (value.indexOf(decimalNumberSeparator) > 0) {
            var p = value.indexOf(decimalNumberSeparator);
            var rhs = value.substring(p + 1);
            if (rhs.length > 2) {
                amountControl.value = amountControl.value.substring(0, amountControl.value.length - (rhs.length - 2));
            }
        }
        sendTriggerBackToServer();
    }

    function sendTriggerBackToServer() {
        if (!pendingTriggerBackToServer) {
            window.setTimeout(fireTriggerBackToServer, 500);//give user a chance to select Payment options
            pendingTriggerBackToServer = true;
        }
    }

    function fireTriggerBackToServer() {

        var lastSelectedElementId = container.find('input[id$=LastSelectedElementIdAfterGiftAmountBlur]');

        var activeElement = document.activeElement;
        lastSelectedElementId.val(activeElement.id);
        __doPostBack('<%= DonationCreatorControl.ClientID %>', 'donationJsCreatorPostback');
        pendingTriggerBackToServer = false;
        disableAmountFieldsOnPostback();
    }

    // For some reason our custom validator doesnt re-validate after a valid entry has bee set, i.e. it remains on screen when it shouldnt
    function fireCustomValidator() {
        window.ValidatorValidate(container.find("span[id$='RadioEntryCustomValidator']").get(0));
    }

    /* Disable donation amount fields during postbacks - This function prevents users from clicking back and forth between radiobuttons 
    before the first postback is finished. Otherwise, we end up with a queue of JS postback triggers and odd behaviours. */
    function disableAmountFieldsOnPostback() {
        var otherAmountWithArray = container.find('input[id$=GiftAmount2]');
        var otherAmountSingle = container.find('input[id$=GiftAmount]');
        var giftArray = container.find('input[name$=GiftAmountSelection]');
        if (otherAmountWithArray != null) otherAmountWithArray.attr("disabled", true);
        if (otherAmountSingle != null) otherAmountSingle.attr("disabled", true);
        if (giftArray != null) giftArray.attr("disabled", true);
    }

    // Public Functions
    this.ValidateRadiosAndTextBox = function (source, args) {
        var checked = container.find("input[name$='GiftAmountSelection']:checked");
        if (checked.length === 0 && container.find("input[id$='GiftAmount2']").val() === "") {
            args.IsValid = false;
        } else {
            args.IsValid = true;
        }
    };

    this.EditCallBack = function (radWin) {
        var refresh = false;
        if (radWin !== null && typeof (radWin.IsDirty) === 'boolean') {
            refresh = radWin.IsDirty;
        }
        else {
            // if for some reason we dont get a rad window then assume we should refresh
            refresh = true;
        }
        if (refresh)
            window.location.reload();
    };

    this.OpenFinderAdder = function (e) {
        ShowDialog('~/AsiCommon/Controls/Shared/FinderAdder/PartyFinderAdder.aspx?DocumentPath=$/ContactManagement/DefaultSystem/Queries/Contacts&PartyType=1&AllowAdd=true', null, null, null, "Find", null, "E", this.OpenFinderAdderCallBack, "ObjectBrowser", false, true);
    };

    this.OpenFinderAdderCallBack = function (radwindow) {
        var contactKey;
        if (radwindow.newContactKey != null)
            contactKey = radwindow.newContactKey; // We are creating a new contact via the "Add a contact" window 
        else { // We are using a preexisting contact
            var result = radwindow.result;
            if (result != null)
                contactKey = result[0];
        }
        if (contactKey) {
            var contactSelectedKey = window.$get(softCreditContactKeyField);
            contactSelectedKey.value = contactKey;
            var elm = window.$get(setSoftCreditContactKeyButton);
            if (elm != null)
                elm.click();
        }
    }
}
