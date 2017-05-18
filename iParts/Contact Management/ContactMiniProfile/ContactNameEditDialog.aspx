<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactNameEditDialog.aspx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactMiniProfile.ContactNameEditDialog" %>
<%@ Register TagPrefix="uc1" TagName="ContactNameDisplay" Src="ContactNameDisplay.ascx" %>
<%@ Register TagPrefix="uc2" TagName="ContactStatus" Src="ContactStatusDisplay.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" Runat="Server" translate="yes">
    <uc1:ContactNameDisplay id="contactNameDisplay1" runat="server"></uc1:ContactNameDisplay>
     <uc2:ContactStatus ID="contactStatus1" runat="server"/>
</asp:Content>