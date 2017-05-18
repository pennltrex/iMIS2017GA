//////////////////////////////////////////////////////////////////////////////////////////////////////
function welcomeAddEvent(obj, evType, fn)
{ 

 if (obj.addEventListener){ 
   // firefox
   obj.addEventListener(evType, fn, false); 
   return true; 
 } else if (obj.attachEvent){ 
  // ie
   var r = obj.attachEvent("on"+evType, fn); 
   return r; 
 } else { 
   return false; 
 } 

} // welcomeAddEvent


var welcomeLoadTryCount = 0;

//////////////////////////////////////////////////////////////////////////////////////////////////////
function welcomeGetElementByNamedId(elementName,elementTag)
{

	try 
	{
		var elList = document.getElementsByTagName(elementTag);

		for (var i = 0;i < elList.length; i++)
		{

			try {
				if (elList[i].id == elementName) return elList[i];
			}
			catch (e3) {}
		}

	}
	catch (e) {}

} // welcomeGetElementByNamedId

//////////////////////////////////////////////////////////////////////////////////////////////////////
function welcomeRunOnPageLoad()
{	
	// uncomment this line to remove the scroll bar from the content	
	// ctl00_ContentPanel.style.overflow = "hidden";
	// this hides the footer and copyright notice at the bottom of the screen

	// note firefox appeared to have two problems:
	// 1. The page load function was being called when the content was loaded not the whole page, hence the
	//    workaround with the timer
	// 2. The ft element couldn't be referenced, hence the workaround to search for the element
	//

	var ft_element = null;

	try
	{
		ft_element = getElementById('ft');
	}
	catch (e)
	{
		ft_element = welcomeGetElementByNamedId('ft','div');
	}

	if (ft_element != null)			
	{
		ft_element.style.display = "none";		
	}
	else
	{
		// if error, try again
		if (welcomeLoadTryCount<10)
		{
			welcomeLoadTryCount++;
			window.setTimeout("welcomeRunOnPageLoad();",1000);
		}
	}
} // function welcomeRunOnPageLoad