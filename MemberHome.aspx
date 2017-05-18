<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" %>
<%@ Import Namespace="Asi.Business.ContentManagement" %>

<script language="C#" runat="server">

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        string url = Asi.Web.UI.AsiCommon.Utils.RedirectHelper.GetShortcutUrl(new NameValueCollection(Request.QueryString),
                                                  Asi.AppContext.CurrentContext.WebsiteKey, "MemberHome");

        if (!string.IsNullOrEmpty(url))
        {
            bool hasWebsite = url.Contains(Asi.AppContext.CurrentContext.WebsiteKey.ToString());
            var websiteName = url;
            websiteName = websiteName.TrimStart('/');
            int length = websiteName.IndexOf('/') < 0 ? 0 : websiteName.IndexOf('/');
            websiteName = websiteName.Substring(websiteName.Substring(0, length + 1).Length);
            length = websiteName.IndexOf('/') <= 0 ? 0 : websiteName.IndexOf('/');
            var otherWebsite = length > 0 ? Website.FindWebsiteByName(websiteName.Substring(0, length)) : null;
            if (otherWebsite != null)
                hasWebsite = true;
            if(!hasWebsite)
                url = string.Format("{0}{1}WebsiteKey={2}", url, url.Contains("?") ? "&" : "?",
                    Asi.AppContext.CurrentContext.WebsiteKey.ToString());
                
            Response.Redirect(url);
        }
    }

</script>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody">

</asp:Content>
