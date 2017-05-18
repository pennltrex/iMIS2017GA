<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PanelEditDialog.aspx.cs" Inherits="Asi.Web.iParts.Common.PanelEditor.PanelEditDialog" %>
<%@ Register tagPrefix="Panel" tagName="FieldEditor" src="PanelEdit.ascx" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asp:Content id="UDFContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <asiweb:PanelTemplateControl2 ID="editPanel" runat="server" ShowHeader="false" Collapsible="false" BorderStyle="None">
        <Panel:FieldEditor runat="server" ID="PanelFieldEditor" ShowSaveAndCancel="False" IsPopup="True" translate="yes"/>
    </asiweb:PanelTemplateControl2>  
</asp:Content>
