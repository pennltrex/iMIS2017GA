<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="AddressSelectorDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.AddressSelector.AddressSelectorDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<telerik:RadAjaxManagerProxy ID="RadAjaxManagerProxy1" runat="server">
    <AjaxSettings>
        <telerik:AjaxSetting AjaxControlID="ButtonChooseAddressReturn">
            <UpdatedControls>
                <telerik:AjaxUpdatedControl ControlID="ContentPanel" LoadingPanelID="RadAjaxLoadingPanel1" />
            </UpdatedControls>
        </telerik:AjaxSetting>
    </AjaxSettings>
</telerik:RadAjaxManagerProxy>
<telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1" SkinID="AjaxLoadingPanel" />  
<telerik:RadAjaxPanel ID="ContentPanel" runat="server" Visible="true" EnableAJAX="true" EnableViewState="true" LoadingPanelID="RadAjaxLoadingPanel1">      
    <div runat="server" ID="ShowAddressPanel">                            
        <asiweb:BusinessLabel runat="server" ID="LabelAddress"/>      
        <br/>
        <asiweb:BusinessHyperLink runat="server" ID="LinkChoose" Text="Choose another address" translate="yes" />      
    </div>    
    <asp:UpdatePanel runat="server" ID="DisplayButtonOnlyPanel" UpdateMode="Conditional">
        <ContentTemplate>
               <telerik:RadButton ID="ChooseAddressButton" runat="server" SkinID="PanelCommandButtonEdit" ToolTip="Edit" Text="Edit" ButtonType="LinkButton" OnClick="ChooseAddressButtonClick" AutoPostBack="True" translate="yes"></telerik:RadButton> 
        </ContentTemplate>
    </asp:UpdatePanel>          
    <div style="visibility:hidden;display:none;">
        <asiweb:StyledButton runat="server" id="ButtonChooseAddressReturn" onclick="ButtonChooseAddressReturnClick" CausesValidation="false" OnClientClick=""/>
        <asiweb:BusinessTextBox runat="server" id="TextChooseAddressAction" title="Choose Address Action" aria-hidden="true" />
        <asiweb:BusinessTextBox runat="server" id="TextChooseAddressAddressId" title="Choose Address ID" aria-hidden="true" />
    </div>   
</telerik:RadAjaxPanel> 