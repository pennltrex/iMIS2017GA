<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Upcoming Events" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="SocialShare" Src="~/iParts/Social/SocialShare/SocialShareDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="BigButtonPanel" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/DisplayBigButtonPanel.ascx" %>
<%@ Register TagPrefix="CM" TagName="CommonSearch" Src="~/iParts/Common/Search/SearchDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("b3d13261-8be5-4b96-baa4-2236e6959e4c"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("2a6358b4-d971-416d-a1af-09fe157b1bd2"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		AddChildUserControl(ContentPage2);

		childUserControl = ciSignUp_2912450583174a4d8129081b625d0ec0 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("29124505-8317-4a4d-8129-081b625d0ec0");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSignUp_2912450583174a4d8129081b625d0ec0);

		childUserControl = ciNewSocialShareCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("5f06c12d-525d-4377-ba79-5419221e2604");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewSocialShareCommon);

		AddChildUserControl(ContentPage3);

		childUserControl = ciUsefulLinks as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("8faa6618-c180-4aa2-8eb7-0a1556794d19");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciUsefulLinks);

		AddChildUserControl(ContentPage4);

		childUserControl = ciNewSearchCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("4d93d6a5-134d-4433-8ca8-3c1b20f49d7a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewSearchCommon);

	}
</script>
<asp:Content ID="TemplateUserMessages" ContentPlaceHolderID="TemplateUserMessages" runat="server"></asp:Content>
<asp:Content ID="TemplateBody" ContentPlaceHolderID="TemplateBody" Runat="Server">
<script type="text/javascript">

</script>
	<asiweb:AsiWebPartManager id="WebPartManager1" runat="server">
		<StaticConnections>
		</StaticConnections>
	</asiweb:AsiWebPartManager>
   <div>
	<div class="row">
    <div class="col-sm-12">
			<CM:ContentPage ID="ContentPage1" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone1_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
<div class="row">
    <div class="col-sm-8">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciSignUp_2912450583174a4d8129081b625d0ec0" runat="server" ContentKey="b3d13261-8be5-4b96-baa4-2236e6959e4c" ContentItemKey="29124505-8317-4a4d-8129-081b625d0ec0" Title="Sign Up" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_SignUp" runat="server"><h2>Next Year's Conference</h2>
Our Annual Conference next year will be in Toronto, Canada! Email <span style="text-decoration: underline;">info@imisdemo.com</span> to get on the advance list and be the first to find out the details!</asp:Panel></CM:ContentHtml>
				<CM:SocialShare ID="ciNewSocialShareCommon" runat="server" ContentKey="b3d13261-8be5-4b96-baa4-2236e6959e4c" ContentItemKey="5f06c12d-525d-4377-ba79-5419221e2604" Title="New SocialShareCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" BorderVisible="False" UrlToShare="" IconDimension="16" LegendText="Share this page" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-4">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:BigButtonPanel ID="ciUsefulLinks" runat="server" ContentKey="b3d13261-8be5-4b96-baa4-2236e6959e4c" ContentItemKey="8faa6618-c180-4aa2-8eb7-0a1556794d19" Title="Useful Links" ShowTitleFlag="False" PartTitle="Useful Links" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="Actions" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="&quot;@/iCore/Events/Events_List|Register for training&quot;,&quot;@/iSamples/AnnualConference/Product_Detail[iProductCode=CONFPROC]|Order conference proceedings&quot;" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
			<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:CommonSearch ID="ciNewSearchCommon" runat="server" ContentKey="b3d13261-8be5-4b96-baa4-2236e6959e4c" ContentItemKey="4d93d6a5-134d-4433-8ca8-3c1b20f49d7a" Title="New SearchCommon" ShowTitleFlag="False" PartTitle="Upcoming Events" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayTextBox="True" DisplayInactiveResultsCheckBox="True" InitialDisplay="True" InitialText="" InitialLogic="And" SearchLabel="Search" DisplayAreaOptions="False" Options="" InitialArea="Event" ErrorMsg="&#39;{0}&#39;" ExceedResultsMsg="Your search criteria returned over {0} records. To see more results, please modify your query." MaxResults="300" NoResultMsg="No search results match your specified criteria. Please try again with fewer or different criteria." PageSize="5" Sort="PublicationDate_DESC" Tags="" PagerMode="NextPrevAndNumeric" PagerDisplay="Both" AddContentItem="00000000-0000-0000-0000-000000000000" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>

	</div>
	
<CM:ContentPageFooter ID="ContentPageFooter1" runat="server" NumberOfPages="1" />

    <asiweb:AsiWebPartEditorZone ID="EditorZone1" runat="server">
        <ZoneTemplate>
            <asp:PropertyGridEditorPart ID="PropertyGridEditor" runat="server" />
        </ZoneTemplate>
    </asiweb:AsiWebPartEditorZone>
    <asiweb:AsiWebPartConnectionsZone ID="ConnectionZone1" runat="server" CloseVerb-Visible="false" />
</asp:Content>