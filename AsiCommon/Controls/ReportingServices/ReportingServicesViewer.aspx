<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" Title="ReportingServices Viewer" %>
<%@ Register TagPrefix="uc1" TagName="ReportingServicesViewer" Src="~/AsiCommon/Controls/ReportingServices/ReportingServicesViewer.ascx" %>

<asp:Content id="MainPlaceHolder" runat="server" ContentPlaceHolderID="TemplateBody">
    <uc1:ReportingServicesViewer id="ReportingServicesViewer1" runat="server" />
</asp:Content>
