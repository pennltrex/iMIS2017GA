<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CartChargesDisplayDisplay.ascx.cs"
    Inherits="Asi.Web.iParts.Commerce.CartChargesDisplay.CartChargesDisplayDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<div runat="server"  Translate="Yes">
    <asp:Panel ID="ContentPanel" runat="server" Visible="true">
        <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay"
            runat="server" />
        <asp:UpdatePanel runat="server" ID="CartChargesUpdatePanel" UpdateMode="Always">
            <ContentTemplate>
                <asp:Panel runat="server" ID="DataPanel" class="StandardPanel CartCharges" BorderStyle="None">
                    <asiweb:StyledLabel ID="TxtTotalAmount" runat="server" RenderPanelField="true"
                        DisplayCaption="true" Caption="Item Total" PositionCaption="Left" />
                    <asiweb:StyledLabel ID="TxtShippingAmount" runat="server" RenderPanelField="true"
                        DisplayCaption="true" Caption="Shipping" PositionCaption="Left" />
                    <asiweb:StyledLabel ID="TxtHandlingAmount" runat="server" RenderPanelField="true"
                        DisplayCaption="true" Caption="Handling" PositionCaption="Left" />
                    <asp:placeholder id="TaxPlaceholder" runat="server" Visible="false" />
                    <asiweb:StyledLabel ID="TxtTaxAmountTotal" runat="server" RenderPanelField="true"
                        DisplayCaption="true" Caption="Tax" PositionCaption="Left" />     
                    <asiweb:StyledLabel ID="TxtItemGrandTotalAmount" runat="server" RenderPanelField="true"
                        DisplayCaption="true" Caption="Item Grand Total" PositionCaption="Left" />
                    <asiweb:StyledLabel ID="TxtInvoiceTotal" runat="server" RenderPanelField="true"
                        DisplayCaption="true" Caption="Invoice Total" PositionCaption="Left" />                
                     <asiweb:StyledLabel ID="TxtPaymentCredit" runat="server" RenderPanelField="true"
                        DisplayCaption="true" Caption="Applied Credit" PositionCaption="Left" />                 
                    <asiweb:StyledLabel ID="TxtCreditTotal" runat="server" RenderPanelField="true"
                        DisplayCaption="true" Caption="Credits (available after checkout)" PositionCaption="Left" />
                    <div class="GrandTotal">
			            <asiweb:StyledLabel ID="TxtTransactionGrandTotal" runat="server" RenderPanelField="true"
				            DisplayCaption="true" Caption="Transaction Grand Total" PositionCaption="Left" />
                    </div>
                    <asiweb:StyledLabel runat="server" ID="TxtWaitlistedAmount" RenderPanelField="False" 
                        DisplayCaption="False"/>

                    <%-- Following DIV is essential to make borders draw properly --%>
                    <div style="clear: both;">
                    </div>
                </asp:Panel>
                <div runat="server" id="DivErrors" visible="false">
                    <asp:Label ID="ErrorLabel" runat="server" CssClass="Error" />
                </div>
                <div style="clear: both;">
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>    
</div>

