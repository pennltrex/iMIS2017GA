<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.AllOppTaskList" Codebehind="AllOppTaskList.ascx.cs" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

<asiweb:Lister2 ID="ListerAllOppTask" runat="server"
    LinkTargetWindowSize="Large" LinkTargetWindowType="Modal" LinkTargetBehavior="NewWindowEachLink"
    TargetUrl='~/AsiNavigator.aspx?iNavMarker=Utility.Task'
    DataSourceDocumentPath="$/OpportunityManagement/DefaultSystem/Queries/AllOppTaskList"
    PagingEnabled="true" PageSize="10"
    
    AddButtonEnabled="true" AddButtonText='<%# Asi.ResourceManager.GetPhrase("AddTask","Add Task") %>'
    SelectColumnLocation="Beginning"
    DeleteColumnLocation="None"
    ExportButtonLocation="None"
    
    AllowNaturalSort="false" 
    DialogWindowCallback="RefreshTasks"/>
<script type="text/javascript">
    function RefreshTasks() {
        window.location.href = window.location.href;
    }
</script>
