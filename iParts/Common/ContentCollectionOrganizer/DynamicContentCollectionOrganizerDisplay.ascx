<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DynamicContentCollectionOrganizerDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.ContentCollectionOrganizer.DynamicContentCollectionOrganizerDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Literal runat="server" ID="TabPanelAnchor" Visible="False"/>  
<asp:UpdatePanel ID="updatePanel" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional" translate="yes">
   
    <ContentTemplate>

        <asp:Label ID="InfoControl" CssClass="PanelFieldValue AsiWarning" runat="server" Visible="false" />
        
        <asp:Label id="MoreInfoControl" runat="server" CssClass="PanelFieldValue AsiInformation" Visible="false" />
                 
        <asp:Panel ID="MainContentControl" runat="server">            
            <telerik:RadTabStrip runat="server" ID="radTab_Top" AutoPostBack="false"
                SelectedIndex="0" MultiPageID="radPage" CausesValidation="false" EnableViewState="true" ScrollChildren="false" ScrollButtonsPosition="Middle" >
            </telerik:RadTabStrip>
            <asp:Button runat="server" id="refreshTrigger" OnClick="RefreshTriggerClick" style="display:none" Text=""></asp:Button>
            <telerik:RadMultiPage ID="radPage" runat="server" 
                SelectedIndex="0" ></telerik:RadMultiPage>                                        
        </asp:Panel>
        
        <asp:Panel ID="panStep" runat="server" EnableViewState="true"/>
        <asp:Label ID="debug" runat="server"/>
      
        <script type="text/javascript"  >
            if (Telerik.Web.UI.RadGrid != null)
            Telerik.Web.UI.RadGrid.prototype._detachDomEvents = function () {
                if (this._events) {
                    if (this._onKeyDownDelegate) {
                        $removeHandler(this.get_element(), "keydown", this._onKeyDownDelegate);
                        this._onKeyDownDelegate = null;
                    }
                    if (this._onKeyPressDelegate) {
                        $removeHandler(this.get_element(), "keypress", this._onKeyPressDelegate);
                        this._onKeyPressDelegate = null;
                    }
                    if (this._onMouseMoveDelegate) {
                        $removeHandler(this.get_element(), "mousemove", this._onMouseMoveDelegate);
                        this._onMouseMoveDelegate = null;
                    }
                }
            }
        </script>
    </ContentTemplate>
      
</asp:UpdatePanel>