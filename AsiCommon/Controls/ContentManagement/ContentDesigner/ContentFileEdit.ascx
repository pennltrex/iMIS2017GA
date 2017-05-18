<%@ Control Language="C#" Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_ContentFileEdit" Codebehind="ContentFileEdit.ascx.cs" %>

<asiweb:PanelTemplateControl ID="FileFields" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <asiweb:SmartControl ID="File" runat="server" BoundPropertyName="FileDocumentStorageKey" DisplayCaption="true" PositionCaption="Top" OnDataChange="File_DataChange" />
</asiweb:PanelTemplateControl>

