<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LogOnPasswordDialog.aspx.cs" Inherits="Asi.Web.iParts.ContactManagement.ChangeLogonPassword.LogOnPasswordDialog" %>
<%@ Register TagPrefix="uc1" TagName="LogOnPasswordDisplay" Src="LogonPasswordDisplay.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <uc1:LogOnPasswordDisplay ID="LogOnPasswordDisplay1" runat="server" ShowPanelHeader="False" ShowBorder="False" ShowTitle="False"/>
</asp:Content>