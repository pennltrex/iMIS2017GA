<%@ Page language="C#" AutoEventWireup="true" %>
<%@ OutputCache Duration="1800" VaryByParam="iUniformKey" %>

<script language="C#" runat="server">
    private void Page_Load(object sender, EventArgs e)
    {
	    if (Request.QueryString["iUniformKey"] != null)
	    {
            Guid uniformKey = new Guid(Request.QueryString["iUniformKey"]);
            Asi.Business.Common.Document document = Asi.Business.Common.DocumentController.GetLatestVersionByVersionKey(uniformKey, Asi.AppContext.CurrentContext.StatelessBusinessContainer);
            if (document != null)
            {
                Asi.Business.BusinessItem fileTypeRef = Asi.Cache.LazyCache.GetItem("FileTypeRef", new object[] { document.DocumentTypeCode });
                string mimeType = fileTypeRef.GetString("MimeType");
                if (!string.IsNullOrEmpty(mimeType) && mimeType.Contains(","))
                    mimeType = mimeType.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries)[0];
                if (fileTypeRef != null && !string.IsNullOrEmpty(mimeType) && 
                    (mimeType.StartsWith("image/", StringComparison.InvariantCultureIgnoreCase) || 
                     mimeType.StartsWith("video/", StringComparison.InvariantCultureIgnoreCase) ||
                     mimeType.StartsWith("audio/", StringComparison.InvariantCultureIgnoreCase)))
                {
                    Response.Clear();
                    Response.ContentType = mimeType;
                    Response.OutputStream.Write(document.Blob, 0, document.Blob.Length);
                    Response.Flush();
                    Response.End();
                }
            }

            Response.Clear();
            Response.StatusCode = 404;
            Response.End();
	    }
    }
</script>