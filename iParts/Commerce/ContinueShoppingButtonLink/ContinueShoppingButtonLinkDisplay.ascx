<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContinueShoppingButtonLinkDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.ContinueShoppingButtonLink.ContinueShoppingButtonLinkDisplay" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <div style="text-align: right;">
      <asp:Label runat="server" ID="ErrorsLabel" CssClass="Error" Visible="false"></asp:Label> <asiweb:StyledButton runat="server" ID="ContinueShoppingButton" Text="Continue Shopping" OnClick="ContinueShoppingButton_Click" CausesValidation="false" />
    </div>
</asp:Panel>
