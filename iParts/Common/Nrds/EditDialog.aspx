<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditDialog.aspx.cs" Inherits="Asi.Web.iParts.Common.Nrds.EditDialog" %>
<%@ Register TagPrefix="uc" TagName="NrdsPanel" Src="NrdsConfigurationDisplay.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <uc:NrdsPanel ID="editPanel" runat="server"/>
</asp:Content>