<%@ Page Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.ReportingServices.PrintTranscriptViewer" Codebehind="~/Core/AccountManagement/CertificationManagement/PrintTranscriptViewer.aspx.cs" %>
<%@ Register TagPrefix="uc1" TagName="ReportingServicesViewer" Src="~/AsiCommon/Controls/ReportingServices/ReportingServicesViewer.ascx" %>

<asp:Content id="MainPlaceHolder" runat="server" ContentPlaceHolderID="TemplateBody">
    <uc1:ReportingServicesViewer id="ReportingServicesViewer1" runat="server" OnInit="ReportingServicesViewer_OnInit" />
</asp:Content>