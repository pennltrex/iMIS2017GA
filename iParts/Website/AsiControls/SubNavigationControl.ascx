<%@ Control Language="C#" Inherits="Asi.Web.iParts.Website.AsiControls.SubNavigation" Codebehind="SubNavigationControl.ascx.cs" %>
<asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
<asp:Panel class="sub-nav-head" ID="SubNavHead" runat="server" translate="yes" Visible="false">
    <asp:Literal ID="SubNavPanelTitle" runat="server" />
</asp:Panel>
<asp:Panel class="sub-nav-body" ID="SubNavPanel" runat="server" translate="yes"> 
    <asp:PlaceHolder ID="NavigationMenuPlaceholder" runat="server" Visible="true" />
</asp:Panel> 