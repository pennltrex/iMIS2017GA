<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.CertificationManagement.ProgramGroupDefinition" Codebehind="~/AsiCommon/Controls/CertificationManagement/ProgramGroup/ProgramGroupDefinition.ascx.cs" %>

<asiweb:PanelTemplateControl2 runat="server" Collapsed="false" FieldSet="true" Collapsible="false" BorderStyle="None">
    <asiweb:PanelTemplateColumn runat="server" LabelWidth="16em" ValueWidth="50em">
        <asiweb:SmartControl runat="server" BoundPropertyName="ProgramGroupName" DisplayCaption="true" InputFieldCssClass="InputXLargeWrapper"/>
        <asiweb:SmartControl runat="server" BoundPropertyName="ProgramGroupDescription" DisplayCaption="true" />
        <asiweb:SmartControl runat="server" BoundPropertyName="ProgramGroupStatusCode" DisplayCaption="true" />
    </asiweb:PanelTemplateColumn>
</asiweb:PanelTemplateControl2>