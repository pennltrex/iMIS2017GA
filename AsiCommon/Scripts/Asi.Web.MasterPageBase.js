// (c) Copyright Advanced Solutions International.
// All rights reserved.

// This gives us a client-side way of determining if something has
// changed on the page.
var IsDirty = false;
// This variable is used to set focus to the last selected control. Value is set by the Before Async Postback function (MasterPageBase_BeginRequest function)
var LastSelectedControl = "";
//This is used to prevent double submission on an Ajax call
var IsUpdating = false;
//addLoadEvent(  MasterPageBase_Init);

//
//
//
function MasterPageBase_AsyncInit() {
    MasterPageBase_Init(true);
}

//
//
//
function MasterPageBase_Init() {
    var manager = Sys.WebForms.PageRequestManager.getInstance();
    if (manager != null) {
        // tell the page you want to run MasterPageBase_EndRequest whenever an async postback ends
        //manager.add_endRequest(MasterPageBase_EndRequest);

        // tell the page you want to run MasterPageBase_BeginRequest whenever an async postback begins
        manager.add_beginRequest(MasterPageBase_BeginRequest);
    }

    // Set the page IsDirty bit - we don't allow setting this back to false, because in some cases (esp. ones with an embedded Object Browser or other control that does AJAX postbacks)
    // it was incorrectly resetting back to false on those postbacks.
    if (!IsDirty) {
        IsDirty = eval($get('PageIsDirty').value);
        var radWindow = GetRadWindow();
        if (radWindow != null) {
            radWindow.IsDirty = IsDirty;
        }
    }
}

//
//
//
function MasterPageBase_BeginRequest(sender, args) {
    var postBackElement = args.get_postBackElement();


    // Save Last Selected element to the Gloab Variable - It is little bit hectic but so far this is the only way I could get it to work.
    if (postBackElement != null && postBackElement.getAttribute('data-ajaxUpdatedControlID') != null) {
        LastSelectedControl = postBackElement.getAttribute('data-ajaxUpdatedControlID');
    }
    else if (postBackElement != null) {
        LastSelectedControl = postBackElement.id;
    }

    // Show Progress Div
    var progressDiv = jQuery('#FillProgressDiv').get(0);
    if (progressDiv != null) {
        var ajaxUpdatedControlID = postBackElement.getAttribute('data-ajaxUpdatedControlID');
        // If control is on a smartcontrol then the ajaxUpdatedControlID might be set on the parent, so check that.
        if (ajaxUpdatedControlID == null)
            ajaxUpdatedControlID = getParent(postBackElement).getAttribute('data-ajaxUpdatedControlID');

        // If we don;t have AjaxControlID let's see if our control has SamrtControlID attribute, and if so - try to get AjaxControlID of the Smart Control.
        if (ajaxUpdatedControlID == null && postBackElement.getAttribute('smartControlId') != null) {
            if (document.getElementById(postBackElement.getAttribute('smartControlId')) != null && document.getElementById(postBackElement.getAttribute('smartControlId')).getAttribute("data-ajaxUpdatedControlID") != null)
                ajaxUpdatedControlID = document.getElementById(postBackElement.getAttribute('smartControlId')).getAttribute("data-ajaxUpdatedControlID");
        }

        if (ajaxUpdatedControlID != null && ajaxUpdatedControlID.length > 0) {
            var updatedElementIDs = ajaxUpdatedControlID.split(',');
            for (var i = 0; i < updatedElementIDs.length; i++) {
                var updatedElement = $get(updatedElementIDs[i]);
                //                if (updatedElement == null)
                //                    updatedElement = $get('OuterContentPanel');
                //                if (updatedElement == null)
                //                    updatedElement = document.body;

                if (updatedElement != null) {
                    progressDiv.style.display = 'block';
                    progressDiv.style.marginLeft = '0';
                    Cover(updatedElement, progressDiv, false);
                }

                //                var coords = findAbsoluteCoords(updatedElement);
                //                var progressDiv2 = progressDiv;
                ////                    if (i > 0)
                ////                    {
                ////                        // if more than one control to update, then clone the fill div
                ////                        progressDiv2 = progressDiv.cloneNode(true);
                ////                        progressDiv.parentNode.appendChild(progressDiv2);
                ////                    }
                //                
                //                progressDiv2.style.left = coords.absoluteLeft + 'px';
                //                progressDiv2.style.top = coords.absoluteTop + 'px';
                //                progressDiv2.style.width = coords.width + 'px';
                //                progressDiv2.style.height = coords.height + 'px';
            }
        }
        else {
            //            var mainPanelElement = $get('MainPanel');
            //            if (mainPanelElement == null)
            //                mainPanelElement = document.body;
            //            
            //            setTimeout('Cover(mainPanelElement, progressDiv, false)', 2000);

            //            progressDiv.style.display = 'none';
        }
    }
}
//
//
//
//function MasterPageBase_EndRequest(sender, args)
//{
////    var progressDiv = $get('FillProgressDiv');
////    if (progressDiv != null)
////    {
////        progressDiv.style.width = progressDivPrevWidth + 'px';
////        progressDiv.style.height = progressDivPrevHeight + 'px';
////    }
//}
//
//
//
function PostCommitScript(customPostCommitScript) {
    // only execute the post commit script if there are no messages to display
    // and the button clicked was a commit button (save, ok)
    //if (IsDirty)
    {
        var commitButtonClickedHiddenInput = $get('CommitButtonClicked');
        var commitButtonClicked = commitButtonClickedHiddenInput != null && eval(commitButtonClickedHiddenInput.value);
        if (commitButtonClicked && customPostCommitScript != null && customPostCommitScript.length > 0) {
            var messagesPanelID = $get('TemplateUserMessagesID').value;
            var messagesPanel = messagesPanelID.length > 0 ? $get(messagesPanelID) : null;
            if (messagesPanel == null) {
                eval(customPostCommitScript);
            }
        }
    }

    commitButtonClickedHiddenInput.value = 'false';
}

//
//
//
function CancelButton_Click(url) {
    var dialogWindow = GetRadWindow();
    if (dialogWindow != null) {
        CloseAndCancelRadWindow();
    }
    else {
        window.location.href = url;
    }
    try {
        return CancelEvent();
    } catch (exc) {
        return null;
    }
}

// ############################################################################
// Functions for resizing content to fit window
// ############################################################################
function MasterPageBaseResizeProperties() {
    this.TopPanel = null;
    this.TopPanelDivider = null;
    this.TitlePanel = null;
    this.SideBarPanel = null;
    this.ContentPanel = null;
    this.ButtonPanel = null;
    this.FootPanel = null;
    this.OldTopPanelHeight = null;
    this.OldSideBarPanelWidth = null;
    this.ExtraPixels = 0;

    this.ResizeHeightIntervalID = 0;
    this.ResizeHeightLastHeight = 0;
}

var masterPageBaseResizeProperties = new MasterPageBaseResizeProperties();

//
// Call this function from a .master implementation to setup all master page components
// for use in the resizing functions.
//
function MasterPageBase_SetupComponents(topPanelId, titlePanelId, sideBarPanelId, contentPanelId, buttonPanelId, footPanelId, extraPixels) {
    if (topPanelId != null && topPanelId.length > 0)
    {
        masterPageBaseResizeProperties.TopPanel = $get(topPanelId);
        masterPageBaseResizeProperties.TopPanelDivider = $get(topPanelId + 'Divider');
    }
    if (titlePanelId != null && titlePanelId.length > 0)
        masterPageBaseResizeProperties.TitlePanel = $get(titlePanelId);
    if (sideBarPanelId != null && sideBarPanelId.length > 0)
        masterPageBaseResizeProperties.SideBarPanel = $get(sideBarPanelId);
    if (contentPanelId != null && contentPanelId.length > 0) 
        masterPageBaseResizeProperties.ContentPanel = $get(contentPanelId);
    if (buttonPanelId != null && buttonPanelId.length > 0)
        masterPageBaseResizeProperties.ButtonPanel = $get(buttonPanelId);
    if (footPanelId != null && footPanelId.length > 0)
        masterPageBaseResizeProperties.FootPanel = $get(footPanelId);
    // These extra pixels are removed from the size of the content panel to account for padding
    if (extraPixels != null)
        masterPageBaseResizeProperties.ExtraPixels = extraPixels;
    else
        masterPageBaseResizeProperties.ExtraPixels = 13;
}


///Version of the Window_Load specific for ASPEN temaplte.
function Window_Load_Aspen() {
    addResizeEvent(Window_Resize_Aspen);
    Window_Resize_Aspen();
    setTimeout("ScrollToFragment()", 200);
}


///Basic version of the Window_Load used with Ultrawave and BlueWave themes.
//addLoadEvent(Window_Load);
function Window_Load() {
    addResizeEvent(Window_Resize);

    // When you hide document.body's overflow then any time there is a onmouseover
    // script inside Desktop Client the whole page disappears.  No clue what is going 
    // on, but we just don't hide the body overflow when inside Desktop Client.
    // 
    // [Update JG 7/1/2008] We only need to do it for FireFox browser
    // if (BrowserDetect.browser != 'Explorer')          // window.location.href.indexOf('/CS/') == -1)
    // hgh 3Aug11 - commented out the IE test because of IE9 issues with desktop nav
        document.body.style.overflow = 'hidden';


    if (masterPageBaseResizeProperties.TopPanel != null) {
        // set width on top panel collapsible panel's div for FireFox
        var collapsed = readCookie('TopPanelCollapsed');
        if (collapsed != null)
            collapsed = eval(collapsed);
        else
            collapsed = false;

        if (BrowserDetect.browser != 'Explorer') {
            // Get Collapsed panel status        

            try {
                var childobj = getProperChildObject(masterPageBaseResizeProperties.TopPanel);
//                if (childobj != null) {
//                    $get(childobj.id).style.width = '100%';
//                }

            }
            catch (exc) { }

            try {
                var childobj = getProperChildObject(masterPageBaseResizeProperties.TopPanel);
                if (childobj != null) {
                    $get(childobj.id).style.overflow = 'visible'
                }
            }
            catch (exc) { }

            try {
                // Special Workaround for FF              
                if (!collapsed)
                    masterPageBaseResizeProperties.TopPanel.style.overflow = 'visible';
                else
                    masterPageBaseResizeProperties.TopPanel.style.overflow = 'hidden';
            }
            catch (exc) { }
        }
        else {
            // Special Workaround for IE        
            if (collapsed) {
                masterPageBaseResizeProperties.TopPanel.style.display = 'none';
                setTimeout("$get('innerSpan').style.display ='none';", 100);
            }
            else {
                var childobj = getProperChildObject(masterPageBaseResizeProperties.TopPanel);
                if (childobj != null) {
                    $get(childobj.id).style.display = 'block';
                }

                setTimeout("try{$get('innerSpan').style.display ='block';} catch(exc){}", 100);
            }
        }


         //Register resize event for top panel
        masterPageBaseResizeProperties.TopPanel.onresize = TopPanel_Resize;
    }

    Window_Resize();
    setTimeout("ScrollToFragment()", 200);
}

///Smal Helper to load proper child object (in IE8 - first child is correct object, but in IE9 - it is TEXT, actual first child is second object)
function getProperChildObject(parentObject) {
    var res = parentObject.firstChild;
    if (res != null && res.nodeName == '#text')
        res = res.nextSibling;
    return res;


}

function ScrollToElement(theElement) {
    var selectedPosX = 0;
    var selectedPosY = 0;
    while (theElement != null && theElement != contentPanel) {
        //selectedPosX += theElement.offsetLeft;
        selectedPosY += theElement.offsetTop;
        theElement = theElement.offsetParent;
    }

    if (masterPageBaseResizeProperties.ContentPanel != null)
        masterPageBaseResizeProperties.ContentPanel.scrollTop = selectedPosY;
    else
        window.scrollTo(selectedPosX, selectedPosY);



}
function ScrollToFragment() {
    // location.hash is automatically set to the URL fragment value
    try
    {
        if (location.hash != null && location.hash != '') {
            var element = $get(location.hash.substring(1));
            if (element == null)
                element = $get(location.hash);
            if (element != null)
                ScrollToElement(element);
        }
    }
    catch (ex)
    { }
}

//
//
//
function Window_Resize() {
    setTimeout("ResizeContentPanel()", 300);
    //ResizeContentPanel();
}

function Window_Resize_Aspen() {
    setTimeout("ResizeContentPanel_Aspen()", 300);
    //ResizeContentPanel();
}

//
//
//
function TopPanel_Resize(e) {
    var topPanelHeight = masterPageBaseResizeProperties.TopPanel.offsetHeight;
    if (topPanelHeight != masterPageBaseResizeProperties.OldTopPanelHeight) {
        masterPageBaseResizeProperties.OldTopPanelHeight = topPanelHeight;
        ResizeContentPanel();
    }
}

//
//
//
function SideBarPanel_Resize() {
    if (BrowserDetect.browser == 'Explorer' && BrowserDetect.version < 7)
        return;

    var sideBarPanelWidth = masterPageBaseResizeProperties.SideBarPanel.offsetWidth; // + $get(sideBarPanel.id + 'Divider').offsetWidth;
    if (sideBarPanelWidth != masterPageBaseResizeProperties.OldSideBarPanelWidth) {
        masterPageBaseResizeProperties.OldSideBarPanelWidth = sideBarPanelWidth;
        ResizeContentPanel();
    }
}

//
//
//
function ResizeContentPanel() {

    var pageHeight = livePageHeight();
    var pageWidth = livePageWidth();

    // get height
    var headHeight = 0;
    if (masterPageBaseResizeProperties.TopPanel != null) {
        try {
            headHeight += masterPageBaseResizeProperties.TopPanel.offsetHeight + masterPageBaseResizeProperties.TopPanelDivider.offsetHeight;
        }
        catch (exc) {
            headHeight += masterPageBaseResizeProperties.TopPanel.offsetHeight;
        }
    }

    // TitlePanel is an Array, so it may have more then ONE Element
    if (masterPageBaseResizeProperties.TitlePanel != null) {
        if (masterPageBaseResizeProperties.TitlePanel.length > 0) {
            for (i = 0; i < masterPageBaseResizeProperties.TitlePanel.length; i++) {
                headHeight += masterPageBaseResizeProperties.TitlePanel[i].offsetHeight;
            }
        }
        else
            headHeight += masterPageBaseResizeProperties.TitlePanel.offsetHeight;
    }

    var footHeight = 0;
    if (masterPageBaseResizeProperties.ButtonPanel != null) {
        footHeight += masterPageBaseResizeProperties.ButtonPanel.offsetHeight;
    }
    if (masterPageBaseResizeProperties.FootPanel != null)
        footHeight += masterPageBaseResizeProperties.FootPanel.offsetHeight;

    var mainHeight = pageHeight - headHeight - footHeight;

    // subtract more for general padding and stuff
    mainHeight -= masterPageBaseResizeProperties.ExtraPixels;

    if (mainHeight <= 99) {
        // min height of 100 px
        mainHeight = 100;
    }

    if (masterPageBaseResizeProperties.SideBarPanel != null) {
        masterPageBaseResizeProperties.SideBarPanel.style.height = mainHeight + 'px';
    }

    // invoke the resize functions that have been registered
    if (masterPageBaseResizeProperties.ContentPanel != null) {
        masterPageBaseResizeProperties.ContentPanel.style.height = mainHeight + 'px';
        var contentWidth = masterPageBaseResizeProperties.ContentPanel.offsetWidth;
        contentResized(contentWidth, mainHeight);
    }
}

function ResizeContentPanel_Aspen() {

    var pageHeight = livePageHeight();
    var pageWidth = livePageWidth();

    // get height
    var headHeight = 0;
    if (masterPageBaseResizeProperties.TopPanel != null) {
        try {
            headHeight += masterPageBaseResizeProperties.TopPanel.offsetHeight + $get(masterPageBaseResizeProperties.TopPanel.id + 'Divider').offsetHeight;
        }
        catch (exc) {
            headHeight += masterPageBaseResizeProperties.TopPanel.offsetHeight;
        }
    }

    // TitlePan is an Array, so it may have more then ONE Element
    if (masterPageBaseResizeProperties.TitlePanel != null) {
        if (masterPageBaseResizeProperties.TitlePanel.length > 0) {
            for (i = 0; i < masterPageBaseResizeProperties.TitlePanel.length; i++) {
                headHeight += masterPageBaseResizeProperties.TitlePanel[i].offsetHeight;
            }
        }

    }

    var footHeight = 0;
    if (masterPageBaseResizeProperties.ButtonPanel != null) {
        footHeight += masterPageBaseResizeProperties.ButtonPanel.offsetHeight;
    }
    if (masterPageBaseResizeProperties.FootPanel != null)
        footHeight += masterPageBaseResizeProperties.FootPanel.offsetHeight;

    // define the height of the content area
    var middleHeight = pageHeight - headHeight - footHeight - 15;

    var mainHeight = 0;
    if (masterPageBaseResizeProperties.ContentPanel != null)
        var mainHeight = masterPageBaseResizeProperties.ContentPanel.offsetHeight;

    if (mainHeight < middleHeight)
        mainHeight = middleHeight;

    if (mainHeight <= 99) {
        // min height of 100 px
        mainHeight = 100;
    }

    if (masterPageBaseResizeProperties.SideBarPanel != null) {
        masterPageBaseResizeProperties.SideBarPanel.style.height = mainHeight + 'px';
    }

    // invoke the resize functions that have been registered
    if (masterPageBaseResizeProperties.ContentPanel != null) {
        masterPageBaseResizeProperties.ContentPanel.style.height = mainHeight + 'px';
        var contentWidth = masterPageBaseResizeProperties.ContentPanel.offsetWidth;
        //var contentHeight = contentPanel.offsetHeight;
        contentResized(contentWidth, mainHeight);
    }
}

function TopPanel_Click() {
    // set cookie so we remember top panel collapsed state on nav change
    var collapsed = readCookie('TopPanelCollapsed');
    if (collapsed != null)
        collapsed = eval(collapsed);
    else
        collapsed = false;

    collapsed = !collapsed;
    createCookie('TopPanelCollapsed', (collapsed) + '', 1);

    if (BrowserDetect.browser != "Explorer") {
        // Special workaround to display menus on FF and IE8 browsers
        if (!collapsed) {
            try {
                masterPageBaseResizeProperties.TopPanel.style.display = 'block';
                masterPageBaseResizeProperties.TopPanel.firstChild.style.display = 'block';
            }
            catch (exc) { }
        }
        else {
            try {
                masterPageBaseResizeProperties.TopPanel.style.display = 'none';
            }
            catch (exc) { }
        }
        ResizeHeightForMozilla();
    }
    else {

        // Odd, but true - IE8 has bug with using Display: block. Especially when it is set from JS. This bug wa sreprted to MS
        // MS claimed they fixed it, but problem still persists. So the only work around is to use: display: table-cell.      
        var DisplayBlock = 'block';
        if (BrowserDetect.version > 7)
            DisplayBlock = 'table-cell';
        // As a matter of fact it is very interesting problem - Display: block works in some cases but not 100%!            

        // Check if we need to special work for Displaying.
        if (!collapsed) {
            masterPageBaseResizeProperties.TopPanel.style.display = DisplayBlock;
            var childobj = getProperChildObject(masterPageBaseResizeProperties.TopPanel);
            if (childobj != null) {
                $get(childobj.id).style.display = 'block';
            }

            masterPageBaseResizeProperties.TopPanel.style.visibility = 'visible';
        }
        else {
            masterPageBaseResizeProperties.TopPanel.style.display = 'none';
            masterPageBaseResizeProperties.TopPanel.style.visibility = 'hidden';
        }
        // Restore Actual Top Nav p[anel
        setTimeout("$get('innerSpan').style.display = " + collapsed + "? 'none' : 'block'", 300);

    }
}

function ResizeHeightForMozilla() {
    masterPageBaseResizeProperties.ResizeHeightLastHeight = masterPageBaseResizeProperties.TopPanel.offsetHeight;
    masterPageBaseResizeProperties.ResizeHeightIntervalID = setInterval("ResizeHeightInterval()", 250);
}
function ResizeHeightInterval() {
    var topPanelHeight = masterPageBaseResizeProperties.TopPanel.offsetHeight;
    if (topPanelHeight == masterPageBaseResizeProperties.ResizeHeightLastHeight) {
        clearInterval(masterPageBaseResizeProperties.ResizeHeightIntervalID);
        ResizeContentPanel();
    }
    masterPageBaseResizeProperties.ResizeHeightLastHeight = topPanelHeight;
}

// ############################################################################
// Functions to help use the Rad tool suite (RadWindow, RadAjax, etc...)
// ############################################################################


//
// Get a handle for the current RadWindow (dialog).
//
function GetRadWindow() {
    var oWindow = null;
    try{
    if (window.radWindow)
        oWindow = window.radWindow; //Will work in Mozilla in all cases, including classic dialog
    else if (window.frameElement && window.frameElement.radWindow)
        oWindow = window.frameElement.radWindow; //IE (and Mozilla as well)
        }catch(e){}
    return oWindow;
}
//
// Close the current RadWindow (dialog).
//
function CloseRadWindow() {
    var oWindow = GetRadWindow();
    if (oWindow != null)
        oWindow.Close();
}
//
// Close the current RadWindow (dialog). Set an argument to indicate that the dialog was canceled.
//
function CloseAndCancelRadWindow() {
    var oWindow = GetRadWindow();
    if (oWindow != null) {
        var oArg = new Object();
        oArg.cancel = true;
        oWindow.Close(oArg);
    }
}
//
// Refreshes the parent of the current RadWindow (dialog). If provided, adds a
// querystring parameter name and it's value.
//
function RefreshRadWindowParent(querystringParameterName, querystringParameterValue) {
    var oWindow = GetRadWindow();
    var href;
    if (oWindow != null && oWindow.BrowserWindow != null) {
        href = GetRadWindow().BrowserWindow.location.href;
        href = AppendQuerystringParameter(href, querystringParameterName, querystringParameterValue);
        GetRadWindow().BrowserWindow.location.href = href;
    }
    else {
        try {
            href = document.location.href;
            href = AppendQuerystringParameter(href, querystringParameterName, querystringParameterValue);
            document.location.href = href;
        }
        catch (exc) { }
    }
}

function AppendQuerystringParameter(url, querystringParameterName, querystringParameterValue) {
    try {
        if (querystringParameterName != null && querystringParameterName.trim() != "" && url.indexOf(querystringParameterName) == -1) {
            if (url.indexOf('?') >= 0)
                url += "&" + querystringParameterName + "=" + querystringParameterValue;
            else
                url += "?" + querystringParameterName + "=" + querystringParameterValue;
        }
        return url;
    }
    catch (exc) {
        return url;
    }
}
/// JAvascript functions to Refresh Proxy Panel Status on Ajax Postbacks

var ContactProxyButtonControlID_Enabled;
var ContactProxyButtonControlID_Disabled;
/// Setup function - Sets Local Variables used by other functions
function MasterPage_SetupProxy(SelectButtonID, DisableButtonID) {
    ContactProxyButtonControlID_Enabled = SelectButtonID;
    ContactProxyButtonControlID_Disabled = DisableButtonID;
}

// Refresh Proxy Status. 
function RefreshProxyStatus(StatusPostbackElement_ClientID) {
    // Get Form Element
    var elm = document.getElementById(StatusPostbackElement_ClientID);

    if (elm != null) {
        // Get current value and run Refresher    
        _RefreshPanelStatus(ContactProxyButtonControlID_Enabled, ContactProxyButtonControlID_Disabled, elm.value.toLowerCase());
    }
}


/// Function to refresh Contact Proxy PAnel Status
function _RefreshPanelStatus(SelectID, DisableID, PanelDisabled) {
    var link = document.getElementById(SelectID);
    var lbl = document.getElementById(DisableID);
    if (link != null && lbl != null) {
        if (PanelDisabled.toString().toUpperCase() != "TRUE") {
            link.style.display = "inline";
            lbl.style.display = "none";
        }
        else {
            link.style.display = "none";
            lbl.style.display = "inline";
        }
    }
}


//All functions pertaining to remembering previous tab position for WCAG compliance
// Note: Works in most cases save for dynamic elements that get changed after target
//       is set - Event Program Register/Unregister buttons as an example.
// Requires hidden input field with id 'lastClickedElementId' in order to work.
//Will attempt to focus on the last element clicked or changed.

//encapsulate everything to not conflict with other scripts
// vars starting with $ simply mean these are jQuery objects
(function ($) {
    Sys.Application.add_load(Refocus);
    var stage = "";

    $('body').change(function (event) {
        var $hiddenField = $("[id*='lastClickedElementId']").eq(0);
        if ($hiddenField.length > 0) focusDetectionEventHandler(event, $hiddenField);
    });

    $('body').click(function (event) {
        var $hiddenField = $("[id*='lastClickedElementId']").eq(0);
        if ($hiddenField.length > 0) focusDetectionEventHandler(event, $hiddenField);
    });

    //we try and recapture the element and focus on it
    function Refocus() {
        var $hiddenField = $("[id*='lastClickedElementId']").eq(0);
        if (!$hiddenField.length > 0) return;

        var $target = null;
        var hiddenFieldValue = $hiddenField.val().split('|');
        if (hiddenFieldValue.length < 2) return;
        try {
            if (hiddenFieldValue[0] == 'id') {
                $target = findById(hiddenFieldValue[1]);
            }

            if (hiddenFieldValue[0] == 'name') {
                $target = findByName(hiddenFieldValue[1]);
            }

            if (hiddenFieldValue[0] == 'href') {
                $target = findByAnchor(hiddenFieldValue[1]);
            }

            if ($target && $target.length > 0) {
                setTimeout(function () { $target.focus(); }, 100);//timeout delay for fire fox
                $hiddenField.val('');
            }
        }
        catch (ex) {
            //do nothing - this covers some unavoidable sizzle errors or attempts to focus on bad things
        }
    }

    function findById(value) {
        stage = "findById:Id search";
        var $target = $('#' + value);
        //not there?  wonder if we ended up with an anchor with the value
        if (!$target || $target.length == 0) {
            stage = "findById:href search";
            $target = $("a[href*='" + value + "']");
        }
        return $target;
    }

    function findByName(value) {
        stage = "findByName:Name search";
        var $target = $("input[name='" + value + "']");
        //crap, they made the element go away so is there another with it's id? 
        if (!$target || $target.length == 0) {
            stage = "findByName:href search";
            $target = $("a[href*='" + value + "']");//try an anchor
            if (!$target || $target.length == 0) {
                stage = "findByName:id search";
                $target = $("#" + value);//try an id
            }
        }
        return $target;
    }

    function findByAnchor(value) {
        stage = "findByAnchor:href search";
        var $target = $("a[href*='" + value + "']");
        //attempt to recover anchor if thrown off by change in id after sort on radgrid
        if (!$target || $target.length == 0) {
            //hunt for the sort button
            stage = "findByAnchor:name search";
            $target = $("input[name='" + value + "']");
            if (!$target || $target.length == 0) {
                stage = "findByAnchor:id search";
                $target = $("#" + value);
            }
            //now go for the anchor
            if ($target && $target.length > 0) {
                stage = "findByAnchor:anchor search";
                $target = $target.siblings("a").eq(0);
            }
        }
        return $target;
    }

    //will feed id, href, or name to the hidden field with a prefix stating type of id
    function focusDetectionEventHandler(event, $hiddenField) {
        //check to see if we have been ordered to not overwrite value
        if ($hiddenField.val().split('|').length > 2) return;

        $hiddenField.val("");
        var $target = $(event.target);
        if ($target.attr("id") && $target.attr("id").length > 0) {
            $hiddenField.val("id|" + $target.attr("id"));
        }
        else if ($target.attr("href") && $target.attr("href").length > 0) {
            //parse out to eliminate single quotes and hopefully give us the control id being called
            var parsedHref = $target.attr("href").split('\'');
            if (parsedHref.length > 1) {
                $hiddenField.val("href|" + parsedHref[1]);
            }
        }
        else if ($target.attr("name") && $target.attr("name").length > 0) {
            $hiddenField.val("name|" + $target.attr("name"));
        }
    }

})(jQuery);
//End - All functions pertaining to remembering previous tab position for WCAG compliance

function updateCartItemCount() {    
    var cartElement = jQuery(".cartSprite");
    if (cartElement == null)
        return;
    if (IsUpdating)
        return;
    IsUpdating = true;
    var cartContainer = cartElement.parent().parent();
    
    if (cartContainer != null) {
        jQuery.ajax({
            type: "POST",
            url: gWebRoot + "/WebMethodUtilities.aspx/GetCartItemCount",
            data: "{}",
            contentType: "application/json; charset=utf-8",
            dataType: 'json',
            success: function (result) {
                if (result.d != '' && result.d != null) {
                    var cartHtml = result.d;
                    if (cartHtml != null) {
                        cartElement.parent().remove();
                        cartContainer.append(cartHtml);
                    }
                }
                IsUpdating = false;
            },
            async: true
        });
    }
}

// Calculates the height available to content after headers, footers, etc. are removed
// Automatically subtracts the height of any element with the attribute data-height-offset="true"
// If none are supplied, default elemenets are subtracted
// Additional elements to be considered may be passed in as an array
function GetAvailableHeight(additionalElements) {
    var availableHeight;

    // First get the height of the browser window
    if (jQuery(window).height() != null)
        availableHeight = jQuery(window).height();
    else // if we don't know the height of the window the calculation is pointless, so just return a default of 500
        return 500;

    var i;
    if (additionalElements.length > 0) {
        for (i = 0; i < additionalElements.length; i++) {
            availableHeight -= jQuery(additionalElements[i]).outerHeight(true);
        }
    }

    var offsetElements = jQuery('[data-height-offset="true"]');
    if (offsetElements.length > 0) {
        for (i = 0; i < jQuery('[data-height-offset="true"]').length; i++) {
            availableHeight -= jQuery(offsetElements[i]).outerHeight(true);
        }
    } else {
        // default elements
        availableHeight -= jQuery("#hd").outerHeight(true);
        availableHeight -= jQuery("#ft").outerHeight(true);
        availableHeight -= jQuery("#masterFooterPush").outerHeight(true);
        availableHeight -= jQuery(".ButtonPanel").outerHeight(true);
    }

    return availableHeight;
}