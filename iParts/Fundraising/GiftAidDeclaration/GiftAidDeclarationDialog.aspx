<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GiftAidDeclarationDialog.aspx.cs" Inherits="Asi.Web.iParts.Fundraising.GiftAidDeclaration.GiftAidDeclarationDialog" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register Src="GiftAidDeclarationDialogControl.ascx" TagPrefix="uc1" TagName="GiftAidDeclarationDialogControl" %>

<asp:Content id="Content" runat="server" ContentPlaceHolderID="TemplateBody">
    <div id="MainContent" runat="server"><uc1:GiftAidDeclarationDialogControl runat="server" id="GiftAidDeclarationDialogControl" /></div>
</asp:Content>

