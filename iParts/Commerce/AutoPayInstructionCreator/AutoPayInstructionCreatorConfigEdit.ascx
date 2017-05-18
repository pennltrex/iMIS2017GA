<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AutoPayInstructionCreatorConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Commerce.AutoPayInstructionCreator.AutoPayInstructionCreatorConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asiweb:PanelTemplateControl ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
<p>Please note: This iPart will only be displayed when there is a Join Now product or an accrual renewal invoice in the Cart.</p>       
</asiweb:PanelTemplateControl>