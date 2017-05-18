<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InvoiceSummary.ascx.cs" Inherits="Asi.WebRoot.AsiCommon.Controls.Commerce.Accounting.InvoiceSummary" %>

<asiweb:paneltemplatecontrol2 id="InvoiceTemplate" runat="server" TemplateTitle="Invoice" Collapsible="False" BorderStyle="None" FieldSet="false">    

	<asiweb:PanelTemplateColumn ID="InvoiceData1" runat="server" Width="40%" translate="yes">
	    <div class="PanelField Left">
	        <asiweb:BusinessLabel runat="server" ID="InvoiceNumberLabel" CssClass="Label"/>
            <div class="PanelFieldValue">
                <asiweb:BusinessLabel runat="server" ID="InvoiceNumberValue" />
            </div>
	    </div>
        <div class="PanelField Left">
	        <asiweb:BusinessLabel runat="server" ID="InvoiceDateLabel" CssClass="Label"/>
            <div class="PanelFieldValue">
                <asiweb:BusinessLabel runat="server" ID="InvoiceDateValue" />
            </div>
	    </div>
        <div class="PanelField Left">
	        <asiweb:BusinessLabel runat="server" ID="InvoiceTypeLabel" CssClass="Label"/>
            <div class="PanelFieldValue">
                <asiweb:BusinessLabel runat="server" ID="InvoiceTypeValue" />
            </div>
	    </div> 
        <div class="PanelField Left">
	        <asiweb:BusinessLabel runat="server" ID="SourceSystemLabel" CssClass="Label"/>
            <div class="PanelFieldValue">
                <asiweb:BusinessLabel runat="server" ID="SourceSystemValue" />
            </div>
	    </div>                   
    </asiweb:PanelTemplateColumn>
    <asiWeb:PanelTemplateColumn ID="EmptyMiddleColumn" runat="server" Width="0">&nbsp;</asiWeb:PanelTemplateColumn>             
	<asiweb:PanelTemplateColumn ID="InvoiceData2" runat="server" Width="60%" translate="yes">	    
		<div class="PanelField Left">
	        <asiweb:BusinessLabel runat="server" ID="DueDateLabel" CssClass="Label"/>
            <div class="PanelFieldValue">
                <asiweb:BusinessLabel runat="server" ID="DueDateValue" />
            </div>
	    </div>
        <div class="PanelField Left">
	        <asiweb:BusinessLabel runat="server" ID="FinancialEntityLabel" CssClass="Label"/>
            <div class="PanelFieldValue">
                <asiweb:BusinessLabel runat="server" ID="FinancialEntityValue" />
            </div>
	    </div>
        <div class="PanelField Left">
	        <asiweb:BusinessLabel runat="server" ID="AccountingMethodLabel" CssClass="Label"/>
            <div class="PanelFieldValue">
                <asiweb:BusinessLabel runat="server" ID="AccountingMethodValue" />
            </div>
	    </div>
	</asiweb:PanelTemplateColumn>
     
    <div class="PanelField Section">
	    <asiweb:BusinessLabel runat="server" ID="DescriptionLabel" CssClass="Label"/>
        <div class="PanelFieldValue">
            <asiweb:BusinessLabel runat="server" ID="DescriptionValue" />
        </div>     
    </div>
    
    <telerik:RadAjaxPanel ID="AdjustmentAreaUpdatePanel" LoadingPanelID="RadAjaxLoadingPanel1" runat="server" EnableAJAX="True" RenderMode="Block" Visible="False">
        <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1" />       
        <div runat="server" id="AdjustmentMainContentArea">                   
            <asiweb:StyledButton ID="AdjustButton" runat="server" CssClass="PrimaryButton SmallButton" CausesValidation="false" OnClick="AdjustButton_OnClick"/>
            <div id="AdjustmentArea" runat="server" Visible="False">
                <div class="PanelField Left">
                    <div style="display: inline;">
                        <asiweb:StyledLabel runat="server" ID="AdjustmentTypeLabel" Text="Adjustment Type" AssociatedControlID="AdjustmentTypeList"></asiweb:StyledLabel>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessDropDownList id="AdjustmentTypeList" AutoPostBack="True" runat="server" RenderPanelField="false">
                            <asp:ListItem Value="0">Reverse the invoice</asp:ListItem>
                        </asiweb:BusinessDropDownList>
                    </div>
                </div>
                <div class="PanelField Left">
                    <asiweb:StyledLabel runat="server" ID="AdjustInvoiceDateLabel" Text="Date" AssociatedControlID="AdjustInvoiceDateInput" CssClass="Required"/>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessCalendar2 runat="server" ID="AdjustInvoiceDateInput" DisplayCaption="false" RenderPanelField="false" Required="True"/>
                        <asiweb:AsiRequiredFieldValidator runat="server" ID="AdjustInvoiceRequiredValidator" />
                        <asp:RangeValidator runat="server" ID="AdjustInvoiceDateRangeValidator" Type="Date" />
                    </div>
                </div>
                <asiweb:StyledButton ID="btnSubmit" runat="server" CssClass="PrimaryButton SmallButton" CausesValidation="true" Text="Submit" />
                <asiweb:StyledButton ID="btnCancel" runat="server" CssClass="TextButton SmallButton" CausesValidation="false" Text="Cancel" />
            </div>
        </div>
    </telerik:RadAjaxPanel>    
       	
</asiweb:paneltemplatecontrol2>