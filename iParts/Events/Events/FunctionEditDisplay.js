function Asi_Web_iParts_Events_FunctionEditDisplay(startDatePickerId, startTimePickerId, endDatePickerId, endTimePickerId, dateRangeValidator, regTypeRadioButtonListId, tabStripId, isImis100, isRegOpt, enableTimeConflictsId, enableTimeConflictsLabelId, conflictCodesListLabelId, conflictCodesListId, hiddenMultiSelectControlid) {

    // private variables 
    var eventsAttached = false;
    var settingTime = false;
    var settingDate = false;

    // public functions
    
    // called when all the controls have been initialised and loaded
    this.OnLoad = function() {

        // attach events
        if (!eventsAttached) {

            // attach events to the time pickers so we can tell when a time has been entered/edited
            if ($find(startDatePickerId) != null) {
                $find(startDatePickerId).add_dateSelected(OnStartDateChanged);
                $find(startTimePickerId).add_dateSelected(OnStartTimeChanged);
                $find(endDatePickerId).add_dateSelected(OnEndDateChanged);
                $find(endTimePickerId).add_dateSelected(OnEndTimeChanged);
            }
            // attach events to reg type radio buttons 
            jQuery("#" + regTypeRadioButtonListId + " [type=radio]").change(OnRegTypeChanged);

            //attach events to Conflict Code MultiSelect box
            jQuery("#" + conflictCodesListId + "_ListBox").chosen().change(OnConflictCodesChange);

            eventsAttached = true;
        }

        ConfigureTabs();

    };

    // validate the start and end date range
    // returns an object with following properties
    //      (bool)IsValid               Indicates if the date range is valid 
    //      (string)ErrorType           Type of error   date:invalid date range, datetime:invalid datetime range
    this.ValidateDateRanges = function() {

        // if we have times, then ensure we have dates
        EnsureDateIfTime(startDatePickerId, startTimePickerId, endDatePickerId);
        EnsureDateIfTime(endDatePickerId, endTimePickerId, startDatePickerId);

        // construct the return object
        var r = { IsValid: true, ErrorType: "" };

        // get a combined start date and time
        var startDate = $find(startDatePickerId).get_selectedDate();
        var startTime = $find(startTimePickerId).get_selectedDate();
        var startDateTime = null;
        if (startDate != null && startTime != null)
            startDateTime = new Date(startDate.getFullYear(), startDate.getMonth(), startDate.getDate(), startTime.getHours(), startTime.getMinutes(), 0, 0);

        // get a combined end date and time
        var endDate = $find(endDatePickerId).get_selectedDate();
        var endTime = $find(endTimePickerId).get_selectedDate();
        var endDateTime = null;
        if (endDate != null && endTime != null)
            endDateTime = new Date(endDate.getFullYear(), endDate.getMonth(), endDate.getDate(), endTime.getHours(), endTime.getMinutes(), 0, 0);

        // now compare them
        // if dates and times are present for both, then do a range check including the time
        if (startDateTime != null && endDateTime != null) {
            r.ErrorType = "datetime";
            r.IsValid = !(startDateTime > endDateTime);
            return r;
        }
        // if we have both dates, but not necessarily both times, then just check the dates
        if (startDate != null && endDate != null) {
            r.ErrorType = "date";
            r.IsValid = !(startDate > endDate);
            return r;
        }

        return r;

    };

    // validate a price
    // also formats the current value to the current locale
    this.ValidatePrice = function(source, args, min, max, pricefieldId, nanErrorMsgId, minErrorMsgId, maxErrorMsgId) {

        // use the Base Type Extensions that .NET injects to test and format numbers based on a locale
        if (typeof(Number.parseLocale) == "undefined") return true;
        var s = jQuery.trim($(pricefieldId).value + "");
        var n = 0;
        if (s != null && s.length != 0) n = Number.parseLocale(s);

        // not a valid number
        if (isNaN(n)) {
            args.IsValid = false;
            jQuery(source).text($(nanErrorMsgId).value);
            return false;
        }

        // format the number and update display
        $(pricefieldId).value = n.localeFormat("N2");

        // check the range
        if (n < min) {
            args.IsValid = false;
            jQuery(source).text($(minErrorMsgId).value);
            return false;
        }
        if (n > max) {
            args.IsValid = false;
            jQuery(source).text($(maxErrorMsgId).value);
            return false;
        }

        return true;
    };

    this.DisableSaveButtons = function (savebuttonId, saveAndCloseButtonId) {
        var saveButton = jQuery('#' + savebuttonId);
        var saveCloseButton = jQuery('#' + saveAndCloseButtonId);

        if (saveButton != 'undefined' && saveCloseButton != 'undefined') {
            saveButton.attr('disabled', 'true');
            saveCloseButton.attr('disabled', 'true');
        }
    };

    this.EnableSaveButtons = function (savebuttonId, saveAndCloseButtonId) {
        var saveButton = jQuery('#' + savebuttonId);
        var saveCloseButton = jQuery('#' + saveAndCloseButtonId);

        if (saveButton != 'undefined' && saveCloseButton != 'undefined') {
            saveButton.removeAttr('disabled', 'false');
            saveCloseButton.removeAttr('disabled', 'true');
        }
    };
    
    // private functions
    
    // called when start date is changed
    function OnStartDateChanged(sender, eventArgs) {
        ClearTimeIfNoDate(startDatePickerId, startTimePickerId);
        FireDateRangeValidator();
    }

    // called when start time is changed
    function OnStartTimeChanged(sender, eventArgs) {
        EnsureDateIfTime(startDatePickerId, startTimePickerId, endDatePickerId);
        FireDateRangeValidator();
    }

    // called when end date is changed
    function OnEndDateChanged(sender, eventArgs) {
        ClearTimeIfNoDate(endDatePickerId, endTimePickerId);
        FireDateRangeValidator();
    }

    // called when end time is changed
    function OnEndTimeChanged(sender, eventArgs) {
        EnsureDateIfTime(endDatePickerId, endTimePickerId, startDatePickerId);
        FireDateRangeValidator();
    }

    // called when the reg type is changed
    function OnRegTypeChanged(sender) {
        ConfigureTabs();
    }

    // called when adding a new conflict code into the select list
    function OnConflictCodesChange(event, params) {
        var hiddenMultiSelectControl = document.getElementById(hiddenMultiSelectControlid);
        var selectedValues = "";
        jQuery(".chosen-select > option:selected").each(function () {
            if (this.value != "" && hiddenMultiSelectControl.value.indexOf(this.value) == -1)
                selectedValues += this.value + ",";
        });
        if (typeof params !== "undefined" && params.deselected != null) {
            var newValue = hiddenMultiSelectControl.value;
            newValue = newValue.replace(params.deselected, "");
            hiddenMultiSelectControl.value = newValue.replace(",,",",");
        } else {
            hiddenMultiSelectControl.value += selectedValues;
        }
    }

    // checks that if there is no date there is no time
    // we can't have a time without a date
    function ClearTimeIfNoDate(datePickerId, timePickerId) {

        if (settingDate) return;

        settingTime = true;

        var date = $find(datePickerId).get_selectedDate();
        var time = $find(timePickerId).get_selectedDate();

        if (date == null && time!=null)
            $find(timePickerId).set_selectedDate(null);

        settingTime = false;

    }

    // checks that if we have a time entered, we also have a date
    // we can't have a time without a date
    function EnsureDateIfTime(datePickerId, timePickerId, defaultDatePickerId) {

        if (settingTime) return;

        settingDate = true;

        var date = $find(datePickerId).get_selectedDate();
        var time = $find(timePickerId).get_selectedDate();
        var defaultDate = $find(defaultDatePickerId).get_selectedDate();
        if (defaultDate == null) defaultDate = new Date();

        if (date == null && time != null)
            $find(datePickerId).set_selectedDate(defaultDate);

        settingDate = false;

    }

    // fire the date range validator
    function FireDateRangeValidator() {
        ValidatorValidate($(dateRangeValidator));
    }

    // configure tabs based on current values
    function ConfigureTabs() {

        // hide/show pricing tab
        var priceTab = $find(tabStripId).findTabByValue("pricing");
        var accountsTab = $find(tabStripId).findTabByValue("accounting");
        var questionsTab = $find(tabStripId).findTabByValue("questions");
        var programOptionsTab = $find(tabStripId).findTabByValue("programOptions");
        var enableTimeConflicts = document.getElementById(enableTimeConflictsId);
        var enableTimeConflictsLabel = document.getElementById(enableTimeConflictsLabelId);
        var conflictCodesListLabel = document.getElementById(conflictCodesListLabelId);
        var conflictCodesList = document.getElementById(conflictCodesListId + "_ListBox");
        if (GetRegTypeValue() == "Fee" || isImis100 == "False" || isRegOpt == "True") {
            priceTab.set_enabled(true);
            if (accountsTab != null)
                accountsTab.set_enabled(true);
        } else {
            priceTab.set_enabled(false);
            accountsTab.set_enabled(false);
        }
        
        if (questionsTab != undefined) {
            // In !iMIS100, all events are fee-based, so enabled the questions.
            if (isImis100 == "False" || isRegOpt || GetRegTypeValue() == "Fee" || GetRegTypeValue() == "Required") {
                questionsTab.set_enabled(true);
            } else {
                questionsTab.set_enabled(false);
            }
        }

        if (isImis100 == "True") {
            if (GetRegTypeValue() == "NotRequired") {
                if (enableTimeConflicts != null) {
                    enableTimeConflicts.setAttribute("disabled", "disabled");
                    enableTimeConflictsLabel.setAttribute("disabled", "disabled");
                    conflictCodesListLabel.setAttribute("disabled", "disabled");
                    conflictCodesList.setAttribute("disabled", "disabled");
                    jQuery("#" + conflictCodesListId + "_ListBox")
                        .chosen()
                        .prop('disabled', true)
                        .trigger("chosen:updated");
                }
            } else {
                if (enableTimeConflicts != null) {
                    enableTimeConflicts.removeAttribute("disabled");
                    enableTimeConflictsLabel.removeAttribute("disabled");
                    conflictCodesListLabel.removeAttribute("disabled");
                    conflictCodesList.removeAttribute("disabled");
                    jQuery("#" + conflictCodesListId + "_ListBox")
                        .chosen()
                        .prop('disabled', false)
                        .trigger("chosen:updated");
                }
            }
        }

        // In !iMIS100, all events are fee-based, so enabled the program options.
        if (programOptionsTab != undefined) {
            if (isImis100 == "False" || isRegOpt)
                programOptionsTab.set_enabled(true);
            else
                programOptionsTab.set_enabled(false);
        }

    }
    
    // get the currently selected regtype value
    function GetRegTypeValue() {
        return jQuery("#" + regTypeRadioButtonListId + " [type=radio]").filter(":checked").val();
    }

}