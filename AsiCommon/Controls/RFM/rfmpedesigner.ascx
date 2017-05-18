<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.RFM.RFMPEDesigner" Codebehind="RFMPEDesigner.ascx.cs" %>

<asp:PlaceHolder id="ErrorMsgPlaceHolder" runat="server" />

<telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
    ShowBaseLine="true" AutoPostBack="true" OnTabClick="SubSectionTabStrip_SelectedIndexChange">
</telerik:RadTabStrip>

<div class="HTabBody">
	<asp:PlaceHolder id="ChildControlsPlaceHolder" runat="server" />
</div>
