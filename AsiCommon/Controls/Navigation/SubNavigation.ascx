<%@ Control Language="C#" Inherits="AsiCommon_Controls_Navigation_SubNavigation" Codebehind="~/AsiCommon/Controls/Navigation/SubNavigation.ascx.cs" %>
<%--<script src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/asicommon/scripts/SubNavigation.js" type="text/javascript"></script>--%>

<asp:Panel runat="server" translate="yes">
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
    <asp:PlaceHolder ID="NavMenuPlaceHolder" runat="server" Visible="true"/>  
</asp:Panel>