<%@ Page Language="C#" Inherits="Asi.Web.UI.DisplayPageBase" %>
<%@ Import Namespace="System.Diagnostics.CodeAnalysis" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="Asi" %>
<%@ Import Namespace="Asi.Soa.Membership.DataContracts" %>
<%@ Import Namespace="Asi.Web.UI" %>
<%@ Import Namespace="Asi.Web.UI.AsiCommon.Utils" %>
<%@ Import Namespace="Asi.Soa.Core.ServiceContracts" %>
<%@ Import Namespace="Asi.Security" %>
<%@ Import Namespace="Asi.WebRoot.AsiCommon.Controls.CommitteeManagement" %>
<%@ Import Namespace="Asi.Soa.Core.DataContracts" %>

<script language="C#" runat="server">
    [ExcludeFromCodeCoverage]
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        
        // Redirect to the appropriate group landing page.
        if (Asi.AppContext.CurrentContext != null && Asi.AppContext.CurrentContext.WebsiteKey != Guid.Empty)
        {
            string groupId = Request.QueryString["GroupId"];
            if (!string.IsNullOrEmpty(groupId))
            {
                var group = EntityManager.FindByIdentity<GroupSummaryData>(groupId);
                if (group != null)
                {
                    string url;
                    string groupType = group.GroupClass.GroupClassId;
                    switch (groupType)
                    {
                        case "COMMITTEE":
                            if (AppPrincipal.CurrentPrincipal == null || !AppPrincipal.CurrentIdentity.IsAuthenticated || AppPrincipal.CurrentIdentity.UserId == "GUEST")
                                RedirectToLogin(this, false, Request.RawUrl);
                            var hasUpdatePermission = EntityManager.HasPermission("update", new IdentityData(GroupSummaryData.EntityTypeName, groupId));
                            var committeeLandingPageShortcut = hasUpdatePermission ? "CommitteeDetailAdmin" : "CommitteeDetail";
                            string code = groupId.Split('/')[1];
                            url = RedirectHelper.GetShortcutUrl(new NameValueCollection(Request.QueryString), Asi.AppContext.CurrentContext.WebsiteKey, committeeLandingPageShortcut);
                            if (!String.IsNullOrWhiteSpace(url))
                                if(!url.Contains("Code="))
                                   url = string.Format(CultureInfo.CurrentCulture, "{0}&Code={1}", url, code);
                            break;
                        default:
                            const string groupLandingPageShortcut = "GroupDetail";
                            url = RedirectHelper.GetShortcutUrl(new NameValueCollection(Request.QueryString), Asi.AppContext.CurrentContext.WebsiteKey, groupLandingPageShortcut);
                            break;
                    }
                    if (!String.IsNullOrWhiteSpace(url))
                    {
                        //add the website key to prevent losing theme/context
                        url = Asi.Web.Utilities.AppendToQueryString(url, "WebsiteKey", Asi.AppContext.CurrentContext.WebsiteKey.ToString());
                        
                        Response.Redirect(url);
                    }
                    else
                    {
                        AddUserMessage(new UserControlMessage(GetType().Name,
                               UserControlMessageTypes.Error, ResourceManager.GetPhrase("GroupLandingPageNotFound",
                                   string.Format("We were unable to load the page. Please contact the site's administrator with the following information: The home page for the {0} group type was not found.", groupType))));
                    }
                }
                else
                {
                    AddUserMessage(new UserControlMessage(GetType().Name,
                        UserControlMessageTypes.Error, ResourceManager.GetPhrase("GroupIdNotFound",
                            string.Format("We were unable to load the page. Please contact the site's administrator with the following information: Could not find a group with id '{0}'.", groupId))));
                }
            }
            else
            {
                AddUserMessage(new UserControlMessage(GetType().Name,
                    UserControlMessageTypes.Error, ResourceManager.GetPhrase("GroupIdIncorrect",
                        "We were unable to load the page. Please contact the site's administrator with the following information: The group id is incorrect.")));
            }
        }
    }
</script>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody"/>
    



