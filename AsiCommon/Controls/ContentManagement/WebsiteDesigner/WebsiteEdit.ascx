<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.ContentManagement.WebsiteControlBase" %>
<%@ Import Namespace="Asi" %>
<%@ Import Namespace="Asi.Business.ContentManagement" %>
<%@ Import Namespace="Asi.Web.UI" %>
<%@ Register TagPrefix="asi" TagName="WebsiteStatus" Src="~/AsiCommon/Controls/ContentManagement/WebsiteDesigner/WebsiteStatus.ascx" %>
<%@ Register TagPrefix="asi" TagName="WebsiteProperties" Src="~/AsiCommon/Controls/ContentManagement/WebsiteDesigner/WebsiteProperties.ascx" %>
<%@ Register TagPrefix="asi" TagName="WebsiteLookAndFeel" Src="~/AsiCommon/Controls/ContentManagement/WebsiteDesigner/WebsiteLookAndFeel.ascx" %>
<%@ Register TagPrefix="asi" TagName="WebsiteNavigationAreas" Src="~/AsiCommon/Controls/ContentManagement/WebsiteDesigner/WebsiteNavigationAreas.ascx" %>
<%@ Register TagPrefix="asi" TagName="AccessSettings" Src="~/AsiCommon/Controls/Shared/SecurityAdmin/AccessSettings.ascx" %>

<script language="C#" runat="server">
    private HttpBrowserCapabilities browser = null;
    protected override void EnsureChildUserControls()
    {
        base.EnsureChildUserControls();

        AddChildUserControl(WebsiteStatusControl);
        AddChildUserControl(WebsitePropertiesControl);
        AddChildUserControl(WebsiteLookAndFeelControl);
        AddChildUserControl(WebsiteNavigationAreasControl);
        AddChildUserControl(AccessSettingsControl);
    }
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        EnsureAtomObject();
        if (Website != null)
        {
            AccessSettingsControl.SecureItem = Website.Document;
            AccessSettingsControl.HierarchyKey = Website.HierarchyKey;
            AccessSettingsControl.UseCAGMasterAdminRole = true;
            StatusPanel.Collapsed = !Website.IsNew;            
        }
        DataBind();        
    }
    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);

        EnsureAtomObject();
        string titleFormat = ResourceManager.GetPhrase("WebsiteStatusPanelTitle", "Status: {0} ({1})");        
        string activeString = Website != null && Website.IsActive ? ResourceManager.GetPhrase("WebsiteIsActive", "Active") : ResourceManager.GetPhrase("WebsiteIsInactive", "Inactive");
        StatusPanel.TemplateTitle = String.Format(titleFormat, activeString, Website != null ? Website.DocumentStatusCode.ToString() : ResourceManager.GetWord("Unknown"));        
    }
    public override void CommandButtonRequisites(CommandButtonRequisiteArgs e)
    {
        base.CommandButtonRequisites(e);
        //this client validation causes JS error in IE8 so we handle validation differently (see below)
        browser = Request.Browser;
        e.SetCssClass(CommandButtonType.Save, "PrimaryButton");
        if (browser != null && browser.Browser.Equals("IE", StringComparison.InvariantCultureIgnoreCase) && browser.MajorVersion < 9)
            e.SetCausesValidation(CommandButtonType.Save, false);
    }
    protected override void OnCommandButtonClick(object sender, CommandButtonEventArgs e)
    {
        //this is only for the case of IE8, we check page validity & redirect to page with error this way
        browser = Request.Browser;
        if (e.ButtonType.Equals(CommandButtonType.Save) && browser != null && browser.Browser.Equals("IE", StringComparison.InvariantCultureIgnoreCase) && browser.MajorVersion < 9)
        {
            Page.Validate();
            if (!Page.IsValid)
            {
                e.CancellationRequest = true;
                var validators = Page.Validators;
                bool isSecondTab = false;               
                foreach (IValidator validator in validators)
                {
                    if (!validator.IsValid && (validator.ErrorMessage.Contains("MasterPage") || validator.ErrorMessage.Contains("Theme")))
                    {
                        isSecondTab = true;
                        break;
                    }
                }
                if (isSecondTab)
                {
                    RadTabStrip1.Tabs[1].Selected = true;
                    RadMultiPage1.SelectedIndex = 1;
                }
                else
                {
                    RadTabStrip1.Tabs[0].Selected = true;
                    RadMultiPage1.SelectedIndex = 0;
                }
            }
            else
                base.OnCommandButtonClick(sender, e);
        }
        else
            base.OnCommandButtonClick(sender, e);
    }
    
    public override void Validate(ValidateArgs e)
    {
        if (!string.IsNullOrEmpty(WebsiteLookAndFeelControl.ContentAreaFolderPath))
        {
            var res = Website.CheckContentFolderPath(WebsiteLookAndFeelControl.ContentAreaFolderPath);
            if (!string.IsNullOrEmpty(res))
            {
                AddUserMessage(new UserControlMessage(UserControlMessageTypes.Error, res));
                e.Failed = true;
                return;
            }            
        }
        if (WebsiteLookAndFeelControl.DefaultThemeName.Length == 0 || WebsiteLookAndFeelControl.MasterPageFileName.Length == 0)
        {
            AddUserMessage(new UserControlMessage(UserControlMessageTypes.Error,
                ResourceManager.GetPhrase("Website.MissingThemeOrMasterpage", "Please select a theme or verify that a theme and master page are configured for this website")
            ));
            RadTabStrip1.Tabs[1].Selected = true;
            RadMultiPage1.SelectedIndex = 1;              
            e.Failed = true;
            return;
        }        
        if (!string.IsNullOrEmpty(WebsiteLookAndFeelControl.FaviconPathValue))
        {
            var res = Website.CheckFaviconFormat(WebsiteLookAndFeelControl.FaviconPathValue, false);

            if (!string.IsNullOrEmpty(res))
            {
                AddUserMessage(new UserControlMessage(UserControlMessageTypes.Error, res));
                e.Failed = true;
                return;
            }
        }
        if (!string.IsNullOrEmpty(WebsiteLookAndFeelControl.MobileFaviconPathValue))
        {
            var res = Website.CheckFaviconFormat(WebsiteLookAndFeelControl.MobileFaviconPathValue, true);

            if (!string.IsNullOrEmpty(res))
            {
                AddUserMessage(new UserControlMessage(UserControlMessageTypes.Error, res));
                e.Failed = true;
                return;
            }
        }
        base.Validate(e);
    }
</script>
<asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" TemplateTitle="" DistinguishHeader="False" Collapsible="False" Collapsed="false" BorderStyle="none">
    
    <asp:ValidationSummary runat="server" ID="WebsiteEditValidationSummary" CssClass="Important" DisplayMode="BulletList" Visible="True" EnableClientScript="True" EnableViewState="True" Enabled="True" ShowSummary="True" ViewStateMode="Enabled" HeaderText="" />
       
    <asiweb:PanelTemplateControl2 ID="StatusPanel" runat="server" TemplateTitle="Status:" Collapsed="true" FieldSet="true" BorderStyle="none">
        <asi:WebsiteStatus id="WebsiteStatusControl" runat="server" UseParentAtomObject="true" />
    </asiweb:PanelTemplateControl2>
    <div style="height:5px;display:block;"></div>
    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
        MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="false" CausesValidation="False">
        <Tabs>
            <telerik:RadTab Text="Properties" PageViewID="PropertiesPage" Selected="true"/>
            <telerik:RadTab Text="Look and feel" PageViewID="LookAndFeelPage" />
            <telerik:RadTab Text="Navigation areas" PageViewID="NavigationAreasPage" />
            <telerik:RadTab Text="Access settings" PageViewID="AccessSettingsPage" />
        </Tabs>
    </telerik:RadTabStrip> 

    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" RenderSelectedPageOnly="False" 
        CssClass="ContentTabbedDisplay" >
    
        <telerik:RadPageView runat="server" ID="PropertiesPage">
            <asiweb:PanelTemplateControl2 ID="PropertiesPanel" runat="server" FieldSet="true" Collapsed="False" Collapsible="false" BorderStyle="none" ShowTitle="false" ShowHeader="false">
                <asi:WebsiteProperties ID="WebsitePropertiesControl" runat="server" UseParentAtomObject="true" />
            </asiweb:PanelTemplateControl2>    
        </telerik:RadPageView>
    
        <telerik:RadPageView runat="server" ID="LookAndFeelPage">
            <asiweb:PanelTemplateControl2 ID="LookAndFeelPanel" runat="server" FieldSet="true" Collapsed="False" Collapsible="false" BorderStyle="none" ShowTitle="false" ShowHeader="false">
                <asi:WebsiteLookAndFeel ID="WebsiteLookAndFeelControl" runat="server" UseParentAtomObject="true" />
            </asiweb:PanelTemplateControl2> 
        </telerik:RadPageView>
    
        <telerik:RadPageView runat="server" ID="NavigationAreasPage">
            <asiweb:PanelTemplateControl2 ID="NavigationAreasPanel" runat="server" FieldSet="true" Collapsed="False" Collapsible="false" BorderStyle="none" ShowTitle="false" ShowHeader="false">
                <asi:WebsiteNavigationAreas ID="WebsiteNavigationAreasControl" runat="server" UseParentAtomObject="true" />
            </asiweb:PanelTemplateControl2>   
        </telerik:RadPageView>
    
        <telerik:RadPageView runat="server" ID="AccessSettingsPage">
            <asi:AccessSettings runat="server" ID="AccessSettingsControl" ShowMemberTypes="true" UseContentACL="true" Collapsible="false" ShowHeader="false" BorderStyle="none" CollapsePanelSetting="False" ShowTitle="False" ShowBorder="False" />   
        </telerik:RadPageView>

    </telerik:RadMultiPage>

</asiweb:PanelTemplateControl2>