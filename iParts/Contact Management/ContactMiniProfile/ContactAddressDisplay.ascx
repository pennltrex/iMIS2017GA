<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactAddressDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactAddressDisplay" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>	
<asp:Panel ID="contentPanel" runat="server" Visible="true" CssClass="StandardPanel" BorderStyle="None" BackColor="Transparent">
    <div id="_divAddress" runat="server">
        <asiweb:StyledLabel ID="_address" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Top" />
    </div>
    <div id="_divPhoneNumber" runat="server">
        <asiweb:StyledLabel ID="_phoneNumber" runat="server" RenderPanelField="true" DisplayCaption="false"/>
    </div>
    <div id="_divEmail" runat="server" class="BreakWord" style="clear: both;">
        <asp:HyperLink runat="server" ID="_email" CssClass="PanelField"/>
    </div> 
    <div style="clear: both;"></div>    
</asp:Panel>
