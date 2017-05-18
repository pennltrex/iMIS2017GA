function Asi_Web_iParts_Commerce_ProductDisplayDisplay() {

    var RefreshButtonId = null;

    // public functions

    // edit an item
    this.EditItem = function (itemKey, url, refreshButtonId) {
        if (url == null || url == "") return;
        if (url.indexOf("?") >= 0)
            url += "&iProductID=" + itemKey;
        else
            url += "?iProductID=" + itemKey;
        RefreshButtonId = refreshButtonId;
        var dialog = ShowDialog(url, null, "95%", "95%", "Edit Item", null, "E", null, null, false, false, ItemEditOnClose, null);

        // dialog.set_destroyOnClose(true);
    };

    // delete an item
    this.DeleteItem = function (deleteButtonId, confirmMessage) {
        if (confirm(confirmMessage)) {
            $(deleteButtonId).click();
        }
    };

    // private functions

    // called when closing the item edit popup
    function ItemEditOnClose(radWin) {
        var refresh = false;
        if (radWin != null && typeof (radWin.IsDirty) == 'boolean') {
            refresh = radWin.IsDirty;
        }
        else {
            // if for some reason we dont get a rad window then assume we should refresh
            refresh = true;
        }
        if (refresh && RefreshButtonId != null)
            $(RefreshButtonId).click();
    };

}

function Asi_Web_iParts_Commerce_PickOneUtility(hiddenSubmitButtonID, thisClientID) {
    function SetSelectedItem(me) {
        //Add the change function that sets the currently hidden field at the top of the part to the current selected item for server side reading and then runs the click event of the hidden button
        if (jQuery(me).is(':checked')) {
            var currentItem = jQuery(me).parent().parent().find('span[id$="OrderLineKeyLabel"]').html();

            if (currentItem != undefined) {
                jQuery("#" + thisClientID).find("input[id$='selectedItem']").val(currentItem);
                jQuery("#" + thisClientID).find("#" + hiddenSubmitButtonID).click();
            }
        }
    }



    //Set the initial state of the hidden selected item in the selected itemhidden field so that we can grab it out at the server,
    this.setStartupActions = function () {

        var tempSelectedItemChangeFunction = SetSelectedItem;
        var tempQuantityTextChangeFunction = QuantityTextBoxChanged;
        var tempQuantityTextChangeNoSubmitFuntion = QuantityChangeNoSubmit;
        jQuery("#" + thisClientID).find('[type=radio]').each(function (i) {
            //Put the radio buttons in the same group by setting the name attribute, because if they're in a Listview you can't set the groupname.
            jQuery(this).attr('name', 'selectedItemRadio_' + thisClientID);
            if (jQuery(this).is(':checked')) {
                //Find the quantity box that is in this table row and trigger the quantity change function for this quantity box to set the initial state.
                var quantityBoxSibling = jQuery(this).parent().parent().find('input[id$="QuantityTextBox"]').get(0);
                if (quantityBoxSibling != undefined) {
                    tempQuantityTextChangeNoSubmitFuntion(quantityBoxSibling);
                }
            }
            jQuery(this).change(function () { tempSelectedItemChangeFunction(this); });
        });
        //Not sure if we should have the postback on change or keyup, but the pick one in MoO has it on change so I guess I'll leave it that way.
        jQuery("#" + thisClientID).find('input[id$="QuantityTextBox"]').each(function (i) { jQuery(this).change(function () { tempQuantityTextChangeFunction(this); }); });
        jQuery("#" + thisClientID).find('input[id$="QuantityTextBox"]').each(function (i) { jQuery(this).keyup(function () { tempQuantityTextChangeNoSubmitFuntion(this); }); });

    }



    //Triggered when the quantity text box changes, causes postback.
    function QuantityTextBoxChanged(me) {
        var quantityTextBoxValue = jQuery(me).val();
        if (!isNaN(quantityTextBoxValue) && parseInt(quantityTextBoxValue) > -1) {
            jQuery('#' + thisClientID).find('input[id$="quantityTextFieldValue"]').val(quantityTextBoxValue);
            jQuery('#' + thisClientID).find('input[id$="quantityTextChangedButton"]').click();
        }
    }

    //Same as above but does not trigger the click/postback, added because there is a chance that people will enter the quantity without clicking out of the quantity box and then the 
    //above function will not be triggered. Probably don't want a postback on keyup though in case site on slow link.
    function QuantityChangeNoSubmit(me) {
        var quantityTextBoxValue = jQuery(me).val();

        if (!isNaN(quantityTextBoxValue) && parseInt(quantityTextBoxValue) > -1) {

            jQuery('#' + thisClientID).find('input[id$="quantityTextFieldValue"]').val(quantityTextBoxValue);
        }
    }
}

// Called on changing OverridePricing Textbox
function DisplayRevertPrice() {
    var revert = jQuery("#RevertPrice").val();
    var override = jQuery("#OverridePricing").val();
    var original = jQuery("#OriginalPrice").val();
    if (revert.length == 0) {
        if (parseFloat(override) != parseFloat(original)) {
            jQuery("#RevertPrice").show();
        }
    }
}

