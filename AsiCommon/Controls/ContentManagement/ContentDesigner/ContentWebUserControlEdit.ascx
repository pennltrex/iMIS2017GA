<%@ Control Language="C#" Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_ContentWebUserControlEdit" Codebehind="ContentWebUserControlEdit.ascx.cs" %>
<asiweb:PanelTemplateControl ID="WebUserControlFields" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">
    <asiweb:SmartControl runat="server" ID="WebUserControlText" DisplayCaption="true" PositionCaption="Top" BoundPropertyName="WebUserControlPath" />
    <asiweb:AsiWebPartManager ID="WebPartManager1" runat="server" Personalization-InitialScope="Shared"></asiweb:AsiWebPartManager>
    <asiweb:AsiWebPartZone ID="UserControlZone" runat="server" Visible="false" PartChromeType="None" WebPartVerbRenderMode="TitleBar"></asiweb:AsiWebPartZone>
    <asiweb:AsiWebPartEditorZone ID="UserControlEditZone" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar">
        <ZoneTemplate>
            <asp:PropertyGridEditorPart ID="PropertyGridEditor" runat="server" />
        </ZoneTemplate>
    </asiweb:AsiWebPartEditorZone>
</asiweb:PanelTemplateControl>