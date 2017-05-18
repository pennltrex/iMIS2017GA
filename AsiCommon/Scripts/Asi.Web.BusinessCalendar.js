// ###########################################################
// JavaScript functions necessary for use with 
// Asi.Web.UI.WebControls.BusinessCalendar
// Asi.Web.UI.WebControls.BusinessCalendar2 
// ###########################################################
function BusinessCalendar_SelectRunDate2(textBox)
{
    textBox.value = "@date";
    textBox.focus();
}
function BusinessCalendar_OnCalendarShown(sender, args)
{
    var textbox = sender._textbox._element;
    var textboxLocation = findAbsoluteCoords(textbox);

    var clientY = textboxLocation.absoluteTop;
    if (typeof textbox.getBoundingClientRect != 'undefined')
    {
        clientY = textbox.getBoundingClientRect(textbox).top;
    }
    else if (typeof doc.getBoxObjectFor != 'undefined')
    {
        clientY = doc.getBoxObjectFor(textbox).screenY;
    }

    // Reposition the div if it would be off the screen
    var viewportwidth;
    var viewportheight;

    if (typeof window.innerWidth != 'undefined')
    {
        viewportwidth = window.innerWidth,
        viewportheight = window.innerHeight
    }
    else if (typeof document.documentElement != 'undefined'
     && typeof document.documentElement.clientWidth !=
     'undefined' && document.documentElement.clientWidth != 0)
    {
        viewportwidth = document.documentElement.clientWidth,
        viewportheight = document.documentElement.clientHeight

    }
    else
    {
        viewportwidth = document.getElementsByTagName('body')[0].clientWidth,
        viewportheight = document.getElementsByTagName('body')[0].clientHeight

    }

    var absLocation = $common.getLocation(textbox);
    if (clientY + textbox.clientHeight + sender._popupDiv.clientHeight > viewportheight)
    {
        sender._popupBehavior._visible = false; // fudge so the next method doesn't just exit out before doing anything
        sender._popupBehavior.show();
    }
    else
    {
        sender._popupBehavior._visible = false; // fudge so the next method doesn't just exit out before doing anything
        sender._popupBehavior.show();
    }
}

// This is needed so that script is properly registered on an async postback
if (typeof (Sys) !== "undefined") Sys.Application.notifyScriptLoaded();


Date.prototype.convertPartialDate = function(partialDate)
{
    var partialDateTimeParts;

    partialDateTimeParts = partialDate.split(' ');

    this.setHours(0);
    this.setMinutes(0);
    this.setSeconds(0);
    this.setMilliseconds(0);
    if (partialDateTimeParts.length > 1)
    {
        // Set the time first
        // Check for an AM/PM designator attached to the time (no space)
        var time = partialDateTimeParts[1].toUpperCase();
        if (time.indexOf('PM') > -1 || time.indexOf('P.M.') > -1)
        {
            partialDateTimeParts[2] = "PM";
        }
        time = time.replace(/AM|PM|A\.M\.|P\.M\./gi, '');

        // Replace any unexpected punctuation in the time
        time = time.replace(/\./gi, ':');
        var partialTimeParts = time.split(':');
        if (partialTimeParts.length >= 1)
        {
            if (partialDateTimeParts.length > 2 && partialDateTimeParts[2].toUpperCase() == "PM")
            {
                this.setHours(partialTimeParts[0] % 12 + 12);
            }
            else
            {
                this.setHours(partialTimeParts[0] % 12);
            }

            if (partialTimeParts.length >= 2)
            {
                this.setMinutes(partialTimeParts[1]);
                if (partialTimeParts.length >= 3)
                {
                    this.setSeconds(partialTimeParts[2]);
                }
            }
        }
    }

    // Replace any other punctuation with /
    partialDateTimeParts[0] = partialDateTimeParts[0].replace(/-/gi, '/');
    partialDateTimeParts[0] = partialDateTimeParts[0].replace(/\\/gi, '/');
    partialDateTimeParts[0] = partialDateTimeParts[0].replace(/\./gi, '/');
    partialDateTimeParts[0] = partialDateTimeParts[0].replace(/\|/gi, '/');
    partialDateTimeParts[0] = partialDateTimeParts[0].replace(/,/gi, '/');
    partialDateTimeParts[0] = partialDateTimeParts[0].replace(/\+/gi, '/');

    // Look to see if there are any separators
    var partialDateParts = partialDateTimeParts[0].split('/');

    // Check for the easy case
    if (partialDateParts.length == 1 && parseInt(partialDateParts[0], 10) < 32)
    {
        this.setDate(partialDateParts[0]);
        return;
    }

    // Either we have more parts, or there are no separators.
    // Either way get the date format.

    var format = GetCurrentDateFormat();

    // If there just weren't any separators, break it up according to format
    // Format will either be mmddyyyy, ddmmyyyy, or yyyymmdd
    if (partialDateParts.length == 1)
    {
        switch (format)
        {
            case "mdy":
            case "dmy":
                if (partialDateParts[0].length == 8)
                {
                    partialDateParts = new Array(partialDateParts[0].substring(0, 2),
																			 partialDateParts[0].substring(2, 4),
																			 partialDateParts[0].substring(4, 8));
                }
                else if (partialDateParts[0].length == 6)
                {
                    partialDateParts = new Array(partialDateParts[0].substring(0, 2),
																			 partialDateParts[0].substring(2, 4),
																			 partialDateParts[0].substring(4, 6));
                }
                else
                {
                    partialDateParts = new Array(partialDateParts[0].substring(0, 2),
																			 partialDateParts[0].substring(2, 4));
                }
                break;
            case "ymd":
            case "ydm":
                if (partialDateParts[0].length == 8)
                {
                    partialDateParts = new Array(partialDateParts[0].substring(0, 4),
																			 partialDateParts[0].substring(4, 6),
																			 partialDateParts[0].substring(6, 8));
                }
                else if (partialDateParts[0].length == 6)
                {
                    partialDateParts = new Array(partialDateParts[0].substring(0, 2),
																			 partialDateParts[0].substring(2, 4),
																			 partialDateParts[0].substring(4, 6));
                }
                else
                {
                    partialDateParts = new Array(partialDateParts[0].substring(0, 2),
																			 partialDateParts[0].substring(2, 4));
                }
                break;
        }
    }

    var day = 0;
    var month = -1;
    var year = -1;
    switch (format)
    {
        case "mdy":
            if (partialDateParts.length >= 2)
            {
                day = 1;
                month = 0;
                if (partialDateParts.length >= 3)
                {
                    year = 2;
                }
            }
            break;
        case "dmy":
            if (partialDateParts.length >= 2)
            {
                day = 0;
                month = 1;
                if (partialDateParts.length >= 3)
                {
                    year = 2;
                }
            }
            break;
        case "ymd":
            if (partialDateParts.length >= 3)
            {
                day = 2;
                month = 1;
                year = 0;
            }
            else if (partialDateParts.length >= 2)
            {
                day = 1;
                month = 0;
            }
            break;
        case "ydm":
            if (partialDateParts.length >= 3)
            {
                day = 1;
                month = 2;
                year = 0;
            }
            else if (partialDateParts.length >= 2)
            {
                day = 0;
                month = 1;
            }
            break;
    }

    //alert("format: " + format + "\r\npartialDate: " + partialDate + "\r\npartialDateParts: " + partialDateParts.join('|') + "\r\nday: " + day + "\r\nmonth: " + month + "\r\nyear: " + year);
    if (year > -1)
    {
        var yearValue = parseInt(partialDateParts[year], 10);
        if (yearValue < 100)
        {
            // 2-digit year; use window of 1931 - 2030
            if (yearValue > 30)
            {
                yearValue += 1900;
            }
            else
            {
                yearValue += 2000;
            }
        }
        // EDM 6/29/2005 - DT - .Net DateTime accepts values between 1 and 9999 for year; SQLServer accepts values between 1753 and 9999.
        if (yearValue < 1753 || yearValue > 9999)
        {
            throw new object();
        }
        this.setFullYear(yearValue);
    }
    if (month > -1)
    {
        // EDM 6/29/2005 - DT 14931 - Set the day to 1 before setting the month, because if (for instance) today is the 31st, 
        // and the month we're setting has < 31 days in it, the current date will cause the month value to be wrong.
        this.setDate(1);
        this.setMonth(parseInt(partialDateParts[month], 10) - 1);
    }
    this.setDate(parseInt(partialDateParts[day], 10));

    // Verify that we got the expected values
    if ((year > -1 && yearValue != this.getFullYear()) ||
		  (month > -1 && parseInt(partialDateParts[month], 10) - 1 != this.getMonth()) ||
		  parseInt(partialDateParts[day], 10) != this.getDate())
    {
        throw new object();
    }
}
function GetCurrentDateFormat()
{
    var testDate = new Date(1999, 9, 8);
    var formattedDate = testDate.localeFormat("d");

    // Locate the date parts
    var ixYear = formattedDate.indexOf("99"); // will locate the year whether it's 2-year or 4-year
    var ixMonth = formattedDate.indexOf("10");
    var ixDay = formattedDate.indexOf("8");

    var testArray = new Array();
    testArray[ixYear] = 1999;
    testArray[ixMonth] = 10;
    testArray[ixDay] = 8;
    var format = "";
    for (var i = 0; i < testArray.length; i++)
    {
        switch (parseInt(testArray[i], 10))
        {
            case 1999:
                format += "y";
                break;
            case 10:
                format += "m";
                break;
            case 8:
                format += "d";
                break;
        }
    }

    return format;
}
function ConvertPartialDate(textbox)
{
    var date = new Date();
    var value = textbox.value;
    if (value.length == 0)
    {
        return;
    }
    if (value.substring(0, 1) == "@")
        return;
    try
    {
        date.convertPartialDate(value);
    }
    catch (e)
    {
        alert(textbox.value + " is not a valid date.");
        return;
    }
    if (isNaN(date))
    {
        return;
    }
    try
    {
        if (date.getHours() == 0 && date.getMinutes() == 0 && date.getSeconds() == 0)
            textbox.value = date.localeFormat("d");
        else
            textbox.value = date.localeFormat("d") + " " + date.localeFormat("t");  // For some reason localeFormat("g") throws a FormatException??
    }
    catch (e)
    {
        textbox.value = date.toDateString();
    }

    jQuery(textbox).trigger("change");
}
