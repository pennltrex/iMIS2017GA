<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" AutoEventWireup="true" %>
<%@ Register TagPrefix="asiweb" TagName="LocationEdit" Src="~/AsiCommon/Controls/ExperienceManagement/LocationEdit.ascx" %>

<script runat="server">

    /// <seealso cref="Asi.Web.UI.DisplayPageBase.OnInit(EventArgs)" />
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        if (!ChildUserControls.Contains(locationEdit))
        {
            AddChildUserControl(locationEdit);
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
   <asiweb:LocationEdit ID="locationEdit" runat="server" />
</asp:Content>