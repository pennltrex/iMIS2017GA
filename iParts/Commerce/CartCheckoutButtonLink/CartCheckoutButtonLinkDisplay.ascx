<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CartCheckoutButtonLinkDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.CartCheckoutButtonLink.CartCheckoutButtonLinkDisplay" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
    <ContentTemplate>
        <div class="FloatRight">
            <asiweb:StyledButton runat="server" ID="RedirectToCartButton" CssClass="PrimaryButton" />
        </div>
        <div style="clear:both;"></div>
    </ContentTemplate>
</asp:UpdatePanel>