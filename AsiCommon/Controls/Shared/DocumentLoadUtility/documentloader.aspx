<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Document Loader" %>
<%@ Register TagPrefix="uc1" TagName="DocumentLoader" Src="~/AsiCommon/Controls/Shared/DocumentLoadUtility/DocumentLoader.ascx" %>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <uc1:documentloader id="DocumentLoader" runat="server"></uc1:documentloader>
</asp:Content>
