<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" CodeBehind="BillingIssueNotifications.aspx.cs" Inherits="Asi.WebRoot.iMIS.Setup.Billing.BillingIssueNotifications" %>
<%@ Register TagPrefix="billing" TagName="BillingIssueNotificationDetail" Src="~/imis/Setup/Billing/BillingIssueNotificationDetail.ascx" %>
<%@ Register TagPrefix="billing" TagName="BillingIssueNotificationLogs" Src="~/imis/Setup/Billing/BillingIssueNotificationLogs.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
    <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" TemplateTitle="" DistinguishHeader="False" Collapsible="False" Collapsed="false" BorderStyle="none">
        
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="true" CausesValidation="False">
            <Tabs>
                <telerik:RadTab Text="Issue notifications" PageViewID="BillingIssueNotificationPage" Selected="true"/>
                <telerik:RadTab Text="Logs" PageViewID="BillingIssueNotificationLogsPage" /> 
            </Tabs>
        </telerik:RadTabStrip> 
    
        <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" CssClass="ContentTabbedDisplay" Style="overflow:auto;" >
        
            <telerik:RadPageView runat="server" ID="IssueNotificationPage">
                <asiweb:PanelTemplateControl2 ID="IssueNotificationPanel" runat="server" FieldSet="true" Collapsible="false" BorderStyle="none" ShowTitle="false" ShowHeader="false">
                    <billing:BillingIssueNotificationDetail runat="server" ID="BillingIssueNotificationDetailControl"/>
                </asiweb:PanelTemplateControl2>
            </telerik:RadPageView>
    
            <telerik:RadPageView runat="server" ID="IssueNotificationLogsPage">
                <asiweb:PanelTemplateControl2 ID="IssueNotificationLogsPanel" runat="server" FieldSet="true" Collapsible="false" BorderStyle="none" ShowTitle="false" ShowHeader="false">
                    <billing:BillingIssueNotificationLogs runat="server" ID="BillingIssueNotificationLogControl"/>
                </asiweb:PanelTemplateControl2>
            </telerik:RadPageView>
    
        </telerik:RadMultiPage>
        
    </asiweb:PanelTemplateControl2>
</asp:Content>
