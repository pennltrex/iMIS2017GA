<%@ Control Language="C#" ClassName="CommunitySideBarHelper" Inherits="Asi.Web.UI.Communities.CommunityDocumentDisplay" %>
<%@ Reference Control="~/AsiCommon/Controls/CommunityManagement/Community/CommunitySummary.ascx" %>
<%@ Import Namespace="Asi.Web.UI" %>
<%@ Import Namespace="System.Web.UI.WebControls.WebParts" %>

<script runat="server">
    // This is a relatively simple "helper" control to work around the fact that Content Designer doesn't allow for some needed features in Communities. For example,
    // we can't turn off the left nav, or add the Summary web part to the sidebar placeholder via the UI, so we add this little web part instead and it takes care of it at runtime.

    AsiCommon_Controls_CommunityManagement_Community_CommunitySummary summaryControl = null;
    
    protected override void CreateChildControls()
    {
        base.CreateChildControls();

        EnsureAtomObject();
        if (AtomObject.IsNullOrEmpty())
            return;

        var master = Page.Master as MasterPageBase;
        if (master != null)
        {
            master.ShowSecondaryNavigation = false;
            var sideBarPlaceHolder = master.FindControl("SideBarPlaceHolder");
            if (sideBarPlaceHolder != null)
            {
                summaryControl = LoadControl("~/AsiCommon/Controls/CommunityManagement/Community/CommunitySummary.ascx") as AsiCommon_Controls_CommunityManagement_Community_CommunitySummary;
                if (summaryControl != null)
                {
                    AddChildUserControl(summaryControl);
                    sideBarPlaceHolder.Controls.AddAt(0, summaryControl);
                    var control = summaryControl.FindControl("SubscribeLink1");
                    Type aType = control.GetType();
                    aType.InvokeMember("UseButtonForLink", System.Reflection.BindingFlags.SetProperty, null, control, new object[] {DisplayLinkAsButton}, System.Globalization.CultureInfo.InvariantCulture);
                    aType.InvokeMember("FollowCommunityOn", System.Reflection.BindingFlags.SetProperty, null, control, new object[] {DisplayLinkAsButton}, System.Globalization.CultureInfo.InvariantCulture); // We are currently using "DisplayLinkAsButton" in the content records to set this variable (stored in Gold Master DB). In the future we will want to add "FollowCommunityOn" to those content records.

                    var wrapperControl = master.FindControl("masterWrapper");
                    if (wrapperControl == null) return;
                    foreach (var c in from object c in wrapperControl.Controls where c.GetType().Name.Equals("iparts_website_secondarynavigation_secondarynavigationdisplay_ascx", StringComparison.OrdinalIgnoreCase) select c)
                    {
                        ((UserControlBase)(c)).Visible = false;
                        break;
                    }         
                }
            }
        }
    }

    [Personalizable(PersonalizationScope.User)]
    [WebBrowsable()]
    [WebDisplayName("Display \"subscribe\" link as button")]
    [WebDescription("Display the link to subscribe as button with \"Follow community\" text instead of as a link.")]
    public bool DisplayLinkAsButton
    { get; set; }
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        AllowNullCommunityDocument = true;
    }

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (!databound)
            DataBind();
    }

    private bool databound = false;
    public override void DataBind()
    {
        base.DataBind();

        EnsureChildControls();
        if (summaryControl != null)
        {
            summaryControl.AtomObject = AtomObject;
            summaryControl.DataBind();
        }
        databound = true;
    }
</script>
