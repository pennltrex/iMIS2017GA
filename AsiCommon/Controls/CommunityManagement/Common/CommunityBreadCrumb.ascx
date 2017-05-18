<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Common_CommunityBreadCrumb" Codebehind="CommunityBreadCrumb.ascx.cs" %>
<%@ Register TagPrefix="Cmty" Assembly="Asi.Web.UI.Communities" Namespace="Asi.Web.UI.Communities" %>
<Cmty:CommunitySiteMapPath ID="BreadCrumbControl" runat="server" RenderCurrentNodeAsLink="false">
    <NodeTemplate>
        <asiweb:BusinessHyperLink ID="NodeLink" runat="server" NavigateUrl='<%# Eval("Url") %>' Text='<%# Eval("Title") %>' DoNotTranslateText="True" ToolTip='<%# Eval("Description") %>' CssClass="BreadCrumbLink"></asiweb:BusinessHyperLink>
    </NodeTemplate>
    <CurrentNodeTemplate>
        <asp:Label ID="CurrentNodeLabel" runat="server" Text='<%# Eval("Title") %>' CssClass="BreadCrumbCurrent" translate="no"></asp:Label>
    </CurrentNodeTemplate>
</Cmty:CommunitySiteMapPath>
<script type="text/javascript">
    (function($) {
        //This function will prevent tabbing into an empty bread crumb link - WCAG compliance
        var clientId = '<%=BreadCrumbControl.ClientID%>';
        var $thisControl = $('#' + clientId);
        if(!$thisControl || $thisControl.length < 1) return ;
        var $anchor = $thisControl.find("[href='#" + clientId + "_SkipLink']").eq(0);
        if (!$anchor || $anchor.length < 1) return;
        var $image = $anchor.children('img').eq(0);
        if (!$image || $image.length < 1) return;
        //is this a hidden image - if so, then skip over link
        if ($image.width() == 0 && $image.height() == 0) $anchor.attr('tabindex', '-1');
    })(jQuery);
</script>