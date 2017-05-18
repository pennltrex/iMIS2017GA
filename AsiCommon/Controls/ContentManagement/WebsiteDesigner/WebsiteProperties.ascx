<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.ContentManagement.WebsiteControlBase"  %>
<%@ Import Namespace="Asi" %>
<%@ Import Namespace="Asi.Soa.ClientServices" %>
<%@ Import Namespace="Asi.Soa.Communications.DataContracts" %>
<%@ Import Namespace="Asi.Web.UI" %>
<%@ Import Namespace="Asi.Soa.Core.ServiceContracts" %>

<script runat="server">
    private string CurrentDefaultWebsite
    {
        get
        {
            if (Website != null && Website.UseMultipleWebsites)
            {
                int numberOfMatches = 0;
                string lastMatchingSiteTitle = string.Empty;
                // Check to make sure no other websites using this root URL are set to be the default.
                foreach (Asi.Business.ContentManagement.Website w in Asi.Business.ContentManagement.Website.GetAllWebsites(true))
                {
                    if (Website.MatchWebsiteRootURL(w, false))
                    {
                        ++numberOfMatches;
                        lastMatchingSiteTitle = w.Title;
                        if (w.IsDefaultWebsite)
                            return lastMatchingSiteTitle;
                    }
                }
                if (numberOfMatches == 0)
                {
                    foreach (Asi.Business.ContentManagement.Website w in Asi.Business.ContentManagement.Website.GetAllWebsites(false))
                    {
                        if (Website.MatchWebsiteRootURL(w, false))
                        {
                            ++numberOfMatches;
                            lastMatchingSiteTitle = w.Title;
                            if (w.IsDefaultWebsite)
                                return lastMatchingSiteTitle + " (Working)";
                        }
                    }
                    if (numberOfMatches == 0)
                        return Website.Title + " (Working)";
                }
                if (numberOfMatches == 1)
                    return lastMatchingSiteTitle;
            }
            
            return "not set";
        }
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        // The SecureWebsiteRootURLControl only needs to post back if it's the staff site being edited 
        // and Advanced email might be using this URL for event notifications
        var secureUrlPostback = false;
        if (Website != null && Website.Name.Equals("Staff", StringComparison.OrdinalIgnoreCase))
        {
            var entityManger = new EntityManager();
            var emailProviderConfig = entityManger.FindByIdentity<EmailProviderConfigurationData>("0");
            if (emailProviderConfig != null && emailProviderConfig.EnableEventNotificationUrl)
                secureUrlPostback = true;
        }
        SecureWebsiteRootURLControl.AutoPostBack = secureUrlPostback;
    }
   
    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);

        CurrentDefaultWebsiteName.Text = CurrentDefaultWebsite;
        bool willBecomeWorkingWhenPublished = Website != null && Website.DocumentStatusCode == Asi.Business.Common.DocumentStatus.Working && !CurrentDefaultWebsite.Equals(Website.Title) && Website.IsDefaultWebsite;
        IsDefaultWebsiteControl.Enabled = Website != null && (!Website.IsDefaultWebsite || willBecomeWorkingWhenPublished);

        if (Website != null && (Website.UseMultipleWebsites || (bool)UseMultipleWebsitesControl.Value))
            DefaultWebsiteDiv.Style.Add("display", "block");
        else
            DefaultWebsiteDiv.Style.Add("display", "none");

        // The WebsiteSpecificContentFolderPath should not be set by the user on initial create website.
        // On save this will default to the website specific content folder for the given website.
        if (Website == null || Website.IsNew)
            WebsiteSpecificContentFolderPath.Visible = false;
    }

    protected void SecureWebsiteRootURLOnDataChanged(object sender, SmartControlDataChangeEventArgs e)
    {
        if (Website == null || Website.IsNew || !Website.Name.Equals("Staff", StringComparison.OrdinalIgnoreCase)) return;

        // If updating the staff site secure URLs, check if advanced email will also need to be updated
        var entityManger = new EntityManager();
        var emailProviderConfig = entityManger.FindByIdentity<EmailProviderConfigurationData>("0");
        if (emailProviderConfig != null && emailProviderConfig.EnableEventNotificationUrl)
        {
            var currentEventNotificationUrl = GetCleanUrl(emailProviderConfig.EventNotificationUrl);
            Website.SecureWebsiteRootURL = e.CurrentValue.ToString();
            if (!currentEventNotificationUrl.Equals(Website.WebsiteSecureBaseUrl))
            {
                var warningMessage = ResourceManager.GetPhrase("EventNotificationUrlChange", "Advanced email is still using an Event notification URL of '{0}'. After publishing your changes, please update the settings for Advanced email to use the updated secure URL.", currentEventNotificationUrl);
                AddUserMessage(new UserControlMessage(UserControlMessageTypes.Warning, warningMessage));
            }
        }
    }

    private static string GetCleanUrl(string urlWithUsernameAndPassword)
    {
        if (string.IsNullOrEmpty(urlWithUsernameAndPassword)) return string.Empty;
        string cleanUrl = urlWithUsernameAndPassword;
        var apiLocation = urlWithUsernameAndPassword.IndexOf("/api/", StringComparison.OrdinalIgnoreCase);
        if (apiLocation > 0)
            cleanUrl = cleanUrl.Substring(0, apiLocation);

        var startLocation = cleanUrl.IndexOf("://", StringComparison.OrdinalIgnoreCase) + 3;
        var endLocation = cleanUrl.IndexOf('@') + 1;

        // If not @ sign was found then the username/password were not present in the URL string
        if (endLocation <= startLocation) return cleanUrl;
        cleanUrl = cleanUrl.Substring(0, startLocation) + cleanUrl.Substring(endLocation);
        return cleanUrl;
    }
       
</script>

<asiweb:SmartControl ID="WebsiteTitleControl" runat="server" BoundPropertyName="Title" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Top" InputFieldCssClass="InputXLargeWrapper" />
<asiweb:SmartControl ID="WebsiteNameControl" runat="server" BoundPropertyName="Name" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Top" InputFieldCssClass="InputXLargeWrapper" />
<asiweb:SmartControl ID="WebsiteDescriptionControl" runat="server" BoundPropertyName="Description" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Top" TextBoxWidth="26.5em" />
<asiweb:SmartControl ID="WebsiteRootURLControl" runat="server" BoundPropertyName="WebsiteRootURL" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Top" InputFieldCssClass="InputXLargeWrapper" />
<asiweb:SmartControl ID="SecureWebsiteRootURLControl" runat="server" BoundPropertyName="SecureWebsiteRootURL" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Top" InputFieldCssClass="InputXLargeWrapper" OnDataChange="SecureWebsiteRootURLOnDataChanged" />
<div class="PanelField">
    <asiweb:SmartControl ID="UseMultipleWebsitesControl" runat="server" CssClass="AutoWidth" BoundPropertyName="UseMultipleWebsites" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Right" AutoPostBack="true" />
    <div id="DefaultWebsiteDiv" class="PanelField Left" runat="server" >
        <asp:Label ID="CurrentDefaultWebsiteLabel" runat="server" Text="The current default website is" />&nbsp;<asp:Label ID="CurrentDefaultWebsiteName" runat="server" style="font-weight:bold;" />
        <br />
        <asiweb:SmartControl ID="IsDefaultWebsiteControl" runat="server" CssClass="AutoWidth" BoundPropertyName="IsDefaultWebsite" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Right" />
    </div>
</div>
<asiweb:SmartControl ID="WebsiteSpecificContentFolderPath" runat="server" BoundPropertyName="WebsiteSpecificContentFolderPath" DisplayCaption="true" PositionCaption="Top" DocumentTypesAllowed="CFL" InputFieldCssClass="InputXLargeWrapper" />
<asiweb:PanelTemplateControl2 runat="server" TemplateTitle="Advanced" Collapsible="True" Collapsed="True">
    <asiweb:SmartControl ID="GoogleAnalyticsJavascriptControl" runat="server" BoundPropertyName="GoogleAnalyticsJavascript" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Top" TextBoxWidth="100%" ValidateRequestMode="Disabled" InputFieldCssClass="CodeBlock"/>
</asiweb:PanelTemplateControl2>

<script type="text/javascript">
    var matchWebsiteRoot = new AsiWebControls.MatchTextBehavior('<%= SecureWebsiteRootURLControl.ClientID %>_TextField', '<%= WebsiteRootURLControl.ClientID %>_TextField', "<%# string.IsNullOrEmpty(Website.WebsiteRootURL) %>" == "True", null);
    matchWebsiteRoot.initialize();
    var matchNameToTitle = new AsiWebControls.MatchTextBehavior('<%= WebsiteNameControl.ClientID %>_TextField', '<%= WebsiteTitleControl.ClientID %>_TextField', "<%# string.IsNullOrEmpty(Website.Title) %>" == "True", '<%# Asi.Business.ContentManagement.Navigation.FolderNameConvertRegularExpression %>');
    matchNameToTitle.initialize();
</script>
