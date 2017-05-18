<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShippingMethodSelectorDisplay.ascx.cs"
    Inherits="Asi.Web.iParts.Commerce.ShippingMethodSelector.ShippingMethodSelectorDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="uc1" TagName="AddressSelector" Src="~/iParts/Commerce/AddressSelector/AddressSelectorDisplay.ascx" %>

<div runat="server" Translate="Yes">
    <asp:Panel ID="ContentPanel" runat="server" Visible="true">
        <asp:UpdatePanel runat="server" ID="ShippingMethodUpdatePanel" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Panel runat="server" ID="DataPanel" class="StandardPanel" BorderStyle="None">
                    <div class="PanelField Left">
                        <div class="PanelFieldLabel">
                            <label runat="server">Ship To</label></div>
                        <div runat="server" id="AddressSelectorDiv" class="PanelFieldValue">
                                <uc1:AddressSelector runat="Server" id="AddressSelectorSM" AddressPath="Cart.ShippingAddress" OverrideFloating="true"
                                    PageTitle="" ShowBorder="false" OnAddressChanged="AddressSelectorAddressChanged">
                                </uc1:AddressSelector>
                        </div>
                    </div>
                    <div class="PanelField Left">
                        <div class="PanelFieldLabel">
                            <asiweb:styledlabel runat="server" Text='<%#ResourceManager.GetPhrase("ShippingMethod", "Shipping Method")%>' AssociatedControlID="ShippingMethodDropDown" />
                        </div>
                        <div runat="server" class="PanelFieldValue">                          
                            <asiweb:BusinessDropDownList runat="server" ID="ShippingMethodDropDown" DisplayCaption="false"
                            OnSelectedIndexChanged="ShippingMethodDropDown_SelectedIndexChanged"
                            AutoPostBack="true"/>
                            <div runat="server" ID="NoShippingMethodsDiv" class="AsiWarning" Visible="False">
                                <asiweb:StyledLabel runat="server" ID="NoShippingMethodsMessage" Text="Shipping is not available to this country."/>
                            </div>
                        </div>
                    </div>
                    <div style="clear: both;">
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div runat="server" id="DivErrors" visible="false">
            <asp:Label ID="SoaErrorLabel" runat="server" CssClass="Error" Text='<%# ResourceManager.GetPhrase("SoaServiceUnavailable", "Temporarily Unavailable") %>' />
        </div>
        <div style="clear: both;">
        </div>
    </asp:Panel>
</div>

