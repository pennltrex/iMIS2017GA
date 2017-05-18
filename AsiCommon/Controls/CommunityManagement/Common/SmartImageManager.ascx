<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Common_SmartImageManager" Codebehind="SmartImageManager.ascx.cs" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="rad" %>

<asiweb:PanelTemplateControl2 ID="ImageManagerPanel" ShowHeader="false" runat="server" Collapsible="false"
    Collapsed="false" FieldSet="true" ShowBorder="false" CssClass="PanelNoPadding">
    <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="CommunityImageUrl" ID="ImageControl" DisplayCaption="true" PositionCaption="Left">
        <rad:dialogopener runat="server" id="DialogOpener1"></rad:dialogopener>
        <asiweb:ToggleButton runat="server" ID="SelectImageButton" OnClientClick="LaunchImageManager();" Text="select image"></asiweb:ToggleButton>
    </asiweb:SmartControl>
    <asiweb:SmartControl runat="server" AtomComponentName="CommunityDocument" BoundPropertyName="CommunityImageAltText" ID="AltTextControl" DisplayCaption="true" PositionCaption="Left" />
</asiweb:PanelTemplateControl2>
<script type="text/javascript">
    function LaunchImageManager() {
        $find('<%= DialogOpener1.ClientID %>').open('ImageManager');
    }
    function ImageManagerCallBackFn(sender, args) {
        if (args == null || args.value == null)
            return;
        var path = args.value[0].getAttribute("src", 2);
        if (path != null) {
            $get('<%= ImageControl.PrincipalControlClientID %>').value = eval('path.replace(/^' + gWebRoot.replace(/\//, '\\/') + '/i, "~")');
    }
}
</script>