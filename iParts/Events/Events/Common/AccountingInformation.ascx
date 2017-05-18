<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AccountingInformation.ascx.cs" Inherits="Asi.Web.iParts.Events.Common.AccountingInformation" %>
<%@ Register TagPrefix="asiEvent" TagName="GeneralLedger" Src="GeneralLedgerAccountDisplay.ascx" %>
<%@ Register TagPrefix="asi" TagName="ItemCreatorTaxInfo" Src="~/iParts/Commerce/ItemCreator/ItemCreatorTaxInfo.ascx" %>
<%@ Import Namespace="Asi" %>
<asp:Panel ID="AccountTemplate" runat="server">   
    <asiweb:BusinessLabel ID="Instructions" runat="server"></asiweb:BusinessLabel>
    <div style="clear: both;"></div>
    
    <div class="PanelField Left" id="DivFinancialEntity" runat="server" Visible="False">
	    <asiweb:StyledLabel AssociatedControlID="FinancialEntitySelect" ID="FinancialEntityLabel" runat="server" Text="Financial entity" />
	    <div class="PanelFieldValue">
            <asiweb:BusinessDropDownList id="FinancialEntitySelect" runat="server" />        
	    </div>
    </div>    

    <asi:ItemCreatorTaxInfo ID="TaxInfo" IsEvent="true" runat="Server" />
           
    <asp:Panel ID="FMVTemplate" runat="server">
        <div class="PanelField Left">
            <div class="PanelFieldLabel">
                <asiweb:StyledLabel ID="FairMarketValueLabel" runat="server" Text='<%# ResourceManager.GetPhrase("FairMarketValue", "Fair market value") %>' AssociatedControlID="FairMarketValueTextBox" ></asiweb:StyledLabel>
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox ID="FairMarketValueTextBox" runat="server" AutoPostBack="False" CssClass="InputSmall" />
                <asp:RangeValidator runat="server" ID="FairMarketValueRangeValidator" Type="Currency" ControlToValidate="FairMarketValueTextBox"
                                Display="Dynamic" MinimumValue="0" MaximumValue="1000000"
                                CssClass="Important" ErrorMessage='<%# ResourceManager.GetPhrase("PriceOutOfRange", "Must be a currency amount between 0 and 1000000.")%>' />
            </div>
            <div style="clear: both;"></div> 
        </div>
    </asp:Panel>

    <asiEvent:GeneralLedger ID="AccountsReceivable" runat="Server" AccountType="AccountsReceivable"/>
    <asiEvent:GeneralLedger ID="Income" runat="Server" AccountType="Income"/>    
    <asiEvent:GeneralLedger ID="DeferredIncome" runat="Server" AccountType="DeferredIncome"/>   
</asp:Panel>