<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BillingShippingTemplate.ascx.cs" Inherits="Asi.WebRoot.AsiCommon.Controls.Commerce.Accounting.BillingShippingTemplate" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asi:paneltemplatecontrol2 BorderStyle="None" Collapsible="False" id="BillingShippingTemplateControl" runat="server" translate="yes">
	<asi:PanelTemplateColumn ID="BillToSection" runat="server" translate="yes" Width="40%">
	    <asi:PanelTemplateColumn ID="BillToPrompt" runat="server" Width="75px">
	        <asp:label class="Label" id="BillToLabel" runat="server" translate="yes" />
		</asi:PanelTemplateColumn>
	    <asi:PanelTemplateColumn ID="BillToContactView" runat="server">
			<div>
			    <asi:StyledLabel ID="FullNameInputControl" runat="server" HtmlEncode="true"/> 
			    <asi:StyledLabel ID="IDInputControl" runat="server" HtmlEncode="true"/>
            </div>
            <div>
                <asi:StyledLabel ID="FormattedAddressInputControl" runat="server" HtmlEncode="true"/>
            </div>
		</asi:PanelTemplateColumn>
    </asi:PanelTemplateColumn>
    <asiWeb:PanelTemplateColumn ID="EmptyMiddleColumn" runat="server" Width="0">&nbsp;</asiWeb:PanelTemplateColumn> 
	<asi:PanelTemplateColumn ID="ShipToSection" runat="server" translate="yes" Width="60%">
	    <asi:PanelTemplateColumn ID="ShipToPrompt" runat="server" Width="75px">
	        <asp:label class="Label" id="ShipToLabel" runat="server" translate="yes" />  
		</asi:PanelTemplateColumn>
	    <asi:PanelTemplateColumn ID="ShipToContactView" runat="server">
            <asi:StyledLabel id="ShiptoValueLabel" runat="server" HtmlEncode="true" /> 
	    </asi:PanelTemplateColumn>
	</asi:PanelTemplateColumn>  
</asi:paneltemplatecontrol2>