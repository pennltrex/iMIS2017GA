<script type="text/javascript">

<% // Do not place any code above this line %>

<% // Global variables %>
var gDocumentTitle;
var gPostBackFormObject;
var gWindowOnLoad;
var gPostBackFormProcessSubmit;
var gWebRoot;

<% // Required initialization method - do not modify %>
__Document_Head_Init();


<% // "Private" functions (called from within this client script block) %>
<% // --------------------------------------------------------------------------- %>

function __Document_Head_Init()
{
	if (!__CookiesEnabled())
	  window.location.href = "<%= Asi.Web.Utilities.GetDocumentBaseUri() %>/NoCookies.html";

	gDocumentTitle = document.title;
	gPostBackFormObject = null;
	gWindowOnLoad = new Array();
	gPostBackFormProcessSubmit = true;
	gWebRoot = "<%= Asi.Web.Utilities.GetTildeExpansion() %>";

	__CloseDisposableWindow();

	__RegisterWithWindowOnLoad(__WriteDocumentTitleToBrowser);
	__RegisterWithWindowOnLoad(__ConfigureWindowStatus);
	__RegisterWithWindowOnLoad(__SetPostBackFormObject);
	__RegisterWithWindowOnLoad(__ExpandPostBackFormActionURI);
	__RegisterWithWindowOnLoad(__SetPostBackFormOnSubmit);
	__RegisterWithWindowOnLoad(__HideObjectsWhenHostedInIMIS);
	__RegisterWithWindowOnLoad(__SetDefaultSelectionOnSelectObjects);
	__RegisterWithWindowOnLoad(__SetMaxLengthLimitersOnTextAreaObjects);
	
	<% if (bool.Parse(Asi.SystemConfig.GetString("Browser.DisableContextMenu"))) { %>
		document.oncontextmenu = __DisableContextMenu;
	<% } %>
	
}

function __CloseDisposableWindow()
{
	if (__GetCookieValue("Asi.Web.Browser.DisposableWindow.Loaded") == "true")
	{
		var disposableWindow = window.open("", "Asi_Web_Browser_DisposableWindow", "width=1,height=1,top=9999,left=9999,resizable=no,scrollbars=no,location=no,directories=no,status=no,menubar=no,toolbar=no");
		disposableWindow.close();
		document.cookie = "Asi.Web.Browser.DisposableWindow.Loaded=false;path=/";
	}
}

function __CookiesEnabled()
{
	if (__GetCookieValue("Asi.Web.Browser.CookiesEnabled") != "true")
	{
		document.cookie = "Asi.Web.Browser.CookiesEnabled=true;path=/";
		if (__GetCookieValue("Asi.Web.Browser.CookiesEnabled") != "true") 
			return false;
	}
	return true;
}

function __GetCookieValue(cookieName) 
{
	if (document.cookie != null)
	{
		var startPos = document.cookie.indexOf(cookieName + "=");
		if (startPos < 0)
			return null;
		startPos += cookieName.length + 1;
		var endPos = document.cookie.indexOf(";", startPos);
		if (endPos == -1) 
			endPos = document.cookie.length;
		return unescape(document.cookie.substring(startPos, endPos));
	}
	return null;
}

function __WindowOnLoad() 
{
	for (var i = 0, ic = gWindowOnLoad.length; i < ic; i++) 
	{
		gWindowOnLoad[i]();
	}
}

function __RegisterWithWindowOnLoad(objFunc) 
{
	if (window.onload) {
		if (window.onload != __WindowOnLoad) 
		{
			gWindowOnLoad[0] = window.onload;
			window.onload = __WindowOnLoad;
		}		
		gWindowOnLoad[gWindowOnLoad.length] = objFunc;
	} 
	else 
	{
		window.onload = objFunc;
	}
}

function __WriteDocumentTitleToBrowser() 
{ 
	document.title = gDocumentTitle; 
}

function __ConfigureWindowStatus() 
{
	var SetStatus = new Function("window.status=gDocumentTitle;return true;");
	window.defaultStatus = gDocumentTitle;
	document.onmouseover = SetStatus;
	document.onmouseout = SetStatus;
	document.onmousedown = SetStatus;
	document.onmouseup = SetStatus;
	document.onclick = SetStatus;
}

function __DisableContextMenu()
{
	var e = event.srcElement.tagName;
	if (e)
	{
		if (e.toUpperCase() == "INPUT" || e.toUpperCase() == "TEXTAREA")
        {
			event.returnValue = true;
			return true;
        }
	}	
	event.returnValue = false;
	return false;
}

function __SetPostBackFormObject() 
{
	var docForms = document.forms;
	if (docForms.length > 0) 
	{
		var fileName = "<%= Asi.Web.Utilities.GetFileNameFromFilePath() %>".toLowerCase();
		for (var i = 0, ic = docForms.length; i < ic; i++) 
		{
			if (docForms[i].action.toLowerCase().indexOf(fileName) == 0) 
			{
				gPostBackFormObject = docForms[i];
				break;
			}		
		}
	}
}

function __ExpandPostBackFormActionURI() 
{
	if (gPostBackFormObject != null)
		gPostBackFormObject.action = "<%= Asi.Web.Utilities.GetClientVirtualAbsolutePath().Replace("./", "/") %>" + gPostBackFormObject.action;
}

function __SetPostBackFormOnSubmit() 
{ 
        //if(gPostBackFormObject != null)
		//	gPostBackFormObject.onsubmit = __CheckPostBackFormProcessSubmit; 
}

function __CheckPostBackFormProcessSubmit() 
{
	if (!gPostBackFormProcessSubmit)
	{
		gPostBackFormProcessSubmit = true;
		return false;
	}
	return true;
}

function __HideObjectsWhenHostedInIMIS()
{
	<% 
	// If we can't access the top.document object and an exception is thrown, 
	// assume the page is hosted inside the iMIS container/shell and hide any
	// objects that have a "hideWhenHostedInIMIS" attribute set to "true".
	%>
	try
	{
		var test = top.document.title;
	}
	catch(Exception)
	{
		for (var i = 0, ic = gPostBackFormObject.elements.length; i < ic; i++)
		{
			var element = gPostBackFormObject.elements[i];
			if (element.hideWhenHostedInIMIS == "true")
			{
				element.style.display = "none";
			}
		}
	}
}

function __SetDefaultSelectionOnSelectObjects()
{
    if(gPostBackFormObject != null){
		for (var i = 0, ic = gPostBackFormObject.elements.length; i < ic; i++)
		{
			var element = gPostBackFormObject.elements[i];
			if (element.tagName.toUpperCase() == "SELECT")
			{
				var options = element.options;
				if (options.length > 0)
				{
					var hasDefaultSelection = false;
					for (var j = 0, jc = options.length; j < jc; j++)
					{
						if (options[j].defaultSelected)
							hasDefaultSelection = true;
					}
					if (!hasDefaultSelection)
						options[0].defaultSelected = true;
				}
			}
		}
	}
}

function __SetMaxLengthLimitersOnTextAreaObjects()
{
	if (gPostBackFormObject != null){
		for (var i = 0, ic = gPostBackFormObject.elements.length; i < ic; i++)
		{
			var element = gPostBackFormObject.elements[i];
			if (element.tagName.toUpperCase() == "TEXTAREA" && element.maxlength != null)
			{
				element.onkeydown = new Function("return __BlockTextAreaMaxLength(this);");
				element.onkeyup = new Function("return __BlockTextAreaMaxLength(this);");
				element.onmouseout = new Function("return __ValidateTextAreaMaxLength(this);");
				element.onchange = new Function("return __ValidateTextAreaMaxLength(this);");
			}
		}
	}
}

function __BlockTextAreaMaxLength(ta)
{
	if (ta.value.length > ta.maxlength)
	{
		ta.value = ta.value.substr(0, ta.maxlength);
		return false;
	}
	return true;	
}

function __ValidateTextAreaMaxLength(ta)
{
	if (ta.value.length > ta.maxlength)
	{
		ta.value = ta.value.substr(0, ta.maxlength);
		var originalBackgroundColor = ta.style.backgroundColor;
		ta.style.backgroundColor = "#FFFF01";
		var alertMessage = "<%= Asi.Web.Utilities.PrepareForJavascript(Asi.ResourceManager.GetPhrase("TextAreaMaxLengthExceededWarning","The text entered for this field exceeds the maximum length allowed\nand has been automatically truncated to the correct length.")) %>";
		alert(alertMessage);
		ta.style.backgroundColor = originalBackgroundColor;
		return false;
	}
	return true;
}

function __NeedCommit()
{
	for (var i = 0, ic = gPostBackFormObject.elements.length; i < ic; i++)
	{
		var element = gPostBackFormObject.elements[i];
		var elementType = element.type.toUpperCase();
		var elementTagName = element.tagName.toUpperCase();
		if (elementType == "TEXT" || elementTagName == "TEXTAREA")
		{
			if (element.value != element.defaultValue)
				return true;
		}
		else if (elementType == "HIDDEN")
		{
			if (element.value == "CommitStateNecessary")
				return true;
		}
		else if (elementType == "CHECKBOX" || elementType == "RADIO")
		{
			if (element.checked != element.defaultChecked) 
				return true;
		}
		else if (elementTagName == "SELECT")
		{
			var options = element.options;
			for (var j = 0, jc = options.length; j < jc; j++)
			{
				var option = options[j];
				if (option.selected != option.defaultSelected) 
					return true;	
			}
		}
	}
	return false;
}


<% // "Public" functions (called by other pages/scripts) %>
<% // --------------------------------------------------------------------------- %>

<% // Used by CustomValidator controls to validate datetime values %>
function _validateDateTime(src, args)
{
	args.IsValid = !isNaN(Date.parse(args.Value));
}

<% // Used by CustomValidator controls to validate currency values %>
function _validateCurrency(src, args)
{
	<%
	/*
	Unicode values for symbols
	--------------------------
	Dollar: 0024
	Pound:  00A3
	Euro:   20AC
	
	Note: The regular expression below tests for values in the format of ( [$|£]X[XX][,]XXX[.XX] [€] )
	with any number of optional spaces on either side of the optional currency symbols.
	*/
	%>
	var regEx = new RegExp("^\\s*[\\u0024\\u00A3]?\\s*(?:(?:[0-9]{1,3},?)(?:[0-9]{3},?)*[0-9]{3}|[0-9]{1,3})(?:\\.[0-9]{2})?\\s*[\\u20AC]?\\s*$", "gi");
	args.IsValid = regEx.test(args.Value);
}

function SetDocumentTitle(title) 
{ 
	gDocumentTitle = title; 
}

function ConfirmCommand(customMessage) 
{
	if (customMessage == null || customMessage == "") 
		customMessage = "<%= Asi.Web.Utilities.PrepareForJavascript(Asi.ResourceManager.GetPhrase("ConfirmOperationWarning","Complete requested operation?")) %>";
	
	gPostBackFormProcessSubmit = confirm(customMessage);
}

function CheckCommit(customMessage) 
{
	if (gPostBackFormObject != null)
	{ 
		if (__NeedCommit()) 
		{
			var confirmMessage = customMessage;
			if (confirmMessage == null || confirmMessage == "") 
			{
				confirmMessage = "<%= Asi.Web.Utilities.PrepareForJavascript(Asi.ResourceManager.GetPhrase("PendingChangeWarning","Continue without saving changes?")) %>";
			}
			return confirm(confirmMessage);
		}
	}
	return true;
}

function NewDisposableWindow(url)
{
	if (url.indexOf("iExportFormat=TextXML") != -1)
	{
		<%
		/* 
		Open XML files in a non-disposable window since MSIE opens XML files 
		in an existing browser window by default instead of a new browser instance.
		This is a "workaround" since a Save operation by the user on the XML file
		will leave this blank window open on the desktop and the user will have to 
		close it manually.
		*/
		%>
		NewWindow(url, '', 'print', 'modal');
	}
	else
	{
		window.open(url, "Asi_Web_Browser_DisposableWindow", "width=1,height=1,top=9999,left=9999,resizable=no,scrollbars=no,location=no,directories=no,status=no,menubar=no,toolbar=no");
		document.cookie = "Asi.Web.Browser.DisposableWindow.Loaded=true;path=/";
	}
}

</script>