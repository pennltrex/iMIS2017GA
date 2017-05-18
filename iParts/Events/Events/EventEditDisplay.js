function Asi_Web_iParts_Events_EventEditDisplay(startDatePickerId,
    startTimePickerId,
    endDatePickerId,
    endTimePickerId,
    publishStartDatePickerId,
    publishStartTimePickerId,
    publishEndDatePickerId,
    publishEndTimePickerId,
    registrationStartDatePickerId,
    registrationStartTimePickerId,
    registrationEndDatePickerId,
    registrationEndTimePickerId,
    dateRangeValidator,
    publishDateRangeValidator,
    registrationDateRangeValidator,
    regTypeRadioButtonListId,
    tabStripId,
    regOthersId,
    allowAddId,
    roLabelId,
    agLabelId,
    allowRegEditId,
    regEditPanelId,
    txtRegistrationClosedMessage,
    lblRegistrationClosedMessage,
    registrationStartTimeZoneId,
    registrationEndTimeZoneId,
    lblRegistrationStart,
    lblRegistrationEnd,
    registrationStartDate,
    registrationEndDate,
    registrationStartTime,
    registrationEndTime,
    enableTimeConflicts,
    enableTimeConflictsLabel,
    allowRegistrantConflicts,
    allowRegistrantConflictsLabel,
    isImis100,
    textDescriptionId,
    IsTemplate,
    pageTitleContainer) {
        
    // private variables 
    var eventsAttached = false;
    var settingTime = false;
    var settingDate = false;    
    
    // public functions
    
    // called when all the controls have been initialised and loaded
    this.OnLoad = function () {

        // attach events
        if (!eventsAttached) {

            // attach events to the time pickers so we can tell when a time has been entered/edited
            $find(startDatePickerId).add_dateSelected(OnStartDateChanged);
            $find(startTimePickerId).add_dateSelected(OnStartTimeChanged);
            $find(endDatePickerId).add_dateSelected(OnEndDateChanged);
            $find(endTimePickerId).add_dateSelected(OnEndTimeChanged);
            
            // attach events to the publish time pickers so we can tell when a time has been entered/edited
            $find(publishStartDatePickerId).add_dateSelected(OnPublishStartDateChanged);
            $find(publishStartTimePickerId).add_dateSelected(OnPublishStartTimeChanged);
            $find(publishEndDatePickerId).add_dateSelected(OnPublishEndDateChanged);
            $find(publishEndTimePickerId).add_dateSelected(OnPublishEndTimeChanged);
            
            // attach events to the registration time pickers so we can tell when a time has been entered/edited
            $find(registrationStartDatePickerId).add_dateSelected(onRegistrationStartDateChanged);
            $find(registrationStartTimePickerId).add_dateSelected(onRegistrationStartTimeChanged);
            $find(registrationEndDatePickerId).add_dateSelected(onRegistrationEndDateChanged);
            $find(registrationEndTimePickerId).add_dateSelected(onRegistrationEndTimeChanged);

            // attach events to reg type radio buttons 
            jQuery("#" + regTypeRadioButtonListId + " [type=radio]").change(OnRegTypeChanged);

            jQuery("input#" + regOthersId).change(ConfigureCheckBoxes);

            jQuery("input#" + allowRegEditId).change(ConfigureRegistrationEditingOption);

            //force the description text box to only 200 characters if imis 100 
            if (isImis100 == 'True') {
                jQuery("#" + textDescriptionId).keydown(LimitLength200);
                jQuery("#" + textDescriptionId).keyup(LimitLength200);
            }
            if (IsTemplate == 'True' && pageTitleContainer != "") {
                jQuery("#" + pageTitleContainer + ">div.panel-heading h2.panel-title").addClass("TemplateTitleIcon");
            }

            // (PBI 67481) Fix for edit iFrame displaying bizarre scrolling behavior when a mobile
            // keyboard is present, hides it when user touches outside of an input element
            jQuery('body').on('touchstart', function () {
                document.activeElement.blur();
            });

            jQuery('input').click(function (e) {
                e.stopPropagation();
            });

            eventsAttached = true;
        }

        ConfigureTabs();
        ConfigureCheckBoxes();
        ConfigureRegistrationEditingOption();
    };

    // validate the start and end date range
    // returns an object with following properties
    //      (bool)IsValid               Indicates if the date range is valid 
    //      (string)ErrorType           Type of error   date:invalid date range, datetime:invalid datetime range
    this.ValidateDateRangesOld = function() {

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
    this.ValidateDateRanges = function (startDateId, startTimeId, endDateId, endTimeId) {

        // if we have times, then ensure we have dates
        EnsureDateIfTime(startDateId, startTimeId, endDateId);
        EnsureDateIfTime(endDateId, endTimeId, startDateId);

        // construct the return object
        var r = { IsValid: true, ErrorType: "" };

        // get a combined start date and time
        var startDate = $find(startDateId).get_selectedDate();
        var startTime = $find(startTimeId).get_selectedDate();
        var startDateTime = null;
        if (startDate != null && startTime != null)
            startDateTime = new Date(startDate.getFullYear(), startDate.getMonth(), startDate.getDate(), startTime.getHours(), startTime.getMinutes(), 0, 0);

        // get a combined end date and time
        var endDate = $find(endDateId).get_selectedDate();
        var endTime = $find(endTimeId).get_selectedDate();
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

    // Cancel an event
    this.CancelEvent = function (confirmMessage) {
        if (confirm(confirmMessage)) {            
            return true;
        }
        return false;
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
    
    // private functions for publish start date
    // called when publish start date is changed
    function OnPublishStartDateChanged(sender, eventArgs) {
        ClearTimeIfNoDate(publishStartDatePickerId, publishStartTimePickerId);
        InitTimeIfDateAndNoTime(publishStartDatePickerId, publishStartTimePickerId, false);
        FirePublishDateRangeValidator();
    }

    // called when start time is changed
    function OnPublishStartTimeChanged(sender, eventArgs) {
        EnsureDateIfTime(publishStartDatePickerId, publishStartTimePickerId, publishEndDatePickerId);
        FirePublishDateRangeValidator();
    }

    // called when end date is changed
    function OnPublishEndDateChanged(sender, eventArgs) {
        ClearTimeIfNoDate(publishEndDatePickerId, publishEndTimePickerId);
        InitTimeIfDateAndNoTime(publishEndDatePickerId, publishEndTimePickerId, true);
        FirePublishDateRangeValidator();
    }

    // called when end time is changed
    function OnPublishEndTimeChanged(sender, eventArgs) {
        EnsureDateIfTime(publishEndDatePickerId, publishEndTimePickerId, publishStartDatePickerId);
        FirePublishDateRangeValidator();
    }
    
    // private functions for registration open and close dates
    
    // called when registration start date is changed
    function onRegistrationStartDateChanged(sender, eventArgs) {
        ClearTimeIfNoDate(registrationStartDatePickerId, registrationStartTimePickerId);
        InitTimeIfDateAndNoTime(registrationStartDatePickerId, registrationStartTimePickerId, false);
        FireRegistrationDateRangeValidator();
    }

    // called when start time is changed
    function onRegistrationStartTimeChanged(sender, eventArgs) {
        EnsureDateIfTime(registrationStartDatePickerId, registrationStartTimePickerId, registrationEndDatePickerId);
        FireRegistrationDateRangeValidator();
    }

    // called when end date is changed
    function onRegistrationEndDateChanged(sender, eventArgs) {
        ClearTimeIfNoDate(registrationEndDatePickerId, registrationEndTimePickerId);
        InitTimeIfDateAndNoTime(registrationEndDatePickerId, registrationEndTimePickerId, true);
        FireRegistrationDateRangeValidator();
    }

    // called when end time is changed
    function onRegistrationEndTimeChanged(sender, eventArgs) {
        EnsureDateIfTime(registrationEndDatePickerId, registrationEndTimePickerId, registrationStartDatePickerId);
        FireRegistrationDateRangeValidator();
    }
    //

    // called when the reg type is changed
// ReSharper disable DuplicatingLocalDeclaration
    function OnRegTypeChanged(sender) {
        ConfigureTabs();
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
    
    // Initialize the time if the date is set and the time is not already set.
    // When end param is true time is intialized to 11:59 PM, otherwise 12 AM.
    function InitTimeIfDateAndNoTime(datePickerId, timePickerId, end) {

        if (settingDate) return;

        settingTime = true;

        var date = $find(datePickerId).get_selectedDate();
        var time = $find(timePickerId).get_selectedDate();

        if (date != null && time == null) {
            var newDate = new Date();
            if(end)
                newDate.setHours(23, 59, 59, 999);
            else
                newDate.setHours(0, 0, 0, 0);
            $find(timePickerId).set_selectedDate(newDate);
        }

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
    
    // fire the publish date range validator
    function FirePublishDateRangeValidator() {
        ValidatorValidate($(publishDateRangeValidator));
    }
    
    // fire the registration date range validator
    function FireRegistrationDateRangeValidator() {
        ValidatorValidate($(registrationDateRangeValidator));
    }

    // configure tabs based on current values
    function ConfigureTabs() {

        // hide/show pricing tab
        var priceTab = $find(tabStripId).findTabByValue("pricing");
        var questionsTab = $find(tabStripId).findTabByValue("questions");      
        var registrationOptionsTab = $find(tabStripId).findTabByValue("registrationOptions");      
        var regOthers = document.getElementById(regOthersId);
        var regLabel = document.getElementById(roLabelId);
        var textRegCloseMessageId = document.getElementById(txtRegistrationClosedMessage);
        var labelRegClosedMessageId = document.getElementById(lblRegistrationClosedMessage);
        var lableRegistrationStartId = document.getElementById(lblRegistrationStart);
        var labelRegistrationEndId = document.getElementById(lblRegistrationEnd);
        var registrationStartDateId = document.getElementById(registrationStartDate);
        var enableTimeConflictsId = document.getElementById(enableTimeConflicts);
        var enableTimeConflictsLabelId = document.getElementById(enableTimeConflictsLabel);
        var allowRegistrantConflictsId = document.getElementById(allowRegistrantConflicts);
        var allowRegistrantConflictsLabelId = document.getElementById(allowRegistrantConflictsLabel);

        var registrationStartTimeZoneLabel = document.getElementById(registrationStartTimeZoneId);
        var registrationEndTimeZoneLabel = document.getElementById(registrationEndTimeZoneId);
        if (GetRegTypeValue() == "Fee" || isImis100 == "False") {
            priceTab.set_enabled(true);
            regLabel.removeAttribute("disabled"); 
            regOthers.disabled = false;
        } else {
            priceTab.set_enabled(false);
            regOthers.checked = false;
            regOthers.disabled = true;
            regLabel.setAttribute("disabled", "disabled"); 
        } 
        
        if (questionsTab != undefined) {
            // In !iMIS100, all events are fee-based, so enabled the questions.
            if (isImis100 == "False" || GetRegTypeValue() == "Fee" || GetRegTypeValue() == "Required") {
                questionsTab.set_enabled(true);
            } else {
                questionsTab.set_enabled(false);
            }
        }
       
        // In !iMIS100, all events are fee-based, so enabled the registration options.
        if (registrationOptionsTab != undefined) {
            if (isImis100 == "False" || GetRegTypeValue() == "Fee")
                registrationOptionsTab.set_enabled(true);
            else 
                registrationOptionsTab.set_enabled(false);                     
        }
        if (isImis100) {
            if (GetRegTypeValue() == "NotRequired") {

                textRegCloseMessageId.disabled = true;
                registrationStartTimeZoneLabel.setAttribute("disabled", "disabled");
                registrationEndTimeZoneLabel.setAttribute("disabled", "disabled");
                labelRegClosedMessageId.setAttribute("disabled", "disabled");
                lableRegistrationStartId.setAttribute("disabled", "disabled");
                labelRegistrationEndId.setAttribute("disabled", "disabled");
                registrationStartDateId.setAttribute("disabled", "disabled");
                enableTimeConflictsId.setAttribute("disabled", "disabled");
                enableTimeConflictsLabelId.setAttribute("disabled", "disabled");
                allowRegistrantConflictsId.setAttribute("disabled", "disabled");
                allowRegistrantConflictsLabelId.setAttribute("disabled", "disabled");
                $find(registrationStartDate).set_enabled(false);
                $find(registrationEndDate).set_enabled(false);
                $find(registrationStartTime).set_enabled(false);
                $find(registrationEndTime).set_enabled(false);
            } else {

                textRegCloseMessageId.disabled = false;
                registrationStartTimeZoneLabel.removeAttribute("disabled");
                registrationEndTimeZoneLabel.removeAttribute("disabled");
                labelRegClosedMessageId.removeAttribute("disabled");
                lableRegistrationStartId.removeAttribute("disabled");
                labelRegistrationEndId.removeAttribute("disabled");
                enableTimeConflictsId.removeAttribute("disabled");
                enableTimeConflictsLabelId.removeAttribute("disabled");
                allowRegistrantConflictsId.removeAttribute("disabled");
                allowRegistrantConflictsLabelId.removeAttribute("disabled");
                $find(registrationStartDate).set_enabled(true);
                $find(registrationEndDate).set_enabled(true);
                $find(registrationStartTime).set_enabled(true);
                $find(registrationEndTime).set_enabled(true);
            }

        }

        ConfigureCheckBoxes();
    }
    
    // configure checkboxes based on current values - commented out internal as "add guest" re-purposed to actually mean "add guest" (not another registrant)
    function ConfigureCheckBoxes() {

        //// enable/disable adding guests if not allowed to register someone else
        //var regOthers = document.getElementById(regOthersId);
        //var addGuests = document.getElementById(allowAddId);
        //var addLabel = document.getElementById(agLabelId);
        //if (regOthers.checked == true) {
        //    addGuests.disabled = false;
        //    addLabel.removeAttribute("disabled"); 
        //} else {
        //    addGuests.checked = false;
        //    addGuests.disabled = true;
        //    addLabel.setAttribute("disabled", "disabled"); 
        //}
    }
    // get the currently selected regtype value
    function GetRegTypeValue() {
        return jQuery("#" + regTypeRadioButtonListId + " [type=radio]").filter(":checked").val();
    }

    function ConfigureRegistrationEditingOption() {
        var allowRegEdit = document.getElementById(allowRegEditId);
        var dateRegEditPanel = jQuery("#" + regEditPanelId);
        if (allowRegEdit != null)
            if (allowRegEdit.checked == true) {
                dateRegEditPanel.disabled = false;
                dateRegEditPanel.find('input, span, div').attr('disabled', false);
                dateRegEditPanel.find('a').attr('style', 'z-index:0;');
            } else {
                dateRegEditPanel.disabled = true;
                dateRegEditPanel.find('input, span, div').attr('disabled', true);
                dateRegEditPanel.find('a').attr('style', 'z-index:-100;');
            }
    }

    function LimitLength200(sender) {
        if (sender.target.value.length > 200) {
            sender.target.value = sender.target.value.substring(0, 200);

        }
    }
}