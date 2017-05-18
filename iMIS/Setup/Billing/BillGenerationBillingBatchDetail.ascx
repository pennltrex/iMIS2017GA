<%@ Control Language="C#" Title="Billing batches" AutoEventWireup="true" CodeBehind="BillGenerationBillingBatchDetail.ascx.cs" Inherits="Asi.WebRoot.iMIS.Setup.Billing.BillGenerationBillingBatchDetail" %>

<asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="false">
    <div class="PanelField">
        <asiweb:StyledLabel runat="server" ID="BillBatchMessage" CssClass="Info" /> 
    </div>        
    <asiweb:Lister2
         AddButtonLocation="None" 
         AjaxEnabled="true" 
         AllowGridRowSelectStyle="false" 
         AllowRowSelecting="false" 
         CollapsiblePanelTemplate="false" 
         ColumnReorderingEnabled="false" 
         DataSourceSelectHidden="false" 
         DisableQueryEdit="true"
         DataKeyNames="BatchId"
         DisplayPropertiesList="BatchNumber, Description, BatchDate, TransactionCount, ActualAmount, BatchStatus" 
         DisplayPropertiesTitleOverride="Batch Number, Description, Batch Date, Transactions, Amount, Status"          
         EditColumnLocation="None"             
         EnableClientSideDelete="false" 
         ExportButtonLocation="None" 
         HideResultsOnInitialLoad="Visible"
         ID="BillBatchGrid" 
         OnNeedDataSource="BillBatchOnNeedDataSource" 
         OnItemDataBound="BillBatchOnItemDataBound"
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



