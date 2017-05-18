<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.MailProcessEngine.EmailPEDesigner" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="EmailPEDesigner.ascx.cs" %>
<asp:PlaceHolder id="ErrorMsgPlaceHolder" runat="server"></asp:PlaceHolder>

<telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
    ShowBaseLine="true" AutoPostBack="true">
</telerik:RadTabStrip>

<div class="HTabBody">
    <asp:PlaceHolder id="TabPlaceHolder" runat="server"></asp:PlaceHolder>
</div>