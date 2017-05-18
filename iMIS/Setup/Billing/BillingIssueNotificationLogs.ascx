
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BillingIssueNotificationLogs.ascx.cs" Inherits="Asi.WebRoot.iMIS.Setup.Billing.BillingIssueNotificationLogs" %>

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
         DisplayPropertiesList="BillingCycleId, BillingDate, NumberOfBills, Amount, Status" 
         DisplayPropertiesTitleOverride="Billing Cycle, Date Created, Communication Type, Number of Notifications, Status"          
         EditColumnLocation="None"             
         EnableClientSideDelete="false" 
         ExportButtonLocation="None" 
         HideResultsOnInitialLoad="Visible"
         ID="BillingIssueNotificationLogsGrid"
         OnNeedDataSource="BillingIssueNotificationsLogsOnNeedDataSource" 
         OnItemDataBound="BillingIssueNotificationsLogsOnItemDataBound"
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