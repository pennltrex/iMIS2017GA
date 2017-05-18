<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PromotionManagerDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.PromotionManager.PromotionManagerDisplay" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1" SkinID="AjaxLoadingPanel" />

<asp:Panel ID="ContentPanel" runat="server" CssClass="" Visible="true" DefaultButton="ApplyPromotionalCode" translate="yes">      
    <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
		<div runat="server" id="PromotionInnerDiv">
			<asiweb:StyledLabel ID="PromotionalCodeLabel" CssClass="" AssociatedControlID="PromotionalCode" runat="server" />
			&nbsp;
			<asiweb:BusinessTextBox ID="PromotionalCode" runat="server" />
			&nbsp;
			<asiweb:StyledButton ID="ApplyPromotionalCode" CausesValidation="false"  runat="server" OnClick="ApplyPromotionalCode_Click" />    
			<asiweb:StyledLabel Visible="False" runat="server" CssClass="Error" ID="ErrorText" />
			<br/>
			<asiweb:StyledLabel ID="PromotionApplied" Visible="False" runat="server" />
		</div>
    </telerik:RadAjaxPanel>
</asp:Panel>

