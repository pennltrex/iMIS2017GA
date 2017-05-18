<%@ Page Language="C#" %>
<script runat="server">
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (!Asi.Security.AppPrincipal.CurrentIdentity.IsAuthenticated)
        {
            Asi.ContentManagerNet.Utilities.RedirectToLogin(this, false, true);
            return;
        }

        if (!string.IsNullOrEmpty(Request.QueryString["ContentKey"]))
        {
            Guid contentKey = new Guid(Request.QueryString["ContentKey"]);
            Asi.Business.Common.DocumentTypeUIMode mode = (Asi.Business.Common.DocumentTypeUIMode)Enum.Parse(typeof(Asi.Business.Common.DocumentTypeUIMode), Request.QueryString["Mode"]);
            
            // First we check to see if it's a document
            Asi.Business.Common.UniformRegistry uniform = Asi.Business.Common.UniformRegistryController.UniformRegistry(contentKey, Asi.AppContext.CurrentContext.StatefulBusinessContainer);
            Asi.TypeRegistry.ComponentRegistry registry = Asi.TypeRegistry.ComponentRegistryController.ComponentRegistry(uniform.ComponentKey, Asi.AppContext.CurrentContext.StatefulBusinessContainer);
            if (uniform != null)
            {
                string url = null;
                Asi.Business.Common.Document document = uniform.UniformItem as Asi.Business.Common.Document;
                if (document != null)
                {
                    if (mode == Asi.Business.Common.DocumentTypeUIMode.Execute && document.DocumentTypeCode.Equals("CON"))
                    {
                        Asi.Business.ContentManagement.Content content = Asi.Business.ContentManagement.Content.GetFromContentKey(contentKey);
                        url = content.PublishLocation;
                    }
                    else
                    {
                        url = Asi.Business.Common.DocumentType.GetUIPath(document.DocumentTypeCode, mode);
                    }
                }
                if (string.IsNullOrEmpty(url))
                {
                    // Try to get it from the Component Registry
                    switch (mode)
                    {
                        case Asi.Business.Common.DocumentTypeUIMode.Edit:
                            url = registry.ComponentEditLink;
                            break;
                        case Asi.Business.Common.DocumentTypeUIMode.Execute:
                        default:
                            url = registry.ComponentExecuteLink;
                            break;
                    }
                }

                if (string.IsNullOrEmpty(url))
                    throw new ArgumentException(Asi.ResourceManager.GetPhrase("CouldNotDetermineUniformItemLink", "Unable to determine the target URL for the uniform item {0}, type {1}:{2}, mode {3}.", uniform.UniformKey, registry.Name, registry.InterfaceName, mode));

                if (url.Contains("{0}"))
                    url = string.Format(url, contentKey);
                else
                    url = Asi.Web.Utilities.AppendToQueryString(url, "iUniformKey", contentKey);
                Response.Redirect(url, true);
            }
        }
    }
</script>