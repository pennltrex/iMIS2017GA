<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AccountArea.ascx.cs" Inherits="Asi.Web.iParts.Website.AsiControls.AccountArea" %>
<%@ Register TagPrefix="asi" TagName="OBOPanel" Src="ContactProxyPanel.ascx" %>

<ul runat="server" ID="AccountMenu" class="account-menu"> <%-- note that the CSS class changes in the code behind when OBO is available --%>
    <li runat="server" ID="SignInLI">
        <asp:Hyperlink runat="server" ID="SignInLink" CssClass="sign-in-link" />
    </li>
    <li runat="server" ID="SignOutUnauthorizedLI" Visible="False">
        <asp:LinkButton runat="server" ID="SignOutUnauthorized" OnClick="SignOutLink_OnClick" CausesValidation="False" />
    </li>
    <li runat="server" id="ProfileMenu" class="dropdown" Visible="False">
        <a href="#" class="dropdown-toggle account-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
            <asp:Panel runat="server" ID="PictureContent" CssClass="profile-picture-wrapper" />
            <asp:Label runat="server" ID="PartyName" CssClass="nav-text" />
            <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
            <li runat="server" ID="OBOPanelLI" class="obo-section"><asi:OBOPanel runat="server" ID="OBOControlPanel" /></li>
            <li class="divider obo-divider" runat="server" ID="OBODivider">&nbsp;</li>
            <li><asp:HyperLink runat="server" ID="MyAccountLink" Text="My account" /></li>
            <li><asp:LinkButton runat="server" ID="SignOutLink" OnClick="SignOutLink_OnClick" CausesValidation="False" /></li>
            <li class="divider" runat="server" ID="SiteSectionDivider" Visible="False">&nbsp;</li>
            <li runat="server" ID="SiteSectionHeaderLI" Visible="False"><asp:Label runat="server" CssClass="dropdown-header" Text="Go To" /></li>
            <asp:PlaceHolder runat="server" ID="GoToSection"></asp:PlaceHolder>
        </ul>
    </li>

    <li runat="server" id="OBOToggleLI" Visible="False" class="obo-toggle-wrapper">
        <asp:LinkButton runat="server" ID="OBOToggle" OnClientClick="ToggleOBO(this.id); return false;" CssClass="obo-toggle off" />
    </li>
</ul>


<script>
    function ToggleOBO(toggle_id) {
        var $this = jQuery("#" + toggle_id);
        var enabled = $this.hasClass("on");
        var button;

        if (enabled) // click the clear button
            button = window.$get('<%= OBOControlPanel.ClearContactButtonClientID %>');
        else // click the select button
            button = window.$get('<%= OBOControlPanel.SelectContactButtonClientID %>');


        if (button != null)
            button.click();
    }

    jQuery(document).ready(function () {
        jQuery('.website-item:gt(2)').hide();
        jQuery('.js-show-more-sites').show();

        jQuery('.js-show-more-sites a').click(function () {
            jQuery('.website-item:not(:visible):lt(5)').fadeIn(function () {
                if (jQuery('.website-item:not(:visible)').length == 0) {
                    jQuery('.website-item a').last().focus();
                    jQuery('.js-show-more-sites').remove();
                }
            });
            return false;
        });
    });
</script>