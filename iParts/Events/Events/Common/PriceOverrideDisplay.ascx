<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PriceOverrideDisplay.ascx.cs" Inherits="Asi.Web.iParts.Events.Common.PriceOverrideDisplay" %>
<%@ Import Namespace="Asi" %>

<span id="Price">
    <asiweb:CurrencyBox ID="OverridePrice" CausesValidation="true" AutoPostBack="false" runat="server" CssClass="DisplayCurrency InputSmall" />
</span>
<span id="Update">
    <asiweb:StyledButton ID="UpdatePriceOverride" runat="server" CssClass="SecondaryButton SmallButton"
        Style="display:none" Text="Update" CausesValidation="true" UseSubmitBehavior="false" ValidationGroup="PriceOverride" />
</span>
<span runat="Server" id="SpanGstInc" style="color:red;">&nbsp;Excludes GST</span>
<div id="Revert" style="clear:both;">
    <asp:LinkButton ID="RevertPrice" runat="server" Text="Revert to original price" Visible="False" OnClick="RevertPrice_OnClick"></asp:LinkButton>
</div>
<div id="validator">
    <asp:RangeValidator ID="OverridePricingValidator" ControlToValidate="OverridePrice" runat="server" Text="" Display="Dynamic"
        Type="Currency" MinimumValue="0" MaximumValue="1000000" EnableClientScript="True" CssClass="Error"
        ErrorMessage='<%# ResourceManager.GetPhrase("PriceOutOfRange", "Must be a valid currency amount.")%>'
        ValidationGroup="PriceOverride" />        
    <div style="clear:both;"></div>
    <asp:RequiredFieldValidator ControlToValidate="OverridePrice" ValidationGroup="PriceOverride" CssClass="Error"
        ErrorMessage='<%# ResourceManager.GetPhrase("PriceOutOfRange", "Valid currency amount required.")%>' runat="server" />        
</div>    
<div style="display:none;">
    <asp:HiddenField ID="OriginalPrice" runat="server" />
</div>