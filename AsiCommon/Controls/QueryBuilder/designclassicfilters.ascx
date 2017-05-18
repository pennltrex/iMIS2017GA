<%@ Reference Control="~/asicommon/controls/querybuilder/designclassic.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.QueryBuilder.DesignClassicFilters" Codebehind="DesignClassicFilters.ascx.cs" %>

<asiweb:PanelTemplateControl ID="FiltersPanel" runat="server" ShowHeader="False" BorderStyle="None" Collapsible="False">
    <h1 class="screen-reader-text" translate="yes">Query Filters</h1> 
    <asp:Label id="ErrorMsgLabel" runat="server" CssClass="Error"></asp:Label>
    <asp:PlaceHolder ID="ChildControlsPlaceHolder" Runat="server"></asp:PlaceHolder>
</asiweb:PanelTemplateControl>
