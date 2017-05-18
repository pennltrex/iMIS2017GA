<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" AutoEventWireup="true" %>
<%@ Import namespace="Asi.Web.UI.Common.Controls.ExperienceManagement"%>
<%@ Import namespace="Asi.Web.UI"%>
<%@ Register TagPrefix="asiweb" TagName="Offering" Src="~/AsiCommon/Controls/ExperienceManagement/OfferingMain.ascx" %>

<script runat="server">

    /// <seealso cref="DisplayPageBase.OnInit(EventArgs)" />
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        if (!ChildUserControls.Contains(offering))
        {
            AddChildUserControl(offering);
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

</script>

<asp:Content runat="server" ContentPlaceHolderID="TemplateBody">
   <asiweb:Offering ID="offering" runat="server" />
</asp:Content>