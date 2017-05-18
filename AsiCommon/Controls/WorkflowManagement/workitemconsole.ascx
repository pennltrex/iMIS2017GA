<%@ Reference Control="~/asicommon/controls/workflowmanagement/workflowprocesshost.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.WorkItemConsole" CodeBehind="WorkItemConsole.ascx.cs" %>
<%@ Register TagPrefix="asiWf" TagName="WorkflowProcessHost" Src="WorkflowProcessHost.ascx" %>
<%@ Register TagPrefix="asiResultViewer" Namespace="Asi.Web.UI.ResultViewer" Assembly="Asi.Web" %>
<asiResultViewer:QueryResultGrid ID="QueryResults" runat="server" PageSize="5"
    QueryPath="$/Workflow Management/DefaultSystem/Queries/WorkItem List">
</asiResultViewer:QueryResultGrid>
<p>
    <asiWf:WorkflowProcessHost ID="ProcessHost" runat="server" UseSkipButton="True"></asiWf:WorkflowProcessHost>
</p>
