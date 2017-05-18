<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" AutoEventWireup="true" %>
<%@ Import namespace="Asi.Web.UI"%>
<%@ Register TagPrefix="asiweb" TagName="CertificationModuleRegistrationList" Src="~/AsiCommon/Controls/CertificationManagement/CertificationModuleRegistrationList.ascx" %>

<script runat="server">

    protected override void OnPreInit(EventArgs e)
    {
        base.OnPreInit(e);

        Asi.Web.Utilities.ProcessBrowserLanguages(Page.Request);
    }
    
    /// <seealso cref="DisplayPageBase.OnInit(EventArgs)" />
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        if (!ChildUserControls.Contains(certificationModuleRegistrationList))
        {
            AddChildUserControl(certificationModuleRegistrationList);
        }
    }

    /// <seealso cref="DisplayPageBase.OnLoad(EventArgs)" />
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (!Page.IsPostBack)
        {
            DataBind();
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
   <asiweb:CertificationModuleRegistrationList ID="certificationModuleRegistrationList" runat="server" />
</asp:Content>