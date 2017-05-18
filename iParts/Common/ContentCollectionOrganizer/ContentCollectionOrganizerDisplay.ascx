<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="ContentCollectionOrganizerDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.ContentCollectionOrganizer.ContentCollectionOrganizerDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Literal runat="server" ID="TabPanelAnchor" Visible="False"/>  
<asp:UpdatePanel ID="updatePanel" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
   
    <ContentTemplate>

        <asp:Label ID="InfoControl" CssClass="PanelFieldValue AsiWarning" runat="server" Visible="false" />
        
        <asp:Label id="MoreInfoControl" runat="server" CssClass="PanelFieldValue AsiInformation" Visible="false" />
                               
        <asp:Panel ID="MainContentControl" runat="server">
            
            <telerik:RadTabStrip runat="server" ID="radTab_Top" AutoPostBack="false"
                SelectedIndex="0" MultiPageID="radPage" CausesValidation="false" EnableViewState="true" ScrollChildren="false" ScrollButtonsPosition="Middle" >
            </telerik:RadTabStrip>
            <asp:Button runat="server" id="refreshTrigger" OnClick="RefreshTriggerClick" style="display:none" Text="Refresh" />
            <telerik:RadMultiPage ID="radPage" runat="server" 
                SelectedIndex="0" ></telerik:RadMultiPage>    
            <telerik:RadTabStrip runat="server" ID="radTab_Bottom" AutoPostBack="false"  
                SelectedIndex="0" MultiPageID="radPage" CausesValidation="false" EnableViewState="true" ScrollChildren="false" ScrollButtonsPosition="Middle">
            </telerik:RadTabStrip>
                            
        </asp:Panel>
        
        <asp:Panel ID="panStep" runat="server" EnableViewState="true"/>
        <asp:Label ID="debug" runat="server"/>
        
    </ContentTemplate>
      
</asp:UpdatePanel>
