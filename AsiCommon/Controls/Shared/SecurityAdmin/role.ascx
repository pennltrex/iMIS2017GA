<%@ Reference Control="~/asicommon/controls/shared/securityadmin/roleedit.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SecurityAdmin.RolesPortfolio" Codebehind="Role.ascx.cs" %>

<script type="text/javascript">
    function RefreshParentRadWindow() {
        var oWindow = GetRadWindow();
        if (oWindow != null && oWindow.BrowserWindow != null) {
            var url = oWindow.BrowserWindow.location.href;
            oWindow.BrowserWindow.location.href = url;
        }
    }
</script>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

<asiweb:PanelTemplateControl2 runat="server" ID="RoleEditor" TemplateTitle="Edit Role" Collapsible="False">
   <asp:placeholder id="SubPlaceHolder" runat="server"></asp:placeholder>
    <br/>
    <div class="CommandBar">
	    <asiweb:StyledButton runat="server" id="btnDelete" onclick="btnDelete_ServerClick" />
	    <asiweb:StyledButton runat="server" id="btnSave" onclick="btnSave_ServerClick" CommandButtonType="Save" />
	    <asiweb:StyledButton runat="server" id="btnCancel" onclick="btnCancel_ServerClick" CommandButtonType="Cancel" />
    </div>
</asiweb:PanelTemplateControl2>

