<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" AutoEventWireup="true" %>
<%@ Import namespace="Asi.Web.UI"%>
<%@ Register TagPrefix="asiweb" TagName="ExperienceDefinition" Src="~/AsiCommon/Controls/ExperienceManagement/ExperienceDefinition.ascx" %>

<script runat="server">

    /// <seealso cref="DisplayPageBase.OnInit(EventArgs)" />
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        if (!ChildUserControls.Contains(experienceDefinition))
        {
            AddChildUserControl(experienceDefinition);
        }

        // This property is set here because for some reason when you click Cancel in a child page the UrlReferrer is set to null
        if (string.IsNullOrEmpty(CancelUrl))
            CancelUrl = String.Concat("~/iMIS/ExperienceManagement/Program.aspx?iUniformKey=", ((Asi.Business.ExperienceManagement.ExperienceDefinition)experienceDefinition.AtomObject[0]).ProgramKey, "&TemplateType=A");
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
   <asiweb:ExperienceDefinition ID="experienceDefinition" runat="server" />
</asp:Content>