<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductDisplayDisplay.ascx.cs"
    Inherits="Asi.Web.iParts.Commerce.ProductDisplay.ProductDisplayDisplay" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay"
        runat="server" />
    <asiweb:StyledLabel runat="server" ID="TopMessage" Visible="false" Text=""></asiweb:StyledLabel>
    <asp:Panel ID="DataPanel" runat="server" Visible="false">
        <asp:Table ID="ProductTable" runat="server" Width="100%" style="border:0;margin:0;padding:0;">
            <asp:TableRow ID="TableRow1" runat="server">
                <asp:TableCell ID="ThumbnailCell" runat="server" Style="padding-top:0.5em;padding-left:0.5em;border:0;margin:0;" >
                    <asp:Image ID="ThumbnailImage" runat="server" AlternateText="Picture of the product"
                        ToolTip="Picture of the product" />
                </asp:TableCell>
                <asp:TableCell ID="DetailsCell" runat="server" Style="border:0;margin:0;padding-top:0.5em;padding-left:0.5em;">
                    <asiweb:StyledLabel ID="ProductTitle" runat="server" Style="font-weight:bold;"></asiweb:StyledLabel><br />
                    <asiweb:StyledLabel ID="ProductDescription" runat="server"></asiweb:StyledLabel><br />
                    <br />
                    <div style="text-align:right;float:left;">
                        <asiweb:StyledLabel ID="Pricing" runat="server"></asiweb:StyledLabel>
                    </div>                    
                    <div runat="server" id="AddToCartDiv" style="text-align:right;float:right;">
                        <asiweb:StyledLabel runat="server" text="Quantity" translate="yes"></asiweb:StyledLabel>&nbsp;
                        <asiweb:BusinessTextBox runat="server" ID="QuantityTextBox" CssClass="AlignRight Quantity" style="width: 6.7em;" Text="1" RenderPanelField="false" MaxLength="5" ValidationGroup="<%# AddToCart.ClientID %>" />
                        &nbsp;
                        <asiweb:StyledButton ID="AddToCart" runat="server" Text="Add to Cart" OnClick="AddToCartClick" ValidationGroup="<%# AddToCart.ClientID %>"/>
                        <br />
                        <asp:CompareValidator ID="InventoryValidator" runat="server" Type="Double" ControlToValidate="QuantityTextBox" 
                            Operator="LessThanEqual" Display="Dynamic" ValidationGroup="<%# AddToCart.ClientID %>"/>
                        <asp:RangeValidator ID="QuantityRangeValidator" runat="server" MinimumValue="0" MaximumValue="100000" Type="Integer" Display="Dynamic"
                        ControlToValidate="QuantityTextBox" ValidationGroup='<%# AddToCart.ClientID %>'
                        ErrorMessage='Quantity must be a positive whole number'/>
                        <br />
                        <asiweb:StyledLabel ID="ItemAddedMessageLabel" Visible="false" runat="server"></asiweb:StyledLabel>
                        &nbsp;<asiweb:BusinessHyperLink ID="CartLink" runat="server"></asiweb:BusinessHyperLink>
                    </div>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </asp:Panel>
</asp:Panel>
