<%@ Reference Control="~/asicommon/controls/querybuilder/designclassic.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.QueryBuilder.DesignClassicColumns" Codebehind="DesignClassicColumns.ascx.cs" %>
	
<asiweb:PanelTemplateControl ID="DisplayPanel" runat="server" BorderStyle="None" Collapsible="False">
    <asp:Label id="ErrorMsgLabel" runat="server" CssClass="Error"></asp:Label>    
    <asp:PlaceHolder ID="ChildControlsPlaceHolder" Runat="server"></asp:PlaceHolder>
</asiweb:PanelTemplateControl>