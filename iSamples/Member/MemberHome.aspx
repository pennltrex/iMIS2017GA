<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Member Home" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactMiniProfile" Src="~/iParts/Contact Management/ContactMiniProfile/ContactMiniProfileDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="InvoicePaymentLink" Src="~/iParts/Commerce/InvoicePaymentLink/InvoicePaymentLinkDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="GroupListEditor" Src="~/iParts/Groups/GroupListEditor/GroupListEditorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactCommunities" Src="~/iParts/Contact Management/ContactCommunities/ContactCommunitiesDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="BigButtonPanel" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/DisplayBigButtonPanel.ascx" %>
<%@ Register TagPrefix="CM" TagName="AlertDisplay" Src="~/iParts/Communications/Notification/NotificationDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentTaggedList" Src="~/AsiCommon/Controls/ContentManagement/DisplayTaggedList.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_RecentActivity" Src="~/AsiCommon/Controls/CommunityManagement/Community/RecentActivity.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_FeaturedBlog1" Src="~/AsiCommon/Controls/CommunityManagement/Blog/BlogListItem.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("6b014aaf-790e-4999-9b5f-7fcc9e71f65f"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("8b034a24-1cb5-4f74-8843-baf6b4a0c584"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciMyProfile as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("44dbc6c0-8cd1-4bf2-8f0c-d22ec173fea6");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMyProfile);

		childUserControl = ciRenewNow as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("f3d10518-b674-40ec-857f-9509afc56e03");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRenewNow);

		childUserControl = ciMyOrganizations as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("1fcaba4c-5a37-4e4a-be74-e5155e3a0f6d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMyOrganizations);

		childUserControl = ciMyCommunities as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("0f1d7025-6a26-4027-9d24-6e88311e0f00");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMyCommunities);

		childUserControl = ciViewAllCommunities as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("26cfece9-f122-4c73-b608-56948c471ee2");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciViewAllCommunities);

		childUserControl = ciMyChaptersandSections as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("227b7f2e-424c-4500-a42b-c71488fac2d1");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMyChaptersandSections);

		childUserControl = ciMyCommittees as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("fc2b12ba-61cd-4743-8109-97a89a5a04cd");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMyCommittees);

		AddChildUserControl(ContentPage2);

		childUserControl = ciAlertDisplay as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("8a72f603-8c9a-4ebe-a723-0e57f32fb4a5");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAlertDisplay);

		childUserControl = ciAnnouncements as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("976d37ba-ba0a-4776-8749-670c6b4a2b4b");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAnnouncements);

		childUserControl = ciRecentActivity as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("42033ec9-34d9-4ce4-873b-61275011743e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRecentActivity);

		AddChildUserControl(ContentPage3);

		childUserControl = ciConferenceAnnouncement_765fb707da55481fa0ff31705ead32a1 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("765fb707-da55-481f-a0ff-31705ead32a1");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciConferenceAnnouncement_765fb707da55481fa0ff31705ead32a1);

		childUserControl = ciViewAllEvents as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e5ad4809-5c04-4895-9f5a-574af65be5b1");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciViewAllEvents);

		childUserControl = ciFeaturedBlogTitle_ef162789debc4941a98d4c3b87ba0da9 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("ef162789-debc-4941-a98d-4c3b87ba0da9");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciFeaturedBlogTitle_ef162789debc4941a98d4c3b87ba0da9);

		childUserControl = ciFeaturedBlog1 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("69c2b4e7-13ff-4c1c-a82a-cb0d39f781da");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciFeaturedBlog1);

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
		<div class="col-sm-3">
						<CM:ContentPage ID="ContentPage1" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone1_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone SecondaryColumn">
					<ZoneTemplate>
				<CM:ContactMiniProfile ID="ciMyProfile" runat="server" ContentKey="6b014aaf-790e-4999-9b5f-7fcc9e71f65f" ContentItemKey="44dbc6c0-8cd1-4bf2-8f0c-d22ec173fea6" Title="My Profile" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="CalloutPart2" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" MaxFileSize="1024" FileTypes=".GIF,.JPG,.PNG,.BMP" MaxImageWidth="150" EnableEdit="False" DisplayForAuthorizedUsersOnly="True" DisplayContactName="True" DisplayContactTitle="True" DisplayInstitute="True" AddressToDisplay="" ChangeContactStatus="False" CustomerIdHeading="ID" CustomerBillingHeading="" CustomerJoinHeading="" CustomerTypeHeading="" CustomerStatusHeading="" MobilePhoneHeading="" CustomerPaidThruHeading="Paid through" DisplayCustomerId="False" DisplayBillingCat="False" DisplayCustomerJoinDate="False" DisplayCustomerType="False" DisplayCustomerStatus="False" DisplayPaidThru="True" DisplayContactPicture="True" EditContactName="False" IncludePrimaryOrganizationSelection="False" RequirePrimaryOrganizationSelection="False" OrganizationListQueryPath="" DisplayMobilePhone="False" />
				<CM:InvoicePaymentLink ID="ciRenewNow" runat="server" ContentKey="6b014aaf-790e-4999-9b5f-7fcc9e71f65f" ContentItemKey="f3d10518-b674-40ec-857f-9509afc56e03" Title="Renew Now" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="iPartChain LastPart CalloutPart2 CenterText" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" LinkText="Renew Now" CancelLinkText="" InvoiceLegend="" AutoPayInvoiceLegend="Your membership is due for renewal and will be automatically paid using {0}" InvoicePurposeCaption="" InvoicePurposeStandard="False" InvoicePurposeRenewal="True" DisplayOption="Hide" NoOpenInvoice="No invoices due at this time." FilterByFinancialEntity="False" SelectedFinancialEntity="" EnableJoinButton="True" JoinDisplayToStaffOnly="False" JoinButtonText="Join Now" JoinButtonMessage="" JoinContentOrUrl="~/JoinNow" EnableRenewInAdvanceCheckbox="False" EnableRenewInAdvanceInfoMessage="" EnableRenewInAdvanceButtonText="" EnableRenewInAdvanceMessageText="" />
				<CM:GroupListEditor ID="ciMyOrganizations" runat="server" ContentKey="6b014aaf-790e-4999-9b5f-7fcc9e71f65f" ContentItemKey="1fcaba4c-5a37-4e4a-be74-e5155e3a0f6d" Title="My Organizations" ShowTitleFlag="False" PageTitle="My Organizations" DoNotRenderInDesignMode="False" ShowBorder="False" CssClass="" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" AutoCreateGroupType="" SelectedGroupTypes="ORGRELATIONSHIP" ParentType="false" GroupMode="PartyMemberships" UrlParameter="" OwnerType="" AllowEdit="False" AutoCreate="False" ShowInactive="False" DisplayProfileImage="False" AddMemberText="Add contact" DisplayForAuthorizedUsersOnly="True" LinkMode="Profile" ListEntriesExpandable="False" ShowMembershipExpirationDate="False" DisplayGroupTitle="True" />
				<CM:ContactCommunities ID="ciMyCommunities" runat="server" ContentKey="6b014aaf-790e-4999-9b5f-7fcc9e71f65f" ContentItemKey="0f1d7025-6a26-4027-9d24-6e88311e0f00" Title="My Communities" ShowTitleFlag="False" PageTitle="My Communities" DoNotRenderInDesignMode="False" ShowBorder="False" NotSubscribedMessage="You have not joined any communities" PageSize="20" />
				<CM:BigButtonPanel ID="ciViewAllCommunities" runat="server" ContentKey="6b014aaf-790e-4999-9b5f-7fcc9e71f65f" ContentItemKey="26cfece9-f122-4c73-b608-56948c471ee2" Title="View All Communities" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="Actions" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="&quot;@/iCore/Communities/CommunitiesList|View All Communities&quot;" />
				<CM:GroupListEditor ID="ciMyChaptersandSections" runat="server" ContentKey="6b014aaf-790e-4999-9b5f-7fcc9e71f65f" ContentItemKey="227b7f2e-424c-4500-a42b-c71488fac2d1" Title="My Chapters and Sections" ShowTitleFlag="False" PageTitle="My Chapters &amp; Sections" DoNotRenderInDesignMode="False" ShowBorder="False" CssClass="" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" AutoCreateGroupType="" SelectedGroupTypes="CHAPT,SEC" ParentType="false" GroupMode="PartyMemberships" UrlParameter="" OwnerType="" AllowEdit="False" AutoCreate="False" ShowInactive="False" DisplayProfileImage="False" AddMemberText="Add contact" DisplayForAuthorizedUsersOnly="False" LinkMode="Profile" ListEntriesExpandable="False" ShowMembershipExpirationDate="False" DisplayGroupTitle="True" />
				<CM:GroupListEditor ID="ciMyCommittees" runat="server" ContentKey="6b014aaf-790e-4999-9b5f-7fcc9e71f65f" ContentItemKey="fc2b12ba-61cd-4743-8109-97a89a5a04cd" Title="My Committees" ShowTitleFlag="False" PageTitle="My Committees" DoNotRenderInDesignMode="False" ShowBorder="False" CssClass="" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" AutoCreateGroupType="" SelectedGroupTypes="COMMITTEE" ParentType="false" GroupMode="PartyMemberships" UrlParameter="" OwnerType="" AllowEdit="False" AutoCreate="False" ShowInactive="False" DisplayProfileImage="False" AddMemberText="Add contact" DisplayForAuthorizedUsersOnly="False" LinkMode="Profile" ListEntriesExpandable="False" ShowMembershipExpirationDate="False" DisplayGroupTitle="True" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-9">
			<div class="row">
				<div class="col-sm-9">
								<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:AlertDisplay ID="ciAlertDisplay" runat="server" ContentKey="6b014aaf-790e-4999-9b5f-7fcc9e71f65f" ContentItemKey="8a72f603-8c9a-4ebe-a723-0e57f32fb4a5" Title="Alert Display" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="Alerts PanelNoPadding" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" SelectedNotificationSets="9bdcb97a-74e9-44f9-8572-662bcebef006,d32c2cb8-44c7-4243-8b8d-35a048ccf576" HideWhenEmpty="True" NoAlertMessage="" />
				<CM:ContentTaggedList ID="ciAnnouncements" runat="server" ContentKey="6b014aaf-790e-4999-9b5f-7fcc9e71f65f" ContentItemKey="976d37ba-ba0a-4776-8749-670c6b4a2b4b" Title="Announcements" ShowTitleFlag="False" ListFormatKey="a41a685c-d82d-42c5-a2c3-78fc28378047" ShowTitleNoContentFlag="False" ListTitle="Announcements" FilterByPropertyName="" DateRangeType="REL" RelNumDaysBefore="0" RelNumDaysAfter="0" FixedStartDate="1/1/0001 12:00:00 AM" FixedEndDate="1/1/0001 12:00:00 AM" SortByPropertyName="PublicationDate" MaxNumResults="1" ViewAllMessage="View all" ViewAllCssClass="" IncludeSocialSharingIcons="False" TagMatchType="ANY" SortType="DESC" SelectedTags="ec401384-08e9-4c44-8f63-5041282c288e" />
				<asp:Panel ID="ste_container_RecentActivity" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_RecentActivity ID="ciRecentActivity" runat="server" MaximumResultsCount="3" CommunityDocumentKey="5c81e9b6-1769-4bca-9158-eff2e94dd595" ShowParentLink="False" ShowBorder="False" UseParentAtomObject="False" UseKeyFromURL="False" CommitSequence="0" /><asiweb:SurfToEditButtonPanel ID="ste_ciRecentActivity" runat="server" ContentKey="6b014aaf-790e-4999-9b5f-7fcc9e71f65f" ContentItemKey="42033ec9-34d9-4ce4-873b-61275011743e" /></asp:Panel>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

				</div>
				<div class="col-sm-3">
								<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone SecondaryColumn">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciConferenceAnnouncement_765fb707da55481fa0ff31705ead32a1" runat="server" ContentKey="6b014aaf-790e-4999-9b5f-7fcc9e71f65f" ContentItemKey="765fb707-da55-481f-a0ff-31705ead32a1" Title="Conference Announcement" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_ConferenceAnnouncement" runat="server"><a class="bg-img-conference-small banner-short" href="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>IMISAnnualConference">
<div class="AlignCenter banner-text">
<h2>Annual Conference</h2>
<p><strong>An engaging three-day event you won't want to miss.</strong></p>
<span class="TextButton PrimaryButton">Register Now</span>
</div>
</a></asp:Panel></CM:ContentHtml>
				<CM:BigButtonPanel ID="ciViewAllEvents" runat="server" ContentKey="6b014aaf-790e-4999-9b5f-7fcc9e71f65f" ContentItemKey="e5ad4809-5c04-4895-9f5a-574af65be5b1" Title="View All Events" ShowTitleFlag="False" PartTitle="View All Events" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="Navigation" UsePopup="False" AltText="" IncludeParentLevelItem="True" DisplayForAuthorizedUsersOnly="False" Links="&quot;@/iCore/Events/Events_List|See Events List&quot;,&quot;@/iCore/Events/Events_Calendar|See Events Calendar&quot;" />
				<CM:ContentHtml ID="ciFeaturedBlogTitle_ef162789debc4941a98d4c3b87ba0da9" runat="server" ContentKey="6b014aaf-790e-4999-9b5f-7fcc9e71f65f" ContentItemKey="ef162789-debc-4941-a98d-4c3b87ba0da9" Title="Featured Blog Title" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_FeaturedBlogTitle" runat="server"><h2>Featured Blog</h2></asp:Panel></CM:ContentHtml>
				<asp:Panel ID="ste_container_FeaturedBlog1" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_FeaturedBlog1 ID="ciFeaturedBlog1" runat="server" CommunityDocumentKey="88bbe9be-5e37-422a-82bb-135afcadb03c" ShowParentLink="False" ShowBorder="False" UseParentAtomObject="False" UseKeyFromURL="True" CommitSequence="0" /><asiweb:SurfToEditButtonPanel ID="ste_ciFeaturedBlog1" runat="server" ContentKey="6b014aaf-790e-4999-9b5f-7fcc9e71f65f" ContentItemKey="69c2b4e7-13ff-4c1c-a82a-cb0d39f781da" /></asp:Panel>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

				</div>
			</div>
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