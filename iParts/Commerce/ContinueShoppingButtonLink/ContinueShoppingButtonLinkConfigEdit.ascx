<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContinueShoppingButtonLinkConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Commerce.ContinueShoppingButtonLink.ContinueShoppingButtonLinkConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asiweb:PanelTemplateControl ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <div class="AutoWidth">
        <asiweb:SmartControl TextBoxWidth="20em" ID="ContinueShoppingUrl" runat="server" BoundPropertyName="ContinueShoppingUrl" DisplayCaption="true" DataSaveUponStateChange="false" />
    </div>    
</asiweb:PanelTemplateControl>