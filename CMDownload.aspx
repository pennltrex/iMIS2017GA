<%@ Page Language="C#" AutoEventWireup="true" %>

<script runat="server">
    private string ProtectedPath = "C:\\Program Files (x86)\\ASI\\iMIS0\\indexServiceProtected";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Guid contentKey = new Guid(Request.QueryString["ContentKey"]);
        Guid contentItemKey = new Guid(Request.QueryString["ContentItemKey"]);

        Asi.Business.BusinessContainer container = new Asi.Business.BusinessContainer("CMDownload");
        Asi.Business.ContentManagement.Content contentRecord = Asi.Business.ContentManagement.Content.GetFromContentKey(contentKey, container, true, false);
        if (contentRecord == null)
        {
            Response.Write(Asi.ResourceManager.GetPhrase("NoPermissionToViewFile", "You do not have permission to view this file."));
            return;
        }
        Asi.Business.ContentManagement.ContentFile contentFile = null;
        foreach (Asi.Business.ContentManagement.ContentItem item in contentRecord.Items)
        {
            if (item.ContentItemKey.Equals(contentItemKey))
            {
                contentFile = item as Asi.Business.ContentManagement.ContentFile;
                break;
            }
        }

        if (contentFile == null)
            throw new System.IO.FileNotFoundException();

        string filename = HttpUtility.UrlEncode(contentFile.FileName) + "." + contentFile.FileTypeCode.ToLowerInvariant();
        string filepath = ProtectedPath.TrimEnd('\\') + contentRecord.PublishPath.TrimEnd('\\') + "\\" + filename;
        if (!System.IO.File.Exists(filepath))
            throw new System.IO.FileNotFoundException(Asi.ResourceManager.GetPhrase("CMDownloadFileNotFound", "Download file {0} could not be located.", contentFile.FileName), filepath);

        Response.ClearContent();
        Response.ClearHeaders();
        Response.AddHeader("Content-Disposition", string.Format("attachment; filename=\"{0}\"", filename));
        string mimeType;
        Asi.Business.BusinessItem fileTypeRef = Asi.Business.BusinessController.BusinessItem("FileTypeRef", new object[] { contentFile.FileTypeCode }, container);
        if (fileTypeRef != null && !string.IsNullOrEmpty(fileTypeRef.GetString("MimeType")))
            mimeType = fileTypeRef.GetString("MimeType");
        else
            mimeType = "application/octet-stream";
        Response.ContentType = mimeType;
        Response.TransmitFile(filepath);
        // EDM 7/6/2007 - DT 20109 - Closing the response causes a "server connection reset" error on the client and cancels the download.
        try
        {
            Response.Flush();
        }
        catch (HttpUnhandledException ex)
        {
            if (ex.ErrorCode != 0x800703E3)   // happens when the user clicks Cancel on the download dialog; we can safely swallow that exception
                throw;
        }
    }
</script>