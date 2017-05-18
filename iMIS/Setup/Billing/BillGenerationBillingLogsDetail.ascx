<%@ Control Language="C#" Title="Billing logs" AutoEventWireup="true" CodeBehind="BillGenerationBillingLogsDetail.ascx.cs" Inherits="Asi.WebRoot.iMIS.Setup.Billing.BillGenerationBillingLogsDetail" %>

<asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="false">

    <asiweb:Lister2
         AddButtonLocation="None" 
         AjaxEnabled="true" 
         AllowGridRowSelectStyle="false" 
         AllowRowSelecting="false" 
         CollapsiblePanelTemplate="false" 
         ColumnReorderingEnabled="false" 
         DataSourceSelectHidden="false"                
         DisableQueryEdit="true"
         DataKeyNames="BillingLogKey"
         DisplayPropertiesList="Process,BillingCycleId,BillingDate,NumberOfBills,Amount, Status" 
         DisplayPropertiesTitleOverride="Process,Billing Cycle,Date,Number Of Bills,Amount,Status"          
         EditColumnLocation="None"             
         EnableClientSideDelete="false" 
         ExportButtonLocation="None" 
         HideResultsOnInitialLoad="Visible"
         ID="BillLogsGrid"
         OnNeedDataSource="BillLogsOnNeedDataSource" 
         OnItemDataBound="BillLogsOnItemDataBound"
         PagerMode="NextPrevAndNumeric" 
         PagingEnabled="true"
         PageSize="20" 
         RefreshButtonLocation="None" 
         runat="server" 
         SelectColumnLocation="None"
         SortingEnabled="true"
         TargetCloseWindowOnCommit="false"
         TargetPreserveStatefulBusinessContainer="false"   
         Visible="true"
    />               

</asiweb:PanelTemplateControl2>
