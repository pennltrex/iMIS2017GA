var preserveScrollPosition = false;
var scrollButtonsClientId = null;

//configure menu width
var menuwidth=2400;
var availableWidth=2400;

//configure scroll speed (1-10), where larger is faster
var scrollspeed=5;

//configure jump speed (1-20), where larger is faster
var jumpspeed=20;

var lefttime = null;
var righttime = null;

var menuContainerElement = null;
var scrollButtonsContainerElement = null;

function menuLoad()
{
    fillup();
    
    if (preserveScrollPosition && scrollButtonsContainerElement.style.display != 'none')
    {
        // set cookie so we remember menu pixel left
        var existingValue = readCookie('MenuPxLeft');
        if (!isNaN(parseInt(existingValue)))
        {
            existingValue = parseInt(existingValue);
            menuContainerElement.style.left = existingValue;
        }
    }
}
function fillup()
{
    menuContainerElement = $get('test2');
    scrollButtonsContainerElement = getParent($get(scrollButtonsClientId));
	scrollButtonsContainerElement.style.left = getParent(scrollButtonsContainerElement).style.left;
	
    // Reset these to max each time in order to get good measurements. Otherwise, we "shrink" periodically, which is not helpful.
	document.getElementById('outerSpan').style.width = '2400px';
	document.getElementById('innerSpan').style.width = '2400px';
	document.getElementById('innerSpan').style.clip = 'rect(0 2400px auto 0)';

    menuwidth = menuContainerElement.offsetWidth;

    var menuDiv = $get('MenuDiv');
	var menuTable = $get('MenuTable');
    var pageWidth = livePageWidth();
    availableWidth = menuTable.offsetWidth > pageWidth ? pageWidth : menuTable.offsetWidth;
    
    //alert('menuWidth = ' + menuwidth + ', availableWidth = ' + availableWidth);
    
    scrollButtonsContainerElement.style.display = menuwidth > availableWidth ? 'block' : 'none';
    
    if (scrollButtonsContainerElement.style.display != 'none')
    {
        availableWidth = availableWidth - scrollButtonsContainerElement.offsetWidth;
        
    }
    
	document.getElementById('outerSpan').style.width = menuwidth + 'px';
	document.getElementById('innerSpan').style.width = availableWidth + 'px';
	document.getElementById('innerSpan').style.clip = 'rect(0 ' + availableWidth + 'px auto 0)';
	
//$get('TestInput').value = 'menu: ' + menuwidth + ', mt:' + $get('MenuTable').offsetWidth + ', page: ' + livePageWidth();
    if (scrollButtonsContainerElement.style.display == 'none')
    {
        menuContainerElement.style.left = '0px';
        menuDiv.style.paddingLeft = '0px';
    }
    else
    {
        menuDiv.style.paddingLeft = scrollButtonsContainerElement.offsetWidth + 'px';
//$get('TestInput').value = 'left: ' + menuDiv.style.paddingLeft;
    }
}

function navStateEnabled()
{
    return $get('NavState') == null || $get('NavState').value == 'enabled';
}
function scrollMenu(scrollLeft, scrollFast)
{
    if (!navStateEnabled()) return;
    
    var left = parseInt(menuContainerElement.style.left);
    
	//menuwidth = menuContainerElement.offsetWidth - scrollButtonsContainerElement.offsetWidth;
	if (scrollLeft)
	{
	    if (left <= (availableWidth - menuwidth ))
	        return;
	}
	else
	{
	    if (left >= 0)
	        return;
	}
	    
    var adjustment = scrollFast ? jumpspeed : scrollspeed;
    if (scrollLeft)
        adjustment = adjustment * -1;
        
    left += adjustment;
    
    if (left > 0)
        left = 0;
        
    menuContainerElement.style.left = left + 'px';    
}
function moveleft()
{
    scrollMenu(true, false);
    
	if (navStateEnabled())
		lefttime=setTimeout("moveleft()", 50);
}
function moveleftstop()
{
    if (lefttime != null) 
        clearTimeout(lefttime);
        
    if (preserveScrollPosition)
        createCookie('MenuPxLeft', menuContainerElement.style.left, 1); 
}
function moveright()
{
    scrollMenu(false, false);
    
	if (navStateEnabled())
		righttime=setTimeout("moveright()", 50);
}
function moverightstop()
{
    if (righttime != null) 
        clearTimeout(righttime);
        
    if (preserveScrollPosition)
        createCookie('MenuPxLeft', menuContainerElement.style.left, 1);
}
function jumpright()
{
    scrollMenu(false, true);
    
	if (navStateEnabled())
		righttime=setTimeout("jumpright()", 50);
}

function jumpleft()
{
    scrollMenu(true, true);
    
	if (navStateEnabled())
		lefttime=setTimeout("jumpleft()", 50);
}				

var keyStrokes = "";
var keyStrokeTimeout;
var links;
var currentLink = null;
var prevPosition = '0px';
var linkSelected = false;

function selectLink()
{
    linkSelected = true;
}
function clickLink()
{
    if (currentLink != null)
    {
        var table = getCurrentTable();
        table.className = table.oldClassName;
    
        currentLink = null;
    }
    resetKeyStrokes();
    
    // set prev location
    prevPosition = test2.style.left;		
    
    linkSelected = false;
}
function shortcutCancel()
{
    resetKeyStrokes();
    resetCurrentLink();

    // move back to previous position 
    if ($get('ActiveLink') != null && $get('ActiveLink').value.length > 0)
        ensureVisible(document.getElementById(document.getElementById("ActiveLink").value));
    else
        test2.style.left = prevPosition;
        
    linkSelected = false;
}
function shortcut()
{
    //document.getElementById('lastKeyStroke').value = event.keyCode;
    
    if (event.keyCode == 13) // enter key
    {
        currentLink.click();
        clickLink();
    }
    else if (event.keyCode == 27) // esc key
    {
        shortcutCancel();
    }
    else
    {
        // append letter typed to the queue
        keyStrokes += String.fromCharCode(event.keyCode).toLowerCase();
        
        // fill links list if empty
        if (links == null)
            links = $get($get('NavMenuClientID').value).getElementsByTagName('a');
        
        // loop through all tabs on page to find the match
        for (var i=0; i<links.length; i++)
        {
            if (links[i].innerText.toLowerCase().substr(0, keyStrokes.length) == keyStrokes)
            {
                if (currentLink != links[i])
                {
                    // set current tab to not selected
                    if (currentLink != null)
                        resetCurrentLink();
	                
	                // set current tab index
	                currentLink = links[i];
	                
	                // set focus on new anchor
                    currentLink.focus();
                }
                
                // position the tab strip so the new link is visible
                ensureVisible(currentLink);
                
                if (keyStrokeTimeout != null)
                    clearTimeout(keyStrokeTimeout);

                selectLink();		                    
                keyStrokeTimeout = setTimeout("resetKeyStrokes()", 1200);
                break;
            }
        }
    }
    
    //document.getElementById('keyStrokesDisplay').value = keyStrokes;		    
}
function getCurrentTable()
{
    if (currentLink != null)
        return getContainingTable(currentLink);
    return null;
}
function getContainingTable(theLink)
{
    return getParent(getParent(getParent(getParent(theLink))));
}
function ensureVisible(theElement)
{
    // Don't scroll if the menu is not wider than the screen
    // because all items are already visible in this case, duh
    if (document.body.offsetWidth <= menuwidth)
    {
        var linkIndex = theElement.linkindex;
        //var offset = currentLink != null ? getCurrentTable().offsetWidth : 100;
	    
        //var newLeft = (linkIndex * offset) * -1;
        var newLeft = 0;
        var node = getContainingTable(theElement);
        var nodeIter = getParent(node).previousSibling;
        while (nodeIter != null)
        {
            newLeft += nodeIter.offsetWidth;
            nodeIter = nodeIter.previousSibling;
        }
        
        if (newLeft > 0)
        {
            newLeft = newLeft * -1;
            newLeft += 10; // buffer 10px so they can see there are tabs to the left.
        }
        
//	            if (linkIndex > 0)
//	                newLeft += offset;

//                if (newLeft < menuwidth)
//                    newLeft = menuwidth;
        
        test2.style.left = newLeft+'px';

        // make sure we don't scroll too far to the left and leave a big blank space on the right
        var pxRight = newLeft + test2.offsetWidth;
        var difference = document.body.offsetWidth - pxRight;
        if (difference > 30)
            test2.style.left = (parseInt(test2.style.left) + (difference - 100)) + 'px' ;
    }
}
function resetKeyStrokes()
{
    keyStrokes = "";
    keyStrokeTimeout = null;
}
function resetCurrentLink()
{
    if (currentLink != null)
    {
        currentLink.blur();

        var table = getCurrentTable();
        table.className = table.oldClassName;
        
        currentLink = null;
    }
}

function SelectDefaultScript(clientID) {
    parentElem = document.getElementById(clientID);
    if (parentElem.firstChild != null && parentElem.firstChild.firstChild != null && parentElem.firstChild.firstChild.firstChild != null &&
        parentElem.firstChild.firstChild.firstChild.firstChild != null && parentElem.firstChild.firstChild.firstChild.firstChild.firstChild != null) {

        child = document.getElementById(clientID).firstChild.firstChild.firstChild.firstChild.firstChild;
        child.click();
    }
}

/*****************************
*
*  PageNavR Script
*
*******************************/
// if the root menu needs scroll arrows, be sure they render on browser resize
var PageNavR_Menu = null;
var PageNavR_NavMenuClientID = null;
addResizeEvent(PageNavR_OnResize);

function PageNavR_OnResize()
{
    if (PageNavR_NavMenuClientID != null)
    {
        PageNavR_Menu = $find(PageNavR_NavMenuClientID);
        if (PageNavR_Menu != null)
        {
            PageNavR_Menu.repaint();
        }
    }
}

function PageNavR_OnClientLoadHandler(sender)
{
    var lastItemIndex = sender.get_items().get_count() - 1; //0 based indexing      
    lastItem = sender.get_items().getItem(lastItemIndex);

    // remove tabindex attribute to fix navigation tabbing issue
    if (PageNavR_NavMenuClientID != null) {
        $(PageNavR_NavMenuClientID).removeAttribute('tabindex');
    }

    // Attach event handlers to tabs to re-enable accessibility
    PageNavR_AddTabEventHandlers();

    if (lastItemIndex == 0)
    {
        PageNavR_Menu = $find("<%= NavMenu.ClientID %>");
        if (PageNavR_Menu != null)
        {
            PageNavR_Menu.width = sender.get_items().getItem(0).get_linkElement().offsetWidth;
            OnResize();
        }
    }
}

function PageNavR_AddTabEventHandlers() {
    // add event handler on page nav menu root links to re-enable accessibility in the form of 
    // working 'tab' key navigation
    jQuery('a.rmLink.rmRootLink')
        .keydown(function (e) {
            // Listen for the tab or down-arrow keys; otherwise, return here
            if ([9, 40].indexOf(e.keyCode) === -1 || e.shiftKey === true) {
                return;
            }

            // Store the reference to our top level link
            var link = jQuery(this);

            // Menu has been expanded with down arrow prior to tab, and links are from responsive site
            if (link.hasClass('rmExpanded') && link.parent('li').find('li.rsmItem').find('a.rsmLink').length !== 0) {
                // Make sure to stop event bubbling
                e.preventDefault();

                // Find the nested element that acts as the menu
                var dropdown = link.parent('li').find('.rmSlide');

                // If there is a ul element available, place focus on the first focusable element within
                if (dropdown.length > 0) {
                    // blur active element, focus on menu item element
                    document.activeElement.blur();
                    dropdown.find('li.rsmItem').first().find('a.rsmLink').first().focus();
                }
            }
        });

    // event handler to remove menus after tabbing has exited to new root link
    jQuery('li.rmItem').not('li.rmItem.rmFirst.rmLast.rmTemplate.MegaDropDownMenuOuter')
        .keyup(function (e) {
            // Listen for the tab key; otherwise, end here
            if ([9].indexOf(e.keyCode) === -1
                || e.shiftKey === true) {
                return;
            }

            // Store the reference to previous top level link
            var link = jQuery(this).prev();

            // Grab parent Rad Menu element
            var radMenu = $find(link.parents('div.RadMenu').attr('id'));
            
            // if root link is expanded...
            if (link.find('a.rmLink.rmRootLink').hasClass('rmExpanded')) {
                // Obtain root link text, use it to find the menu item and properly close it
                var menuItemText = link.children('a.rmLink.rmRootLink.rmExpanded').children('span.rmText.rmExpandDown').text();

                var menuItem = radMenu.findItemByText(menuItemText);

                menuItem.close();
            }
        });

    // event handler for very last sub-menu item of last menu root link, similar code as above
    jQuery('li.rmItem.rmLast').find('div.rmSlide').find('li.rsmItem').last()
        .keydown(function(e) {
            // Listen for the tab key; otherwise, end here
            if ([9].indexOf(e.keyCode) === -1 || e.shiftKey === true) {
                return;
            }

            // Store the reference to top level link
            var link = jQuery(this);

            // Grab parent Rad Menu element
            var radMenu = $find(link.parents('div.RadMenu').attr('id'));

            // if root link is expanded...
            if (link.closest('div.rmSlide').prev().hasClass('rmExpanded')) {
                // Obtain root link text, use it to find the menu item and properly close it
                var menuItemText = link.parents('div.rmSlide').prev().children('span.rmText.rmExpandDown').text();

                var menuItem = radMenu.findItemByText(menuItemText);

                menuItem.close();
            }
        });
}

/******************************
*
* PageSubNav Scripts
*
*******************************/
var navTreeClientID = null;
function PageSubNav_Init()
{
    var navTree = $get(navTreeClientID);
    var allSpans = navTree.getElementsByTagName('span');
    var allLinks = navTree.getElementsByTagName('a');

    for (var i = 0; i < allSpans.length; i++)
    {
        allSpans[i].onclick = PageSubNav_ExpandOnClick;

        // hide the bullet if there is no text for the node (e.g. a break).
        var text = allSpans[i].firstChild.nodeValue;
        if (text == null || text.length == 0)
        {
            getParent(allSpans[i]).previousSibling.firstChild.style.display = 'none';

            // hide consecutive breaks
            if (i > 0)
            {
                var prevBreakIter = parseInt(allSpans[i - 1].id.substr(navTreeClientID.length));
                var currBreakIter = parseInt(allSpans[i].id.substr(navTreeClientID.length));
                if (currBreakIter == (prevBreakIter + 1))
                    allSpans[i].style.display = 'none';
            }
        }
    }
    for (var i = 0; i < allLinks.length; i++)
    {
        $addHandler(allLinks[i], 'click', PageSubNav_ExpandOnClick);
    }
}
function PageSubNav_ExpandOnClick(e)
{
    var src;
    if (!e) var e = window.event;
    if (e.target) src = e.target;
    else if (e.srcElement) src = e.srcElement;

    var parentElement = getParent(src);
    if (parentElement.previousSibling != null)
    {
        var anchor = parentElement.previousSibling.firstChild;
        if (anchor != null && anchor.tagName.toLowerCase() == 'a')
        {
            // click the link in IE
            if (anchor.click != null)
            {
                anchor.click();
            }
            // click the link in Firefox
            else if (anchor.onclick != null)
            {
                anchor.onclick.apply(anchor);
            }

        }
    }
    return true;
}
// HACK: I have to override some of the base javascript TreeView functions b/c they
// simply do not work out of the box.  Maybe it'll get fixed by MS in .net 3.0, if so
// then we should reexamine these hacks.

// Override ToggleNode b/c if the node is collapsed by default when page loads
// then its children are not yet existant in the collection of document anchor
// objects that we looped through in PageSubNav.ascx.cs script to set "NodeClick"
// and other client events; so we configure the anchors when they do become
// available instead.    
var ms_TreeView_ToggleNode = null;
function asi_TreeView_ToggleNode(data, index, node, lineType, children)
{
    ms_TreeView_ToggleNode(data, index, node, lineType, children);

    var anchors = children.getElementsByTagName('a');
    for (var i = 0; i < anchors.length; i++)
    {
        // Call the js function (defined in PageNav.ascx.cs) that configures
        // the anchor nodes.
        NavigationList_ConfigureAnchor(anchors[i]);
    }
}

// Override HoverNode and UnhoverNode b/c if you have your mouse over the left frame in C/S while
// the page is loading then it throws an error.  So, I'm just catching and 
// swallowing the error and things should progress normally from there.
this.ms_TreeView_HoverNode = null;
function asi_TreeView_HoverNode(data, node)
{
    try
    {
        ms_TreeView_HoverNode(data, node);
    }
    catch (e)
    {
    }
}
this.ms_TreeView_UnhoverNode = null;
function asi_TreeView_UnhoverNode(node)
{
    try
    {
        ms_TreeView_UnhoverNode(node);
    }
    catch (e)
    {
    }
}