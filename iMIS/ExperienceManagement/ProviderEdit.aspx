<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" AutoEventWireup="true" %>
<%@ Register TagPrefix="asiweb" TagName="ProviderEdit" Src="~/AsiCommon/Controls/ExperienceManagement/ProviderEdit.ascx" %>

<script runat="server">

    /// <seealso cref="Asi.Web.UI.DisplayPageBase.OnInit(EventArgs)" />
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        if (!ChildUserControls.Contains(providerEdit))
        {
            AddChildUserControl(providerEdit);
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
   <asiweb:ProviderEdit ID="providerEdit" runat="server" />
</asp:Content>