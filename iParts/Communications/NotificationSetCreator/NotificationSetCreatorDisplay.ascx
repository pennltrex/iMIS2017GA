<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NotificationSetCreatorDisplay.ascx.cs" Inherits="Asi.Web.iParts.Communications.NotificationSetCreator.NotificationSetCreatorDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" SkinID="AjaxLoadingPanel" />  
<telerik:RadAjaxPanel EnableAJAX="true" EnableViewState="true" ID="ListerPanel" 
    LoadingPanelID="RadAjaxLoadingPanel1" runat="server" Visible="true">
               
    <asiweb:Lister2 ID="NotificationSetGrid" 
        AddButtonEnabled="true" 
        AddButtonText="Add alert set"
        AddButtonLocation="TopRight" 
        AddLinkTargetBehavior="NewWindowEachLink" 
        AddTargetUrl="~/iParts/Communications/NotificationSetCreator/NotificationSetCreatorDialog.aspx?iOperation=add" 
        AjaxEnabled="true" 
        CollapsiblePanelTemplate="false" 
        ColumnReorderingEnabled="false" 
        DeleteColumnLocation="End"
        DeleteConfirmText="Delete this alert set?"
        DeleteButtonCssClass="FloatRight"
        DeleteColumnButtonType = "Image"
        DeleteColumnImageUrl="~/AsiCommon/Images/icon_delete.png"
        OnItemDeleted="DeleteNotificationSet"
        DisableQueryEdit="true" 
        EditColumnLocation="None" 
        EnableClientSideDelete="false"         
        LinkTargetBehavior="NewWindowAllShare" 
        OnNeedDataSource="ResultsGridNeedDataSource" 
        PagingEnabled="true" 
        runat="server" 
        SelectColumnLocation="None" 
        SortingEnabled="true" 
        TargetPreserveStatefulBusinessContainer="false"         
        OnItemDataBound="ResultsGridOnItemDataBound"
        DataKeyNames="NotificationSetId"
        DisplayPropertiesList="Name,Description" 
        DisplayPropertiesTitleOverride="Name,Description"
        DialogWindowCallback="CallbackRefresh" />
                    
</telerik:RadAjaxPanel>

<script type="text/javascript">
    function CallbackRefresh() {
        var masterTable = $find('<%# NotificationSetGrid.ClientID %>_Grid1').get_masterTableView();
        if (masterTable != null)
            masterTable.rebind();
    }
</script>