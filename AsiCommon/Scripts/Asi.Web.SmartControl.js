// ###########################################################
// JavaScript functions necessary for use with 
// Asi.Web.UI.WebContols.SmartControl
// ###########################################################

addLoadEvent(SmartControls_Init);
var defaultSmartControlInput = null;

addLoadEvent(SmartControls_AsyncInit);
function SmartControls_AsyncInit()
{
    // tell the page you want to run SmartControls_Init whenever a postback happens
    var manager = Sys.WebForms.PageRequestManager.getInstance();
    if (manager != null)
        manager.add_endRequest(SmartControls_AsyncInit2);
}
function SmartControls_AsyncInit2(sender, args)
{
    setTimeout('SmartControls_Init(true)', 750);
}
function SmartControls_Init(asyncPostBack)
{
    if (typeof (DefaultPropertySmartControls) != 'undefined' && DefaultPropertySmartControls && DefaultPropertySmartControls != null && DefaultPropertySmartControls.length > 0)
    {
        // Get the first input controls so we can wire the default focus event below
        // Only continue looking for controls if the control hasn't been found yet
        var smartControl = $(DefaultPropertySmartControls[0]);
        var controlFound = false;

        var inputs = smartControl.getElementsByTagName('input'); 
        for (var j=0; j<inputs.length; j++)
        {
            inputs[j].setAttribute('smartControlId', smartControl.id);
            defaultSmartControlInput = inputs[j];
            if (controlFound)
                controlFound = true;
        }
        if (!controlFound)
        {
            var selects = smartControl.getElementsByTagName('select');
            for (var j=0; j<selects.length; j++)
            {
                selects[j].setAttribute('smartControlId', smartControl.id);
                defaultSmartControlInput = selects[j];
                if (!controlFound)
                    controlFound = true;
            }
        }
        if (!controlFound)
        {
            var textareas = smartControl.getElementsByTagName('textarea');
            for (var j=0; j<textareas.length; j++)
            {
                textareas[j].setAttribute('smartControlId', smartControl.id);
                defaultSmartControlInput = textareas[j];
                if (!controlFound)
                    controlFound = true;
            }
        }
        if (!controlFound) 
        {
            var anchors = smartControl.getElementsByTagName('a');
            for (var j = 0; j < anchors.length; j++) 
            {
                anchors[j].setAttribute('smartControlId', smartControl.id);
                defaultSmartControlInput = anchors[j];
            }
        }
        
        // HACK: until we have SmartControl support embedded links, we usually wrap the SmartControl in
        // an <a> to get the same result.  Let's check if the immediate parent is an <a>.
        var parent = getParent(smartControl);
        if (parent.tagName != null && parent.tagName.toLowerCase() == 'a')
        {
            parent.setAttribute('smartControlId', smartControl.id);
            smartControlInputs.push(parent);
        }
    
        if (!gIsPostBack && !asyncPostBack && defaultSmartControlInput != null && !defaultSmartControlInput.disabled)
        {
            try
            {
                // Focus to the default field
                // If you set focus immediately then it behaves oddly, half a second
                // timeout seems to fix the problem.
                window.setTimeout('defaultSmartControlInput.focus()', 500);
            }
            catch(exception){}
        }
    }
}
function SmartControl_GetSmartControlContainer(control)
{
    if (control.getAttribute('smartControlId') != null)
        return $(control.getAttribute('smartControlId'));

    // If smartControlId attribute isn't set for some reason, then we'll
    // recurse up the tree to get the first div we come to instead.
    if (control == null || control.tagName.toLowerCase() == 'body')
        return null;
    if (control.tagName.toLowerCase() == 'div' && control.className.match("PanelField") != null && control.className.match("PanelFieldValue") == null)
    {
        return control;
    }
    return SmartControl_GetSmartControlContainer(getParent(control));
}
function SmartControl_GetPanelTemplateControlContainer(control)
{
    if (control.getAttribute('data-ptcId') != null)
        return $(control.getAttribute('data-ptcId'));
}
function SmartControl_GetPrincipalControl(smartControl)
{
    if (smartControl != null)
    {
        var inputId = smartControl.getAttribute('data-inputId');
        if (inputId != null && inputId.length > 0)
        {
            return $(smartControl.id + '_' + inputId);
        }
    }
    return smartControl;
}
function SmartControl_LongClientValidation(val, args)
{
    args.IsValid = false;
    inVal = args.Value;
    // This is the condition we need to check for:
    // if (args.Value >= -9223372036854775808 && args.Value <= 9223372036854775807)
    // The problem is that javascripts precision for this number of integer digits is lacking
    // which results in javacript converting large numbers to: 922337203686000
    if (inVal.substr(0,15) == "922337203685477")  {
        lastDigits = inVal.substr(15,4);
        if (lastDigits <= 5807) {
            args.IsValid = true;
        }
    }
    else if (inVal.substr(0,16) == "-922337203685477")  {
        lastDigits = inVal.substr(16,4);
        if (lastDigits <= 5808) {
            args.IsValid = true;
        }
    }
    else if (inVal >= -922337203685477 && inVal <= 922337203685477)
    {
       args.IsValid = true;
    }
}

//function SmartControl_DateTimeClientValidation(val, args)
//{
//    args.IsValid = false;

//    // Verify the passed-in value is a datetime datatype.
//    var inVal = new Date(args.Value);
//    if (inVal.toString() == "Invalid Date")
//    {
//        // If the Date constructor can't parse it, well, that doesn't
//        // necessarily mean it's an invalid date (due to localization), 
//        // so defer to the server-side validator, which is more robust.
//        args.IsValid = true;
//        return;
//    }

//    // Min value = System.Data.SqlTypes.SqlDateTime.MinValue ("1/1/1753 12:00:00")
//    var minValueDate = new Date();
//    minValueDate.setFullYear(1753);
//    minValueDate.setMonth(1);
//    minValueDate.setDate(1);
//    minValueDate.setHours(12);
//    minValueDate.setMinutes(00);
//    minValueDate.setSeconds(00);
//    minValueDate.setMilliseconds(00);

//    // Max value = System.Data.SqlTypes.SqlDateTime.MaxValue ("12/31/9999 23:59:59")
//    var maxValueDate = new Date();
//    maxValueDate.setFullYear(9999);
//    maxValueDate.setMonth(12);
//    maxValueDate.setDate(31);
//    maxValueDate.setHours(23);
//    maxValueDate.setMinutes(59);
//    maxValueDate.setSeconds(59);
//    maxValueDate.setMilliseconds(00);

//    // Do the range comparison.
//    if (inVal >= minValueDate && inVal <= maxValueDate)
//    {
//        args.IsValid = true;
//    }
//}
     
// This is needed so that script is properly registered on an async postback
if(typeof(Sys) !== "undefined")Sys.Application.notifyScriptLoaded();