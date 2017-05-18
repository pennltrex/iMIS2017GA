<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" %>

<script language="C#" runat="server">

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        
        // We look for a nav item within the current site with NavigationCode=GiftDetail and redirect there
        if (Asi.AppContext.CurrentContext != null && Asi.AppContext.CurrentContext.WebsiteKey != Guid.Empty)
        {
            string url = Asi.Web.UI.AsiCommon.Utils.RedirectHelper.GetShortcutUrl(new NameValueCollection(Request.QueryString),
                                                  Asi.AppContext.CurrentContext.WebsiteKey, "GiftDetail");

            if (!string.IsNullOrEmpty(url))
                Response.Redirect(url);
        }
    }

</script>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody">

</asp:Content>
