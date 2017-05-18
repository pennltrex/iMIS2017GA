<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Document Chooser" %>
<%@ Register TagPrefix="uc1" TagName="Workflow" Src="Workflow.ascx" %>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <uc1:Workflow id="Workflow1" runat="server"></uc1:Workflow>
</asp:Content>
