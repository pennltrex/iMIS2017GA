<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.WordMergeEngine.WordMergePEDesigner" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="WordMergePEDesigner.ascx.cs" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

<telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
    ShowBaseLine="true" AutoPostBack="true">
</telerik:RadTabStrip>

<div class="HTabBody">
    <asp:placeholder id="TabPlaceHolder" runat="server"></asp:placeholder>
</div>