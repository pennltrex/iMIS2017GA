<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InvoiceLinesTemplate.ascx.cs" Inherits="Asi.WebRoot.AsiCommon.Controls.Commerce.Accounting.InvoiceLinesTemplate" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="asiInvoice" TagName="InvoiceLinesView" Src="InvoiceLinesView.ascx" %>

<asi:paneltemplatecontrol2 BorderStyle="None" Collapsible="False" id="InvoiceLinesPanelTemplate" runat="server" translate="yes">                               
    <div style="max-width:1000px;">
        <asiInvoice:InvoiceLinesView id="InvoiceLinesControl" runat="server"/> 
        <div class="FloatRight CartCharges">                       
            <div class="PanelField Left">
	            <asiweb:BusinessLabel runat="server" ID="SubTotalLabel" CssClass="Label"/>
                <div class="PanelFieldValue">
                    <asiweb:BusinessLabel runat="server" ID="SubTotalValue" />
                </div>
	        </div>
            <div class="PanelField Left">
	            <asiweb:BusinessLabel runat="server" ID="FreightTotalLabel" CssClass="Label"/>
                <div class="PanelFieldValue">
                    <asiweb:BusinessLabel runat="server" ID="FreightTotalValue" />
                </div>
	        </div>
            <div class="PanelField Left">
	            <asiweb:BusinessLabel runat="server" ID="HandlingTotalLabel" CssClass="Label"/>
                <div class="PanelFieldValue">
                    <asiweb:BusinessLabel runat="server" ID="HandlingTotalValue" />
                </div>
	        </div>
            <div class="PanelField Left">
	            <asiweb:BusinessLabel runat="server" ID="TaxTotalLabel" CssClass="Label"/>
                <div class="PanelFieldValue">
                    <asiweb:BusinessLabel runat="server" ID="TaxTotalValue" />
                </div>
	        </div>
            <div class="PanelField Left">
	            <asiweb:BusinessLabel runat="server" ID="TotalChargesLabel" CssClass="Label"/>
                <div class="PanelFieldValue">
                    <asiweb:BusinessLabel runat="server" ID="TotalChargesValue" />
                </div>
	        </div>
            <div class="PanelField Left">
	            <asiweb:BusinessLabel runat="server" ID="PaymentsAdjustmentsLabel" CssClass="Label"/>
                <div class="PanelFieldValue">
                    <asiweb:BusinessLabel runat="server" ID="PaymentsAdjustmentsValue" />
                </div>
	        </div>
            <div class="PanelField Left">
	            <asiweb:BusinessLabel runat="server" ID="RemainingBalanceLabel" CssClass="Label"/>
                <div class="PanelFieldValue">
                    <asiweb:BusinessLabel runat="server" ID="RemainingBalanceValue" />
                </div>
	        </div>
        </div>   
    </div>         	
</asi:paneltemplatecontrol2>