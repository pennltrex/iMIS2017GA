<%@ Register TagPrefix="asiwc" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Control Language="c#" AutoEventWireup="false" Codebehind="TaskList.ascx.cs" Inherits="Asi.Web.UI.Common.Tasks.TaskList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>

<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" TemplateTitle="Tasks" Collapsible="false">

    <asp:placeholder id="phTaskBar" runat="server"></asp:placeholder>

    <asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

    <div style="clear:both;"></div> 
    <asiweb:Lister2 id="TaskList" 
        runat="server"
        AjaxEnabled="true"
        SortingEnabled="true"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="20"
        ColumnReorderingEnabled="false"
        DataSourceDocumentPath="$/Tasks/DefaultSystem/Queries/TaskList"
        DeleteColumnLocation="None"
        AddButtonLocation="TopRight"
        AddLinkTargetBehavior="NewWindowEachLink"
        AddTargetUrl="~/iMIS/Tasks/Task.aspx?iNewTask=Task"
        TargetUrl="~/iMIS/Tasks/Task.aspx"
        LinkTargetBehavior="NewWindowEachLink"
        EditColumnLocation="None"
        SelectColumnLocation="Beginning"    
        EnableClientSideDelete="false"
        UseUniformKey="true"
        AddButtonText="Add a Task"
        ExportButtonLocation="TopRight"
        LinkTargetHeight="75%"
        LinkTargetWidth="75%"                                                   
        />
     
</asiweb:PanelTemplateControl2>
