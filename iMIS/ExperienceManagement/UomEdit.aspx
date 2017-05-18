<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" AutoEventWireup="true" %>
<%@ Register TagPrefix="asiweb" TagName="UomEdit" Src="~/AsiCommon/Controls/ExperienceManagement/UomEdit.ascx" %>

<script runat="server">

    /// <seealso cref="Asi.Web.UI.DisplayPageBase.OnInit(EventArgs)" />
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        if (!ChildUserControls.Contains(uomEdit))
        {
            AddChildUserControl(uomEdit);
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
   <asiweb:UomEdit ID="uomEdit" runat="server" />
</asp:Content>