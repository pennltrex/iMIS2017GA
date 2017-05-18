<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_TagGroupProperties" Codebehind="TagGroupProperties.ascx.cs" %>
<%@ Register TagPrefix="asiweb" TagName="TagSelector" Src="~/AsiCommon/Controls/ContentManagement/TagSelector.ascx" %>
<script type="text/javascript">
    function GetDialogArgument()
    {
        var oWindow = <%= Asi.Web.UI.MasterPageBase.WindowClientScript %>;
        InitiateControlEventWithArgument('<%= DialogArgumentButton.ClientID %>', oWindow.dialogArguments);
    }
</script>
<asiweb:PanelTemplateControl ID="TagGroupDefinition" runat="server" TemplateTitle="Tag Group Properties" CollapsedText="Tag Group Properties" RoundedCorners="false" FieldSet="true">
    <asiweb:SmartControl ID="TagGroupName" runat="server" BoundPropertyName="TagGroupName" DisplayCaption="true" PositionCaption="Top" OnNeedBoundAtom="NeedBoundAtom" AtomComponentName="TagGroup" />
    <asiweb:SmartControl ID="TagGroupDescription" runat="server" BoundPropertyName="TagGroupDescription" DisplayCaption="true" PositionCaption="Top" OnNeedBoundAtom="NeedBoundAtom" AtomComponentName="TagGroup" />
    <asiweb:TagSelector ID="GroupTags" runat="server" />
    <asp:Button ID="DialogArgumentButton" runat="server" style="display: none" OnClick="DialogArgumentButton_Click" />
    <asp:HiddenField ID="SerializedTagGroup" runat="server" />
</asiweb:PanelTemplateControl>