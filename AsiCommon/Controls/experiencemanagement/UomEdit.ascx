<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.ExperienceManagement.UomEdit" Codebehind="UomEdit.ascx.cs" %>

<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" TemplateTitle="Unit type" Collapsible="false" FieldSet="true" BorderStyle="None">
    <asiweb:PanelTemplateColumn runat="server" LabelWidth="10em" ValueWidth="10em">
        <asiweb:SmartControl runat="server" ID="NameCaption" BoundPropertyName="Name" DisplayType="EditableField" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" ID="DescriptionCaption" BoundPropertyName="Description" DisplayType="EditableField" DisplayCaption="true" />
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl2>