<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" CodeBehind="BillingIssueNotificationLogDetail.aspx.cs" Inherits="Asi.WebRoot.iMIS.Setup.Billing.BillingIssueNotificationLogDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
    <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="false">
    
        <div class="FloatLeft" style="padding-top:10px;">
            <asp:Button ID="DownloadNotificationsButton" runat="server" OnClick="DownloadNotificationsButton_OnClick"  
                CssClass="PrimaryButton TextButton"></asp:Button>     
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
             DataKeyNames="BillingLogKey"
             DisplayPropertiesList="SubscriptionOwner, MemberType, BillBeginning, BillThrough, Amount, Balance" 
             DisplayPropertiesTitleOverride="Recipient, Billed On, Due Date, Billing Cycle, Notification Sent"          
             EditColumnLocation="None"             
             EnableClientSideDelete="false" 
             ExportButtonLocation="None" 
             HideResultsOnInitialLoad="Visible"
             ID="BillingIssueNotificationDetailGrid"
             OnNeedDataSource="BillingIssueNotificationDetailOnNeedDataSource" 
             OnItemDataBound="BillingIssueNotificationDetailOnItemDataBound"
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
