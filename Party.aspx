<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="Asi" %>
<%@ Import Namespace="Asi.Providers.Profile" %>
<%@ Import Namespace="Asi.Soa.ClientServices" %>
<%@ Import Namespace="Asi.Soa.Core.DataContracts" %>
<%@ Import Namespace="Asi.Soa.Membership.DataContracts" %>
<%@ Import Namespace="Asi.Web.UI" %>

<script type="text/C#" runat="server">

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        
        // Find out if the logged in user has access to update the selected user and redirect to the appropriate page
        // We look for a nav item within the current site with NavigationCode=navCode and redirect there
        if (Asi.AppContext.CurrentContext != null && Asi.AppContext.CurrentContext.WebsiteKey != Guid.Empty)
        {
            string name = string.Empty;
            string shortcutName = string.Empty;
            string id = Asi.Security.Utility.SecurityHelper.GetSelectedImisId(Page.Request);
                       
            // If there is a selected ID, check to see if it's an organization or person and
            // heck if the user has permissions to update the record before deciding whether to send them to 
            // the organization profile, organization account, profile, member account or staff account page
            
            // Account for the [LoggedInUserId] variable, which overrides any On Behalf Of or impersonation behavior
            if (id.Equals("[loggedinuserid]", StringComparison.OrdinalIgnoreCase))
                id = Asi.AppContext.CurrentIdentity.LoginIdentity;
            
            // Handles links that have no id - such as a non-user in an event roster
            if (id.ToLowerInvariant() == "noid")
            {
                var msg = ResourceManager.GetPhrase("NoId", "The contact cannot be found.");
                AddUserMessage(new UserControlMessage(GetType().Name, UserControlMessageTypes.Error, msg));
                return;
            }

            if (!string.IsNullOrEmpty(id))
            {
                // Determine if they have permission
                var entityManager = new EntityManager();
                var hasFindPermission = entityManager.HasPermission("Find", new IdentityData("Party", id));//check this ahead of any actual find request to avoid security exception
                if (!hasFindPermission)
                {
                    if (Asi.AppContext.CurrentIdentity.IsAuthenticated)
                    {
                        var msg = ResourceManager.GetPhrase("NotAuthorized", "To view the requested page, you must be authorized by your system administrator.");
                        AddUserMessage(new UserControlMessage(GetType().Name, UserControlMessageTypes.Error, msg));
                        return;
                    }
                    Response.Redirect(FormsAuthentication.LoginUrl + "?ReturnUrl=" + Page.Server.UrlEncode(Page.Request.RawUrl));
                }
                
                if (hasFindPermission)
                {
                    // Find the selected contact
                    MembershipManager membershipManager = new MembershipManager(entityManager);
                    PartyData party = membershipManager.FindPartyByPartyId(id);
                    if (party != null)
                        name = party.Name;

                    // Check to see if the record is an organization record
                    if (party is IOrganizationData)
                    {
                        if (membershipManager.UpdatePermitted(id))
                            shortcutName = Asi.AppContext.CurrentPrincipal.IsInRole("customerlevel1") || Asi.AppContext.CurrentPrincipal.IsInRole("SysAdmin") ? "OrganizationFullAccount" : "OrganizationAccount";
                        else
                            shortcutName = "Organization";
                    }
                    else // Not an organization, so this must be a person
                    {
                        // Staff users with the right module authorization will go to the full account page, members will go to "My Account"
                        if (membershipManager.UpdatePermitted(id))
                            shortcutName = Asi.AppContext.CurrentPrincipal.IsInRole("customerlevel1") || Asi.AppContext.CurrentPrincipal.IsInRole("SysAdmin") ? "FullAccount" : "MyAccount";
                        else  
                            shortcutName = "Profile";
                    }
                }
            }

            // Find the URL to redirect to by looking up the shortcut for particular site
            string url = string.IsNullOrEmpty(shortcutName)
                             ? String.Empty
                             : Asi.Web.UI.AsiCommon.Utils.RedirectHelper.GetShortcutUrl(
                                 new NameValueCollection(Request.QueryString),
                                 Asi.AppContext.CurrentContext.WebsiteKey, shortcutName);
            
            // If failed to find the FullAccount shortcut url then default to MyAccount shortcut url
            if (shortcutName.Equals("FullAccount") && string.IsNullOrEmpty(url))
                url = string.IsNullOrEmpty("MyAccount")
                             ? String.Empty
                             : Asi.Web.UI.AsiCommon.Utils.RedirectHelper.GetShortcutUrl(new NameValueCollection(Request.QueryString),
                                 Asi.AppContext.CurrentContext.WebsiteKey, "MyAccount");
            
            //add the website key to prevent losing theme/context
            if (!string.IsNullOrEmpty(url) && !url.Contains("WebsiteKey"))
                url = string.Format("{0}{1}WebsiteKey={2}", url, url.Contains("?") ? "&" : "?",
                    Asi.AppContext.CurrentContext.WebsiteKey.ToString());

            // Only redirect if a url for shortcut was found
            if (!string.IsNullOrEmpty(url))
            {
                if (!string.IsNullOrEmpty(id) && !id.Equals(Asi.AppContext.CurrentIdentity.LoginIdentity, StringComparison.OrdinalIgnoreCase))
                    ProfileHelper.AddRecentItem(HttpContext.Current.Profile, new RecentlyAccessedItem(id, RecentlyAccessedItemType.Contacts, name));
                Response.Redirect(url);
            }
            else
            {
                // Otherwise, display an error message telling the user to contact their site administrator
                AddUserMessage(new UserControlMessage(GetType().Name,
                       UserControlMessageTypes.Error, ResourceManager.GetPhrase("NoShortcutUrl",
                       string.Format("We were unable to load the page. Please contact the site's administrator with the following information: The current site does not contain a url for the shortcut '{0}'.", shortcutName))));
            }
        }
    }

</script>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody">

</asp:Content>
