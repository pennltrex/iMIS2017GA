function Asi_Web_UI_Common_CommitteeManagement(startDatePickerId,
    endDatePickerId,
    dateRangeValidator
    ) {

    // private variables 
  
    
    var settingDate = false;

    // public functions

    // called when all the controls have been initialised and loaded
    this.OnLoad = function () {

            $find(startDatePickerId).add_dateSelected(onStartDateChanged);
           
            $find(endDatePickerId).add_dateSelected(onEndDateChanged);
              
    };

    // validate the start and end date range
    // returns an object with following properties
    //      (bool)IsValid               Indicates if the date range is valid 
    //      (string)ErrorType           Type of error   date:invalid date range, datetime:invalid datetime range
    
    this.ValidateDateRanges = function (startDateId,  endDateId) {

        
        ensureDate(startDateId, endDateId);
      

        // construct the return object
        var r = { IsValid: true, ErrorType: "" };

        // get a combined start date and time
        var startDate = $find(startDateId).get_selectedDate();
      

        // get a combined end date and time
        var endDate = $find(endDateId).get_selectedDate();
       

        
        if (startDate != null && endDate != null) {
            r.ErrorType = "date";
            r.IsValid = !(startDate > endDate);
            return r;
        } 

        return r;
    };

    // private functions

    // called when start date is changed
    function onStartDateChanged(sender, eventArgs) {
        fireDateRangeValidator();
    }

   

    // called when end date is changed
    function onEndDateChanged(sender, eventArgs) {
        fireDateRangeValidator();
    }

    

    // checks that if there is no date there is no time
    

   
    // checks that if we have a time entered, we also have a date
    // we can't have a time without a date
    function ensureDate(datePickerId, defaultDatePickerId) {

        
        settingDate = true;

        var date = window.$find(datePickerId).get_selectedDate();
   
        var defaultDate = window.$find(defaultDatePickerId).get_selectedDate();
        if (defaultDate == null) defaultDate = new Date();

        if (date == null)
            window.$find(datePickerId).set_selectedDate(defaultDate);

        settingDate = false;
    }

    // fire the date range validator
    function fireDateRangeValidator() {
        window.ValidatorValidate($(dateRangeValidator));
    }

    
}