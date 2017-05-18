<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Templates/MasterPages/Empty.master" CodeBehind="InvoiceDetail.aspx.cs" Inherits="Asi.WebRoot.AsiCommon.Controls.Commerce.Accounting.InvoiceDetail" %>
<%@ Register TagPrefix="asiAccounting" TagName="Summary" Src="InvoiceSummary.ascx" %>
<%@ Register TagPrefix="asiAccounting" TagName="BillingShippingTemplate" Src="BillingShippingTemplate.ascx" %>
<%@ Register TagPrefix="asiAccounting" TagName="InvoiceLinesTemplate" Src="InvoiceLinesTemplate.ascx" %>

<asp:Content ID="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">       
    <asiAccounting:Summary id="SummaryControl" runat="server" />
    <asiAccounting:BillingShippingTemplate id="BillingShippingTemplateControl" runat="server" />
    <asiAccounting:InvoiceLinesTemplate id="InvoiceLinesTemplateControl" runat="server" />   
</asp:Content>