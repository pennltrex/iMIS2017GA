<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FinancialEntityCreator.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.FinancialEntityCreator" MasterPageFile="~/Templates/MasterPages/Empty.master"%>
<%@ Register TagPrefix="asiCommon" TagName="FileUpload" Src="~/AsiCommon/Controls/Shared/Utility/BusinessFileUpload.ascx" %>

<asp:content contentplaceholderid="TemplateBody" id="ContentBody" runat="server">    
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
                    MultiPageID="RadMultiPage1" ShowBaseLine="true" >
                    <Tabs>
                        <telerik:RadTab translate="yes" Text="Financial Entity" PageViewID="FinancialEntityPage"/>
                        <telerik:RadTab translate="yes" Text="Default Accounts" PageViewID="DefaultAccountsPage"/>
                    </Tabs>
                </telerik:RadTabStrip>
            
            <telerik:RadMultiPage ID="RadMultiPage1" runat="server" CssClass="ContentTabbedDisplay" SelectedIndex="0">
                
                <telerik:RadPageView runat="server" ID="FinancialEntityPage">
                    <asiweb:PanelTemplateControl ID="PanelTemplate" runat="server" Width="100%" ShowHeader="false">
                    <div class="AddPaddingHorizontal DisplayInlineBlock">
	                    <asiweb:BusinessTextBox id="OrgCodeTextBox" runat="server" Caption="Organization code" CssClass="InputMedium" Required="True" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left" MaxLength="5"/>
                        <asiweb:AsiRequiredFieldValidator runat="server" ID="RequiredValidatorCode" ControlToValidate="OrgCodeTextBox" Display="Dynamic" SetFocusOnError="true"></asiweb:AsiRequiredFieldValidator>
                        <asiweb:BusinessTextBox id="OrgNameTextBox" runat="server" Caption="Organization name" CssClass="InputXLarge" Required="True" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left" MaxLength="60"/>
                        <asiweb:AsiRequiredFieldValidator runat="server" ID="RequiredValidatorName" ControlToValidate="OrgNameTextBox" Display="Dynamic" SetFocusOnError="true"></asiweb:AsiRequiredFieldValidator>
                        <asiweb:BusinessCheckBox id="DefaultCheckBox" runat="server"  Caption="Default organization" RenderPanelField="True" DisplayCaption="True" PositionCaption="Right"/>
                        <asiweb:BusinessCheckBox id="IsFundCheckBox" runat="server" Caption="Is fund" RenderPanelField="True" DisplayCaption="True" PositionCaption="Right"/>
	                </div>
                    <div class="AddPaddingHorizontal PanelField Left">
                        <asiweb:BusinessLabel Text="Taxation method" CssClass="Label" runat="server" id="TaxationMethodLabel"></asiweb:BusinessLabel>
                        <div class="PanelFieldValue">
	                        <asiweb:BusinessRadioButtonList ID="TaxationMethodRadioButtonList" runat="server" CssClass="AutoWidth" RepeatDirection="Horizontal" OnSelectedIndexChanged="OnSelectedIndexChanged" AutoPostBack="True">
	                            <asp:ListItem Text="Default" Value="0" Selected="True"/>
                                <asp:ListItem Text="Canadian" Value="1" Enabled="True"/>
                                <asp:ListItem Text="VAT" Value="2" Enabled="True"/>
                            </asiweb:BusinessRadioButtonList>
                            <div class="PanelField" ID="CanadianDiv" runat="server">
                                <asiweb:BusinessDropDownList id="TaxAuthorityDropDown" runat="server" Caption="Tax authority" CssClass="InputMedium" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left"/>
                                <asiweb:BusinessTextBox id="RemittanceNumberTextBox" runat="server" Caption="GST/HST remittance number" CssClass="InputMedium" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left" MaxLength="15"/>
                            </div>
                            <div class="PanelField" ID="VATDiv" runat="server">
                                <asiweb:BusinessTextBox id="VATRegistrationNumberTextBox" runat="server" Caption="VAT registration number" CssClass="InputMedium" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left" MaxLength="20"/>
                                <asiweb:BusinessTextBox id="VATBranchIdTextBox" runat="server" Caption="VAT branch ID" CssClass="InputMedium" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left" MaxLength="3"/>
                                <asiweb:BusinessTextBox id="VATCompanyTextBox" runat="server" Caption="VAT Company" CssClass="InputMedium" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left" MaxLength="20"/>
                                <asiweb:BusinessDropDownList id="EUCountryCodeDropDown" runat="server" Caption="EU country code" CssClass="InputSmall" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left"/>
                            </div>
	                    </div>
                    </div>
                    <div class="AddPaddingHorizontal">
                        <asiweb:BusinessTextBox id="InvoiceAddressTextBox" runat="server" Caption="Invoice/Receipt address" CssClass="InputXLarge" Rows="5" TextMode="MultiLine" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left"/>
	                </div>
                    <div class="AddPaddingHorizontal PanelField Left" >
                       <asiweb:StyledLabel runat="server" ID="LogoImageUrlLabel" AssociatedControlID="LogoImageUrlInputControl" 
					        Text="Logo image" />
				        <div class="PanelFieldValue">
				            <div class="Section">
					            <asiweb:BusinessDropDownList id="LogoImageUrlInputControl" runat="server" AutoPostBack="True" OnSelectedIndexChanged="LogoImageUrlInputControlSelectedIndexChanged"/>
                                
                            </div>
							<asiweb:BusinessStyledImage id="LogoImage" CssClass="Section" runat="server" Width="200"/> 		            
					        <div class="PanelField">
						        <asiweb:StyledLabel id="UploadNewImageLabel" Runat="server" CssClass="Label"
							            Text="Upload new image" />
						        <div class="PanelFieldValue">
							        <asiCommon:FileUpload id="BusinessFileUploadControl" runat="Server" UploadDirectory="~/images/Organizations/" OnFileUploaded="FileUploadControlFileUploaded" AllowedExtensions="JPG,JPEG,GIF,PNG,BMP" />
						        </div>
                            </div>
				        </div>
			        </div>
                    <div class="AddPaddingHorizontal">
	                    <asiweb:BusinessTextBox id="LetterHeadTextBox" runat="server" Caption="Letterhead like single line address" CssClass="InputXLarge" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left"/>
	                </div>
                    
                    <div class="AddPaddingHorizontal">
	                    <asiweb:BusinessTextBox id="RegistrationNumberTextBox" runat="server" Caption="Registration number" CssClass="InputXLarge" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left"/>
	                </div>
                    </asiweb:PanelTemplateControl>
                </telerik:RadPageView>

                <telerik:RadPageView runat="server" ID="DefaultAccountsPage">
                    <asiweb:PanelTemplateControl runat="server" Width="100%" ShowHeader="false">
                     <div class="AddPaddingHorizontal DisplayInlineBlock">
                        <asiweb:BusinessDropDownList id="CashAccountDropDown" runat="server" CssClass="InputLarge" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left"/>
                        <asiweb:BusinessDropDownList id="AccountsReceivableDropDown" runat="server" CssClass="InputLarge" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left"/>
                        <asiweb:BusinessDropDownList id="IncomeDropDown" runat="server" CssClass="InputLarge" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left"/>
                         <asiweb:BusinessDropDownList id="SalesTaxDropDown" runat="server" CssClass="InputLarge" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left"/>
                         <asiweb:BusinessDropDownList id="FreightDropDown" runat="server" CssClass="InputLarge" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left"/>
                         <asiweb:BusinessDropDownList id="HandlingDropDown" runat="server" CssClass="InputLarge" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left"/>
                         <asiweb:BusinessDropDownList id="RestockDropDown" runat="server" CssClass="InputLarge" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left"/>
                         <asiweb:BusinessDropDownList id="RefundClearingDropDown" runat="server" CssClass="InputLarge" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left"/>
                         <asiweb:BusinessDropDownList id="RefundAPDropDown" runat="server" CssClass="InputLarge" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left"/>
                         <asiweb:BusinessDropDownList id="PrepaidDropDown" runat="server" CssClass="InputLarge" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left"/>
                         <asiweb:BusinessDropDownList id="TransferClearingDropDown" runat="server" CssClass="InputLarge" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left"/>
                         <asiweb:BusinessDropDownList id="WriteOffOffsetDropDown" runat="server" CssClass="InputLarge" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left"/>
	                </div>
                        </asiweb:PanelTemplateControl>
                </telerik:RadPageView>

            </telerik:RadMultiPage>  
</asp:content>