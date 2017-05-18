<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductDisplayDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.GeneralProductDisplay.ProductDisplayDisplay" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="uc1" TagName="enrollinautomaticrenewalscontrol" Src="~/iParts/Commerce/GeneralProductDisplay/EnrollInAutomaticRenewalsControl.ascx" %>
<%@ Import Namespace="Asi" %>
<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" translate="yes" />

    <asp:Panel ID="DataPanel" runat="server" Visible="false">

        <div id="ProductDisplay" class="ProductDisplay">

            <div id="ItemAdded" Visible="False" runat="server" class="AsiSuccess AsiSuccessIcon" translate="yes">
                <asiweb:StyledLabel ID="ItemAddedMessageLabel" runat="server" />&nbsp;                        
                <asiweb:BusinessHyperLink ID="CartLink" runat="server" />
            </div>
            
            <asiweb:StyledLabel ID="ProductTitle" runat="server" CssClass="PanelTitle ProductTitle" />
            <div id="ProductImageArea" runat="server" class="ProductImageArea">
                <asp:Image CssClass="ProductImage" ID="ProductImage" runat="server" />
            </div>
                
            <div class="ProductDetails">
            
                <asiweb:StyledLabel ID="ProductDescription" runat="server" />
                <asiweb:StyledLabel ID="InventoryLabel" translate="yes" runat="server" CssClass="Error" />
                
                <div id="divPricing" runat="server" class="PricingSection" translate="yes">
                    
                    <div id="StandardPricing" runat="server">
                        <asiweb:StyledLabel runat="server" ID="StandardPriceLabelControl" CssClass="ProductLabel" />
                        <asiweb:StyledLabel runat="server" ID="StandardPrice" />
                    </div>
                    
                    <div id="DiscountPricing" runat="server">
                        <asiweb:StyledLabel runat="server" ID="DiscountPriceLabelControl" CssClass="ProductLabel" />
                        <asiweb:StyledLabel runat="server" ID="DiscountPrice" />
                    </div>
                    <div id="CustomerPricing" runat="server">
                        <asiweb:StyledLabel runat="server" ID="CustomerPriceLabelControl" CssClass="Significant ProductLabel" AssociatedControlID="OverridePricing"   />
                        <asiweb:StyledLabel runat="server" ID="CustomerPrice" CssClass="Significant CustomerPrice" />
                        <asiweb:BusinessTextBox ID="OverridePricing" AutoPostBack="false" runat="server" ClientIDMode="Static" onkeypress="return event.keyCode != 13;" onchange="javascript:DisplayRevertPrice()" Visible="false" MaxLength="10" CssClass="AlignRight InputSmall" />
                        <asp:HiddenField ID="OriginalPrice" ClientIDMode="Static" runat="server" />
                        <asp:RangeValidator ID="OverridePricingRangeValidator" ValidateRequestMode="Enabled" ControlToValidate="OverridePricing" runat="server" Visible="false" ValidationGroup='<%# UniqueID %>'
                                                Display="Dynamic" CssClass="Important" />
                        <asp:RequiredFieldValidator runat="server" ID="OverridePricingRequiredFieldValidator" ControlToValidate="OverridePricing" Visible="False" Display="Dynamic" CssClass="Important"  ValidationGroup='<%# UniqueID %>' />
                        <asp:LinkButton ID="RevertPrice" runat="server" ClientIDMode="Static" Text="Revert to original price" Visible="False" OnClick="RevertPrice_OnClick"></asp:LinkButton>
                    </div>
                    
                    <div id="Savings" runat="server">
                        <asiweb:StyledLabel runat="server" ID="SavingsLabelControl" CssClass="ProductLabel" />
                        <asiweb:StyledLabel runat="server" ID="SavingsAmount" />
                    </div>
                    
                </div>
                <div runat="server" id="AddToCartSection" class="AddToCartSection" translate="yes">
                    <asiweb:StyledLabel ID="QuantityLabel" runat="server" Text='<%# ResourceManager.GetWord("Quantity:") %>' CssClass="ProductLabel" AssociatedControlID="QuantityTextBox" />
                    <asiweb:BusinessTextBox runat="server" ID="QuantityTextBox" CssClass="AlignRight InputSmall Quantity" Text="1" RenderPanelField="false" MaxLength="5" />
                    <asiweb:StyledButton ID="AddToCart" runat="server" Text="Add to Cart" OnClick="AddToCartClick" ValidationGroup='<%# UniqueID %>' CssClass="PrimaryButton AddToCartButton" />
                    <asiweb:AsiRequiredFieldValidator ID="QuantityRequiredFieldValidator" runat="server" ControlToValidate="QuantityTextBox"
                        Display="Dynamic" ErrorMessage='<%# ResourceManager.GetPhrase("Asi.Web.iParts.Commerce.ProductDisplay.QuantityRequired", "Quantity is required.") %>'
                        ValidationGroup='<%# UniqueID %>' translate="yes" />
                    <asp:RangeValidator ID="QuantityRangeValidator" runat="server" MinimumValue="0" MaximumValue="100000" Type="Integer" Display="Dynamic"
                        ControlToValidate="QuantityTextBox" ValidationGroup='<%# UniqueID %>'
                        ErrorMessage='<%# ResourceManager.GetPhrase("Asi.Web.iParts.Commerce.ProductDisplay.QuantityInteger", "Quantity must be a positive whole number.")  %>' />
                </div>
                <div runat="server" id="DetailsSection" class="AddToCartSection" translate="yes">
                    <asiweb:StyledLabel ID="DetailsLabel" Text="Details:" CssClass="ProductLabel" AssociatedControlID="DetailsTextBox" runat="server"></asiweb:StyledLabel>
                    <asiweb:BusinessTextBox runat="server" ID="DetailsTextBox" CssClass="InputXLarge" TextMode="MultiLine" Rows="3" RenderPanelField="false"/>
                </div>
            </div>

        </div>
        <uc1:enrollinautomaticrenewalscontrol runat="server" id="EnrollInAutomaticRenewalsCtrl" />

    </asp:Panel>
    <asp:Button CausesValidation="false" ID="RefreshButton" OnClick="RefreshButtonClick" runat="server" Style="display:none;" Text="WCAG Compliant" />
</asp:Panel>