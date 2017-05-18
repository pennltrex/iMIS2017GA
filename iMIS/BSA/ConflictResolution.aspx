<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Inherits="Asi.Web.UI.DisplayPageBase" %>
<%@ Import Namespace="Asi" %>
<%@ Import Namespace="Asi.Web.UI" %>

<script runat="server">

    private bool isStaffUser;
    
    public override void CommandButtonRequisites(CommandButtonRequisiteArgs e)
    {
        base.CommandButtonRequisites(e);

        e.SetNeed(CommandButtonType.Cancel, false);
    }

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        ConflictReplace.OnClientClick = "ReturnValue('" + Asi.Business.Common.ConflictingPathResolution.Overwrite.ToString() + "');";
        ConflictCancel.OnClientClick = "ReturnValue('" + Asi.Business.Common.ConflictingPathResolution.Skip.ToString() + "');";
        ConflictCopy.OnClientClick = "ReturnValue('" + Asi.Business.Common.ConflictingPathResolution.CreateCopy.ToString() + "');";
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        isStaffUser = ((Asi.AppContext.CurrentPrincipal.IsInRole("SysAdmin")) ||
                       (Asi.AppContext.CurrentPrincipal.IsInRole("IsStaff")) ||
                       (Asi.AppContext.CurrentPrincipal.IsInRole("full staff")));

        if (!Asi.Security.Utility.SecurityHelper.IsAuthenticatedUser || !isStaffUser)
        {
            ((DisplayPageBase)Page).AddUserMessage(new UserControlMessage(UserControlMessageTypes.Error,
                                                                          ResourceManager.GetPhrase(
                                                                              "AccessDenied", "Access Denied")));
            ConflictResolutionPanel.Visible = false;
        } 
    }      
</script>

<asp:Content ID="Content3" ContentPlaceHolderID="TemplateBody" Runat="Server">
    <script type="text/javascript">
        function ReturnValue(value)
        {
            var oWindow = <%= MasterPageBase.WindowClientScript %>;
            oWindow.result = value;
            oWindow.Close();
        }
    </script>
    <asiweb:PanelTemplateControl ID="ConflictResolutionPanel" runat="server" Collapsible="false" Visible="True">
        <asiweb:TemplateTitle ID="TemplateTitle1" runat="server">
            <asp:Label ID="ConflictInfoLabel" runat="server">There is already a document with the same name in this location.</asp:Label>
        </asiweb:TemplateTitle>
        <div style="margin-bottom: 20px; border: 1px solid black;">
            <asiweb:StyledButton ID="ConflictReplace" runat="server" Text="Replace" AutoPostBack="false" /><br />Replace the document in the destination folder with the file you are moving.
        </div>
        <div style="margin-bottom: 20px; border: 1px solid black;">
            <asiweb:StyledButton ID="ConflictCancel" runat="server" Text="Cancel" AutoPostBack="false" /><br />Don't move. No changes will be made.
        </div>
        <div style="margin-bottom: 20px; border: 1px solid black;">
            <asiweb:StyledButton ID="ConflictCopy" runat="server" Text="Create New Copy" AutoPostBack="false" /><br />Rename the moved document to no longer conflict with the existing document.
        </div>
    </asiweb:PanelTemplateControl>
</asp:Content>