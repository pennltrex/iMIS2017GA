<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RegistrantInfoEdit.ascx.cs" Inherits="Asi.Web.iParts.Events.RegistrantInfoEdit1" %>
<%@ Register TagPrefix="asiweb" TagName="RegistrantInfoAddress" Src="RegistrantInfoAddress.ascx" %> 
<%@ Register TagPrefix="uc1" TagName="AddressEdit" Src="~/iParts/Contact Management/ContactAddressEditor/AddressEdit.ascx" %>

 
<asiweb:PanelTemplateControl ID="EditPanel" runat="server" ShowHeader="false" Collapsible="false" ScrollBars="None" BorderStyle="None">
    <div class="RegistrantInfoContainer">
        <div class="RegistrantInfoAddressList">
            <asp:LinkButton ID="AddAddressLink" runat="server" CausesValidation="False" OnClick="AddAddressLink_OnClick" translate="yes" />
            <asp:Repeater ID="AddressRepeater" runat="server" OnItemDataBound="AddressRepeater_ItemDataBound">
                <ItemTemplate>
                    <div class="RegistrantInfoAddressListItem">                                                                                                                                                                                                                                                   <asiweb:RegistrantInfoAddress ID="RegInfoAddress" runat="server" OnAddressSelected="RegistrantInfoAddress_AddressSelected" />                                                                                                                                                                                                                                                   </div>                                         
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="RegistrantInfoEntry"><asp:HiddenField ID="AddressIsDirtyControl" runat="server" /><asp:Label ID="LabelErrorMessage" runat="server" cssclass="Error" visible="false" /><asiweb:TitleBar ID="RegistrantInfoTitleBar" runat="server" /><div id="DivValidateAddress" runat="server"><asiweb:AddressValidationControl ID="AddressValidator" runat="server" /></div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server"><ContentTemplate><uc1:AddressEdit ID="AddressEdit1" runat="server" IsEventContext="true" /></ContentTemplate>
            </asp:UpdatePanel>
        </div>      
    </div>
</asiweb:PanelTemplateControl>