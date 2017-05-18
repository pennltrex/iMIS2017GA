<%@ Control Language="C#" Inherits="AsiCommon_Controls_Navigation_PageSubNav" Codebehind="~/AsiCommon/Controls/Navigation/PageSubNav.ascx.cs" %>

<%--<img id="NavigationItemSurfToEditButton" style="display:none; position:absolute; cursor:pointer" src="../../Images/icon_nav.gif" alt="Edit this Navigation Item" />--%>

<asp:TreeView ID="NavTree" SkinID="NavMenuTree" runat="server" 
    DataSourceID="SiteMapDataSource1"
    EnableClientScript="true" OnTreeNodePopulate="NavTree_TreeNodePopulate" />
<asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
