<%@ Page Language="C#" AutoEventWireup="true" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs args) {
        // This is not related to sitemaps; but the purpose
        // of ResetSiteMap, I think, is to perform all the reset
        // needed when the system information changes so we make
        // this call here.
        Asi.Primitive.LicensePrimitive.ResetLicenseCache();
        Asi.Application.AppConfig.Refresh();

        Asi.Web.SiteMapProviderBase.PreviewSiteMapProvider.Clear();
        Asi.Web.SiteMapProviderBase.SiteMapProvider.RebuildSiteMap();
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <meta http-equiv="CACHE-CONTROL" content="NO-CACHE" />
    <meta http-equiv="PRAGMA" content="NO-CACHE" />
    <meta http-equiv="EXPIRES" content="Mon, 1 Jan 2000 00:00:00 GMT" />
    <title></title>
    </head>
    
    <body style="cursor:wait">
    
    </body>
</html>