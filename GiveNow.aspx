<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" %>

<script language="C#" runat="server">

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        string url = Asi.Web.UI.AsiCommon.Utils.RedirectHelper.GetShortcutUrl(new NameValueCollection(Request.QueryString),
                       Asi.AppContext.CurrentContext.WebsiteKey, "GiveNow");
        if (!string.IsNullOrEmpty(url))
            Response.Redirect(url);
    }

</script>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody">

</asp:Content>