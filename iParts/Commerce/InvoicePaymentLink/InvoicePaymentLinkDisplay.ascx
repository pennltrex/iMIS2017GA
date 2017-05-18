<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InvoicePaymentLinkDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.InvoicePaymentLink.InvoicePaymentLinkDisplay" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<div runat="server" ID="MainContentWrapper" translate="yes">
    <asp:Panel ID="ContentPanel" runat="server">
        <asiweb:StyledLabel ID="InvoiceMessage" runat="server" CssClass="Description" Text="<%#InvoiceLegend%>" />
        <asiweb:StyledLabel ID="JoinNowButtonMessage" runat="server" CssClass="Description" Text="<%#JoinButtonMessage%>" Visible="false" />
        <asiweb:StyledLabel ID="RenewInAdvanceButtonMessage" runat="server" CssClass="Description" Text="<%#EnableRenewInAdvanceMessageText%>" Visible="false" />
        <asiweb:StyledLabel ID="AutoPayInvoiceMessage" runat="server" CssClass="Description" Text="<%#AutoPayInvoiceLegend%>" Visible="false" /> 
        <asiweb:StyledLabel ID="NoOpenInvoiceMessage" runat="server" CssClass="Description" Text="<%#NoOpenInvoice%>" Visible="false" />    
        <div runat="server" id="divSpacer" style="clear:both;padding:0.2em" Visible="false"></div>
        <asiweb:StyledButton ID="PayInvoiceButton" runat="server" OnClick="PayInvoiceButtonOnClick" Text="<%#LinkText%>" CssClass="LargeButton PrimaryButton"  /> 
        <asiweb:StyledButton ID="JoinNowButton" runat="server" OnClick="JoinNowButton_OnClick" Text="<%#JoinButtonText%>" CssClass="LargeButton PrimaryButton"  />
        <asiweb:StyledButton ID="RenewInAdvanceButton" runat="server" OnClick="RenewInAdvanceButton_OnClick" Text="<%#EnableRenewInAdvanceButtonText%>" CssClass="LargeButton PrimaryButton"  />
        <br/>
        <asiweb:StyledButton ID="CancelInvoiceButton" runat="server" OnClick="CancelInvoiceButtonOnClick" Text="<%#CancelLinkText%>" Visible="false"
            style="margin-top:1em" /> 
        <div style="clear:both;"></div>
    </asp:Panel>
</div>
