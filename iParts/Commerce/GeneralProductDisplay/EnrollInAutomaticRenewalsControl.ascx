<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EnrollInAutomaticRenewalsControl.ascx.cs" Inherits="Asi.Web.iParts.Commerce.GeneralProductDisplay.EnrollInAutomaticRenewalsControl" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<div runat="server" id="EnrollInAutomaticRenewals" visible="true">
    <asiweb:PanelTemplateControl runat="server" ShowBorder="true" translate="no" ShowHeader="false">
        <asiweb:StyledLabel runat="server" ID="AutomaticRenewalsMessage">
            <span id="AutomaticRenewalsTopText" runat="server">
            <strong>Enroll in automatic renewals?</strong>
            <p>
            When you choose to automatically renew, we will continue to notify you when your membership is about to expire and a new year billing is available but your payment will automatically be drafted on the due date using the account you specified.
            </p>
            <p>
            Automatic renewal saves you time and ensures that your membership will never lapse.
            </p>
            </span>
            <asp:CheckBox runat="server" id="AutoRenew"/><asiweb:StyledLabel runat="server" ID="AutomaticRenewalsLabel" AssociatedControlID="AutoRenew"><strong>&nbsp;Yes.</strong> I would like to have my membership automatically renew each year.</asiweb:StyledLabel>           
            <span id="AutomaticRenewalsBottomText" runat="server">
            <p>
            I understand that the payment method I specify when I check out will also be used as the payment method for future membership renewals. If I decide to cancel my automatic renewal, I will notify iMIS International at least 14 days prior to the due date of my next renewal payment.
            </p></span>
        </asiweb:StyledLabel>  
    </asiweb:PanelTemplateControl>
    <br/>
</div>