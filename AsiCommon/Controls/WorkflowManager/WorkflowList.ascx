<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.WorkflowManager.TaskList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="WorkflowList.ascx.cs" %>
<%@ Register TagPrefix="asiwc" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" Collapsible="false">

    <asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
    <asp:placeholder id="phTaskBar" runat="server"></asp:placeholder>

    <asiweb:Lister2 runat="server" AjaxEnabled="true"
    ID="ListerWF"
    DataSourceDocumentPath="$/Common/Queries/WorkflowManagement/WorkflowList"
    UseUniformKey="true"
    TargetContentCode="Workflow.Viewer"
    LinkTargetWindowSize="Small" 
    PageSize="20"
    PagingEnabled="True"
    ExportButtonLocation="TopRight" 
    TargetUrl="~/AsiCommon/Controls/WorkflowManagement/Workflow.aspx"
    TargetTemplateType="D" 
    PagerMode="Advanced"
    />		
		
</asiweb:PanelTemplateControl2>