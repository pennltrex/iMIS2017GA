<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PickOneProductDisplayDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.GeneralProductDisplay.PickOneProductDisplayDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asi" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>
<%@ Register TagPrefix="uc1" TagName="enrollinautomaticrenewalscontrol" Src="~/iParts/Commerce/GeneralProductDisplay/EnrollInAutomaticRenewalsControl.ascx" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
        <ContentTemplate>
            <input ID="OrderLineHiddenField" runat="server" type="hidden" /> 
            <asi:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" />
            <asi:StyledLabel runat="server" ID="TopMessage" Visible="false" />
            <asi:PanelTemplateControl runat="server" ID="ProductSetDetailsPanel" Collapsible="false">
                <asp:Label ID="MooProductNameLabel" runat="server" CssClass="SectionLabel" Visible="false"></asp:Label>
                <asp:Label ID="ParentProductDescription" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="OrderLineKeyLabel" runat="server" Visible="false" ></asp:Label>
                <input ID="selectedItem" runat="server" type="hidden" />
                <asp:ListView ID="PickOneListView" runat="server" OnItemDataBound="PickOneListViewItemDataBound" OnLayoutCreated="PickOneListViewLayoutCreated">
                    <LayoutTemplate>            
                        <table runat="server" id="MooListTable" class="Grid" cellpadding="2" cellspacing="2" width="100%" style="Width:100%!Important;" >
                            <tr>
                                <th width="0%" style="display:none"></th>
                                <th  style="width:1%;"></th>
                                <th style="white-space:nowrap;width:80%;" class="TextStyle"><asi:StyledLabel ID="lblDescription" runat="server" Text="" RenderPanelField="false"></asi:StyledLabel></th>
                                <th style="white-space:nowrap;width:5%;" class="PriceStyles"><asi:StyledLabel ID="lblUnitPrice" runat="server" Text="" RenderPanelField="false"></asi:StyledLabel></th>
                                <th style="white-space:nowrap;width:7%;" class="NumberStyle"><asi:StyledLabel ID="lblQuantity" runat="server" Text="" RenderPanelField="false"></asi:StyledLabel></th>
                                <th style="white-space:nowrap;width:7%;" class="PriceStyles"><asi:StyledLabel ID="lblAmount" runat="server" Text="" RenderPanelField="false"></asi:StyledLabel></th>
                            </tr> 
                            <tr runat="server" id="itemPlaceholder" ></tr>
                        </table>     
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr id="Tr1">
                        <td id="OrderLineKeyCell" style="display: none;">
                            <asi:StyledLabel runat="server" ID="OrderLineKeyLabel" Text='<%# Eval("OrderLineId") %>' style="display:none" ></asi:StyledLabel>
                            <asi:StyledLabel runat="server" ID="ParentOrderLineKeyLabel" style="display:none" ></asi:StyledLabel>
                        </td>

                        <td id="SelectCell" style="width:1%;">
                            <asp:CheckBox runat="server" ID="SelectCheckBox" Enabled="false"
                                                    ValidationGroup='<%# UniqueID %>' ></asp:CheckBox>
                            <asi:StyledRadioButton runat="server" ID="SelectRadioButton" Enabled="true" 
                                                 ValidationGroup='<%# UniqueID %>' >  </asi:StyledRadioButton>
                        </td>
                        <td id="ProductNameCell" style="width:80%;">
                            <asi:StyledLabel ID="ProductNameLabel" runat="server" ></asi:StyledLabel>
                        </td>
                                                            
                        <td id="UnitPriceCell" align="right" style="width:5%;" class="PriceStyles">
                            <asi:StyledLabel ID="UnitPriceLabel" runat="server" ></asi:StyledLabel>
                        </td>
                                
                        <td id="QuantityCell" align="right" style="width:7%;" class="PriceStyles">
                            <asi:StyledLabel ID="QuantityLabel" runat="server" ></asi:StyledLabel>
                            <asp:TextBox ID="QuantityTextBox" runat="server" Width="1.5em" 
                                Style="text-align:right" 
                                 ValidationGroup='<%# UniqueID %>' ></asp:TextBox>
                            <asp:RangeValidator ID="QuantityRangeValidator" runat="server" ControlToValidate="QuantityTextBox" MinimumValue="0" MaximumValue="100000"
                                CssClass="Error" Display="None" EnableClientScript="true" Type="Integer" ValidationGroup='<%# UniqueID %>'></asp:RangeValidator>
                        </td>
                                
                        <td id="AmountCell" align="right" style="width:7%;" class="PriceStyles">
                            <asi:StyledLabel ID="AmountLabel" runat="server" Text='<%# Eval("ExtendedAmount", "{0:N}") %>' ></asi:StyledLabel>
                            <asp:TextBox ID="AmountTextBox" runat="server" Width="3em" style="text-align:right" 
                                Text='<%# Eval("ExtendedAmount", "{0:N}") %>' 
                                AutoPostBack="true" ValidationGroup='<%# UniqueID %>' ></asp:TextBox>
                            <asp:CompareValidator ID="MinAmountCompareValidator" runat="server" ControlToValidate="AmountTextBox" 
                                CssClass="Error" Display="None" Type="Currency" Operator="GreaterThanEqual" Enabled="false" 
                                ValueToCompare="0" ValidationGroup='<%# UniqueID %>' ></asp:CompareValidator>
                            <asp:CompareValidator ID="MaxAmountCompareValidator" runat="server" ControlToValidate="AmountTextBox" 
                                CssClass="Error" Display="None" Type="Currency" Operator="LessThanEqual" Enabled="false" 
                                ValueToCompare="0" ValidationGroup='<%# UniqueID %>'></asp:CompareValidator>         
                        </td>
                    </tr>                      
                    </ItemTemplate>
                </asp:ListView>
                <asp:Label ID="MinInProductSetLabel" runat="server" style="display:none"></asp:Label>
                <asp:Label ID="MaxInProductSetLabel" runat="server" style="display:none"></asp:Label>
                <div style="display:none;visibility:hidden;">
                    <asp:Button ID="selectedItemChanged" runat="server" OnClick="SelectedItemChanged_Click"/><asp:Button runat="server" CausesValidation="true" ID="quantityTextChangedButton" ValidationGroup='<%# UniqueID %>' OnClick="QuantityTextChanged_Click" />
                    <asp:HiddenField ID="quantityTextFieldValue" runat="server" />
                </div>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup='<%# UniqueID %>' />
            </asi:PanelTemplateControl>
    
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="AddToCartButton" />
        </Triggers>
    </asp:UpdatePanel>
    <uc1:enrollinautomaticrenewalscontrol runat="server" id="EnrollInAutomaticRenewalsCtrl" />
    <asp:Button ID="AddToCartButton" runat="server" ValidationGroup='<%# UniqueID %>' OnClick="AddToCartOnClick" CssClass="TextButton PrimaryButton" />
    <asp:Label ID="AddToCartMessage" runat="server" />&nbsp;
    <asi:BusinessHyperLink ID="CartLink" runat="server" />
    <asp:Button ID="RefreshButton" runat="server" CausesValidation="false" Style="display:none" OnClick="RefreshButtonClick" />
</asp:Panel>