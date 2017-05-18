<%@ Page Language="C#"  Inherits="Asi.Web.UI.DisplayPageBase" AutoEventWireup="true"%>

<%@ Register TagPrefix="asiweb" TagName="PurgeInactiveRegistrations" Src="~/AsiCommon/Controls/CertificationManagement/PurgeInactiveRegistrations.ascx" %>

<script runat="server">

    /// <summary>
    /// Property overridden to avoid the Lister2 from hanging up when an item is deleted
    /// </summary>
    public override bool AjaxAnimationsEnabled
    {
        get { return false; }
    }

    /// <summary>
    /// Handles the Load event of the Page control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
    private void Page_Load(object sender, EventArgs e)
    {
        if (!ChildUserControls.Contains(purgeInactiveRegistrations))
        {
            AddChildUserControl(purgeInactiveRegistrations);
        }

        if (!IsPostBack)
        {
            purgeInactiveRegistrations.DataBind();
        }
    }

</script>

<asp:Content runat="server" ContentPlaceHolderID="TemplateBody">
   <asiweb:PurgeInactiveRegistrations ID="purgeInactiveRegistrations" runat="server" />
</asp:Content>