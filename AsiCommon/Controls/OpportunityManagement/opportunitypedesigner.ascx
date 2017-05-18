<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.OpportunityPEDesigner" Codebehind="OpportunityPEDesigner.ascx.cs" %>
<asp:PlaceHolder id="ErrorMsgPlaceHolder" runat="server"></asp:PlaceHolder>

<telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
    ShowBaseLine="true" AutoPostBack="true" OnTabClick="SubSectionTabStrip_SelectedIndexChange">
</telerik:RadTabStrip>

<div class="HTabBody">
	<asp:PlaceHolder id="TabPlaceHolder" runat="server"></asp:PlaceHolder>
</div>
