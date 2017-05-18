<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuOfOptionsProductDisplayDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.GeneralProductDisplay.MenuOfOptionsProductDisplayDisplay" %>
<%@ Register TagPrefix="asi" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register Src="~/iParts/Commerce/GeneralProductDisplay/EnrollInAutomaticRenewalsControl.ascx" TagPrefix="uc1" TagName="EnrollInAutomaticRenewalsControl" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asp:UpdatePanel runat="server" ChildrenAsTriggers="true">
        <ContentTemplate>
            <input ID="OrderLineHiddenField" runat="server" type="hidden" />
            <asi:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" ></asi:TitleBar>
            <asi:StyledLabel runat="server" ID="TopMessage" Visible="false" ></asi:StyledLabel>
            <asi:PanelTemplateControl2 runat="server" ID="ProductSetDetailsPanel" Collapsible="false" ShowBorder="false">
                <asp:Panel ID="DataPanel" runat="server"> 
                    <asp:Panel ID="ParentProductDescriptionPanel" runat="server" class="Section" Visible="false">  
                        <asp:Label ID="ParentProductDescriptionLabel" runat="server" Visible="false"></asp:Label>
                    </asp:Panel>    
                    <asp:Repeater ID="MooRepeater" runat="server" OnItemDataBound="MooRepeaterItemDataBound" >
                        <ItemTemplate >
                            <div class="Section">
                                <asp:Label CssClass="SectionLabel AddPaddingHorizontal" ID="MooProductNameLabel" runat="server" Visible="false"></asp:Label>
                                <asp:Label CssClass="AddPaddingHorizontal" ID="MooProductDescriptionLabel" runat="server" Visible="false"></asp:Label>
                                <asp:Label CssClass="AddPaddingHorizontal" ID="OrderLineKeyLabel" runat="server" Visible="false"></asp:Label>
                                <asp:ListView ID="ChildMooListView" runat="server"
                                    OnItemDataBound="ChildMooListViewItemDataBound" OnLayoutCreated="ChildMooListViewLayoutCreated">
                                    <LayoutTemplate>            
                                        <table runat="server" id="MooListTable" class="Grid">
                                            <tr>
                                                <th style="width:0;display:none;"></th>
                                                <th style="width:1%;"></th>
                                                <th style="white-space:nowrap;width:79%;"><asi:StyledLabel ID="lblDescription" runat="server" Text="" RenderPanelField="false" translate="yes"></asi:StyledLabel></th>
                                                <th style="white-space:nowrap;width:5%;"><asi:StyledLabel ID="lblUnitPrice" runat="server" Text="" RenderPanelField="false" translate="yes"></asi:StyledLabel></th>
                                                <th style="white-space:nowrap;width:7%;"><asi:StyledLabel ID="lblQuantity" runat="server" Text="" RenderPanelField="false" translate="yes"></asi:StyledLabel></th>
                                                <th style="white-space:nowrap;width:8%;"><asi:StyledLabel ID="lblAmount" runat="server" Text="" RenderPanelField="false" translate="yes"></asi:StyledLabel></th>
                                            </tr> 
                                            <tr runat="server" id="itemPlaceholder" ></tr>
                                        </table>                           
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <tr id="Tr1" runat="server">
                                            <td id="OrderLineKeyCell" style="display:none;">
                                                <asi:StyledLabel runat="server" ID="OrderLineKeyLabel" Text='<%# Eval("OrderLineId") %>' style="display:none;"></asi:StyledLabel>
                                                <asi:StyledLabel runat="server" ID="ParentOrderLineKeyLabel" style="display:none;"></asi:StyledLabel>
                                            </td>
                                            <td id="SelectCell" style="width:1%;">
                                                <asp:CheckBox runat="server" ID="SelectCheckBox" OnCheckedChanged="SelectControlCheckedChanged" 
                                                    AutoPostBack="true" ValidationGroup='<%# UniqueID %>'></asp:CheckBox>
                                                <asi:StyledRadioButton runat="server" ID="SelectRadioButton" OnCheckedChanged="SelectControlCheckedChanged"
                                                    AutoPostBack="true" ValidationGroup='<%# UniqueID %>'></asi:StyledRadioButton>
                                            </td>
                                            <td id="ProductNameCell" style="width:80%;">
                                                <asi:StyledLabel ID="ProductNameLabel" runat="server" CssClass="ResetFont"/>
                                            </td>
                                                            
                                            <td id="UnitPriceCell" style="width:5%;text-align:right;" class="PriceStyles">
                                                <asi:StyledLabel ID="UnitPriceLabel" runat="server"></asi:StyledLabel>
                                            </td>
                                
                                            <td id="QuantityCell" style="width:7%;text-align:right;" class="PriceStyles">
                                                <asi:StyledLabel ID="QuantityLabel" runat="server"></asi:StyledLabel>
                                                <asp:TextBox ID="QuantityTextBox" runat="server"  
                                                    Style="text-align:right" CssClass="InputXXSmall" OnTextChanged="QuantityTextBoxTextChanged" 
                                                    AutoPostBack="true" ValidationGroup='<%# UniqueID %>'></asp:TextBox>
                                                <asp:RangeValidator ID="QuantityRangeValidator" runat="server" ControlToValidate="QuantityTextBox" 
                                                    CssClass="Error" Display="None" Type="Integer" MinimumValue="0" MaximumValue="10000" ValidationGroup='<%# UniqueID %>'></asp:RangeValidator>
                                            </td>
                                
                                            <td id="AmountCell" style="width:7%;text-align:right;" class="PriceStyles">
                                                <asi:StyledLabel ID="AmountLabel" runat="server" Text='<%# Eval("ExtendedAmount", "{0:N}") %>'></asi:StyledLabel>
                                                <asp:TextBox ID="AmountTextBox" runat="server" CssClass="InputXSmall" style="text-align:right" 
                                                    Text='<%# Eval("ExtendedAmount", "{0:N}") %>' OnTextChanged="AmountTextBoxTextChanged"
                                                    AutoPostBack="true" ValidationGroup='<%# UniqueID %>'></asp:TextBox>
                                                <asp:CompareValidator ID="MinAmountCompareValidator" runat="server" ControlToValidate="AmountTextBox" 
                                                    CssClass="Error" Display="None" Type="Currency" Operator="GreaterThanEqual" Enabled="false" 
                                                    ValueToCompare="0" ValidationGroup='<%# UniqueID %>'></asp:CompareValidator>
                                                <asp:CompareValidator ID="MaxAmountCompareValidator" runat="server" ControlToValidate="AmountTextBox" 
                                                    CssClass="Error" Display="None" Type="Currency" Operator="LessThanEqual" Enabled="false" 
                                                    ValueToCompare="0" ValidationGroup='<%# UniqueID %>'></asp:CompareValidator>
                                            </td>
                                        </tr>                      
                                    </ItemTemplate>
                                </asp:ListView>
                                <asp:Label ID="MinInProductSetLabel" runat="server" style="display:none;"></asp:Label>
                                <asp:Label ID="MaxInProductSetLabel" runat="server" style="display:none;"></asp:Label>
                                <asp:CustomValidator ID="ProductSetItemsSelectedCustomValidator" runat="server" CssClass="Error" Display="None"
                                    OnServerValidate="ProductSetItemsSelectedCustomValidator_OnServerValidate"
                                    ValidationGroup='<%# UniqueID %>'></asp:CustomValidator>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>                       
                    <div class="FloatRight AddPaddingHorizontal">
                        <b><asp:Label runat="server" ID="SubtotalLabel" Text='<%# Asi.ResourceManager.GetWord("Subtotal") %>' translate="yes"></asp:Label>&nbsp;&nbsp;
                        <asp:Label runat="server" ID="SubtotalValueLabel"></asp:Label></b>        
                    </div>                    
                </asp:Panel>    
                <asp:ValidationSummary runat="server" ValidationGroup='<%# UniqueID %>'/>
            </asi:PanelTemplateControl2>          
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="AddToCartButton"/>
        </Triggers>
    </asp:UpdatePanel>
    <uc1:enrollinautomaticrenewalscontrol runat="server" id="EnrollInAutomaticRenewalsCtrl" />
    <div runat="server" translate="yes" class="AddPaddingHorizontal">
        <asp:Button ID="AddToCartButton" runat="server" ValidationGroup='<%# UniqueID %>' OnClick="AddToCartOnClick" CssClass="TextButton PrimaryButton"/>
        <asp:Label ID="AddToCartMessage" runat="server"></asp:Label>&nbsp;
        <asi:BusinessHyperLink ID="CartLink" runat="server"></asi:BusinessHyperLink>
    </div>
    <asp:Button ID="RefreshButton" runat="server" CausesValidation="false" Style="display:none;" OnClick="RefreshButtonClick"/>

</asp:Panel>       