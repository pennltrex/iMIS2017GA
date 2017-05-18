<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PanelDesignDialog.aspx.cs" Inherits="Asi.Web.iParts.Common.PanelEditor.PanelDesignDialog" Title="Panel definition" %>
<%@ Register TagName="PanelDesigner" TagPrefix="PanelEditor" Src="PanelDesigner.ascx" %>

<asp:Content id="UDFContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <PanelEditor:PanelDesigner ID="panelDesigner1" Enabled="true" runat="server"></PanelEditor:PanelDesigner> 
</asp:Content>
