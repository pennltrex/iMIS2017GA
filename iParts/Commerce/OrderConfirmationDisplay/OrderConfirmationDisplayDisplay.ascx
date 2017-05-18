<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OrderConfirmationDisplayDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.OrderConfirmationDisplay.OrderConfirmationDisplayDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asp:Panel runat="server" ID="DataPanel" CssClass="StandardPanel" BorderStyle="None">
        <div class="LetterHead Center">
            <asp:Label ID="LetterheadNameLabel" runat="server" CssClass="SectionLabel"/><br />
            <asp:Label ID="LetterheadAddressLabel" runat="server"/>
        </div>
        <div class="FloatRight"><asp:HyperLink runat="server" ID="PrintFriendlyLink" Text='<%# ResourceManager.GetPhrase("Asi.Web.iParts.OrderConfirmationDisplay.PrintFriendlyLink", "Printable version") %>' Visible="false" /></div>
        <br />       
               
        <div class="PanelField Left" runat="server" id="OrderNumberRow">
            <div class="PanelFieldLabel">
                <label ID="OrderNumberLabel" runat="server" translate="yes">Order Number</label>
            </div>
            <div runat="server" class="PanelFieldValue">
                <asiweb:StyledLabel ID="OrderNumberValue" runat="server" PositionCaption="Left" />        
            </div>
        </div>
        <div class="PanelField Left" ID="OrderDateRow" runat="server">
            <div class="PanelFieldLabel">
                <label ID="OrderDateLabel" runat="server" translate="yes">Order Date</label>
            </div>
            <div runat="server" class="PanelFieldValue">
                <asiweb:StyledLabel ID="OrderDateValue" runat="server" PositionCaption="Left" />        
            </div>
        </div>
        <div class="PanelField Left" runat="server" ID="BillToRow">
            <div class="PanelFieldLabel">
                <label ID="BillToLabel" runat="server" translate="yes">Bill To</label>
            </div>
            <div runat="server" class="PanelFieldValue">
                <asiweb:StyledLabel ID="BillToValue" runat="server" PositionCaption="Left" />        
            </div>
        </div>
        <asp:Panel runat="server" ID="PaymentPanel" CssClass="StandardPanel" BorderStyle="None">
            <div class="PanelField Left" ID="PaymentMethodRow" runat="server">
                <div class="PanelFieldLabel">
                    <label ID="PaymentMethodLabel" runat="server" translate="yes">Payment Method</label>
                </div>
                <div runat="server" class="PanelFieldValue">
                    <asiweb:StyledLabel ID="PaymentMethodValue" runat="server" PositionCaption="Left" translate="yes" />        
                </div>
            </div>
            <div class="PanelField Left">
                <div class="PanelFieldLabel" id="CCNameRow" runat="server">
                    <label id="CCNameLabel" runat="server" translate="yes">Name on Card</label>
                </div>
                <div runat="server" class="PanelFieldValue">
                    <asiweb:StyledLabel ID="CCNameValue" runat="server" PositionCaption="Left" />        
                </div>
            </div>
        </asp:Panel>          
        <div class="PanelField Left" id="ShipAddressRow" runat="server">
            <div class="PanelFieldLabel">
                <label id="ShipAddressLabel" runat="server" translate="yes">Ship To</label>
            </div>
            <div runat="server" class="PanelFieldValue">
                <asiweb:StyledLabel ID="ShipAddressValue" runat="server" PositionCaption="Left" />        
            </div>
        </div>
        <div class="PanelField Left" id="ShipMethodRow" runat="server">
            <div class="PanelFieldLabel">
                <label id="ShipMethodLabel" runat="server" translate="yes">Shipping Method</label>
            </div>
            <div runat="server" class="PanelFieldValue">
                <asiweb:StyledLabel ID="ShipMethodValue" runat="server" PositionCaption="Left" translate="yes"/>        
            </div>
        </div>
        <div style="clear: both;">
        </div>
            
        <%-- Following DIV is essential to create a bit of space between the address and the item list --%>
        <div style="clear:both;"></div>
        <asiweb:Lister2 ID="ItemGrid" runat="server" AjaxEnabled="false" SelectColumnLocation="None"
            EditColumnLocation="None" DeleteColumnLocation="None"
            OnNeedDataSource="ItemGrid_OnNeedDataSource"
            TargetPreserveStatefulBusinessContainer="true" SortingEnabled="false" OnItemCreated="ItemGrid_OnItemCreated" BorderStyle="None" BorderWidth="0"
            AllowGridRowSelectStyle="False" />        
        <div class="CartCharges FloatRight" runat="server" Translate="Yes">
			<asiweb:StyledLabel ID="TxtTotalAmount" runat="server" RenderPanelField="true" DisplayCaption="true" Caption="Item Total" PositionCaption="Left" />
			<asiweb:StyledLabel ID="TxtShippingAmount" runat="server" RenderPanelField="true" DisplayCaption="true" Caption="Shipping" PositionCaption="Left" />        
			<asiweb:StyledLabel ID="TxtHandlingAmount" runat="server" RenderPanelField="true" DisplayCaption="true" Caption="Handling" PositionCaption="Left" />       
			<asp:placeholder id="TaxPlaceholder" runat="server" Visible="false" />
			<asiweb:StyledLabel ID="TxtTaxAmountTotal" runat="server" RenderPanelField="true"
				DisplayCaption="true" Caption="Tax" PositionCaption="Left" /> 
			<asiweb:StyledLabel ID="TxtGrandTotalAmount" runat="server" RenderPanelField="true" DisplayCaption="true" Caption="Item Grand Total" PositionCaption="Left" />        
			<asiweb:StyledLabel ID="TxtInvoiceTotal" runat="server" RenderPanelField="true" DisplayCaption="true" Caption="Invoice Total" PositionCaption="Left" />           
			<asiweb:StyledLabel ID="TxtAppliedCredit" runat="server" RenderPanelField="true" DisplayCaption="true" Caption="Applied Credit" PositionCaption="Left" />           
            <asiweb:StyledLabel ID="TxtCreditTotal" runat="server" RenderPanelField="true" DisplayCaption="true" Caption="Credits (available after checkout)" PositionCaption="Left" />       			                   
            <div class="GrandTotal">
				<asiweb:StyledLabel ID="TxtTransTotalAmount" runat="server" RenderPanelField="true" DisplayCaption="true" Caption="Transaction Grand Total" PositionCaption="Left" />
			</div>
            <asiweb:StyledLabel ID="TxtTotalWaitlistedAmount" runat="server" RenderPanelField="False" DisplayCaption="false"  />
            <asiweb:StyledLabel ID="TxtPaymentAmount" runat="server" RenderPanelField="True" DisplayCaption="True" Caption="Payment Amount" PositionCaption="Left"></asiweb:StyledLabel>
        </div>
        <%-- Following DIV is essential to make borders draw properly --%>
        <div style="clear:both;"></div>
    </asp:Panel>
    <hr />
    <div runat="server" id="FinancialEntitySection" style="display:none">
        <br />
        <asiweb:StyledLabel ID="AdditionalInfo" runat="server" HtmlEncode="True"/>
        <br /><br />
        <hr />
    </div>
    <asp:Label runat="server" id="ErrorsLabel" Visible="false" CssClass="Error" Text=""></asp:Label>
    <asp:Panel runat="server" id="EmailConfirmationDiv" class="AlignRight" Translate="Yes" DefaultButton="SendEmailButton">
        <asp:Label runat="server" ID="EmailConfirmationLabel" CssClass="AlignRight" Text=""/>
        <asp:Label runat="server" ID="EmailConfirmationCopyLabel" AssociatedControlID="EmailTextBox" Text='<%# ResourceManager.GetPhrase("Asi.Web.iParts.OrderConfirmationDisplay.EmailConfirmationCopy", "Send another copy to: ") %>'/><asiweb:BusinessTextBox ID="EmailTextBox" runat="server" /> <asiweb:StyledButton runat="server" Text="Send" ID="SendEmailButton" OnClick="SendEmailButtonClick" />
    </asp:Panel>
</asp:Panel>

       
