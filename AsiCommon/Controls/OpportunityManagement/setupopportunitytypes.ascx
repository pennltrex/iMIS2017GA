<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.SetupOpportunityTypes" Codebehind="SetupOpportunityTypes.ascx.cs" %>

<asiweb:Lister2 ID="TypeList" runat="server" GroupingEnabled="false" ColumnReorderingEnabled="false" Width="400px" AjaxEnabled="true"
    SelectColumnLocation="Beginning"
    DeleteColumnLocation="End"
    AddButtonLocation="TopRight"
    AddButtonText="Create Process Type" ExportButtonLocation="None"
    DataSourceDocumentPath="$/OpportunityManagement/DefaultSystem/Queries/OpportunityTypeList"
    LinkTargetBehavior="NewWindowAllShare" LinkTargetHeight="650" LinkTargetWidth="900"
    TargetUrl="~/iMIS/OpportunityManagement/SetupOpportunityTypeEditor.aspx"
    AddTargetUrl="~/iMIS/OpportunityManagement/SetupOpportunityTypeEditor.aspx"
    OnItemDeleted="TypeList_ItemDeleted" EnableClientSideDelete="false"
    MinimumQueryRepeatTime="400"
    AllowNaturalSort="false" 
   DialogWindowCallback="RefreshTypes"/>
<script type="text/javascript">
    function RefreshTypes() {
        var masterTable = $find('<%# TypeList.ClientID %>_Grid1').get_masterTableView();
        if (masterTable != null)
            masterTable.rebind();
    }
</script>