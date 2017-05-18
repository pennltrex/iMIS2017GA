<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" AutoEventWireup="true" %>
<%@ Import namespace="Asi.Web.UI"%>
<%@ Register TagPrefix="asiweb" TagName="ManageProviders" Src="~/AsiCommon/Controls/ExperienceManagement/ManageProviders.ascx" %>

<script runat="server">

    /// <seealso cref="Asi.Web.UI.DisplayPageBase.OnInit(EventArgs)" />
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        if (!ChildUserControls.Contains(manageProviders))
        {
            AddChildUserControl(manageProviders);
        }
    }

    /// <seealso cref="Asi.Web.UI.DisplayPageBase.OnLoad(EventArgs)" />
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
   <asiweb:ManageProviders ID="manageProviders" runat="server" />
</asp:Content>