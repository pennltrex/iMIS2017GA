<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Contact.UserManagement.WebUserEdit" Codebehind="WebUserEdit.ascx.cs" %>
<asiweb:PanelTemplateControl runat="server" ID="WebInfoPanel" ShowHeader="false" FieldSet="true" BorderStyle="None">
    <asiweb:PanelTemplateColumn ID="Column1" runat="server" LabelWidth="10em">
        <asiweb:SmartControl runat="server" ID="WebUser_SecurityGroupPrompt" BoundPropertyName="SecurityGroup" DisplayType="EditableField" DisplayCaption="true" />
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl>