<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" MasterPageFile="~/Templates/MasterPages/Empty.master" %>
<%@ Import Namespace="Asi" %>
<%@ Import Namespace="Asi.Providers.Profile" %>
<%@ Import Namespace="Asi.Soa.Core.DataContracts" %>
<%@ Import Namespace="Asi.Soa.Events.DataContracts" %>
<%@ Import Namespace="Asi.Web.UI" %>
<%@ Import Namespace="Asi.Web.UI.AsiCommon.Utils" %>
<%@ Import Namespace="Asi.Soa.Core.ServiceContracts" %>

<script language="C#" runat="server">

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        if (Asi.AppContext.CurrentContext != null && Asi.AppContext.CurrentContext.WebsiteKey != Guid.Empty)
        {
            string shortcutName;
            Guid contentKey = Guid.Empty;
            string staffShortcut = string.Empty;
            Guid staffContentKey = Guid.Empty;
            string publicShortcut = string.Empty;
            Guid publicContentKey = Guid.Empty;
            var eventKey = Request.QueryString["EventKey"];
            var isTemplate = (Request.QueryString["IsTemplate"] ?? string.Empty).Equals("true", StringComparison.OrdinalIgnoreCase);
            string url = string.Empty;

            if (eventKey != null)
            {
                var eventData = EntityManager.FindByIdentity<EventSummaryData>(eventKey);
                if (eventData != null)
                {
                    if (!isTemplate) ProfileHelper.AddRecentItem(HttpContext.Current.Profile, new RecentlyAccessedItem(eventKey, RecentlyAccessedItemType.Events, eventData.Name));

                    if (eventData.DisplayLayouts != null)
                    {
                        var displayLayout = GetDisplayLayout(eventData.DisplayLayouts, LayoutTypeData.EventDefault);
                        if (displayLayout != null)
                        {
                            if (!string.IsNullOrEmpty(displayLayout.LayoutDirectory))
                            {
                                publicShortcut = displayLayout.LayoutDirectory.Substring(1);
                            }
                            else if (displayLayout.LayoutDocument != null && !string.IsNullOrEmpty(displayLayout.LayoutDocument.DocumentId))
                            {
                                publicContentKey = new Guid(displayLayout.LayoutDocument.DocumentId);
                            }
                        }

                        displayLayout = GetDisplayLayout(eventData.DisplayLayouts, LayoutTypeData.EventOwner);
                        if (displayLayout != null)
                        {
                            if (!string.IsNullOrEmpty(displayLayout.LayoutDirectory))
                            {
                                staffShortcut = displayLayout.LayoutDirectory.Substring(1);
                            }
                            else if (displayLayout.LayoutDocument != null && !string.IsNullOrEmpty(displayLayout.LayoutDocument.DocumentId))
                            {
                                staffContentKey = new Guid(displayLayout.LayoutDocument.DocumentId);
                            }
                        }
                    }
                }
            }
            
            // If the logged in user is Admin or Staff
            // then redirect to the EventDashboard page, otherwise send to the EventDetail page 

            bool isStaffUser = ((Asi.AppContext.CurrentPrincipal.IsInRole("SysAdmin")) ||
                                    (Asi.AppContext.CurrentPrincipal.IsInRole("IsStaff")) ||
                                    (Asi.AppContext.CurrentPrincipal.IsInRole("full staff")));

            if (isStaffUser && !isTemplate)
            {
                shortcutName = (!string.IsNullOrEmpty(staffShortcut)) ? staffShortcut : "EventDashboard";
                contentKey = (staffContentKey != Guid.Empty) ? staffContentKey : Guid.Empty;
            }
            else
            {
                shortcutName = (!string.IsNullOrEmpty(publicShortcut)) ? publicShortcut : "EventDetail";
                contentKey = (publicContentKey != Guid.Empty) ? publicContentKey : Guid.Empty;
            }

            if (contentKey != Guid.Empty)
            {
                url = RedirectHelper.GetContentKeyUrl(new NameValueCollection(Request.QueryString),
                    Asi.AppContext.CurrentContext.WebsiteKey, contentKey);
            }
            else if (!string.IsNullOrEmpty(shortcutName))
            {
                url = RedirectHelper.GetShortcutUrl(new NameValueCollection(Request.QueryString),
                    Asi.AppContext.CurrentContext.WebsiteKey, shortcutName);
            }
            
            //add the website key to prevent losing theme/context
            if (!string.IsNullOrEmpty(url) && !url.Contains("WebsiteKey"))
                url = string.Format("{0}{1}WebsiteKey={2}", url, url.Contains("?") ? "&" : "?",
                    Asi.AppContext.CurrentContext.WebsiteKey.ToString());
            
            if (!string.IsNullOrEmpty(url))
                Response.Redirect(url);
            else
            {
                AddUserMessage(new UserControlMessage(GetType().Name,
                        UserControlMessageTypes.Error, ResourceManager.GetPhrase("ContentNotFound", "The requested content could not be found.")));
            }
        }
    }

    private static DisplayLayoutData GetDisplayLayout(IEnumerable<DisplayLayoutData> displayLayoutDataCollection, LayoutTypeData layoutTypeData)
    {
        if (displayLayoutDataCollection == null) return null;
        var displayDocument = displayLayoutDataCollection.FirstOrDefault(d => d.LayoutType == layoutTypeData);
        return displayDocument;
    }


</script>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody">

</asp:Content>
