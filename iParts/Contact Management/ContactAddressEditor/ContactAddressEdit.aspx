<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactAddressEdit.aspx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactAddressEditor.ContactAddressEdit" %>
<%@ Register tagPrefix="uc1" tagName="AddressEdit" src="AddressEdit.ascx" %>

<asp:Content id="ContentPanel" runat="server" contentplaceholderid="TemplateBody">    
    <uc1:AddressEdit ID="AddressEdit" runat="server" />
</asp:Content>
