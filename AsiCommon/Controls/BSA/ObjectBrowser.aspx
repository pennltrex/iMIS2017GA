<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" MasterPageFile="~/Templates/MasterPages/Empty.master" Title="Document System" %>
<%@ Import Namespace="Asi.Soa.ClientServices" %>
<%@ Import Namespace="Asi.Soa.Core.DataContracts" %>
<%@ Import Namespace="Asi.Core.Performance" %>
<%@ Register TagPrefix="bsa" TagName="ObjectBrowserControl" Src="~/AsiCommon/Controls/BSA/Objectbrowser2.ascx" %>

<script language="C#" runat="server">

    [System.Web.Services.WebMethod]
    static public string GetActionLink(Asi.Web.UI.PageOperation action, object templateType, string docType, Guid hierarchyKey, Guid documentVersionKey, Guid folderHierarchyKey, int itemCount, bool closeWindowOnCommit, Guid websiteKey, Guid pageInstanceKey)
    {
        return "about:blank";
    }
        
    public bool NavigationBrowserMode
    {
        get
        {
            if (ViewState["NavigationBrowserMode"] == null)
            {
                if (!string.IsNullOrEmpty(Request["NavigationBrowserMode"]))
                    ViewState["NavigationBrowserMode"] = bool.Parse(Request["NavigationBrowserMode"]);
                else
                    ViewState["NavigationBrowserMode"] = false;
            }

            return (bool)ViewState["NavigationBrowserMode"];
        }
        set
        {
            ViewState["NavigationBrowserMode"] = value;
        }
    }
    protected override void EnsureChildUserControls()
    {
        base.EnsureChildUserControls();

        ChildUserControls.Add(ObjectBrowser1);
    }
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        // Handle scrolling on this page, don't scroll on master page
        ((Asi.Web.UI.MasterPageBase)Master).ScrollContentPane = false;
    }
    
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (!Page.User.Identity.IsAuthenticated)
            Response.Redirect("~/AsiCommon/Controls/Shared/FormsAuthentication/Login.aspx");

        var user = Asi.ContentManagerNet.SessionState.User;
        if ((user == null || (!user.IsStaff && Session["OverrideStaffCheck"] == null)) && !AllowObjectBrowser(Asi.AppContext.CurrentIdentity.UserId))
        {           
            Response.Redirect("~/AsiCommon/Controls/Shared/FormsAuthentication/Login.aspx");
        }
        
        if (!Page.IsPostBack)
        {
            bool showRecycleBin = true;
            if (Request.QueryString["ShowRecycleBin"] != null)
                showRecycleBin = bool.Parse(Request.QueryString["ShowRecycleBin"]);
            ObjectBrowser1.ShowRecycleBin = showRecycleBin;

            if (Request["DocumentPath"] != null)
            {
                ObjectBrowser1.DocumentPath = Request["DocumentPath"];
                // If the selected path is a nav path, use a navigation browser.
                if (ObjectBrowser1.DocumentPath.StartsWith("~"))
                    NavigationBrowserMode = true;
            }
            else if (Request["FolderHierarchyKey"] != null)
            {
                ObjectBrowser1.DocumentHierarchyKey = new Guid(Request["FolderHierarchyKey"]);
                // If the selected path is a nav path, use a navigation browser.
                try
                {
                    Asi.Business.Common.DocumentHierarchy h = Asi.Business.Common.DocumentHierarchyController.DocumentHierarchy(ObjectBrowser1.DocumentHierarchyKey, Container, false, false);
                    if (h != null && h.Path.StartsWith("~"))
                        NavigationBrowserMode = true;
                }
                catch (Exception) {}
            }
            else if (Request["DocumentHierarchyKey"] != null)
            {
                // If the selected path is a nav path, use a navigation browser.
                try
                {
                    Asi.Business.Common.DocumentHierarchy h = Asi.Business.Common.DocumentHierarchyController.DocumentHierarchy(ObjectBrowser1.DocumentHierarchyKey, Container, false, false);
                    if (h != null && h.Path.StartsWith("~"))
                        NavigationBrowserMode = true;
                }
                catch (Exception) { }
            }
            else
                ObjectBrowser1.DocumentPath = "$";

            // Set selected root from Profile
            if (Profile.UI.DocumentSystemLastRootKey != Guid.Empty)
            {
                //ObjectBrowser1.RootHierarchyKey = Profile.UI.DocumentSystemLastRootKey;
            }

            // CAREFUL: I want the following codeblock to execute ONLY if viewing navigation or the HideRootList param is false.
            // If no value is sent, we will default to true.  There are not many places we want to let the user pick the root.
            if(NavigationBrowserMode || 
                (Request.QueryString["HideRootList"] != null && !Convert.ToBoolean(Request.QueryString["HideRootList"])))
            {

                string contentTypeKey = string.Empty;
                NameValueCollection collection = GetQueryStringCollection(HttpContext.Current.Request.UrlReferrer.Query);
                if (collection != null && collection.Count > 0 && HttpContext.Current.Server.UrlDecode(collection["ContentTypeKey"]) != null)
                    contentTypeKey = HttpContext.Current.Server.UrlDecode(collection["ContentTypeKey"]);

                if (!string.IsNullOrEmpty(contentTypeKey))
                {
                    Asi.Business.ContentManagement.ContentType.ContentTypeRegistry contentType =
                        Asi.Business.ContentManagement.ContentType.ContentTypeRegistry.GetFromContentTypeKey(new Guid(contentTypeKey), Container);

                    if (contentType.TypeName == "Asi.Business.ContentManagement.ContentBigButtonPanel")
                    {
                        UsePerspectiveRoot();
                    }
                    else
                    {
                        ObjectBrowser1.RootListDataValueField = "HierarchyRootKey";
                        ObjectBrowser1.RootListDataTextField = "Description";
                        ObjectBrowser1.RootListDataSource = GetRoots();
                    }
                }
                else
                {
                    if (NavigationBrowserMode)
                    {
                        UsePerspectiveRoot();
                    }
                }
            }
            DataBind();
        }

        ObjectBrowser1.RootChanged += (ObjectBrowser1_RootChanged);
    }

    private void UsePerspectiveRoot()
    {
        ObjectBrowser1.RootListDataValueField = "RootHierarchyKey";
        ObjectBrowser1.RootListDataTextField = "PerspectiveName";
        ObjectBrowser1.RootListDataSource = GetPerspectives();
    }

    // variables used by AllowObjectBrowser
    private static readonly IdentityData documentIdentity = new IdentityData("Document", String.Empty);
    private static readonly PermissionDataCollection permissionData = new PermissionDataCollection {
                        new PermissionData("Update",  documentIdentity)};
    private static readonly string cacheName = Guid.NewGuid().ToString();

    /// <summary>
    /// Returns an indication of whether the indicated user has permission to see the Objectbrowser
    /// </summary>
    /// <param name="userid">The userid to be checked.</param>
    /// <returns>True if the user has permission to display the ObjectBrowser</returns>
    /// 
    private static bool AllowObjectBrowser(string userid)
    {
        // The EntityManager caches this stuff with a "short" lifetime, but we want something
        // more aggressive here.  This permission information should not change much,  
        // so we use a separate cache with a longer lifetime.
        var permission = (bool?)CacheManager.Instance.GetData(cacheName, userid.ToUpperInvariant());
        if (permission == null)
        {
            var entityManager = new EntityManager(userid);
            PermissionResultCollection permissions = entityManager.HasPermission(permissionData);
            permission = permissions.HasPermission("Update", documentIdentity);
        }

        if (permission.HasValue)
        {
            CacheManager.Instance.Add(cacheName, userid.ToUpperInvariant(), permission);
            return permission.Value;
        }
        return false;
    }

    protected void ObjectBrowser1_RootChanged(object sender, Asi.Web.UI.Common.BSA.ObjectBrowserEventArgs e)
    {
        DropDownList ddl = sender as DropDownList;
        if (ddl == null) return;

        if (string.IsNullOrEmpty(ddl.SelectedValue)) return;

        // Set the last selected root to User's Profile
        Guid key = new Guid(ddl.SelectedValue);
        Profile.UI.DocumentSystemLastRootKey = key;
    }

    /// <summary>
    /// Return all the roots
    /// </summary>
    /// <returns></returns>
    protected System.Data.DataRow[] GetRoots()
    {
        Asi.Business.Common.HierarchyRootController rootController = Asi.Business.Common.HierarchyRootController.NewHierarchyRootController(Container);
        Asi.Business.BusinessFilter[] filter;
        if (NavigationBrowserMode)
        {
            filter = new Asi.Business.BusinessFilter[1] { new Asi.Business.BusinessFilter("Name", Asi.ComparisonType.Equal, "~") };
        }
        else
        {
            // we don't want to show the Website Navigation Perspectives in the Document System Browser
            filter = new Asi.Business.BusinessFilter[1] { new Asi.Business.BusinessFilter("Name", Asi.ComparisonType.NotEqual, "~") };
        }
        return rootController.SelectWithFilter(filter, true, "Description");
    }

    /// <summary>
    /// Return all the perspectives
    /// </summary>
    /// <returns></returns>
    protected System.Data.DataRow[] GetPerspectives()
    {
        Asi.Business.ContentManagement.PerspectiveController controller = Asi.Business.ContentManagement.PerspectiveController.NewPerspectiveController();
        System.Data.DataRow[] rows = controller.SelectWithFilter(null, true, "PerspectiveName");
        return rows;
    }

    /// <summary>
    /// Get Querystring name value collection
    /// </summary>
    /// <returns>Returns a name value pair collection</returns>
    public static NameValueCollection GetQueryStringCollection(string url)
    {
        string keyValue = string.Empty;
        string _url = string.Empty; 
        NameValueCollection collection = new NameValueCollection();
        _url = url.Replace("&&", "&");
        string[] querystrings = _url.Split('&');
        if (querystrings != null && querystrings.Length > 0)
        {
            for (int i = 0; i < querystrings.Length; i++)
            {
                string[] pair = querystrings[i].Split('=');
                collection.Add(pair[0].Trim('?'), pair[1]);
            }
        }
        return collection;
    }


</script>
<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <script id="ResizeEvent" type="text/javascript">
    //<![CDATA[
        addResizeEvent(Window_Resize);
    //]]>
    </script>

    <bsa:ObjectBrowserControl id="ObjectBrowser1" Runat="server" Mode="Standard" PublishedOnly="false" 
    TypeFilter="AVI,BMP,COM,CON,COP,CPE,CRA,CTY,DOC,EML,FLV,FOL,FIG,HTM,IQD,JPE,JPG,MEA,MEP,MOV,MP2,MP3,MPE,MPG,NPE,OP2,OPP,PDF,PNG,POS,PPT,RA,RAM,RCT,RDL,REL,RES,RFA,RFM,RPT,RSP,RTF,SLP,SPE,SRT,TIF,TXT,WAV,WFD,WLT,WMM,WMV,WPD,WRI,XLS,XML,XPE,ZIP"/>
</asp:Content>