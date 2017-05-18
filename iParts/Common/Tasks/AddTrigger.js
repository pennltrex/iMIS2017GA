function Asi_Web_iParts_Common_Tasks_AddTrigger(startDatePickerId, startTimePickerId, endDatePickerId, endTimePickerId, dateRangeValidator) {
    var settingTime = false;
    var settingDate = false;    

    // called when all the controls have been initialised and loaded
    this.OnLoad = function() {

        var startDate = $find(startDatePickerId);
        var startTime = $find(startTimePickerId);
        var endDate = $find(endDatePickerId);
        var endTime = $find(endTimePickerId);

        if(startDate != null)
            startDate.add_dateSelected(OnStartDateChanged);
        if(startTime != null)
            startTime.add_dateSelected(OnStartTimeChanged);
        if(endDate != null)
            endDate.add_dateSelected(OnEndDateChanged);
        if(endTime != null)
            endTime.add_dateSelected(OnEndTimeChanged);
    };

    this.ValidateDateRanges = function (startDateId, startTimeId, endDateId, endTimeId) {

        var startTimePicker = $find(startTimeId);
        var endTimePicker = $find(endTimeId);
        //// if we have times, then ensure we have dates
        if (startTimePicker != null)
            EnsureDateIfTime(startDateId, startTimeId, endDateId);
        if (endTimePicker != null)
            EnsureDateIfTime(endDateId, endTimeId, startDateId);
        
        // construct the return object
        var r = { IsValid: true, ErrorType: "" };

        // get a combined start date and time
        var startDate = $find(startDateId).get_selectedDate();;
        var startTime = startTimePicker != null ? startTimePicker.get_selectedDate() : null;
        var startDateTime = null;
        if (startDate != null && startTime != null)
            startDateTime = new Date(startDate.getFullYear(), startDate.getMonth(), startDate.getDate(), startTime.getHours(), startTime.getMinutes(), 0, 0);

        // get a combined end date and time
        var endDatePicker = $find(endDateId);
        if (endDatePicker == null)
            return r;
        var endDate = endDatePicker.get_selectedDate();
        var endTime = endTimePicker != null ? endTimePicker.get_selectedDate() : null;
        var endDateTime = null;
        if (endDate != null && endTime != null)
            endDateTime = new Date(endDate.getFullYear(), endDate.getMonth(), endDate.getDate(), endTime.getHours(), endTime.getMinutes(), 0, 0);

        // now compare them
        // if dates and times are present for both, then do a range check including the time
        if (startDateTime != null && endDateTime != null) {
            r.ErrorType = "datetime";
            // ReSharper disable QualifiedExpressionMaybeNull
            r.IsValid = !(startDateTime.getTime() > endDateTime.getTime() || startDate.getTime() == endDate.getTime());
            // ReSharper restore QualifiedExpressionMaybeNull
            return r;
        }
        // if we have both dates, but not necessarily both times, then just check the dates
        if (startDate != null && endDate != null) {
            r.ErrorType = "date";
            r.IsValid = !(startDate.getTime() > endDate.getTime() || startDate.getTime() == endDate.getTime());
            return r;
        }

        return r;
    };

    // checks that if there is no date there is no time
    // we can't have a time without a date
    function ClearTimeIfNoDate(datePickerId, timePickerId) {

        if (settingDate) return;
        var timePicker = $find(timePickerId);
        if (timePicker == null) return;

        settingTime = true;

        var date = $find(datePickerId).get_selectedDate();
        var time = timePicker.get_selectedDate();

        if (date == null && time != null)
            timePicker.set_selectedDate(null);

        settingTime = false;
    }

    // checks that if we have a time entered, we also have a date
    // we can't have a time without a date
    function EnsureDateIfTime(datePickerId, timePickerId, defaultDatePickerId) {

        if (settingTime) return;

        settingDate = true;

        var date = $find(datePickerId).get_selectedDate();
        var time = $find(timePickerId).get_selectedDate();
        var defaultDate;
        if ($find(defaultDatePickerId) != null)
            defaultDate = $find(defaultDatePickerId).get_selectedDate();
        else
            defaultDate = new Date();
        if (defaultDate == null) defaultDate = new Date();

        if (date == null && time != null)
            $find(datePickerId).set_selectedDate(defaultDate);

        settingDate = false;
    }

    // called when start date is changed
    function OnStartDateChanged(sender, eventArgs) {
        ClearTimeIfNoDate(startDatePickerId, startTimePickerId);
        var endDate = $find(endDatePickerId);
        if (endDate != null)
            FireDateRangeValidator();
    }

    // called when start time is changed
    function OnStartTimeChanged(sender, eventArgs) {
        EnsureDateIfTime(startDatePickerId, startTimePickerId, endDatePickerId);
        var endDate = $find(endDatePickerId);
        if (endDate != null)
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

    // fire the date range validator
    function FireDateRangeValidator() {
        ValidatorValidate($(dateRangeValidator));
    }
}