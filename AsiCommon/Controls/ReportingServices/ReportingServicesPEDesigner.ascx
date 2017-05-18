<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.ReportingServices.ReportingServicesPEDesigner" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="ReportingServicesPEDesigner.ascx.cs" %>

<asp:PlaceHolder id="ErrorMsgPlaceHolder" runat="server"></asp:PlaceHolder>

<telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
    ShowBaseLine="true" AutoPostBack="true" SkinID="SubTabs">
</telerik:RadTabStrip>

<div class="HTabBody AddPadding">
    <asp:PlaceHolder id="TabPlaceHolder" runat="server"/>
</div>