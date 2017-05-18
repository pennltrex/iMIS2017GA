<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisplayNameEditorDialog.aspx.cs" Inherits="Asi.Web.iParts.ContactManagement.DisplayNameEditor.DisplayNameEditorDialog" %>

<%@ Register src="DisplayNameEditorDisplay.ascx" tagname="DisplayNameEditorDisplay" tagprefix="uc1" %>

<asp:Content id="UDFContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <uc1:DisplayNameEditorDisplay ID="DisplayNameEditorDisplay1" runat="server" />
</asp:Content>
