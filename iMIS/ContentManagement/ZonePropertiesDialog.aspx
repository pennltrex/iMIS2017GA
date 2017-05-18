<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="iMIS_ContentManagement_ZonePropertiesDialog" Title="Zone Properties" Codebehind="ZonePropertiesDialog.aspx.cs" %>
<asp:Content ID="Content2" ContentPlaceHolderID="TemplateUserMessages" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <div class="Section">
        <asp:Label ID="TitleLabel" runat="server" Text="Title" AssociatedControlID="TitleTextBox" /><br />
        <asp:TextBox ID="TitleTextBox" runat="server" CssClass="InputLarge" />
    </div>
    <div class="Section">
        <asp:Label ID="TitleCssLabel" runat="server" Text="Title CSS class" AssociatedControlID="TitleCssTextBox" /><br />
        <asp:TextBox ID="TitleCssTextBox" runat="server" CssClass="InputLarge" />
    </div>
    <div class="Section">            
        <asp:Label ID="CssLabel" runat="server" Text="Zone CSS class" AssociatedControlID="CssTextBox" /><br />
        <asp:TextBox ID="CssTextBox" runat="server" CssClass="InputLarge" />
    </div>
</asp:Content>