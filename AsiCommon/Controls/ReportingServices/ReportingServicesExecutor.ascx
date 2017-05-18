<%@ Register TagPrefix="rsweb" Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91"    Namespace="Microsoft.Reporting.WebForms"  %>
<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.ReportingServices.ReportingServicesExecutor" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="ReportingServicesExecutor.ascx.cs" %>

<div align="right">
    <asiweb:StyledButton id="btnParams" runat="server" />
    <asiweb:StyledButton id="btnCancel" runat="server" />
</div>

<div class="ReportViewer" align="center">
    <asp:PlaceHolder id="ErrorMsgPlaceHolder" runat="server"></asp:PlaceHolder>
    <asp:PlaceHolder id="ExecutorPlaceHolder" runat="server"></asp:PlaceHolder>
</div>

