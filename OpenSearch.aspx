<%@ Page Language="C#" Buffer="true" Inherits="Asi.Web.UI.DisplayPageBase" %>
<script runat="server">
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        Response.ClearContent();
        Response.ClearHeaders();
        Response.ContentType = "text/xml";

        // {0} = Website Title; {1} = search form URL incl {searchTerms}; {2} = website root URL
        string xml = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?><OpenSearchDescription xmlns=\"http://a9.com/-/spec/opensearch/1.1/\"><ShortName>{0} Search</ShortName><Description>Search {0}</Description><Url type=\"text/html\" method=\"get\" template=\"{1}\"/><Image>{2}favicon.ico</Image><InputEncoding>UTF-8</InputEncoding><SearchForm>{2}</SearchForm></OpenSearchDescription>";
        EnsureWebsite();
        using (Asi.Security.SecurityContext.ImpersonateAnonymous())
        {
            if (iMISWebsite != null)
                Response.Write(string.Format(xml, iMISWebsite.Title, iMISWebsite.WebsiteLink + "iMIS/ContentManagement/Search.aspx?SearchTerms={searchTerms}", iMISWebsite.WebsiteLink));
        }
        Response.End();
    }
</script>