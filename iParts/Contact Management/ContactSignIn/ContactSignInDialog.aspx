<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactSignInDialog.aspx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactSignIn.ContactSignInDialog" %>
<%@ Register TagPrefix="uc1" TagName="ContactSignIn" Src="ContactSignInDisplay.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <uc1:ContactSignIn ID="contactSignIn1" runat="server" ShowPanelHeader="False" ShowBorder="False" ShowTitle="False"/>
</asp:Content>