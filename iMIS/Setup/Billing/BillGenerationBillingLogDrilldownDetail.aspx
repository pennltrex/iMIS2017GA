<%@ Page Language="C#" Title="Billing logs" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" CodeBehind="BillGenerationBillingLogDrilldownDetail.aspx.cs" Inherits="Asi.WebRoot.iMIS.Setup.Billing.BillGenerationBillingLogDrilldownDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
    <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="false">
    
        <asiweb:Lister2
             AddButtonLocation="None" 
             AjaxEnabled="true" 
             AllowGridRowSelectStyle="false" 
             AllowRowSelecting="false" 
             CollapsiblePanelTemplate="false" 
             ColumnReorderingEnabled="false" 
             DataSourceDocumentPath="$/Common/Queries/Billing/BillingLogByParty"
             DataSourceSelectHidden="false"                
             DisableQueryEdit="true"    
             EditColumnLocation="None"             
             EnableClientSideDelete="false" 
             ExportButtonLocation="None" 
             HideResultsOnInitialLoad="Visible"
             ID="BillLogsGrid"
             OnItemDataBound="BillLogDrillDownOnItemDataBound"
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
</asp:Content>