<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CountriesEdit.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.CountriesEdit" MasterPageFile="~/Templates/MasterPages/Empty.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">   
    <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false">
        <div class="AddPaddingVertical">
            <asiweb:BusinessTextBox ID="CountryTextBox" runat="server" Required="True" DisplayCaption="True" RenderPanelField="True" CssClass="InputLarge" MaxLength="25"/>
            <asiweb:BusinessTextBox ID="CountryCodeTextBox" runat="server" Required="True" DisplayCaption="True" RenderPanelField="True" CssClass="InputXSmall" MaxLength="2"/>
            <asiweb:BusinessTextBox ID="ISO3DigitTextBox" runat="server" DisplayCaption="True" RenderPanelField="True" CssClass="InputXSmall" MaxLength="3"/>
            <asiweb:BusinessDropDownList ID="AddressFormatDropDown" runat="server" DisplayCaption="True" RenderPanelField="True" CssClass="InputMedium"/>
        </div>
        <asiweb:BusinessDropDownList ID="DefaultShippingMethodDropDown" runat="server" DisplayCaption="True" RenderPanelField="True" CssClass="InputLarge"/>
    
        <div id="GSTDiv" runat="server">
            <asiweb:BusinessCheckBox ID="GSTStyleTaxation" runat="server" DisplayCaption="True" RenderPanelField="True" PositionCaption="Right"/>
        </div>
    
        <div id="VATDiv" runat="server">
            <div class="row" style="max-width: 600px">
                <div class="col-xs-6">
                    <asiweb:BusinessTextBox ID="EUCountryCodeTextBox" runat="server" DisplayCaption="True" RenderPanelField="True" CssClass="InputXXSmall" MaxLength="2"/>
                </div>
                <div class="col-xs-6">
                    <asiweb:BusinessTextBox ID="IntrastateCodeTextBox" runat="server" DisplayCaption="True" RenderPanelField="True" CssClass="InputXXSmall" MaxLength="2"/>
                </div>
            </div>
            <div class="ShowFieldset">
                <fieldset style="max-width: 600px">
                    <legend>
			            <span class="SectionLabel"><asiweb:StyledLabel runat="server" ID="VATValidationLabel" CssClass="label"/></span> 
		            </legend>
                    <div>
                        <asiweb:BusinessTextBox ID="MinSizeVATTextBox" runat="server" DisplayCaption="True" RenderPanelField="True" CssClass="InputLarge" MaxLength="2"/>
                        <asp:RangeValidator runat="server" ID="MinSizeVATValidator" ControlToValidate="MinSizeVATTextBox" MinimumValue="0" MaximumValue="20" Type="Integer" Display="Dynamic" ErrorMessage="Please enter a number between 0 and 20"/>
                    </div>
                    <div>
                        <asiweb:BusinessTextBox ID="MaxSizeVATTextBox" runat="server" DisplayCaption="True" RenderPanelField="True" CssClass="InputLarge" MaxLength="2"/>
                        <asp:RangeValidator runat="server" ID="MaxSizeVATRangeValidator" ControlToValidate="MaxSizeVATTextBox" MinimumValue="0" MaximumValue="20" Type="Integer" Display="Dynamic" ErrorMessage="Please enter a number between 0 and 20"/>
                    </div>
                    <div>
                        <asiweb:BusinessTextBox ID="ValidationProcedureTextBox" runat="server" DisplayCaption="True" RenderPanelField="True" CssClass="InputLarge" MaxLength="128"/>
                        <asiweb:BusinessTextBox ID="TestValueTextBox" runat="server" DisplayCaption="True" RenderPanelField="True" CssClass="InputLarge"/>
                    </div>
                </fieldset>
            </div>
        </div>

    </asiweb:PanelTemplateControl2>
</asp:content>