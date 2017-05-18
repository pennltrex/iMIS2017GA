<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactStatusEditDialog.aspx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactStatusEditDialog" %>
<%@ Register TagPrefix="uc1" TagName="ContactStatus" Src="ContactStatusDisplay.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <uc1:ContactStatus ID="contactStatus1" runat="server"/>
</asp:Content>