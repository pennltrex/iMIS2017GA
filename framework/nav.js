// alert ("hello");
// debugger;
// Check to see if navigation is enabled or disabled.
function CheckNavState()
{
    if (document.all("NavState").value != "enabled")
    {
        alert("Navigation not allowed in Edit mode.");
        return(false);
    }
    else {return true;}
}

//Load navigation if not in edit mode for module
function SetLeftNavLoc(nav_loc)
{
    if (document.all("NavState").value == "enabled")
    {
        parent.leftnav.window.location.href=nav_loc;
    }
}

//Load window if not in edit mode
function SetWinLoc(win_loc)
{
    if (document.all("NavState").value == "enabled")
    {
        window.location.href=win_loc;
    }
}

//Disable the left click and drag event from the menus
function DisableDrag(evt) 
{
    document.body.ondrag = function () { return false; };
    document.body.onselectstart = function () { return false; };
}

// Enable or disable all links in page.
//
// Page must have the following hidden fields:
//  NavState - 'enabled' or 'disabled'
function ChangeNavState()
{
    var ActiveLink = document.getElementById("ActiveLink");

    //The first section covers all of the non-activated links in the left and top nav
    
    // Loop through all table cells (used for left nav) and enable or disable 
    //  un-activated menu items (class of navlinkleft).
    for (var i=0; i<document.all.tags('td').length; i++)
    {
        // if changing to enabled mode, look for all td's in left nav currently disabled
        //  and change back to enabled	
        if (document.all("NavState").value == "enabled" && document.all.tags('td')[i].className=="navlinkleftdisabled")
        {
            document.all.tags('td')[i].className="navlinkleft";
        }
        // else if mode is disabled mode, look for all leftnav td's currently enabled
        //  and change to disabled
        else if (document.all("NavState").value == "disabled" && document.all.tags('td')[i].className=="navlinkleft")
        {
            document.all.tags('td')[i].className="navlinkleftdisabled";
        }
        
        // if changing to enabled mode, look for all td's in left nav currently disabled
        //  and change back to enabled	
        if (document.all("NavState").value == "enabled" && document.all.tags('td')[i].className=="subnavlinkleftdisabled")
        {
            document.all.tags('td')[i].className="subnavlinkleft";
        }
        // else if mode is disabled mode, look for all leftnav td's currently enabled
        //  and change to disabled
        else if (document.all("NavState").value == "disabled" && document.all.tags('td')[i].className=="subnavlinkleft")
        {
            document.all.tags('td')[i].className="subnavlinkleftdisabled";
        }		
        
    }
    // Loop through all spans (used for top nav) and enable or disable 
    //  un-activated menu items (class of navlinktop).
    for (var i=0; i<document.all.tags('span').length; i++)
    {
        // if changing to enabled mode, look for all spans in top nav currently disabled
        //  and change back to enabled
        if (document.all("NavState").value == "enabled" && document.all.tags('span')[i].className=="navlinktopdisabled")
        {
            document.all.tags('span')[i].className="navlinktop";
        }
        // else if mode is disabled mode, look for all spans in top nav currently enabled
        //  and change to disabled
        else if (document.all("NavState").value == "disabled" && document.all.tags('span')[i].className=="navlinktop")
        {
            document.all.tags('span')[i].className="navlinktopdisabled";
        }
        
    }	
    
    // The second section covers all of the activated links in the left and top nav
    // Take the current active links in the left and top nav and change their class
    //  to be activated or activated and disabled
    
    // If changing to enabled mode and the ActiveLink value is not blank,
    //  change disabled active items back to active - use current class name to determine
    //  if current ActiveLink value is a top or left nav item.
    if (document.all("NavState").value == "enabled" && document.all.ActiveLink.value != "")
    {	
        // if the item is a disabled active left nav item, enable the left nav item
        if (document.all(ActiveLink.value).className=="navlinkleftactivedisabled")
        {
            document.all(ActiveLink.value).className="navlinkleftactive";
        }
        // else if the item is a disabled active top nav item, enable the top nav item
        else if (document.all(ActiveLink.value).className=="navlinktopactivedisabled")
        {
            document.all(ActiveLink.value).className="navlinktopactive";
        }
        // The ActiveLink2 item is only non-blank for left nav items because it is only used
        //  for submenus - also, it will always be blank if ActiveLink is blank
        if (document.all.ActiveLink2.value != "")
        {	
            document.all(ActiveLink2.value).className="navlinkleftactive";
        }
        
        if (document.all(ActiveLink.value).className=="subnavlinkleftactivedisabled")
        {
            document.all(ActiveLink.value).className="subnavlinkleftactive";
        }
        
    }
    // If changing to disabled mode and the ActiveLink value is not blank,
    //  change enabled active menu items to disabled active menu items - use current class name
    //  to determine if current ActiveLink value it a top or left nav item.
    else if (document.all("NavState").value == "disabled" && document.all.ActiveLink.value != "")
    {
        // if the item is an enabled active left nav item, disable the left nav item
        if (document.all(ActiveLink.value).className=="navlinkleftactive")
        {
            document.all(ActiveLink.value).className="navlinkleftactivedisabled";
        }
        // else if the item is an enabled active top nav item, disable the top nav item
        else if (document.all(ActiveLink.value).className=="navlinktopactive")
        {
            document.all(ActiveLink.value).className="navlinktopactivedisabled";
        }
        // The ActiveLink2 item is only non-blank for left nav items because it is only used
        //  for submenus - also, it will always be blank if ActiveLink is blank
        if (document.all.ActiveLink2.value != "")
        {
            document.all(ActiveLink2.value).className="navlinkleftactivedisabled";
        }
        
        if (document.all(ActiveLink.value).className=="subnavlinkleftactive")
        {
            document.all(ActiveLink.value).className="subnavlinkleftactivedisabled";
        }
        
    }

    //The third section handle the scroll arrows
    // Make sure to handle the scroll-nav arrows separately since the behave differently
    // Loop through all anchors (used for hover-scroll arrows in top nav) and enable or disable 
    for (var i=0; i<document.all.tags('a').length; i++)
    {
        // if changing to enabled mode, look for all a's in top nav currently disabled and with
        //  a class for arrows and change back to enabled
        if (document.all("NavState").value == "enabled" && document.all.tags('a')[i].className=="navlinktoparrowdisabled")
        {
            document.all.tags('a')[i].className="navlinktoparrow";
        }
        // else if mode is disabled mode, look for all a's in top nav currently enabled and with
        //  a class for arrows and change to disabled
        else if (document.all("NavState").value == "disabled" && document.all.tags('a')[i].className=="navlinktoparrow")
        {
            document.all.tags('a')[i].className="navlinktoparrowdisabled";
        }
    }

}

// Highlight active nav link and un-highlight previous active nav link.
//
// Page must have the following hidden fields:
//  NavState - 'enabled' or 'disabled'
//  ActiveLink - contains the name of the current active link
function TopActivate(strLink)
{	
    // Exit function if navigation is disabled.
    if (parent.topnav.document.all("NavState").value != "enabled") {return;}
    
    // Deactivate previously active module.
    if (parent.topnav.document.all("ActiveLink").value != "")
    {
        if (parent.topnav.document.all(parent.topnav.document.all("ActiveLink").value) != null)
        {
            parent.topnav.document.all(parent.topnav.document.all("ActiveLink").value).className="navlinktop";
        }
    }
    // Store the new active module name.
    parent.topnav.document.all("ActiveLink").value = strLink;
    // Activate the module that was just selected.
    if (parent.topnav.document.all(strLink) != null)
    {
        parent.topnav.document.all(strLink).className="navlinktopactive";
    }
}

// Set the text in the TaskDescription frame.
function SetTask(strTask, resetMainPage)
{
    // Exit function if navigation is disabled.
    if (document.all("NavState").value != "enabled") {return;}

    if (parent.taskdescription == null || parent.taskdescription.document.all("TaskDescription") == null) {return;}

    parent.taskdescription.document.all("TaskDescription").innerHTML = strTask;
    parent.taskdescription.document.all("TaskDescription2").innerHTML = ""; //Clear Cust. portfolio's 2nd task description
    
    if (parent.imismain == null || parent.imismain.location == null) {return;}
    
    if (resetMainPage == null || resetMainPage)   //removed DT 18156
        if (strTask != ""){parent.imismain.location.href = "about:blank";}
}

//Frame top nav menu item on mouseover.
function topframe(currentlink)
{
    if (document.all("NavState").value == "enabled" && document.all(currentlink).className != 'navlinktopactive')
        {
            document.all(currentlink).className='navlinktophover';
        }
}

//Unframe top nav menu item on mouseover.
function topunframe(currentlink)
{
    if (document.all("NavState").value == "enabled" && document.all(currentlink).className != 'navlinktopactive')
        {
            document.all(currentlink).className='navlinktop';
        }
}

//Frame menu item on mouseover.
function frame(currentlink)
{
    if (document.all("NavState").value == "enabled" && document.all(currentlink).className != 'navlinkleftactive')
        {
            document.all(currentlink).className='navlinklefthover';
        }
}

//Unframe menu item on mouseover.
function unframe(currentlink)
{
    if (document.all("NavState").value == "enabled" && document.all(currentlink).className != 'navlinkleftactive')
        {
            document.all(currentlink).className='navlinkleft';
        }
}

//Frame submenu heading on mouseover - 2 cells in table row so both must be changed.
function framesub(currentlink1)
{
    if (document.all("NavState").value == "enabled" && document.all(currentlink1).className != 'subnavlinkleftactive')
        {	
            document.all(currentlink1).className='subnavlinklefthover1';	
        }
}

//Unframe submenu heading on mouseover - 2 cells in table row so both must be changed.
function unframesub(currentlink1)
{
    if (document.all("NavState").value == "enabled" && document.all(currentlink1).className != 'subnavlinkleftactive')
        {
            document.all(currentlink1).className='subnavlinkleft';
        }
}

//Frame menu items in submenu on mouseover.
function subframe(currentsublink)
{
    document.all(currentsublink).className='navlinkleftsubhover';
}

//Unframe menu items in submenu on mouseout.
function subunframe(currentsublink)
{
    document.all(currentsublink).className='navlinkleftsub';
}

//Need cookie for state of left navigation icons being displayed
function getCookie(cookieName){
    
    var searchName = cookieName + "=";
    var cookies = document.cookie;
    var start = cookies.indexOf(cookieName);
    
    if (start == -1){ return "" } // cookie not found 
     
    start += searchName.length; //start of the cookie data
    var end = cookies.indexOf(";", start);
    
    if (end == -1){
        end = cookies.length;
    }
     
   return cookies.substring(start, end)
}

//Change background color on menu items when they are clicked to show they are active.
function LeftActivate(strLink,strStyleClass)
{
    var styleClass = getCookie("LastMenuStyleSelected");
    
    document.cookie = "LastMenuStyleSelected=" + escape(strStyleClass);
    
    // Exit function if navigation is disabled.
    if (document.all("NavState").value != "enabled") {return;}
    
    // Deactivate previously active module.
    if (document.all("ActiveLink").value != "")
    {
        
        document.all(document.all("ActiveLink").value).className = styleClass;
        
    }

    // Store the new active module name.
    document.all("ActiveLink").value = strLink;
    // Activate the module that was just selected.
    document.all(strLink).className="navlinkleftactive";
}

// Set the text in the TaskDescription frame for Submenus.
function SubSetTask(strTask)
{
    parent.parent.taskdescription.document.all("TaskDescription").innerHTML = strTask;
    parent.parent.taskdescription.document.all("TaskDescription2").innerHTML = ""; //Clear Cust. portfolio's 2nd task description

alert('strTask: ' + strTask);
    if (strTask != ""){parent.parent.imismain.location.href = "about:blank";}
}

//Change background color on submenu items when they are clicked to show the submenu heading as active.
function SubLeftActivate(strLink1,strLink2,strStyleClass)
{
    
    var styleClass = getCookie("LastMenuStyleSelected");
    
    document.cookie = "LastMenuStyleSelected=" + escape(strStyleClass);
    
    // Deactivate previously active module.
    if (parent.document.all("ActiveLink").value != "")
    {
        parent.document.all(parent.document.all("ActiveLink").value).className = styleClass;
    }

    // Store the new active module name.
    parent.document.all("ActiveLink").value = strLink1;

    // Activate the module that was just selected.
    parent.document.all(strLink1).className="subnavlinkleftactive";
}

// Check whether the supplied license key exists in the license string
function CheckLicense(key)
{
  if (document.all("LicenseString"))
    {	
    if (document.all("LicenseString").value.match(new RegExp("\\b" + key + "\\b")) != null)
        return true;	
        else
        {
    a = (document.all("LicenseString").value).indexOf(key);
    if (a >= 0)  // if -1 returned, leave the flag false
        return true;
        }
    }
   
  return false;
}
