<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.ContentManagement.WebsiteControlBase" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="Asi" %>
<%@ Import Namespace="Asi.Soa.Core.DataContracts" %>
<%@ Import Namespace="Asi.Soa.ClientServices" %>

<script runat="server">  
    private const string WebsiteThemeConfirmMessage = "The selected theme will be applied when the website is saved and published.";
    private ThemesData selectedTheme;

    private ThemesData SelectedTheme
    {
        get
        {
            if (string.IsNullOrEmpty(ThemeNameControl.Text))
            {
                selectedTheme = null;
                return selectedTheme;
            }
            if (selectedTheme != null) return selectedTheme;

            selectedTheme = GetThemeFromName(ThemeNameControl.Text);

            return selectedTheme;
        }
        set { selectedTheme = value; }
    }

    private ThemesData GetThemeFromName(string themeName)
    {
        EntityManager entityManager = new EntityManager();
        var queryData = new QueryData(ThemesData.EntityTypeName);
        queryData.AddCriteria(new CriteriaData("ThemeName", OperationData.Equal, themeName));
        var themes = entityManager.Find(queryData);

        // we're assuming there is only one defined theme per ThemeName, so just return the first result
        if (themes != null && themes.Result != null && themes.Result.Count > 0 && themes.Result[0] != null)
            return (ThemesData) themes.Result[0];

        return null;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        SetSelectedThemeText();

        SelectThemeLink.OnClientClick = string.Format(CultureInfo.InvariantCulture, "SelectTheme('{0}','{1}'); return CancelEvent();", Website.IsNew, SelectedThemeLabel.Text);

        if (Website.IsNew && string.IsNullOrEmpty(ThemeNameControl.Text))
        {
            SelectThemeImage.Visible = false;
        }
        else
        {
            DisplayThemeImage();
        }
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        if (Website.ShowCookieWarning)
            CookieOptions.CssClass += " in";
    }


    protected override void OnPreRender(EventArgs e)
    {
        ThemeNameControl.InputControl.Attributes.Add("translate", "no");
        MasterPageControl.InputControl.Attributes.Add("translate", "no");
        PrinterMasterPageControl.InputControl.Attributes.Add("translate", "no");
        TextOnlyMasterPageControl.InputControl.Attributes.Add("translate", "no");
        DialogMasterPageControl.InputControl.Attributes.Add("translate", "no");

        if (MasterPageControl.DataSource == null) return;
        int datasouceCount = ((IEnumerable) MasterPageControl.DataSource).Cast<object>().Count();
        if (datasouceCount == Asi.Business.ContentManagement.Website.MasterPages.Count()) return;
        var masterPages = Asi.Business.ContentManagement.Website.MasterPages;
        MasterPageControl.DataSource =
            PrinterMasterPageControl.DataSource =
                TextOnlyMasterPageControl.DataSource =
                    DialogMasterPageControl.DataSource = masterPages;
        DataBind();
    }

    private string ImageUrl(string themeId)
    {
        string imageUrl = string.Format(CultureInfo.InvariantCulture, "{0}/App_Themes/{1}/images/ThemeScreenshotSmall.png", Asi.Web.Utilities.GetTildeExpansion(), themeId);
        if (!File.Exists(Server.MapPath(imageUrl)))
            imageUrl = string.Empty;
        return imageUrl;
    }

    private void ThemeChangedClick(object sender, EventArgs e)
    {
        string argument = ((Asi.Web.UI.DisplayPageBase)Page).GetPageEventArgument();
        string[] argParts = argument.Split(',');
        try
        {
            Website.ApplyTemplate(argParts[0], argParts[1]);
            DataBind();
            MasterPageControl.IsDirty = true;
            ThemeNameControl.IsDirty = true;
            UserControlMessages.Clear();
            AddUserMessage(new Asi.Web.UI.UserControlMessage(Asi.Web.UI.UserControlMessageTypes.Information,
                ResourceManager.GetPhrase("Website.TemplateChangedInstructions", WebsiteThemeConfirmMessage, Website.Name)
            ));
            SelectedTheme = GetThemeFromName(argParts[0]);
            SetSelectedThemeText();
            SelectThemeLink.OnClientClick = string.Format(CultureInfo.InvariantCulture, "SelectTheme('{0}','{1}'); return CancelEvent();", Website.IsNew, SelectedThemeLabel.Text);
            DisplayThemeImage();
            DataBind();
        }
        catch (Exception ex)
        {
            string message = ResourceManager.GetPhrase("Website.ErrorApplyingTemplate", "There was an error changing the website theme: {0}", ex.Message);
            AddUserMessage(new Asi.Web.UI.UserControlMessage(Asi.Web.UI.UserControlMessageTypes.Error, message));
            Asi.Web.HealthMonitoring.AsiWebErrorEvent errorEvent = new Asi.Web.HealthMonitoring.AsiWebErrorEvent(message, this, Asi.Web.HealthMonitoring.AsiErrorEventCode.Error, ex);
            errorEvent.Raise();
        }
    }

    private void DisplayThemeImage()
    {
        if (!ImageUrl(ThemeNameControl.Text).Equals(string.Empty))
        {
            SelectThemeImage.Visible = true;
            SelectThemeImage.ImageUrl = ImageUrl(ThemeNameControl.Text);
            SelectThemeImage.OnClientClick = string.Format(CultureInfo.InvariantCulture, "SelectTheme('{0}','{1}'); return CancelEvent();", Website.IsNew, SelectedThemeLabel.Text);
        }
        else
        {
            SelectThemeImage.Visible = false;
        }
    }

    private void SetSelectedThemeText()
    {
        if (SelectedTheme != null && !string.IsNullOrEmpty(SelectedTheme.ThemeDescription))
        {
            SelectedThemeLabel.Text = SelectedTheme.ThemeDescription;

            if (SelectedTheme.ScheduledRemovalDate != null)
            {
                SelectedThemeLabel.Text = string.Format(CultureInfo.CurrentUICulture, "{0} ({1})", SelectedThemeLabel.Text, GetTranslatedPhrase("Deprecated"));
                SelectedThemeLabel.CssClass += " Important";

                var deprcationWarningText = string.Format(CultureInfo.CurrentUICulture, "The selected theme ({0}) is no longer supported. " +
                                                                                        "Please select another theme or make a copy of {0} to avoid problems with your site.",
                                                                                        SelectedTheme.ThemeDescription);
                UserControlMessages.Add(new Asi.Web.UI.UserControlMessage(Asi.Web.UI.UserControlMessageTypes.Warning, deprcationWarningText));
            }

        }
        else if (!string.IsNullOrEmpty(ThemeNameControl.Text))
            SelectedThemeLabel.Text = ThemeNameControl.Text;
        else
            SelectedThemeLabel.Text = ResourceManager.GetPhrase("Theme.NoThemeSelected", "No theme selected");
    }

    public string ContentAreaFolderPath
    {
        get { return ContentAreaFolderControl.Text; }
    }

    public string DefaultThemeName
    {
        get { return ThemeNameControl.InputControl.Text; }
    }

    public string MasterPageFileName
    {
        get { return MasterPageControl.InputControl.Text; }
    }

    protected bool ShowCreateDefaultNav
    {
        get
        {
            return Website.IsNew || !Asi.Business.Common.DocumentHierarchy.HasChildren(Website.RootHierarchyKey);
        }
    }
    public string FaviconPathValue
    {
        get { return FaviconPath.InputControl.Text; }
    }
    public string MobileFaviconPathValue
    {
        get { return MobileFaviconPath.InputControl.Text; }
    }
</script>
<asp:UpdatePanel ID="LookAndFeelUpdatePanel" runat="server" ChildrenAsTriggers="true">   
    <ContentTemplate>
        <div class="AutoWidth">
            <asiweb:SmartControl ID="UseBreadcrumbsControl" runat="server" BoundPropertyName="UseBreadCrumbs" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Right" />
        </div>
        <asiweb:SmartControl ID="ContentAreaFolderControl" runat="server" BoundPropertyName="ContentAreaFolderPath" DisplayCaption="true" PositionCaption="Top" DocumentTypesAllowed="CFL" CssClass="InputXLargeWrapper" />                                
        
        <div class="Section"> 
            <div class="PanelField">
                <asp:Label ID="ThemeLabel" runat="server" Text="Website theme" AssociatedControlID="SelectedThemeLabel"></asp:Label>
                <div class="PanelFieldValue">
                    <asp:Label ID="SelectedThemeLabel" runat="server" CssClass="MarginRight" translate="no"></asp:Label>
                    <asp:LinkButton ID="SelectThemeLink" runat="server" Text="select" Enabled="<%# Website.HasPermission(AclPermissionType.Edit) %>" />            
                </div>
            </div>
            <asp:ImageButton runat="server" ID="SelectThemeImage" Enabled="<%# Website.HasPermission(AclPermissionType.Edit) %>" CssClass="theme-image selected-preview"/>      
            <asp:Button ID="ThemeChanged" runat="server" style="display:none;" OnClick="ThemeChangedClick" CausesValidation="false" />  
        </div>

        <asiweb:SmartControl ID="FaviconPath" runat="server" BoundPropertyName="FaviconPath" DisplayCaption="true" PositionCaption="Top" CssClass="AutoWidth" InputFieldCssClass="InputXLargeWrapper"/>
        <asiweb:SmartControl ID="MobileFaviconPath" runat="server" BoundPropertyName="MobileFaviconPath" DisplayCaption="true" PositionCaption="Top" CssClass="AutoWidth" InputFieldCssClass="InputXLargeWrapper"/>
        
        <asiweb:SmartControl ID="ShowCookieWarning" runat="server" BoundPropertyName="ShowCookieWarning" DisplayType="EditableField"
             DisplayCaption="true" PositionCaption="Right" OnClientClick="ToggleCookieWarning()" />
        <div style="clear:both"></div>
        <asp:Panel ID="CookieOptions" runat="server" CssClass="ShowFieldset collapse">
            <fieldset>
                <legend>Cookie warning options</legend>
                <asiweb:SmartControl ID="CookieMessage" runat="server" BoundPropertyName="CookieMessage" DisplayType="EditableField" DisplayCaption="true" InputFieldCssClass="InputXLargeWrapper" PositionCaption="Top" />
                <asiweb:SmartControl ID="CookieLearnMoreText" runat="server" BoundPropertyName="CookieLearnMoreText" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Top" />
                <asiweb:SmartControl ID="CookieLearnMoreContentPath" runat="server" BoundPropertyName="CookieLearnMoreContentPath" DisplayType="EditableField" DisplayCaption="true" InputFieldCssClass="InputXLargeWrapper" PositionCaption="Top" />
                <asiweb:SmartControl ID="CookieDismissText" runat="server" BoundPropertyName="CookieDismissText" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Top" />
                <asiweb:SmartControl ID="SmartControl1" runat="server" BoundPropertyName="CookieWarningLocation" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Top" />
            </fieldset>
        </asp:Panel>
           
        <asiweb:PanelTemplateControl2 runat="server" ID="AdvancedPanel" TemplateTitle="Advanced" Collapsible="True" Collapsed="False">
            <asiweb:SmartControl ID="ThemeNameControl" runat="server" BoundPropertyName="DefaultThemeName" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Top" CaptionCssClass="Required" />            
            <asiweb:SmartControl ID="MasterPageControl" runat="server" BoundPropertyName="MasterPageFileName" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Top" CaptionCssClass="Required" />
            <asiweb:SmartControl ID="PrinterMasterPageControl" runat="server" BoundPropertyName="PrinterMasterPageFileName" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Top" />
            <asiweb:SmartControl ID="TextOnlyMasterPageControl" runat="server" BoundPropertyName="TextMasterPageFileName" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Top" />
            <asiweb:SmartControl ID="DialogMasterPageControl" runat="server" BoundPropertyName="DialogMasterPageFileName" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Top" />
            <%--<asiweb:SmartControl ID="CustomCssControl" runat="server" BoundPropertyName="CustomCss" DisplayType="EditableField" DisplayCaption="true" PositionCaption="Top" TextBoxWidth="100%" ValidateRequestMode="Enabled" InputFieldCssClass="CodeBlock" />--%>
        </asiweb:PanelTemplateControl2>        
    </ContentTemplate>
</asp:UpdatePanel>

<script type="text/javascript">
    function SelectTheme(isNew, activeTheme) {
        var size = "100%";
        if (isNew == "True")
            size = "90%";
        ShowDialog(gWebRoot + "/AsiCommon/Controls/ContentManagement/WebsiteDesigner/ThemeSelector/SelectTheme.aspx?activetheme=" + activeTheme + "", null, size, size, "Themes", null, "E", SelectTheme_Callback, null, false, true, null, null);
    }
    function SelectTheme_Callback(dialogWindow) {
        if (!dialogWindow.result)
            return;
        InitiateControlEventWithArgument('<%= ThemeChanged.ClientID %>', dialogWindow.result);
    }

    function ToggleCookieWarning() {
        var cookieCheckbox = jQuery("#<%# ShowCookieWarning.PrincipalControlClientID %>");
        var cookieOptions = jQuery("#<%# CookieOptions.ClientID %>");
        if (cookieCheckbox == null) return false;

        if (cookieCheckbox.prop("checked")) {
            cookieOptions.collapse('show');
        } else {
            cookieOptions.collapse('hide');
        }
    }
</script>