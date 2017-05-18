<%@ Page Language="C#" Inherits="iMIS_ContentManagement_PerspectiveList" Title="Manage sitemaps" Codebehind="PerspectiveList.aspx.cs" %>
<%@ Import Namespace="DocumentFormat.OpenXml" %>
<%@ Register TagPrefix="asi" TagName="ObjectBrowser" Src="~/AsiCommon/Controls/BSA/ObjectBrowser2.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <asp:Panel ID="BrowserPanel" runat="server" Height="100%" Width="100%" CssClass="hidden-xs hidden-sm">
        <asi:ObjectBrowser ID="NavigationItemBrowser" runat="server" TypeFilter="NAV" 
            Text="Navigation Items" Mode="EditContainer" PublishedOnly="false"
            RootListDataValueField="RootHierarchyKey" RootListDataTextField="PerspectiveName"
            RootListDataSource="<%# GetPerspectives() %>" SortByName="false" ShowRecycleBin="true" />
    </asp:Panel>
    
    <asp:Label ID="SmallScreenMessage" Text="Manage sitemaps is not supported on the screen size of this browser." CssClass="hidden-md hidden-lg" runat="server" translate="yes"></asp:Label>

</asp:Content>

