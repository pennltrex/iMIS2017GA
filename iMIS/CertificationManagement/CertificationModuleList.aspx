<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" AutoEventWireup="true" %>
<%@ Register TagPrefix="asiweb" TagName="CertificationModuleList" Src="~/AsiCommon/Controls/CertificationManagement/CertificationModuleList.ascx" %>

<script runat="server">

    /// <summary>
    /// Property overridden to avoid the Lister2 from hanging up when an item is deleted
    /// </summary>
    public override bool AjaxAnimationsEnabled
    {
        get { return false; }
    }

    /// <summary>
    /// Adding the certificationModuleList control as a child so error messages are displayed
    /// </summary>
    /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        
        if (!ChildUserControls.Contains(certificationModuleList))
        {
            AddChildUserControl(certificationModuleList);
        }
    }
        
    /// <summary>
    /// Handles the Load event of the Page control.
    /// </summary>
    /// <param name="sender">The source of the event.</param>
    /// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            certificationModuleList.DataBind();
        }
    }

</script>

<asp:Content runat="server" ContentPlaceHolderID="TemplateBody">
   <asiweb:CertificationModuleList ID="certificationModuleList" runat="server" />
</asp:Content>