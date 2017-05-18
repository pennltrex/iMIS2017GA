Telerik.Web.UI.RadProgressManager.prototype._showInvalidContentMessage = function () { };
document.styleSheets[0].insertRule(".ui-widget-overlay {position:absolute;top:0;left:0;width:100%;height:100%;background-color:#000;opacity:0.3;}", 0);
document.styleSheets[0].insertRule(".ui-dialog {background-color:#FFF;border:1px solid #000;position:absolute;overflow:hidden;z-index:5000;}", 0);

function GLExport_Date_Validation(startDatePickerId, endDatePickerId, dateRangeValidator) {

    // private variables 
    var eventsAttached = false;

    // public functions

    // called when all the controls have been initialized and loaded
    this.OnLoad = function () {
        // attach events
        if (!eventsAttached) {
            // attach events to the time pickers so we can tell when a time has been entered/edited
            $find(startDatePickerId).add_dateSelected(OnStartDateChanged);
           // $find(startTimePickerId).add_dateSelected(OnStartTimeChanged);
            $find(endDatePickerId).add_dateSelected(OnEndDateChanged);          
        }      
    };

    // validate the start and end date range
    // returns an object with following properties
    //      (bool)IsValid               Indicates if the date range is valid 
    //      (string)ErrorType           Type of error   date:invalid date range, datetime:invalid datetime range
    this.ValidateDateRanges = function (startDateId, endDateId) {

        // construct the return object
        var r = { IsValid: true, ErrorType: "" };

        // get a combined start date and time
        var startDate = $find(startDateId).get_selectedDate();      
        var endDate = $find(endDateId).get_selectedDate();
        
        // if we have both dates, check the dates
        if (startDate != null && endDate != null) {
            r.ErrorType = "date";
            r.IsValid = !(startDate > endDate);
            if (!r.IsValid) {
                return r;
            }
        } 
        return r;
    }
   
    // private functions

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
}

function clientProgressUpdating(sender, args) {
    document.styleSheets[0].insertRule(".RadUploadProgressArea{visibility:visible!important;width:auto!important;height:auto!important;}", 0);
    document.styleSheets[0].insertRule(".RadUploadProgressArea .ruProgress{border:0!important;color:#000!important;}", 0);

    jQuery('[id$=_ProgressAreaPanel]').dialog({
        autoOpen: true,
        width: 500,       
        modal: true
    });

    jQuery(".ui-dialog-titlebar").hide();
    jQuery(".ruProgressHeader").hide();
    jQuery(".ruShadow").removeClass("ruShadow");
    jQuery("[id$=_RadProgressArea1]").show();

    if (args._progressData.OperationComplete === "true") {
        setTimeout(function () { window.location.reload(1); }, 2000);
    }
}

function ValidateWithinSameMonth() {

    var startDateId = jQuery("[id$=_BeginDaterad_Dp_dateInput]").get(0).id;
    var endDateId = jQuery("[id$=_EndDaterad_Dp_dateInput]").get(0).id;  
    var startDate = $find(startDateId).get_selectedDate();
    var endDate = $find(endDateId).get_selectedDate();

    if (startDate != null && endDate != null) {
        var locale = window.navigator.userLanguage || window.navigator.language;
        var startMonth = startDate.toLocaleString(locale, { month: "long" });
        var endMonth = endDate.toLocaleString(locale, { month: "long" });
        if (startMonth !== endMonth) {
            ClearUserMessages();
            return confirm("The date range should not span more than 1 month. \nThe begin date is " + startMonth + " and the end date is " + endMonth + ". \n\nAre you sure you want to continue?");
        }
    }

    return true;
}

//ensure we clear any user message at top of the page for fresh export try
function ClearUserMessages() {
    var messagePanel = jQuery("[id$='UserMessagesUpdatePanel']").eq(0);
    if (messagePanel.length > 0) {
        var messageArea = messagePanel.find("[id$='Messages']").eq(0);
        if (messageArea.length > 0) {
            messageArea.empty();
        }
    }
}