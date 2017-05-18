<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_Shared_PropertyEditor_PropertyDefinition" Codebehind="PropertyDefinition.ascx.cs" %>
<asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsed="false" TemplateTitle="Definition" RoundedCorners="false" FieldSet="true">
    <asiweb:SmartControl ID="DataType" runat="server" BoundPropertyName="DataTypeCode" DisplayCaption="true" AutoPostBack="False" />
    <asiweb:SmartControl ID="MaxLength" runat="server" BoundPropertyName="MaxLength" DisplayCaption="true" />
    <asiweb:SmartControl ID="Scale" runat="server" BoundPropertyName="Scale" DisplayCaption="true" />
    <asiweb:SmartControl ID="Required" runat="server" BoundPropertyName="IsRequired" DisplayCaption="true" PositionCaption="Right"></asiweb:SmartControl>
</asiweb:PanelTemplateControl2>