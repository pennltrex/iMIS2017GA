<%@ Page language="c#" Inherits="Asi.Web.UI.DisplayPageBase" Title="Workflow Manager" %>
<%@ Register TagPrefix="uc1" TagName="WFPortfolio" Src="~/AsiCommon/Controls/WorkflowManager/WorkflowList.ascx" %>

<asp:Content id="WFPortfolioContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <uc1:WFPortfolio id="WFPortfolio1" runat="server"></uc1:WFPortfolio>
</asp:Content>
