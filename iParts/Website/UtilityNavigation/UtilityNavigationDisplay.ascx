<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UtilityNavigationDisplay.ascx.cs" Inherits="Asi.Web.iParts.Website.UtilityNavigation.UtilityNavigationDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<asp:Panel id="UtilityPlaceholder" runat="server" CssClass="UtilityNavigation nav-auxiliary"></asp:Panel>
<asp:Panel class="UtilityNavigationPlaceholder EditModePlaceholder" id="UtilityPlaceholderDesignMode" runat="server">
    <telerik:RadDockLayout runat="server" ID="RadDockLayout">
        <telerik:RadDockZone BorderStyle="None" ID="RadDockZoneSelectedItems" Orientation="Horizontal" runat="server" RenderMode="Lightweight">              
        </telerik:RadDockZone>         
    </telerik:RadDockLayout>
    <div class="UtilityNavigationPlaceholderInner EditModePlaceholderInner" runat="server" id="UtilityNavigationPanel">Utility navigation</div>
</asp:Panel>
<telerik:RadScriptBlock runat="server" id="ScriptBlock">
<script type="text/javascript">
    //<![CDATA[
    // adapted from bs.collapse - if the search bar is open when opening the menu, close it (and vise versa)
    function UtilityAreaAction(utilityControl, hideArea) {
        jQuery(utilityControl).on('show.bs.collapse', function() {
            var actives = jQuery(hideArea).find('> .in');
            if (actives && actives.length) {
                var hasData = actives.data('bs.collapse');
                if (hasData && hasData.transitioning) return;
                actives.collapse('hide');
                hasData || actives.data('bs.collapse', null);
            }
        });
    }
    jQuery(document).ready(function () {
        UtilityAreaAction('.navbar-collapse', '.nav-auxiliary');
        UtilityAreaAction('.searchbar-collapse', '.primary-navigation-area');
    });
    //]]>              
</script>
</telerik:RadScriptBlock>     