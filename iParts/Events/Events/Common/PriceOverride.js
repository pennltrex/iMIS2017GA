function Asi_Web_iParts_Events_PriceOverride(priceInputId, revertId, originalPriceId, updatePriceId) {

    this.OnLoad = function () {
        jQuery("#" + updatePriceId).on("keydown", enterKeyPress);
        jQuery("#" + priceInputId).on("input", onPriceChange);

        var originalPrice = parseFloat(jQuery("#" + originalPriceId).val());
        originalPrice.toFixed(2);
        var priceInput = parseFloat(jQuery("#" + priceInputId).val());
        priceInput.toFixed(2);

        if (originalPrice != priceInput)
            jQuery("#" + revertId).show();

    };

    function onPriceChange() {
        var override = jQuery("#" + priceInputId).val();
        var originalPrice = jQuery("#" + originalPriceId).val();
        //we need to remove the comma seperator in order to get a proper comparison using the parseFloat function otherwise parseFloat(1)==parseFloat(1,345.50) is true. 
        //This Regex part needs to be replaced with a jQuery plugin in order to be compatible with other cultures
        if ( parseFloat(override) != parseFloat(originalPrice.replace(/[^0-9\.]+/g, "") )) {
            jQuery("#" + revertId).show();
            jQuery("#" + updatePriceId).show();
            jQuery("#" + revertId).attr("tabindex", "0");
        }
        else
        {
            jQuery("#" + revertId).hide();
            jQuery("#" + updatePriceId).hide();
        }
    }
    
    function enterKeyPress(e) {
        // look for window.event in case event isn't passed in 
        if (typeof e == 'undefined' && window.event) { e = window.event; }
        if (e != null && (e.keyCode == 13 || e.which == 13)) {
            jQuery("#" + updatePriceId).click();
            e.stopPropagation();
        }
    }
}

