<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.WorkflowInstanceList" Codebehind="WorkflowInstanceList.ascx.cs" %>
<asp:Label id="ProcessLabel" CssClass="SectionTitle" runat="server">Processes</asp:Label>
<asiResultsViewer:QueryResultGrid id="ListerInstances" AllowPaging="True" SelectItemBehavior="RaiseEvent" PageSize="20"
	RunAt="server" QueryPath="$/Workflow Management/DefaultSystem/Queries/Process List"
	ExportEnabled="False" DeleteEnabled="True"></asiResultsViewer:QueryResultGrid>
<br>
<asp:Label id="WorkItemLabel" CssClass="SectionTitle" runat="server">Pending work items</asp:Label>
<asiResultsViewer:QueryResultGrid id="ListerWorkItems" AllowPaging="True" SelectItemBehavior="RaiseEvent" PageSize="10"
	RunAt="server" QueryPath="$/Workflow Management/DefaultSystem/Queries/Process WorkItem List"
	ExportEnabled="False"></asiResultsViewer:QueryResultGrid>
