function Asi_Web_iParts_Events_EventFunctionPricing(priceMode, earlyCutoffDatePickerId, regularCutoffDatePickerId, 
    cutoffRangeValidatorId, priceGridId, minPrice, maxPrice, stdCompBoxId, discCompBoxId, earlyCutoffDate, regularCutoffDate,
    allowGuestsCheckboxId, allowPrimaryDivId) {

    // private variables 
    var eventsAttached = false;
    var priceFocusValues;

    // constructor
    CachePrices();

	// public functions
	
	// called when all the controls have been initialised and loaded
	this.OnLoad = function() {

        // attach events
        if (!eventsAttached) {

            // attach events to the time pickers so we can tell when a time has been entered/edited
            // only applies when pricing mode is Event, we don't show the dates in Function mode
            if (priceMode == "Event") {
                $find(earlyCutoffDatePickerId).add_dateSelected(OnEarlyCutoffDateChanged);
                $find(regularCutoffDatePickerId).add_dateSelected(OnRegularCutoffDateChanged);
            }

            // attach events to price text fields
            jQuery("#" + priceGridId + " input[type=text][name*=TextPrice]").blur(OnPriceBlur);

            var standardCompBox = document.getElementById(stdCompBoxId);
            var discountCompBox = document.getElementById(discCompBoxId);

            if (standardCompBox != null)
                standardCompBox.onclick = function () { EnableDisablePriceFields(); };
            if (discountCompBox != null)
                discountCompBox.onclick = function () { EnableDisablePriceFields(); };

            jQuery("#" + allowGuestsCheckboxId).change(this, OnAllowGuestsChanged);

            eventsAttached = true;

        }

        EnableDisablePriceFields();

    };

    // validate cut off date range
    // returns an object with following properties
    //      (bool)IsValid               Indicates if the date range is valid
    this.ValidateCutoffDateRange = function() {

        //construct return object
        var r = { IsValid: true };

        //get early cut off date
        var earlyDate = $find(earlyCutoffDatePickerId).get_selectedDate();
        //get late cut off date
        var regularDate = $find(regularCutoffDatePickerId).get_selectedDate();

        // now compare them
        if (earlyDate != null && regularDate != null) {
            //SMR #309103 when comparing make sure you check if they are equal by using getTime(), otherwise
            //events cloned/created on desktop that have matching early & regular dates cannot be edited in web!
            r.IsValid = !(earlyDate > regularDate) || !(earlyDate.getTime() == regularDate.getTime());
            return r;
        }
        return r;
    };
    
    // private functions
    
    // called when early cutoff date is changed
    function OnEarlyCutoffDateChanged(sender, eventArgs) {
        earlyCutoffDate = eventArgs._newDate;
        EnableDisablePriceFields();
        FireCutoffDateRangeValidator();
    }

    // called when regular cutoff date is changed
    function OnRegularCutoffDateChanged(sender, eventArgs) {
        regularCutoffDate = eventArgs._newDate;
        EnableDisablePriceFields();
        FireCutoffDateRangeValidator();
    }

    // fire the cut off date range validator
    function FireCutoffDateRangeValidator()
    {
        ValidatorValidate($(cutoffRangeValidatorId));
    }

    // called when leaving a price field
    function OnPriceBlur(sender) {
        
        //If the field is invalid, don't bother doing anything.
        if (!sender.target.Validators[0].isvalid )
            return;
        // tidy the price field
        var untidy = jQuery(sender.target).val();
        var tidy = TidyPriceString(untidy);
        if (untidy != tidy) jQuery(sender.target).val(tidy);
        
        if (priceMode == "Event" || (stdCompBoxId == '' && discCompBoxId == '')) {
            MapPrices(sender.target.id);
        }
        // map standard price to discount--as long as Complimentary isn't checked (i20 only)
        else {
            var standardCompBox = document.getElementById(stdCompBoxId);
            var discountCompBox = document.getElementById(discCompBoxId);
            if (!standardCompBox.checked && !discountCompBox.checked)
                MapPrices(sender.target.id);
        }
        
        CachePrices();
        ValidateCorrespondingField(sender);
    }

    // Cache the current prices
    function CachePrices() {
        priceFocusValues = new Array();
        jQuery("#" + priceGridId + " input[type=text][name*=TextPrice]").each(function(index) {priceFocusValues.push({id:this.id,price:this.value})});
    }

    // Map prices between the standard and discount rows
    function MapPrices(priceId) {

        // get the field ids
        var isStandard = IsStandardPriceId(priceId);
        var stId = isStandard ? priceId : StandardPriceIdFromDiscountPriceId(priceId);
        var diId = isStandard ? DiscountPriceIdFromStandardPriceId(priceId) : priceId;

        if (isStandard) {
            // map standard price field to discount field if they were previously the same
            // get the cached standard price
            var oldst = null;
            for (var i = 0; i < priceFocusValues.length; i++) {
                if (priceFocusValues[i].id == stId) {
                    oldst = priceFocusValues[i];
                    break;
                }
            }
            if (oldst == null) return;  // should never happen
            // if the current discount price, and old standard price are the same
            // OR the discount price is empty
            // then copy the standard price to the discount price
            var diTidy = TidyPriceString(jQuery("#" + diId).val());
            var oldstTidy = TidyPriceString(oldst.price);
            if (diTidy == oldstTidy || diTidy.length == 0)
                jQuery("#" + diId).val(jQuery("#" + stId).val());

        }
        else {
            // map standard to discount if discount is now empty
            if (jQuery("#" + diId).val().length == 0)
                jQuery("#" + diId).val(jQuery("#" + stId).val());
        }

    }

    // tests the id of an element to see if it is one of the standard price fields
    function IsStandardPriceId(priceFieldId) {
        return priceFieldId.indexOf("_TextPriceStandard") >= 0;
    }

    // gets the id of a corresponding discount price element from standard price id
    function DiscountPriceIdFromStandardPriceId(standardPriceId) {
        if (standardPriceId.indexOf("_TextPriceStandard") < 0) return null;
        return standardPriceId.replace("_TextPriceStandard", "_TextPriceDiscount");
    }

    // gets the id of a corresponding standard price element from discount price id
    function StandardPriceIdFromDiscountPriceId(discountPriceId) {
        if (discountPriceId.indexOf("_TextPriceDiscount") < 0) return null;
        return discountPriceId.replace("_TextPriceDiscount", "_TextPriceStandard");
    }

    // Tidies a price string
    // Uses locale settings to format the number
    // Zero prices will be returned as empty
    function TidyPriceString(priceString) {

        // cleanup whitespace
        priceString = jQuery.trim(priceString + "");
        if (priceString == null || priceString.length == 0) return "";

        // determine if we have the Base Type Extensions that .NET injects to test and format numbers based on a locale
        // we should have them
        var useMsExtensions = typeof (Number.parseLocale) != "undefined";

        // convert string to a number
        var n = useMsExtensions ? Number.parseLocale(priceString) : parseFloat(priceString);
        if (isNaN(n)) n = 0;
        //convert maxPrice, which needs to be passed as string for culture/language issues
        maxPrice = jQuery.trim(maxPrice + "");
        var convertedMaxPrice = useMsExtensions ? Number.parseLocale(maxPrice) : parseFloat(maxPrice);
        
        // check the range
        if (n < minPrice) n = minPrice;
        if (n > convertedMaxPrice) n = convertedMaxPrice;

        //special case for complimentary
        if (stdCompBoxId != '' && discCompBoxId != '') {
            var standardCompBox = document.getElementById(stdCompBoxId);
            var discountCompBox = document.getElementById(discCompBoxId);
            if ((standardCompBox.checked || discountCompBox.checked) && n == 0) {
                return "0";
            }
        }
        // return formatted for display
        if (n == 0) return "";
        return useMsExtensions ? n.localeFormat("N2") : n.toFixed(2);

    }
    
    //If one of the the discount fields has an invalid value in it and you modify the corresponding
    //standard price field, the validator on the discount field never gets turned off even when the valid
    //value gets copied over, so we'll fire the corresponding validator on the discount field.
    function ValidateCorrespondingField(sender) {
        if (IsStandardPriceId(sender.target.id)) {
            var priceId = DiscountPriceIdFromStandardPriceId(sender.target.id);
            var validatorId = priceId.replace("$", "_")+"Validator";//Find the validator that's associated with this field
            var validator = document.getElementById(validatorId);
            ValidatorValidate(validator);
        }
    }
    

    // enable and disable price fields based on whether cutoff dates are specified
    function EnableDisablePriceFields() {

        // First look for the values to be passed from the client fields in case they have been edited.
        // When the function pricing is edited in the program display, there is no client side field, 
        // so we get the values from the server side Event object.

        var earlyDate = null;
	    var regularDate = null;

	
	    //iMis100 has the datepickers in the same panel as the price fields.	
	    if ($find(earlyCutoffDatePickerId) != null) {
	        earlyDate = $find(earlyCutoffDatePickerId).get_selectedDate();
	    }
	    if ($find(regularCutoffDatePickerId) != null) {
	        regularDate = $find(regularCutoffDatePickerId).get_selectedDate();
	    }
        //iMis10 has the datepickers in a previous panel, which is why we search the parent document if they are not found.
	    if (earlyDate == null) {
	        earlyDate = jQuery("#" + earlyCutoffDatePickerId, window.parent.document).val();
	    }	        
	    if (regularDate == null) {
	        regularDate = jQuery("#" + regularCutoffDatePickerId, window.parent.document).val();
	    }

	    //if the dates are still null, they can come from the server.
	    if (earlyDate == null) {
	        earlyDate = earlyCutoffDate;	        
	    }
	    if (regularDate == null) {
	        regularDate = regularCutoffDate;	        
	    }
	    if (priceMode != "Event") {
	        //set the dates in hidden fields so we can pass them for pricing
	        jQuery("input[type=hidden][name$=HiddenEarlyCutoffDate]").attr('value', earlyDate);
	        jQuery("input[type=hidden][name$=HiddenRegularCutoffDate]").attr('value', regularDate);
	    }
        //if after all of this, they are still null, then there are no cut off dates defined and the fields will be disabled.

	    var standardCompBox = document.getElementById(stdCompBoxId);
        var discountCompBox = document.getElementById(discCompBoxId);

 	    // early prices
        if (earlyDate != null) {
            // disable price boxes and clear value if complementary pricing box is checked
            // or if there is no early date defined
            if ((standardCompBox != null && standardCompBox.checked == true) ||
                earlyDate == null ||
                earlyDate == "") {
                DisablePriceBox("TextPriceStandardEarly");
            }
            else {
                EnablePriceBox("TextPriceStandardEarly");
            }
            if ((discountCompBox != null && discountCompBox.checked == true) ||
                earlyDate == null ||
                earlyDate == ""){
                DisablePriceBox("TextPriceDiscountEarly");
            }
            else {
                EnablePriceBox("TextPriceDiscountEarly");
                //repopulate price with corresponding standard price
                if (discountCompBox != null)
                    MapPrices(StandardPriceIdFromDiscountPriceId(jQuery("#" + priceGridId + " input[type=text][name$=TextPriceDiscountEarly]").attr('id')));
            }
        }
        else {
            DisablePriceBox("TextPriceStandardEarly");
            DisablePriceBox("TextPriceDiscountEarly");
            DisablePriceBox("TextPriceOtherEarly");
        }

        // late prices
        if (regularDate != null) {
            // disable price boxes and clear value if complementary pricing box is checked
            // or if there is no regular date defined
            if ((standardCompBox != null && standardCompBox.checked == true) ||
                regularDate == null ||
                regularDate == "") {
                DisablePriceBox("TextPriceStandardLate");
            }
            else {
                EnablePriceBox("TextPriceStandardLate");
            }
            if ((discountCompBox != null && discountCompBox.checked == true) ||
                regularDate == null ||
                regularDate == "") {
                DisablePriceBox("TextPriceDiscountLate");
            }
            else {
                EnablePriceBox("TextPriceDiscountLate");
                //repopulate price with corresponding standard price
                if (discountCompBox != null)
                    MapPrices(StandardPriceIdFromDiscountPriceId(jQuery("#" + priceGridId + " input[type=text][name$=TextPriceDiscountLate]").attr('id')));
            }
        }
        else {
            DisablePriceBox("TextPriceStandardLate");
            DisablePriceBox("TextPriceDiscountLate");
            DisablePriceBox("TextPriceOtherLate");
        }
        // Regular Prices being disabled or enabled only depends on whether the complementary pricing box is checked
        if (standardCompBox != null && standardCompBox.checked == true) {
            DisablePriceBox("TextPriceStandardRegular");
        }
        else {
            EnablePriceBox("TextPriceStandardRegular");
        }

        if (discountCompBox != null && discountCompBox.checked == true) {
            DisablePriceBox("TextPriceDiscountRegular");
        }
        else {
            EnablePriceBox("TextPriceDiscountRegular");
            //repopulate price with corresponding standard price
            if (discountCompBox != null)
                MapPrices(StandardPriceIdFromDiscountPriceId(jQuery("#" + priceGridId + " input[type=text][name$=TextPriceDiscountRegular]").attr('id')));
        }

        if (earlyDate == null || earlyDate == "") {
            DisablePriceBox("TextPriceOtherEarly");
        }
        if (regularDate == null || regularDate == "") {
            DisablePriceBox("TextPriceOtherLate");
        }
    }
    
    function DisablePriceBox(name) {
        jQuery("#" + priceGridId + " input[type=text][name$=" + name + "]").attr('disabled', 'true');
        jQuery("#" + priceGridId + " input[type=text][name$=" + name + "]").attr('value', '');
    }

    function EnablePriceBox(name) {
        jQuery("#" + priceGridId + " input[type=text][name$=" + name + "]").removeAttr('disabled');
    }

    function OnAllowGuestsChanged() {
        var allowPrimaryDiv = jQuery("#" + allowPrimaryDivId);
        if (this.checked) {
            allowPrimaryDiv.collapse('show');
        } else {
            allowPrimaryDiv.collapse('hide');
            jQuery('#' + allowPrimaryDivId + " :checkbox").prop('checked', false);
        }
    }
}


function EnableDisableOtherPriceFields(priceMode, earlyCutoffDatePickerId, regularCutoffDatePickerId,
        otherCompBoxId, otherEarlyTextBoxId, otherRegularTextBoxId, otherLateTextBoxId, earlyCutoffDate, regularCutoffDate) {

    // First look for the values to be passed from the client fields in case they have been edited.
    // When the function pricing is edited in the program display, there is no client side field, 
    // so we get the values from the server side Event object.

    var earlyDate = null;
    var regularDate = null;


    //iMis100 has the datepickers in the same panel as the price fields.	
    if ($find(earlyCutoffDatePickerId) != null) {
        earlyDate = $find(earlyCutoffDatePickerId).get_selectedDate();
    }
    if ($find(regularCutoffDatePickerId) != null) {
        regularDate = $find(regularCutoffDatePickerId).get_selectedDate();
    }
    //iMis10 has the datepickers in a previous panel, which is why we search the parent document if they are not found.
    if (earlyDate == null) {
        earlyDate = jQuery("#" + earlyCutoffDatePickerId, window.parent.document).val();
    }
    if (regularDate == null) {
        regularDate = jQuery("#" + regularCutoffDatePickerId, window.parent.document).val();
    }

    //if the dates are still null, they can come from the server.
    if (earlyDate == null) {
        earlyDate = earlyCutoffDate;
    }
    if (regularDate == null) {
        regularDate = regularCutoffDate;
    }

    var otherCompBox = document.getElementById(otherCompBoxId);

    // early prices
    if (earlyDate != null) {
        // disable price boxes and clear value if complementary pricing box is checked
        // or if there is no early date defined
        if ((otherCompBox != null && otherCompBox.checked == true) ||
            earlyDate == null ||
            earlyDate == "") {
            jQuery('#' + otherEarlyTextBoxId).attr('disabled', 'true');
            jQuery('#' + otherEarlyTextBoxId).attr('value', '');
        }
        else {
            jQuery('#' + otherEarlyTextBoxId).removeAttr('disabled');
        }
    }


    // late prices
    if (regularDate != null) {
        // disable price boxes and clear value if complementary pricing box is checked
        // or if there is no regular date defined
        if ((otherCompBox != null && otherCompBox.checked == true) ||
            regularDate == null ||
            regularDate == "") {
            jQuery('#' + otherLateTextBoxId).attr('disabled', 'true');
            jQuery('#' + otherLateTextBoxId).attr('value', '');
        }
        else {
            jQuery('#' + otherLateTextBoxId).removeAttr('disabled');
        }
    }

    // Regular Prices being disabled or enabled only depends on whether the complementary pricing box is checked
    if (otherCompBox != null && otherCompBox.checked == true) {
        jQuery('#' + otherRegularTextBoxId).attr('disabled', 'true');
        jQuery('#' + otherRegularTextBoxId).attr('value', '');
    }
    else {
        jQuery('#' + otherRegularTextBoxId).removeAttr('disabled');
    }

}