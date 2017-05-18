<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_UserDefinedFieldEdit" Codebehind="UserDefinedFieldEdit.ascx.cs" %>
<%@ Register TagPrefix="propedit" TagName="PropertyEditor" Src="~/AsiCommon/Controls/Shared/PropertyEditor/PropertyEditor.ascx" %>
<asiweb:PanelTemplateControl2 id="PanelTemplate" TemplateTitle="User Defined Field Information" runat="server" FieldSet="true">
    <asiweb:SmartControl ID="FieldName" runat="server" BoundPropertyName="Name" DisplayCaption="true"></asiweb:SmartControl>
    <asiweb:SmartControl ID="IncludeInMetaData" runat="server" BoundPropertyName="UseInSearchFlag" DisplayCaption="true" PositionCaption="Right"></asiweb:SmartControl>
    <asiweb:SmartControl ID="SortOrder" runat="server" BoundPropertyName="SortOrder" DisplayCaption="true"></asiweb:SmartControl>
</asiweb:PanelTemplateControl2>
<propedit:PropertyEditor ID="PropertyEditor" runat="server" />