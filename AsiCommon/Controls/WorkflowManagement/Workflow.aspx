<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Document Chooser" %>
<%@ Register TagPrefix="uc1" TagName="Workflow" Src="~/AsiCommon/Controls/WorkflowManagement/Workflow.ascx" %>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
<link href="../../../Templates/iMIS15/StyleSheets/iMIS.css" rel="stylesheet" type="text/css" />
    <uc1:Workflow id="Workflow1" runat="server"></uc1:Workflow>
</asp:Content>
