<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" AutoEventWireup="true" %>
<%@ Register TagPrefix="asiweb" TagName="ProgramGroupList" Src="~/AsiCommon/Controls/CertificationManagement/ProgramGroup/ProgramGroupList.ascx" %>

<script runat="server">

    /// <summary>
    /// Handles the Load event of the Page control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            programGroupList.DataBind();
        }
    }
    /// <summary>
    /// Property overridden to avoid the Lister2 from hanging up when an item is deleted
    /// </summary>
    public override bool AjaxAnimationsEnabled
    {
        get { return false; }
    }

</script>

<asp:Content runat="server" ContentPlaceHolderID="TemplateBody">
   <asiweb:ProgramGroupList ID="programGroupList" runat="server" />
</asp:Content>
