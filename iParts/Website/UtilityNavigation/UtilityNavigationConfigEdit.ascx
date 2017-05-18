<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UtilityNavigationConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Website.UtilityNavigation.UtilityNavigationConfigEdit" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<div style="width:100%" class="Section">   
    <telerik:RadDockLayout ID="RadDockLayout" OnLoadDockLayout="RadDockLayoutLoadDockLayout" OnSaveDockLayout="RadDockLayoutSaveDockLayout" runat="server" RenderingMode="Lightweight" >
        <div class="PanelField Top">
            <div class="PanelFieldLabel" translate="yes">
	            <label><%# ResourceManager.GetWord("Available") %></label>
            </div>
            <div class="PanelFieldValue">             
                <telerik:RadDockZone BorderStyle="None" ID="RadDockZoneAvailableItems" runat="server" Style="background:#C2C2C2;" UniqueName="RadDockZoneAvailable" RenderMode="Lightweight">                                        
                </telerik:RadDockZone>
            </div>
        </div>
        <div class="PanelField Top">
            <div class="PanelFieldLabel" translate="yes">
	            <label><%# ResourceManager.GetWord("Selected") %></label>
            </div>
            <div class="PanelFieldValue">  
                <telerik:RadDockZone BorderStyle="None" ID="RadDockZoneSelectedItems" runat="server" Style="background:#555555;" UniqueName="RadDockZoneSelected" RenderMode="Lightweight">
                </telerik:RadDockZone>               
            </div>
        </div>
    </telerik:RadDockLayout>
    <div class="Center Info"><%# ResourceManager.GetPhrase("DagDropBoxes","Drag-and-drop the boxes to the dark gray area.") %></div>
</div>

<asp:Panel runat="server" ID="AuxiliaryNavigationPanel" CssClass="ShowFieldset">
    <fieldset>            
        <legend><%# ResourceManager.GetPhrase("NavigationLinks","Navigation links") %></legend>      
        <asiweb:SmartControl 
            ID="NavigationPaneCode" runat="server" 
            BoundPropertyName="NavigationPaneCode" DisplayCaption="true" 
            PositionCaption="Left" DataSaveUponStateChange="false" />   
    </fieldset>   
</asp:Panel>

<asp:Panel runat="server" ID="SignInOutPanel" CssClass="ShowFieldset">
    <fieldset>            
        <legend><%# ResourceManager.GetPhrase("SignInOut","Sign in/out") %></legend>             
        <asiweb:SmartControl 
            ID="SignInText" runat="server" 
            BoundPropertyName="SignInText" DisplayCaption="true" 
            PositionCaption="Left" DataSaveUponStateChange="false" />
        <asiweb:SmartControl 
            ID="SignOutText" runat="server" 
            BoundPropertyName="SignOutText" DisplayCaption="true" 
            PositionCaption="Left" DataSaveUponStateChange="false" />  
        <asiweb:SmartControl 
            ID="SignInOutCssClass" runat="server" 
            BoundPropertyName="SignInOutCssClass" DisplayCaption="true" 
            PositionCaption="Left" DataSaveUponStateChange="false" />                      
    </fieldset>   
</asp:Panel>

<asp:Panel runat="server" ID="UniversalSearchPanel" CssClass="ShowFieldset">
    <fieldset>            
        <legend><%# ResourceManager.GetPhrase("UniversalSearch","Universal search") %></legend>  
        <asiweb:SmartControl 
            ID="UniversalSearchDefaultText" runat="server" 
            BoundPropertyName="UniversalSearchDefaultText" DisplayCaption="true" 
            PositionCaption="Left" DataSaveUponStateChange="false" InputFieldCssClass="InputLargeWrapper" />
         <asiweb:SmartControl 
            ID="UniversalSearchCssClass" runat="server" 
            BoundPropertyName="UniversalSearchCssClass" DisplayCaption="true" 
            PositionCaption="Left" DataSaveUponStateChange="false" />                          
    </fieldset>   
</asp:Panel>

<script type="text/javascript">
    function SetHandleDock(dock) {
        var dockContent = dock.get_contentContainer();
        var dragHandle = $telerik.$(dockContent).find("div")[0];
        dock.set_handle(dragHandle);
    }

    function DockPositionChanged(sender) {
        var signInOutPanel;
        var universalSearchPanel;
        var auxiliaryNavigationPanel;
        if (sender._dockZone._uniqueName === "RadDockZoneAvailable") {
            if (sender._uniqueName === "SignInOut") {
                signInOutPanel = $get("<%#SignInOutPanel.ClientID%>");
                signInOutPanel.setAttribute("style", "display:none;");
            }
            if (sender._uniqueName === "UniversalSearch") {
                universalSearchPanel = $get("<%#UniversalSearchPanel.ClientID%>");
                universalSearchPanel.setAttribute("style", "display:none;");
            }       
            if (sender._uniqueName === "AuxiliaryNavigation") {
                auxiliaryNavigationPanel = $get("<%#AuxiliaryNavigationPanel.ClientID%>");
                auxiliaryNavigationPanel.setAttribute("style", "display:none;");
            }
        }
        if (sender._dockZone._uniqueName === "RadDockZoneSelected") {

            if (sender._uniqueName === "SignInOut") {
                signInOutPanel = $get("<%#SignInOutPanel.ClientID%>");
                signInOutPanel.setAttribute("style", "display:block;");
            }
            if (sender._uniqueName === "UniversalSearch") {
                universalSearchPanel = $get("<%#UniversalSearchPanel.ClientID%>");
                universalSearchPanel.setAttribute("style", "display:block;");
            }
            if (sender._uniqueName === "AuxiliaryNavigation") {
                auxiliaryNavigationPanel = $get("<%#AuxiliaryNavigationPanel.ClientID%>");
                auxiliaryNavigationPanel.setAttribute("style", "display:block;");
            }
        }
    }
</script>

 