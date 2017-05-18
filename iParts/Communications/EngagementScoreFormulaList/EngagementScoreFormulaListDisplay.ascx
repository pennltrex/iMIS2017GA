<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EngagementScoreFormulaListDisplay.ascx.cs" Inherits="Asi.Web.iParts.Communications.EngagementScoreFormulaList.EngagementScoreFormulaListDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" SkinID="AjaxLoadingPanel" />  
<telerik:RadAjaxPanel EnableAJAX="true" EnableViewState="true" ID="ListerPanel" 
    LoadingPanelID="RadAjaxLoadingPanel1" runat="server" Visible="true">
               
    <asiweb:Lister2 ID="EngagementScoreGrid" 
        AddButtonEnabled="true" 
        AddButtonText=<%# GetTranslatedPhrase(ResourceManager.GetPhrase("AddNewformula","Add new formula")) %>
        AddButtonType="Link"
        AddButtonLocation="TopRight" 
        AddLinkTargetBehavior="SameWindow" 
        AddTargetUrl="~/iParts/Communications/EngagementScoreFormulaList/EngagementScoreFormulaCreator.aspx?iOperation=add" 
        AjaxEnabled="true" 
        CollapsiblePanelTemplate="false" 
        ColumnReorderingEnabled="false" 
        DeleteColumnLocation="End"
        DeleteConfirmText="Delete this formula?"
        DeleteButtonCssClass="FloatRight"
        DeleteColumnButtonType = "Image"
        DeleteColumnImageUrl="~/AsiCommon/Images/icon_delete.png"
        OnItemDeleted="DeleteEngagementScore"
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
        OnItemCreated="ResultsGridItemCreated"
        DataKeyNames="EngagementScoreId"
        DisplayPropertiesList="Name,Description,IsEnabled" 
        DisplayPropertiesTitleOverride="Score Name,Description,Enabled"
        DialogWindowCallback="CallbackRefresh" 
        />
                    
</telerik:RadAjaxPanel>

<script type="text/javascript">
    function CallbackRefresh() {
        var masterTable = $find('<%# EngagementScoreGrid.ClientID %>_Grid1').get_masterTableView();
        if (masterTable != null)
            masterTable.rebind();
    }
</script>