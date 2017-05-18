<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Templates/MasterPages/Empty.master" Inherits="iMIS_ContentManagement_ContentLayoutCustom" Title="Edit layout" Codebehind="ContentLayoutCustom.aspx.cs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TemplateHead" Runat="Server">
<style type="text/css">
#bd p {
    text-align: center; 
    color: #ffffff; 
    background-color: #808080; 
    min-height: 4em;
    -moz-min-width: 100px;
    -ms-min-width: 100px;
    -o-min-width: 100px;
    -webkit-min-width: 100px;
    min-width: 100px;
}

.RadTabStrip .rtsLevel {
    width: 100%;
    clear: both;
    position: relative;
    position:static;
    padding-top: 1px;
}

textarea {
    width: 100% !important;
} 
p { 
    padding: 1em !important; 
    font-weight: bold !important; 
}
</style>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" ShowHeader="false" Collapsible="false" BorderStyle="None">
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
            MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="false" OnTabClick="TabClick">
            <Tabs>
                <telerik:RadTab Text="Code" PageViewID="PropertiesPage" />
                <telerik:RadTab Text="Design" PageViewID="PreviewPage" />
            </Tabs>
        </telerik:RadTabStrip>     
    
        <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" CssClass="ContentTabbedDisplay">

            <telerik:RadPageView runat="server" ID="PropertiesPage">
                <asiweb:PanelTemplateControl2 ID="PanelTemplateControl2" runat="server" ShowHeader="false" Collapsible="false" BorderStyle="None">
                    <asiweb:BusinessTextBox Caption="Title" CssClass="InputXLarge" DisplayCaption="True" id="LayoutTitle" PositionCaption="Left" RenderPanelField="True" Required="True" runat="server" />
                    <asiweb:AsiRequiredFieldValidator ControlToValidate="LayoutTitle" runat="server" />
                    <asiweb:BusinessTextBox Caption="Description" CssClass="InputXXLarge" DisplayCaption="True" id="LayoutDescription" PositionCaption="Left" RenderPanelField="True" runat="server" />
                    <asiweb:BusinessTextBox Caption="Layout code" cols="80" DisplayCaption="True" id="CustomContentLayoutSourceCode" PositionCaption="Top" RenderPanelField="True" rows="15" runat="server" 
                        TextMode="MultiLine" ValidateRequestMode="Disabled" CssClass="CodeBlock"/>
                    <br />
                    <asp:Button id="Format" OnClick="FormatClick" runat="server" Text="Format Code" CssClass="TextButton" />
                </asiweb:PanelTemplateControl2>               
            </telerik:RadPageView>

            <telerik:RadPageView runat="server" ID="PreviewPage" EnableTheming="False">
                
                <asiweb:PanelTemplateControl2 ID="PanelTemplateControl3" runat="server" ShowHeader="false" Collapsible="false" BorderStyle="None">
                    
                    <telerik:RadSplitter ID="RadSplitterMain" runat="server" RenderMode="Lightweight" BorderStyle="None" BorderWidth="0"
                        Width="100%" ResizeWithBrowserWindow="true" VisibleDuringInit="true" OnClientLoaded="SplitterLoaded" OnClientResized="SplitterResize">    
                                       
                        <telerik:RadPane ID="RadPaneTree" runat="server" Width="100%" Height="100%" ShowContentDuringLoad="true"
                            ResizeWithBrowserWindow="True" VisibleDuringInit="true"
                            PersistScrollPosition="True" RenderMode="Lightweight" BorderWidth="0">  
                    
                            <div id="bd">
                                <asp:Placeholder ID="ContantLayoutHolder" runat="server"></asp:Placeholder>
                            </div>

                            <telerik:RadContextMenu ID="RadMenu1" runat="server" OnClientItemClicked="MenuItemClicked">
                                <Items>
                                    <telerik:RadMenuItem Text="Styling" >
                                        <Items>
                                            <telerik:RadMenuItem Text="pull-left" ></telerik:RadMenuItem>
                                            <telerik:RadMenuItem Text="pull-right" ></telerik:RadMenuItem>
                                            <telerik:RadMenuItem Text="full-width" ></telerik:RadMenuItem>
                                            <telerik:RadMenuItem IsSeparator="True"/>
                                            <telerik:RadMenuItem Text="clear-left" ></telerik:RadMenuItem>
                                            <telerik:RadMenuItem Text="clear-right" ></telerik:RadMenuItem>
                                            <telerik:RadMenuItem Text="ClearFix" ></telerik:RadMenuItem>
                                            <telerik:RadMenuItem IsSeparator="True"/>
                                            <telerik:RadMenuItem Text="col-secondary cs-left" ></telerik:RadMenuItem>
                                            <telerik:RadMenuItem Text="col-secondary cs-right" ></telerik:RadMenuItem>
                                        </Items>
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Area" >
                                        <Items>
                                            <telerik:RadMenuItem Text="Logo" ></telerik:RadMenuItem>
                                            <telerik:RadMenuItem Text="Utility Navigation" ></telerik:RadMenuItem>
                                            <telerik:RadMenuItem Text="Header" ></telerik:RadMenuItem>
                                            <telerik:RadMenuItem Text="Primary Navigation" ></telerik:RadMenuItem>
                                            <telerik:RadMenuItem Text="Secondary Navigation" ></telerik:RadMenuItem>
                                            <telerik:RadMenuItem Text="Content" ></telerik:RadMenuItem>
                                            <telerik:RadMenuItem Text="Main Content" ></telerik:RadMenuItem>
                                            <telerik:RadMenuItem Text="Footer" ></telerik:RadMenuItem>
                                        </Items>
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Rows" >
                                        <Items>
                                            <telerik:RadMenuItem Text="Add before" ></telerik:RadMenuItem>
                                            <telerik:RadMenuItem Text="Add after" ></telerik:RadMenuItem>
                                            <telerik:RadMenuItem Text="Delete" ></telerik:RadMenuItem>
                                        </Items>
                                    </telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="Reset" >
                                        <Items>
                                            <telerik:RadMenuItem Text="Reset All" ></telerik:RadMenuItem>
                                            <telerik:RadMenuItem Text="Reset Styling" ></telerik:RadMenuItem>
                                            <telerik:RadMenuItem Text="Reset Area" ></telerik:RadMenuItem>
                                        </Items>
                                    </telerik:RadMenuItem>
                                </Items>
                            </telerik:RadContextMenu>
                    
                        </telerik:RadPane>
                    
                    </telerik:RadSplitter>
                    
                </asiweb:PanelTemplateControl2>  
                              
                <![if gt IE 8]>
                    <asiweb:StyledLabel ID="ContextLabel" Text="Right-click any row to begin styling the layout. Hover over individual boxes to review the applied styling. &nbsp;" runat="server" CssClass="pull-right" Font-Italic="True"/>
                <![endif]>               

            </telerik:RadPageView>
        </telerik:RadMultiPage>  
    </asiweb:PanelTemplateControl2>
    
    <script type="text/javascript">
        (function () {

            window.itemIndex = null;
            window.websiteLayout = ('<%= WebsiteLayout%>' === 'True');
            window.itemsToDelete = [];

            window.hasSecondaryNav = function () {
                var pTag = jQuery('p');
                var masterWrapper = document.getElementById('masterWrapper');
                if (masterWrapper === undefined || masterWrapper === null)
                    return;
                for (var i = 0; i < pTag.length; i++) {
                    var parentOfP = pTag[i].parentNode;
                    var classToDelete;
                    if (parentOfP.className.indexOf('col-secondary cs-left') > -1) {
                        masterWrapper.className = masterWrapper.className.replace(' has-secondary-col col-on-right', '').replace('has-secondary-col col-on-right', '');
                        if (!(masterWrapper.className.indexOf('has-secondary-col col-on-left') > -1)) {
                            classToDelete = masterWrapper.className ? ' has-secondary-col col-on-left' : 'has-secondary-col col-on-left';
                            masterWrapper.className += classToDelete;
                            if (!(itemsToDelete.indexOf(classToDelete) > -1))
                                itemsToDelete.push(classToDelete);
                        }
                    }
                    else if (parentOfP.className.indexOf('col-secondary cs-right') > -1) {
                        masterWrapper.className = masterWrapper.className.replace(' has-secondary-col col-on-left', '').replace('has-secondary-col col-on-left', '');
                        if (!(masterWrapper.className.indexOf('has-secondary-col col-on-right') > -1)) {
                            classToDelete = masterWrapper.className ? ' has-secondary-col col-on-right' : 'has-secondary-col col-on-right';
                            masterWrapper.className += classToDelete;
                            if (!(itemsToDelete.indexOf(classToDelete) > -1))
                                itemsToDelete.push(classToDelete);
                        }
                    }
                }
            };

            window.addEvents = function() {
                jQuery(".template-contextmenu-area").mouseover(function() {
                    itemIndex = this;
                    var menu = $find('<%= RadMenu1.ClientID %>');
                    if (menu != null)
                        menu.hide();
                    itemIndex.setAttribute("oncontextmenu", "ShowContextMenu(itemIndex, event)");
                });
            };
            window.addContext = function() {
                var pTag = jQuery('p');
                if (pTag.length < 1) {
                    var template;
                    if(websiteLayout)
                        template = '<div id="masterWrapper" class="wrapper">\n\t<div>\n\t\t<p>1</p>\n\t</div>\n</div>';
                    else
                        template = '<div>\n\t<div>\n\t\t<p>1</p>\n\t</div>\n</div>';
                    var customTextArea = document.getElementById('<%= CustomContentLayoutSourceCode.ClientID %>');
                    customTextArea.value = template;
                }
                var isIe8 = IsIe8();
                if (websiteLayout && !isIe8) {
                    for (var i = 0; i < pTag.length; i++) {
                        var tooltipToDelete = "";
                        var parentOfP = pTag[i].parentNode;
                        parentOfP.className = parentOfP.className.trim();
                        if (!(parentOfP.className.indexOf('template-contextmenu-area') > -1))
                            parentOfP.className += parentOfP.className ? ' template-contextmenu-area' : 'template-contextmenu-area';

                        var tooltip = "Area: " + parentOfP.getAttribute("data-label") + "\x0A";
                        if ((tooltip.indexOf("null") > -1))
                            tooltip = "";
                        var thisClass = parentOfP.className.replace(/template-contextmenu-area/g, "");
                        if (thisClass.trim() != "")
                            tooltip += "Style: " + thisClass.trim();
                        if ((tooltip == ("Style: ")))
                            tooltip = "";
                        parentOfP.title = tooltip;
                        tooltipToDelete = ' title="' + tooltip + '"';
                        var ieTooltipToDelete = tooltipToDelete.replace("\x0A", "&#10\;");
                        if (!(itemsToDelete.indexOf(tooltipToDelete) > -1)) {
                            itemsToDelete.push(tooltipToDelete);
                            itemsToDelete.push(ieTooltipToDelete);
                        }
                    }
                    addEvents();
                    hasSecondaryNav();
                }
            };
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(addContext());
            jQuery(document).ready(addContext());

            window.fixNumbers = function() {
                var pTag = jQuery('p');
                for (var i = 0; i < pTag.length; i++) {
                    pTag[i].innerText = i + 1;
                }
            };
            window.removeContext = function() {
                var pTag = jQuery('p');
                for (var i = 0; i < pTag.length; i++) {
                    var parentOfP = pTag[i].parentNode;
                    parentOfP.removeAttribute("oncontextmenu");
                }
            };

            window.MenuItemClicked = function (sender, eventArgs) {
                if (itemIndex) {
                    //retrieve the clicked menu item value and perform the necessary operation using RadListView's client API methods
                    var clickedItemValue = eventArgs.get_item().get_text();
                    //get areas to apply changes to at the end
                    var placeHolder = document.getElementById('bd');
                    var customTextArea = document.getElementById('<%= CustomContentLayoutSourceCode.ClientID %>');
                    var template = "\n\t<p>{0}</p>\n";
                    var currentNumber = 0;
                    var div;
                    var node;
                    var parentDiv = itemIndex.parentNode;
                    switch (clickedItemValue) {
                        case "pull-left":
                            itemIndex.className = itemIndex.className.replace(' col-secondary cs-left', '').replace('col-secondary cs-left', '');
                            itemIndex.className = itemIndex.className.replace(' col-secondary cs-right', '').replace('col-secondary cs-right', '');
                            itemIndex.className = itemIndex.className.replace(' pull-right', '').replace('pull-right', '');
                            if (!(itemIndex.className.indexOf('pull-left') > -1))
                                itemIndex.className += itemIndex.className ? ' pull-left' : 'pull-left';
                            break;
                        case "pull-right":
                            itemIndex.className = itemIndex.className.replace(' col-secondary cs-left', '').replace('col-secondary cs-left', '');
                            itemIndex.className = itemIndex.className.replace(' col-secondary cs-right', '').replace('col-secondary cs-right', '');
                            itemIndex.className = itemIndex.className.replace(' pull-left', '').replace('pull-left', '');
                            if (!(itemIndex.className.indexOf('pull-right') > - 1))
                                itemIndex.className += itemIndex.className ? ' pull-right' : 'pull-right';
                            break;
                        case "full-width":
                            itemIndex.className = itemIndex.className.replace(' col-secondary cs-left', '').replace('col-secondary cs-left', '');
                            itemIndex.className = itemIndex.className.replace(' col-secondary cs-right', '').replace('col-secondary cs-right', '');
                            itemIndex.className = itemIndex.className.replace(' pull-left', '').replace('pull-left', '');
                            itemIndex.className = itemIndex.className.replace(' pull-right', '').replace('pull-right', '');
                            break;
                        case "clear-left":
                            itemIndex.className = itemIndex.className.replace(' col-secondary cs-left', '').replace('col-secondary cs-left', '');
                            itemIndex.className = itemIndex.className.replace(' col-secondary cs-right', '').replace('col-secondary cs-right', '');
                            itemIndex.className = itemIndex.className.replace(' clear-right', '').replace('clear-right', '');
                            itemIndex.className = itemIndex.className.replace(' ClearFix', '').replace('ClearFix', '');
                            if (!(itemIndex.className.indexOf('clear-left') > -1))
                                itemIndex.className += itemIndex.className ? ' clear-left' : 'clear-left';
                            break;
                        case "clear-right":
                            itemIndex.className = itemIndex.className.replace(' col-secondary cs-left', '').replace('col-secondary cs-left', '');
                            itemIndex.className = itemIndex.className.replace(' col-secondary cs-right', '').replace('col-secondary cs-right', '');
                            itemIndex.className = itemIndex.className.replace(' clear-left', '').replace('clear-left', '');
                            itemIndex.className = itemIndex.className.replace(' ClearFix', '').replace('ClearFix', '');
                            if (!(itemIndex.className.indexOf('clear-right') > -1))
                                itemIndex.className += itemIndex.className ? ' clear-right' : 'clear-right';
                            break;
                        case "ClearFix":
                            itemIndex.className = itemIndex.className.replace(' col-secondary cs-left', '').replace('col-secondary cs-left', '');
                            itemIndex.className = itemIndex.className.replace(' col-secondary cs-right', '').replace('col-secondary cs-right', '');
                            itemIndex.className = itemIndex.className.replace(' clear-left', '').replace('clear-left', '');
                            itemIndex.className = itemIndex.className.replace(' clear-right', '').replace('clear-right', '');
                            if (!(itemIndex.className.indexOf('ClearFix') > -1))
                                itemIndex.className += itemIndex.className ? ' ClearFix' : 'ClearFix';
                            break;
                        case "col-secondary cs-left":
                            itemIndex.className = itemIndex.className.replace(' pull-left', '').replace('pull-left', '');
                            itemIndex.className = itemIndex.className.replace(' pull-right', '').replace('pull-right', '');
                            itemIndex.className = itemIndex.className.replace(' ClearFix', '').replace('ClearFix', '');
                            itemIndex.className = itemIndex.className.replace(' clear-left', '').replace('clear-left', '');
                            itemIndex.className = itemIndex.className.replace(' clear-right', '').replace('clear-right', '');
                            itemIndex.className = itemIndex.className.replace(' col-secondary cs-right', '').replace('col-secondary cs-right', '');
                            if (!(itemIndex.className.indexOf('col-secondary cs-left') > -1))
                                itemIndex.className += itemIndex.className ? ' col-secondary cs-left' : 'col-secondary cs-left';
                            hasSecondaryNav();
                            break;
                        case "col-secondary cs-right":
                            itemIndex.className = itemIndex.className.replace(' pull-left', '').replace('pull-left', '');
                            itemIndex.className = itemIndex.className.replace(' pull-right', '').replace('pull-right', '');
                            itemIndex.className = itemIndex.className.replace(' ClearFix', '').replace('ClearFix', '');
                            itemIndex.className = itemIndex.className.replace(' clear-left', '').replace('clear-left', '');
                            itemIndex.className = itemIndex.className.replace(' clear-right', '').replace('clear-right', '');
                            itemIndex.className = itemIndex.className.replace(' col-secondary cs-left', '').replace('col-secondary cs-left', '');
                            if (!(itemIndex.className.indexOf('col-secondary cs-right') > -1))
                                itemIndex.className += itemIndex.className ? ' col-secondary cs-right' : 'col-secondary cs-right';
                            hasSecondaryNav();
                            break;
                        case "Logo":
                                itemIndex.removeAttribute("data-label");
                                itemIndex.setAttribute("data-label", "Logo");
                            break;
                        case "Utility Navigation":
                                itemIndex.removeAttribute("data-label");
                                itemIndex.setAttribute("data-label", "Utility Navigation");
                            break;
                        case "Header":
                            itemIndex.removeAttribute("data-label");
                            itemIndex.setAttribute("data-label", "Header");
                            break;
                        case "Primary Navigation":
                            itemIndex.removeAttribute("data-label");
                            itemIndex.setAttribute("data-label", "Primary Navigation");
                            break;
                        case "Secondary Navigation":
                            itemIndex.removeAttribute("data-label");
                            itemIndex.setAttribute("data-label", "Secondary Navigation");
                            break;
                        case "Content":
                            itemIndex.removeAttribute("data-label");
                            itemIndex.setAttribute("data-label", "Content");
                            break;
                        case "Main Content":
                            itemIndex.removeAttribute("data-label");
                            itemIndex.setAttribute("data-label", "Main Content");
                            break;
                        case "Footer":
                            itemIndex.removeAttribute("data-label");
                            itemIndex.setAttribute("data-label", "Footer");
                            break;
                        
                        case "Reset Styling":
                            itemIndex.className = itemIndex.className.replace(' pull-left', '').replace('pull-left', '');
                            itemIndex.className = itemIndex.className.replace(' pull-right', '').replace('pull-right', '');
                            itemIndex.className = itemIndex.className.replace(' ClearFix', '').replace('ClearFix', '');
                            itemIndex.className = itemIndex.className.replace(' clear-left', '').replace('clear-left', '');
                            itemIndex.className = itemIndex.className.replace(' clear-right', '').replace('clear-right', '');
                            itemIndex.className = itemIndex.className.replace(' col-secondary cs-left', '').replace('col-secondary cs-left', '');
                            itemIndex.className = itemIndex.className.replace(' col-secondary cs-right', '').replace('col-secondary cs-right', '');
                            break;
                        case "Reset Area":
                            itemIndex.removeAttribute("data-label");
                            break;
                        case "Reset All":
                            itemIndex.className = itemIndex.className.replace(' pull-left', '').replace('pull-left', '');
                            itemIndex.className = itemIndex.className.replace(' pull-right', '').replace('pull-right', '');
                            itemIndex.className = itemIndex.className.replace(' ClearFix', '').replace('ClearFix', '');
                            itemIndex.className = itemIndex.className.replace(' clear-left', '').replace('clear-left', '');
                            itemIndex.className = itemIndex.className.replace(' clear-right', '').replace('clear-right', '');
                            itemIndex.className = itemIndex.className.replace(' col-secondary cs-left', '').replace('col-secondary cs-left', '');
                            itemIndex.className = itemIndex.className.replace(' col-secondary cs-right', '').replace('col-secondary cs-right', '');
                            itemIndex.removeAttribute("data-label");
                            break;
                        case "Add before":
                            for (var i = 0; i < itemIndex.childNodes.length; i++) {
                                node = itemIndex.childNodes[i];
                                if (node.tagName == 'P') {
                                    currentNumber = parseInt(node.innerText);
                                    template = template.replace('{0}', currentNumber);
                                    //add template
                                    div = document.createElement('div');
                                    div.className = 'template-contextmenu-area';
                                    div.innerHTML = template;
                                    parentDiv.insertBefore(div, itemIndex);
                                    fixNumbers();
                                    var tooltipToDelete = "";
                                    itemIndex.className = itemIndex.className.trim();
                                    var tooltip = "Area: " + itemIndex.getAttribute("data-label") + "\n";
                                    if ((tooltip.indexOf("null") > -1))
                                        tooltip = "";
                                    var thisClass = itemIndex.className.replace(/template-contextmenu-area/g, "");
                                    if (thisClass.trim() != "")
                                        tooltip += "Style: " + thisClass.trim();
                                    if ((tooltip == ("Style: ")))
                                        tooltip = "";
                                    itemIndex.title = tooltip;
                                    tooltipToDelete = ' title="' + tooltip + '"';
                                    var ieTooltipToDelete = tooltipToDelete.replace("\x0A", "&#10\;");
                                    if (!(itemsToDelete.indexOf(tooltipToDelete) > -1)) {
                                        itemsToDelete.push(tooltipToDelete);
                                        itemsToDelete.push(ieTooltipToDelete);
                                    }
                                }
                            }
                            break;
                        case "Add after":
                            for (var i = 0; i < itemIndex.childNodes.length; i++) {
                                node = itemIndex.childNodes[i];
                                if (node.tagName == 'P') {
                                    currentNumber = parseInt(node.innerText);
                                    template = template.replace('{0}', currentNumber);
                                    //add template
                                    div = document.createElement('div');
                                    div.className = 'template-contextmenu-area';
                                    div.innerHTML = template;
                                    parentDiv.insertBefore(div, itemIndex.nextSibling);
                                    fixNumbers();
                                    var tooltipToDelete = "";
                                    itemIndex.className = itemIndex.className.trim();
                                    var tooltip = "Area: " + itemIndex.getAttribute("data-label") + "\n";
                                    if ((tooltip.indexOf("null") > -1))
                                        tooltip = "";
                                    var thisClass = itemIndex.className.replace(/template-contextmenu-area/g, "");
                                    if (thisClass.trim() != "")
                                        tooltip += "Style: " + thisClass.trim();
                                    if ((tooltip == ("Style: ")))
                                        tooltip = "";
                                    itemIndex.title = tooltip;
                                    tooltipToDelete = ' title="' + tooltip + '"';
                                    var ieTooltipToDelete = tooltipToDelete.replace("\x0A", "&#10\;");
                                    if (!(itemsToDelete.indexOf(tooltipToDelete) > -1)) {
                                        itemsToDelete.push(tooltipToDelete);
                                        itemsToDelete.push(ieTooltipToDelete);
                                    }
                                }
                            }
                            break;
                        case "Delete":
                            parentDiv.removeChild(itemIndex);
                            fixNumbers();
                            break;
                    }
                    if (clickedItemValue != "Delete")
                        itemIndex.className = itemIndex.className.trim();
                    //apply all changes to the Layout area
                    if (placeHolder != null && customTextArea != null) {
                        //clean all the extra data before adding to the customTextArea
                        removeContext();
                        var cleanPlaceHolder = placeHolder.innerHTML;
                        for (var listItem = 0; listItem < itemsToDelete.length; listItem++) {
                            cleanPlaceHolder = cleanPlaceHolder.replace(new RegExp(itemsToDelete[listItem], 'g'), '');
                        }
                        cleanPlaceHolder = cleanPlaceHolder.replace(/ title=""/g, '').replace(/title=""/g, '');
                        cleanPlaceHolder = cleanPlaceHolder.replace(/ template-contextmenu-area/g, '');
                        cleanPlaceHolder = cleanPlaceHolder.replace(/template-contextmenu-area/g, '');
                        cleanPlaceHolder = cleanPlaceHolder.replace(/ class=""/g, '').replace(/class=""/g, '').replace(/class=" /g, 'class="');
                        cleanPlaceHolder = cleanPlaceHolder.replace(/<div >/g, '<div>');
                        cleanPlaceHolder = cleanPlaceHolder.replace(/\n\n/g, '\n');
                        customTextArea.value = cleanPlaceHolder.trim();
                    }
                    addContext();

                }
            };
            
            window.ShowContextMenu = function (index, evt) {
                if (index) {
                    itemIndex = index;
                    var targetElement = index;
                    if (targetElement.tagName == "INPUT" || targetElement.tagName == "A" || targetElement.tagName == "BUTTON") {
                        return;
                    }
                }
                //display the context menu over non-input or anchor DOM elements
                var menu = $find('<%= RadMenu1.ClientID %>');
                menu.show(evt);
                //prevent the default browser context menu appearance
                evt.cancelBubble = true;
                evt.returnValue = false;
                if (evt.stopPropagation) {
                    evt.stopPropagation();
                }
                evt.preventDefault ? evt.preventDefault() : (event.returnValue = false);
            };

            function GetInternetExplorerVersion() {
                var rv = -1; // Return value assumes failure.
                if (navigator.appName == 'Microsoft Internet Explorer') {
                    var ua = navigator.userAgent;
                    var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
                    if (re.exec(ua) != null)
                        rv = parseFloat(RegExp.$1);
                }
                return rv;
            };
            function IsIe8() {
                var ver = GetInternetExplorerVersion();
                if (ver > -1) {
                    if (ver <= 8.0)
                        return true;
                }
                return false;
            };
            
        })();

    function SplitterLoaded(splitter) {
        var reHeight = SetSplitterHeight();
        splitter.set_height(reHeight);
    }

    function SplitterResize(splitter) {
        var reHeight = SetSplitterHeight();
        splitter.set_height(reHeight);
    }

    function SetSplitterHeight() {
        var windowHeight = 0;
        if (jQuery(window).height() != null) {
            var messagePanel = jQuery(".AsiWarning");
            var remove = 150;
            if (messagePanel.length > 0)
                remove = 225;
            windowHeight = jQuery(window).height() - remove;
        }
        return windowHeight;
    }
    </script>
</asp:Content>