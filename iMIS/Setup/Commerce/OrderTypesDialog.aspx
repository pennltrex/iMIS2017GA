<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderTypesDialog.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.OrderTypesDialog" MasterPageFile="~/Templates/MasterPages/Empty.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">   
    <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false">
        <div class="AddPaddingVertical">
            <asiweb:BusinessTextBox ID="OrderTypeCodeTextBox" runat="server" Required="True" DisplayCaption="True" RenderPanelField="True" CssClass="InputMedium" MaxLength="10"/>
            <asiweb:AsiRequiredFieldValidator ControlToValidate="OrderTypeCodeTextBox" CssClass="Important" ID="RequiredZoneTextBox" runat="server" SetFocusOnError="True" Text="Required" />
            <asiweb:BusinessTextBox ID="DescriptionTextBox" runat="server" DisplayCaption="True" RenderPanelField="True" CssClass="InputLarge" MaxLength="20"/>
            <asiweb:BusinessTextBox ID="InvoiceDescriptionTextBox" runat="server" DisplayCaption="True" RenderPanelField="True" CssClass="InputLarge" MaxLength="20"/>
        </div>
        <div>
            <asiweb:BusinessRadioButtonList ID="CategoriesRadioButtonList" runat="server" CssClass="AutoWidth" RepeatDirection="Horizontal" OnSelectedIndexChanged="CategoriesRadioButtonList_OnSelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Text="Standard" Value="0" Selected="True"/>
                <asp:ListItem Text="Debit memo" Value="1" Enabled="True"/>
                <asp:ListItem Text="Credit memo" Value="2" Enabled="True"/>
                <asp:ListItem Text="Pro forma" Value="3" Enabled="True"/>
            </asiweb:BusinessRadioButtonList>
        </div>
    
        <div class="ShowFieldset">
                <fieldset style="max-width: 600px">
                    <legend>
			            <span class="SectionLabel"><asiweb:StyledLabel runat="server" ID="TypeOptionsLabel" CssClass="label"/></span> 
		            </legend>
                    <div>
                        <asiweb:BusinessCheckBox ID="AffectInventoryCheckBox" runat="server" DisplayCaption="True" RenderPanelField="True" PositionCaption="Right"/>
                        <asiweb:BusinessCheckBox ID="PrintInvoiceCheckBox" runat="server" DisplayCaption="True" RenderPanelField="True" PositionCaption="Right"/>
                        <asiweb:BusinessCheckBox ID="PickListCheckBox" runat="server" DisplayCaption="True" RenderPanelField="True" PositionCaption="Right"/>
                        <asiweb:BusinessCheckBox ID="ShippingPaperCheckBox" runat="server" DisplayCaption="True" RenderPanelField="True" PositionCaption="Right"/>
                        <asiweb:BusinessCheckBox ID="PrintQuoteCheckBox" runat="server" DisplayCaption="True" RenderPanelField="True" PositionCaption="Right"/>
                    </div>
                    <asiweb:BusinessDropDownList ID="ConvertToOrderDropDown" runat="server" DisplayCaption="True" RenderPanelField="True" CssClass="InputMedium"/>
                </fieldset>
            </div>
        
    </asiweb:PanelTemplateControl2>
</asp:content>