<%@ Page Language="C#" Title="Generate renewals" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" CodeBehind="BillGeneration.aspx.cs" Inherits="Asi.WebRoot.iMIS.Setup.Billing.BillGeneration" %>
<%@ Register TagPrefix="billing" TagName="BillGenerationBillingRunDetail" Src="~/imis/Setup/Billing/BillGenerationBillingRunDetail.ascx" %>
<%@ Register TagPrefix="billing" TagName="BillGenerationBillingBatchDetail" Src="~/imis/Setup/Billing/BillGenerationBillingBatchDetail.ascx" %>
<%@ Register TagPrefix="billing" TagName="BillGenerationBillingLogsDetail" Src="~/imis/Setup/Billing/BillGenerationBillingLogsDetail.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
    <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" TemplateTitle="" DistinguishHeader="False" Collapsible="False" Collapsed="false" BorderStyle="none">
        
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="true" CausesValidation="False">
            <Tabs>
                <telerik:RadTab Text="Run billing" PageViewID="BillingRunPage" Selected="true"/>
                <telerik:RadTab Text="Billing batches" PageViewID="BillingBatchesPage" />
                <telerik:RadTab Text="Logs" PageViewID="BillingLogsPage" /> 
            </Tabs>
        </telerik:RadTabStrip> 
    
        <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" CssClass="ContentTabbedDisplay" Style="overflow:auto;" >
        
            <telerik:RadPageView runat="server" ID="BillingRunPage">
                <asiweb:PanelTemplateControl2 ID="BillingRunPanel" runat="server" FieldSet="true" Collapsible="false" BorderStyle="none" ShowTitle="false" ShowHeader="false">
                    <billing:BillGenerationBillingRunDetail runat="server" ID="BillingRunControl"/>
                </asiweb:PanelTemplateControl2>
            </telerik:RadPageView>
    
            <telerik:RadPageView runat="server" ID="BillingBatchesPage">
                <asiweb:PanelTemplateControl2 ID="BillingBatchesPanel" runat="server" FieldSet="true" Collapsible="false" BorderStyle="none" ShowTitle="false" ShowHeader="false">
                    <billing:BillGenerationBillingBatchDetail runat="server" ID="BillingBatchControl"/>
                </asiweb:PanelTemplateControl2>
            </telerik:RadPageView>
    
            <telerik:RadPageView runat="server" ID="BillingLogsPage">
                <asiweb:PanelTemplateControl2 ID="BillingLogsPanel" runat="server" FieldSet="true" Collapsible="false" BorderStyle="none" ShowTitle="false" ShowHeader="false">
                    <billing:BillGenerationBillingLogsDetail runat="server" ID="BillingLogControl"/>
                </asiweb:PanelTemplateControl2>
            </telerik:RadPageView>
    
        </telerik:RadMultiPage>
        
    </asiweb:PanelTemplateControl2>
</asp:Content>