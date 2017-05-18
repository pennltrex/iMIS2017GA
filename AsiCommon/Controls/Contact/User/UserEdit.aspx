<%@ Page Language="C#" Inherits="Asi.Web.UI.Common.Contact.UserManagement.UserEdit" MasterPageFile="~/Templates/MasterPages/Empty.master" Codebehind="UserEdit.aspx.cs" %>
<%@ Register Src="~/AsiCommon/Controls/Contact/User/UserEdit.ascx" TagPrefix="asi" TagName="UserEditConrol" %>
<asp:Content ID="Content0" ContentPlaceHolderID="TemplateUserMessages" runat="server"></asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" Runat="Server">    
    <asi:UserEditConrol id="UserEditControl" runat="server"></asi:UserEditConrol>
</asp:Content>
