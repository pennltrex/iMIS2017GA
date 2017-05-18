<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProratingScheduleCreatorDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.ProratingScheduleCreator.ProratingScheduleCreatorDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" SkinID="AjaxLoadingPanel" />  
<telerik:RadAjaxPanel EnableAJAX="true" EnableViewState="true" ID="ListerPanel" 
    LoadingPanelID="RadAjaxLoadingPanel1" runat="server" Visible="true">
               
    <asiweb:Lister2 ID="ScheduleGrid" 
        AddButtonEnabled="true" 
        AddButtonText="Add schedule"
        AddButtonLocation="TopRight" 
        AddLinkTargetBehavior="SameWindow" 
        AddTargetUrl="~/iParts/Commerce/ProratingScheduleCreator/ProratingScheduleCreatorDialog.aspx" 
        AjaxEnabled="true" 
        CollapsiblePanelTemplate="false" 
        ColumnReorderingEnabled="false" 
        DeleteColumnLocation="End"
        DeleteConfirmText="Delete this schedule?"
        DeleteButtonCssClass="FloatRight"
        DeleteColumnButtonType = "Image"
        DeleteColumnImageUrl="~/AsiCommon/Images/icon_delete.png"
        OnItemDeleted="DeleteSchedule"
        DisableQueryEdit="true" 
        EditColumnLocation="None" 
        EnableClientSideDelete="false"         
        LinkTargetBehavior="SameWindow"
        OnNeedDataSource="ResultsGridNeedDataSource" 
        PagingEnabled="true" 
        runat="server" 
        SelectColumnLocation="None" 
        SortingEnabled="true" 
        TargetPreserveStatefulBusinessContainer="false"         
        OnItemDataBound="ResultsGridOnItemDataBound"
        DataKeyNames="ProrateScheduleId"
        DisplayPropertiesList="Name,Description" 
        DisplayPropertiesTitleOverride="Name,Description" />
                    
</telerik:RadAjaxPanel>