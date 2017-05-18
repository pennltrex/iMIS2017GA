function Asi_Web_iParts_Commerce_PromotionEdit(startDatePickerId, endDatePickerId, dateRangeValidator) {
    //
    // Variables
    //'<%#CollectionItemsGrid.ClientID%>'
    this.RefreshButtonId;
    this.HiddenProductGuidTextBoxId;

    // keep a reference to "this" to use when "this" means something else
    var me = this;

    // private variables 
    var eventsAttached = false;
    // public functions

    // called when all the controls have been initialised and loaded
    this.OnLoad = function () {
       
        if (!eventsAttached) {
            
            // attach events to the time pickers so we can tell when a time has been entered/edited
            var tempStartDatePicker = $find(startDatePickerId);
            var tempEndDatePicker = $find(endDatePickerId);
            if (tempStartDatePicker != undefined)
                tempStartDatePicker.add_dateSelected(OnStartDateChanged);
            if (tempEndDatePicker != undefined)
                tempEndDatePicker.add_dateSelected(OnEndDateChanged);

            eventsAttached = true;
        }
    }

    // validate the start and end date range
    this.ValidateDateRanges = function (source,args) {
        // construct the return object
        var r = { IsValid: true, ErrorType: "" };

        var startDate = $find(startDatePickerId).get_selectedDate();
        var endDate = $find(endDatePickerId).get_selectedDate();

        // if we have both dates, but not necessarily both times, then just check the dates
        if (startDate != null && endDate != null) {
            args.IsValid = !(startDate > endDate);
            return r;
        }

        return r;
    }

    // called when start date is changed
    function OnStartDateChanged(sender, eventArgs) {
        FireDateRangeValidator();
    }

    // called when end date is changed
    function OnEndDateChanged(sender, eventArgs) {
        FireDateRangeValidator();
    }

    // fire the date range validator
    function FireDateRangeValidator() {
        ValidatorValidate($(dateRangeValidator));
    }

    // add an item
    this.AddItem = function (url) {
        if (url == null || url == "") return;
        ShowDialog(url, null, 1000, 1000, "Add Item", null, "E", null, null, false, false, AddItemOnClose, null);
        return false; //this prevents postback
    };

    // called when closing the item edit popup
    function AddItemOnClose(radWin) {
        if (radWin != null &&
            radWin.result != null &&
            radWin.result.length > 0) {

            var result = radWin.result[0];
            radWin.result = null; // clear out radWin.result in case we press the "cancel" button next time in the finder adder
            if (me.HiddenProductGuidTextBoxId != null) {
                $(me.HiddenProductGuidTextBoxId).value = result;
            }
        }
        if (me.RefreshButtonId != null) {
            $(me.RefreshButtonId).click();
        }
    };
}