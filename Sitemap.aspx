<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="iMIS_ContentManagement_Sitemap" Codebehind="Sitemap.aspx.cs" %>
<asp:Content ID="Content3" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <asp:Menu ID="SitemapMenu" runat="server" Orientation="Vertical" DataSourceID="SiteMapDataSource1" StaticEnableDefaultPopOutImage="false" OnMenuItemDataBound="SitemapMenu_MenuItemDataBound">
        <StaticMenuItemStyle CssClass="SitemapMenuItem" />
        <StaticHoverStyle CssClass="SitemapMenuItem_Hover" />
    </asp:Menu>
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" SiteMapProvider="AsiSitemapProvider" />
</asp:Content>