<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.TaskList" Codebehind="TaskList.ascx.cs" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<asiweb:Lister2 ID="ListerOppTask" runat="server"
    HeaderVisible="true" Title='<%# Asi.ResourceManager.GetPhrase("TaskViewer","Task Viewer") %>'
    LinkTargetWindowSize="Large" LinkTargetWindowType="Modal" LinkTargetBehavior="NewWindowEachLink"
    DataSourceDocumentPath="$/OpportunityManagement/DefaultSystem/Queries/OpportunityTaskList"
    PagingEnabled="true" PageSize="10"
    
    AddButtonEnabled="true" AddButtonText='<%# Asi.ResourceManager.GetPhrase("AddTask","Add Task") %>'
    SelectColumnLocation="Beginning"
    DeleteColumnLocation="None"
    ExportButtonLocation="None"
    TargetPreserveStatefulBusinessContainer="true"
     />
