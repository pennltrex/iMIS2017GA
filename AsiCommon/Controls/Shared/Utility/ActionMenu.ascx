<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.ActionMenu" Codebehind="ActionMenu.ascx.cs" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Import Namespace="Asi" %>

<!--
This is sort of mysterious.  URLs are not handled as we expect when an UpdatePanel is used.  
Without this javascript, once we update the page via partial postback, we can no longer 
follow the URLs on our page's links.  I don't pretend to understand this completely - see
the post at http://forums.asp.net/p/1083499/1609805.aspx for some more detail.
-->
<script type="text/javascript">
//<![CDATA[
    Sys.Application.add_load(function() {
        var form = Sys.WebForms.PageRequestManager.getInstance()._form;
        form._initialAction = form.action = window.location.href;
    });
//]]>
</script>
<asi:TitleBar ID="TitleBar"  OptionsMenuBehavior="AlwaysDisplay" runat="server" />
<asi:StyledHyperlink ID="AddLink" runat="server" style="display:none" />
<asi:StyledHyperlink ID="EditLink" runat="server" style="display:none" />
<asp:Button ID="DeleteLink" runat="server" OnClick="DeleteLinkClick" style="display:none" />
