// ###########################################################
// JavaScript functions necessary for use with 
// Asi.Web.UI.WebContols.BusinessCalendar2
// ###########################################################


///This Event fired by Telerik Calendar control when incorrect date value is entered.

function BusinessCalendar2_RadDatePicker_DateError(sender, args) 
{
    alert(args.get_inputText() + " is not a valid date.");
    sender.set_selectedDate("");
    args.set_cancel(true);
}

function BusinessCalendar2_RadDateTimePicker_DateTimeError(sender, args) 
{
    alert(args.get_inputText() + " is not a valid datetime.");
    sender.set_selectedDate("");
    args.set_cancel(true);
}

function BusinessCalendar2_RadTimePicker_TimeError(sender, args) 
{
    alert(args.get_inputText() + " is not a valid time.");
    sender.set_selectedDate("");
    args.set_cancel(true);
}

// Verify Datepicker values in order to prevent form submit.
function BusinessCalendar2_VerifyDatePickerValue(sender, args) {
    try {
        // We use controltovalidate of the Sender object
        var datepick = $find(sender.controltovalidate);
        if (datepick != null && datepick.get_textBox() != null) {
            if (datepick.get_selectedDate() == null && datepick.get_textBox().value != "") {
                // text box has value, but datetime value  is null - ERROR!!!
                args.IsValid = false;
            }
        }
    }
    catch (ex) {
        alert(ex);
    }
}

// Return the focus to the date textbox once the Pop up is closed.
function BusinessCalendar2_OnPopupClosing(sender, args) {
    try {
        var datepick = sender.get_textBox();
        if (datepick != null) {
            datepick.focus();
        }
    }
    catch (ex) {
        console.log(ex);
    }
}