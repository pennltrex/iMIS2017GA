<%@ Reference Control="~/asicommon/controls/querybuilder/designclassic.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.QueryBuilder.DesignClassicSorting" Codebehind="DesignClassicSorting.ascx.cs" %>

<asiweb:PanelTemplateControl ID="SortPanel" runat="server" ShowHeader="False" BorderStyle="None" Collapsible="False">
    <h1 class="screen-reader-text" translate="yes">Query Sorting</h1> 
    <asp:Label id="ErrorMsgLabel" runat="server" CssClass="Error"></asp:Label>
    <asp:placeholder id="ChildControlsPlaceHolder" Runat="server"></asp:placeholder>
</asiweb:PanelTemplateControl>