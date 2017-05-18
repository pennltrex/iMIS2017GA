<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LicenseEditor.aspx.cs" Inherits="Asi.Web.iParts.LicenseManagement.Licensing.LicenseEditor" %>
<%@ Register tagPrefix="license" tagName="Edit" src="LicenseEdit.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" Runat="Server" translate="yes">
    <license:Edit runat="server" ID="LicenseEdit"/>
</asp:Content>