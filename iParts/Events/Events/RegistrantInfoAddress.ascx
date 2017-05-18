<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RegistrantInfoAddress.ascx.cs" Inherits="Asi.Web.iParts.Events.RegistrantInfoAddress" %>

<div runat="server" id="MainContentContainer" translate="yes">
    <div class="Significant">
        <asiweb:StyledLabel runat="server" ID="LabelAddressPurpose"/>
    </div>
    <asp:LinkButton runat="server" ID="ChooseAddressLink" OnClick="ChooseAddressLink_OnClick" CausesValidation="False" />
    <asp:Label runat="server" ID="LabelSelectedAddress" Text="Selected Address" Font-Italic="True" />
    <br />
    <asp:Label runat="server" ID="LabelAddress" Text="" />
    <br />&nbsp;
</div>