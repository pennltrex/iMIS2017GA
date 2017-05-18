<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreightZoneDialog.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.FreightZoneDialog" MasterPageFile="~/Templates/MasterPages/Empty.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">   
    <asiweb:PanelTemplateControl2 ID="FreightZonePanel" runat="server" Collapsible="false">
        <div class="PanelField Left">
            <div class="PanelFieldLabel">
                <asiweb:StyledLabel ID="ShippingMethodLabel" CssClass="Label Required" runat="server" Translate="yes"/>
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessDropDownList ID="ShippingMethodDropDown" runat="server" Required="True" DisplayCaption="False" RenderPanelField="False" CssClass="InputLarge"/>
                <asiweb:AsiRequiredFieldValidator ControlToValidate="ShippingMethodDropDown" CssClass="Important" ID="ShippingMethodValidator" runat="server" SetFocusOnError="True" Text="Required" />
            </div>
        </div>
        <div class="AddPaddingVertical">
            <asiweb:BusinessDropDownList ID="CountryDropDown" runat="server" DisplayCaption="True" RenderPanelField="True" CssClass="InputLarge"/>
            
        </div>
        <div>
            <asiweb:BusinessTextBox ID="UpdatedTextBox" runat="server" DisplayCaption="True" RenderPanelField="True" CssClass="InputLarge" Enabled="False"/>
            <asiweb:BusinessTextBox ID="TitleTextBox" runat="server" DisplayCaption="True" RenderPanelField="True" CssClass="InputXLarge" MaxLength="255"/>
            <asiweb:BusinessTextBox ID="DefuaultZoneTextBox" runat="server" DisplayCaption="True" RenderPanelField="True" CssClass="InputLarge" MaxLength="10"/>
        </div>
    
        <div class="PanelField Left">
			<div class="PanelFieldValue">
				<asiweb:BusinessTextBox id="ZoneTableTextBox" RenderPanelField="True" DisplayCaption="True" runat="server" CssClass="InputXLarge" Rows="10" TextMode="MultiLine"/>
			</div>
			<div class="PanelFieldValue">
				<asiweb:InfoControl ID="ZoneTableInfo" runat="server" Title=""/>
			</div>
        </div>
        
    </asiweb:PanelTemplateControl2>
</asp:content>