<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ItemCreatorTaxInfo.ascx.cs" Inherits="Asi.Web.iParts.Commerce.ItemCreator.ItemCreatorTaxInfo" EnableViewState="True" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="asiCommon" TagName="ItemCreatorPicture" Src="ItemCreatorPictureDisplay.ascx" %>
<%@ Register TagPrefix="asiCommon" TagName="GeneralLedger" Src="GeneralLedgerAccountDisplay.ascx" %>
<asp:Panel ID="ContentPanel" runat="server" Visible="true" translate="yes">
    <asp:Panel ID="PanelTemplateControl1" runat="server">
        <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" Width="40%">
            <div id="taxDivV10" runat="server">
                <div id="taxIsTaxableDiv" runat="server">
                    <asiweb:BusinessCheckBox ID="TaxableCheckBox" runat="server" AutoPostBack="True" CssClass="FloatLeft" OnCheckedChanged="TaxableCheckBox_OnCheckedChanged" RenderPanelField="True" Caption='<%# ResourceManager.GetPhrase("Taxable", "Taxable")%>' DisplayCaption="True" PositionCaption="Right" />
                </div>
                <div id="taxByLocationDiv" runat="server">
                    <div class="PanelField Left">
                        <div class="PanelFieldLabel">
                            <asiweb:StyledLabel runat="server" ID="TaxModeLabel" CssClass="Required" Text='<%# ResourceManager.GetPhrase("TaxMode", "Tax mode")%>'
                                AssociatedControlID="TaxLocationModeDropDown"></asiweb:StyledLabel>
                        </div>
                        <div class="PanelFieldValue">
                            <asiweb:BusinessDropDownList runat="server" ID="TaxLocationModeDropDown" IncludeNullItem="False" RenderPanelField="False" AutoPostBack="True" Required="true" OnSelectedIndexChanged="TaxLocationModeDropDown_OnSelectedIndexChanged" CausesValidation="False" />
                            <asiweb:AsiRequiredFieldValidator runat="server" ID="TaxLocationModeRequiredValidator" ControlToValidate="TaxLocationModeDropDown"
                                CssClass="Important" SetFocusOnError="true"></asiweb:AsiRequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div id="vatTaxCategoryDiv" runat="server">
                    <div class="PanelField Left">
                        <div class="PanelFieldLabel">
                            <asiweb:StyledLabel runat="server" ID="VatTaxCategoryLabel" CssClass="Required" Text='<%# ResourceManager.GetPhrase("VatTaxCategory", "VAT tax category")%>'
                                AssociatedControlID="VatTaxCategoryDropDown"></asiweb:StyledLabel>
                        </div>
                        <div class="PanelFieldValue">
                            <asiweb:BusinessDropDownList runat="server" ID="VatTaxCategoryDropDown" IncludeNullItem="False" RenderPanelField="False" AutoPostBack="True" Required="true" OnSelectedIndexChanged="VatTaxCategoryDropDown_OnSelectedIndexChanged" CausesValidation="False" />
                            <asiweb:AsiRequiredFieldValidator runat="server" ID="VatTaxCategoryValidator" ControlToValidate="VatTaxCategoryDropDown"
                                CssClass="Important" SetFocusOnError="true"></asiweb:AsiRequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div id="taxAuthorityDiv" runat="server">
                    <div class="PanelField Left">
                        <div class="PanelFieldLabel">
                            <asiweb:StyledLabel runat="server" ID="TaxAuthorityLabel" CssClass="Required" Text='<%# ResourceManager.GetPhrase("VatCode", "VAT tax code")%>'
                                AssociatedControlID="TaxAuthorityDropDown"></asiweb:StyledLabel>
                        </div>
                        <div class="PanelFieldValue">
                            <asiweb:BusinessDropDownList runat="server" ID="TaxAuthorityDropDown" RenderPanelField="False" AutoPostBack="True" Required="true" OnSelectedIndexChanged="TaxAuthority_OnSelectedIndexChanged" CausesValidation="False" IncludeNullItem="True" />
                            <asiweb:AsiRequiredFieldValidator runat="server" ID="TaxAuthorityValidationRequired" ControlToValidate="TaxAuthorityDropDown"
                                CssClass="Important" SetFocusOnError="true" InitialValue="(None)"></asiweb:AsiRequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div id="taxCanadaPureDiv" runat="server">
                    <div class="PanelField Left">
                        <div class="PanelFieldLabel">
                            <asiweb:StyledLabel runat="server" ID="TaxCategoryLabelCanadaPure" Text='<%# ResourceManager.GetPhrase("Taxable", "Taxable")%>'
                                AssociatedControlID="checkBoxGstHst"></asiweb:StyledLabel>
                        </div>
                        <div class="PanelFieldValue">
                            <div class="form-inline">
                                <asiweb:BusinessCheckBox ID="checkBoxGstHst" runat="server" AutoPostBack="False"  OnCheckedChanged="CanadianGstHStCheckChanged" 
                                    Caption='<%# ResourceManager.GetPhrase("GSTPST", "GST/HST")%>' DisplayCaption="True" PositionCaption="Right" RenderPanelField="True"/>
                            </div>
                            <div class="form-inline">
                                <asiweb:BusinessCheckBox ID="checkBoxPst" runat="server" AutoPostBack="False" OnCheckedChanged="CanadianPstCheckChanged" 
                                    Caption='<%# ResourceManager.GetPhrase("PST", "PST")%>' DisplayCaption="True" PositionCaption="Right" RenderPanelField="True"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="vatRuleSetDiv" runat="server" visible="False">
                    <div class="PanelField Left">
                        <div class="PanelFieldLabel">
                            <asiweb:StyledLabel runat="server" ID="VatRuleSetLabel" Text='<%# ResourceManager.GetPhrase("VatRule", "VAT rule")%>'
                                AssociatedControlID="VatRuleSetDropDown"></asiweb:StyledLabel>
                        </div>
                        <div class="PanelFieldValue">
                            <asiweb:BusinessDropDownList runat="server" ID="VatRuleSetDropDown" RenderPanelField="False" AutoPostBack="True" Required="True" OnSelectedIndexChanged="VatRuleSet_OnSelectedIndexChanged" CausesValidation="False" IncludeNullItem="True" />
                        </div>
                    </div>
                </div>
                <div id="taxByAddressDiv" runat="server" visible="False">
                    <div class="PanelField Left">
                        <div class="PanelFieldValue">
                            <asiweb:BusinessCheckBox ID="TaxByAddressCheckBox" runat="server" AutoPostBack="False" CssClass="FloatLeft" OnCheckedChanged="TaxByAddressCheckChanged" />
                        </div>
                        <div class="PanelFieldLabel">
                            <asiweb:StyledLabel runat="server" ID="StyledLabel1" Text='<%# ResourceManager.GetPhrase("TaxByAddress", "Tax by address")%>'
                                AssociatedControlID="TaxByAddressCheckBox"></asiweb:StyledLabel>
                        </div>
                    </div>
                </div>
            </div>
            <div id="taxDivV100" runat="server" visible="False">
                <div runat="server" id="FinancialEntityDiv" class="PanelField Left">
                    <div class="PanelFieldLabel">
                        <asiweb:StyledLabel runat="server" ID="FinancialEntityLabel" Text='<%# ResourceManager.GetPhrase("FinancialEntity", "Financial entity")%>' CssClass="Label"></asiweb:StyledLabel>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:StyledLabel runat="server" ID="SelectedFinancialEntity" Text=''></asiweb:StyledLabel>
                    </div>
                </div>
                <div runat="server" id="AccountingMethodDiv" class="PanelField Left" style="margin-right: 100px;">
                    <div class="PanelFieldLabel">
                        <asiweb:StyledLabel runat="server" ID="AccountMethodLabel" Text='<%# ResourceManager.GetPhrase("AccountingMethod", "Accounting method")%>'
                            AssociatedControlID="AccountingMethodDropDown"></asiweb:StyledLabel>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessDropDownList runat="server" ID="AccountingMethodDropDown" RenderPanelField="false" AutoPostBack="false" Required="true" OnSelectedIndexChanged="AccountingMethod_OnSelectedIndexChanged" />
                        <asiweb:AsiRequiredFieldValidator runat="server" ID="AccountingMethodRequired" ControlToValidate="AccountingMethodDropDown"
                            CssClass="Important" SetFocusOnError="true"></asiweb:AsiRequiredFieldValidator>
                    </div>
                </div>
                <div class="PanelField Left">
                    <div class="PanelFieldLabel">
                        <asiweb:StyledLabel runat="server" ID="TaxCategoryDropDownV100Label" Text='<%# ResourceManager.GetPhrase("TaxCategory", "Tax category")%>'
                            AssociatedControlID="TaxCategoryDropDownV100"></asiweb:StyledLabel>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessDropDownList runat="server" ID="TaxCategoryDropDownV100" RenderPanelField="False" AutoPostBack="True" Required="true" OnSelectedIndexChanged="TaxCategoryV100_OnSelectedIndexChanged" />
                    </div>
                </div>
                <div class="PanelField Left">
                    <div class="PanelFieldLabel">
                        <asiweb:StyledLabel runat="server" ID="TaxScheduleLabel" Text='<%# ResourceManager.GetPhrase("TaxSchedule", "Tax schedule")%>'
                            AssociatedControlID="TaxScheduleDropDown"></asiweb:StyledLabel>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessDropDownList runat="server" ID="TaxScheduleDropDown" RenderPanelField="False" AutoPostBack="True" Required="true" OnSelectedIndexChanged="TaxSchedule_OnSelectedIndexChanged" />
                    </div>
                </div>
            </div>
            <div class="PanelField Right" id="IsCharitableDiv" runat="server" visible="True">
                <div class="PanelFieldValue">
                    <asiweb:BusinessCheckBox CssClass="jsIsCharitableCheckbox" ID="IsCharitableCheckBox" runat="server" RenderPanelField="False" OnCheckedChanged="IsCharitableCheckBox_OnCheckedChanged" AutoPostBack="False" />
                </div>
                <div class="PanelFieldLabel">
                    <asiweb:StyledLabel runat="server" ID="IsCharitableLabel" AssociatedControlID="IsCharitableCheckBox" Text='<%# ResourceManager.GetPhrase("IsCharitable", "Charitable item")%>'></asiweb:StyledLabel>
                </div>
            </div>
            <div style="clear: both;">
            </div>
        </asiweb:PanelTemplateColumn>
    </asp:Panel>
</asp:Panel>

