<%@ Control Language="C#" Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_ContentReferenceEdit" Codebehind="ContentReferenceEdit.ascx.cs" %>
<asiweb:PanelTemplateControl ID="ReferenceFields" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <asiweb:SmartControl ID="ReferenceDocumentPath" runat="server" BoundPropertyName="ReferenceDocumentPath" DisplayCaption="true" PositionCaption="Top" DocumentTypesAllowed="CON" />
    <div class="AutoWidth">
        <asiweb:SmartControl ID="ShowDescription" runat="server" BoundPropertyName="ShowDescriptionFlag" DisplayCaption="true" PositionCaption="right" />
    </div>
</asiweb:PanelTemplateControl>