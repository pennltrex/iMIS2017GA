<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.SetupActionPlans" Codebehind="SetupActionPlans.ascx.cs" %>
	
<asiweb:Lister2 ID="ActionPlans" runat="server" GroupingEnabled="false" ColumnReorderingEnabled="false" AjaxEnabled="true"
    EnableClientSideDelete="false"
    SelectColumnLocation="Beginning" DeleteColumnLocation="End" AddButtonLocation="TopRight"
    AddButtonText="Create Action Plan" ExportButtonLocation="None"
    DataSourceDocumentPath="$/OpportunityManagement/DefaultSystem/Queries/ActionPlanList"
    LinkTargetBehavior="NewWindowAllShare" LinkTargetHeight="95%" LinkTargetWidth="95%"
    TargetUrl="~/iMIS/OpportunityManagement/SetupActionPlanEditor.aspx"
    OnItemDeleted="ActionPlans_ItemDeleted" 
    OnPreRender="ActionPlans_PreRender"
    AllowNaturalSort="false"
    MinimumQueryRepeatTime="400"
    Width="400px"
   DialogWindowCallback="RefreshActionPlans"/>
<script type="text/javascript">
    function RefreshActionPlans() {
        var masterTable = $find('<%# ActionPlans.ClientID %>_Grid1').get_masterTableView();
        if (masterTable != null)
            masterTable.rebind();
    }
</script>