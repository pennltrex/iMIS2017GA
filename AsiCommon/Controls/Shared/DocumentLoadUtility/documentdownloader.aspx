<%@ Register TagPrefix="uc1" TagName="DocumentDownloader" Src="~/AsiCommon/Controls/Shared/DocumentLoadUtility/DocumentDownloader.ascx" %>
<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Document Downloader" %>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <uc1:documentdownloader id="DocumentDownloader" runat="server"></uc1:documentdownloader>
</asp:Content>
