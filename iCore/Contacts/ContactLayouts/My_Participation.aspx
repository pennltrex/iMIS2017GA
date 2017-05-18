<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="My Participation" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="GroupListEditor" Src="~/iParts/Groups/GroupListEditor/GroupListEditorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactCommunities" Src="~/iParts/Contact Management/ContactCommunities/ContactCommunitiesDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="OpenInvoiceListDisplay" Src="~/iParts/Commerce/OpenInvoiceListDisplay/OpenInvoiceListDisplayDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="BigButtonPanel" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/DisplayBigButtonPanel.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryMenu" Src="~/iparts/Common/QueryMenu/QueryMenuDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="AutomaticPaymentEnrollments" Src="~/iParts/Commerce/AutoPayEnrollments/AutoPayEnrollmentsDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="PaymentOptionManager" Src="~/iParts/Commerce/PaymentOptionManager/PaymentOptionManagerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="PanelEditor" Src="~/iparts/Common/PanelEditor/PanelEditorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="PanelCollectionEditor" Src="~/iparts/Common/PanelEditor/PanelCollectionEditorDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("93b0d127-0251-4fab-9121-cb109f0f7db6"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("3cae89b5-2732-4d63-840f-2a583e562419"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		AddChildUserControl(ContentPage2);

		childUserControl = ciOrganizations as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9c0b53ac-9bac-4c4a-b33c-6018c14e2a6b");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciOrganizations);

		childUserControl = ciCommunities as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6482d6d9-6598-40ae-85ab-6fb8ce765b8b");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCommunities);

		AddChildUserControl(ContentPage3);

		childUserControl = ciChaptersandSections as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("b281e52e-3890-418c-834f-181f26f2819a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciChaptersandSections);

		childUserControl = ciCommittees as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6500d43c-ee49-46d1-831e-555b082eba54");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCommittees);

		AddChildUserControl(ContentPage4);

		childUserControl = ciOpenInvoiceListDisplayCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("04db09b3-1616-460f-a4fa-92f24283deb4");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciOpenInvoiceListDisplayCommon);

		childUserControl = ciPrintStatement as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("322f9791-2079-455d-a32b-e6f0903c6627");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciPrintStatement);

		childUserControl = ciCurrentBilling as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("44492850-4e6c-4626-aec5-903b2db58392");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCurrentBilling);

		childUserControl = ciAutomaticrenewal as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6b5bbc6b-30cc-433f-a9bb-d2b2372a8ece");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAutomaticrenewal);

		childUserControl = ciAutomaticpaymentoptions as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6749de83-1f3a-4c43-830d-bdb72e017fe3");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAutomaticpaymentoptions);

		childUserControl = ciUpcomingMeetingsandEvents as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("444d14b7-4630-4577-9189-e49b7eb6f9d5");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciUpcomingMeetingsandEvents);

		childUserControl = ciTransactions as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("67253b03-e396-41f3-b579-9172241c6c9f");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciTransactions);

		childUserControl = ciInvoices as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("0408dd64-0135-40f9-a11b-e8cef87c3c4f");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciInvoices);

		childUserControl = ciMyrecurringdonations as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("50e28252-7354-4055-b30d-55ab4c7dece7");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMyrecurringdonations);

		childUserControl = ciNewQueryMenuCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("b39289a3-4153-456a-8e78-98d04fda187d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewQueryMenuCommon);

		childUserControl = ciVolunteerinformation as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("57e5e5ff-ee09-4673-bf4c-eeb45635b7e6");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciVolunteerinformation);

		childUserControl = ciVolunteeravailabilityandskills as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9180508a-c6a4-4bf0-abbd-a7de76c7c395");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciVolunteeravailabilityandskills);

		childUserControl = ciVolunteerhistoryandschedule as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6625bec9-3fa1-45b9-a22c-d990a79d6d63");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciVolunteerhistoryandschedule);

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
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:GroupListEditor ID="ciOrganizations" runat="server" ContentKey="93b0d127-0251-4fab-9121-cb109f0f7db6" ContentItemKey="9c0b53ac-9bac-4c4a-b33c-6018c14e2a6b" Title="Organizations" ShowTitleFlag="False" PageTitle="Organizations" DoNotRenderInDesignMode="False" ShowBorder="False" CssClass="" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" AutoCreateGroupType="" SelectedGroupTypes="ORGRELATIONSHIP" ParentType="false" GroupMode="PartyMemberships" UrlParameter="" OwnerType="" AllowEdit="False" AutoCreate="False" ShowInactive="False" DisplayProfileImage="False" AddMemberText="Add contact" DisplayForAuthorizedUsersOnly="True" LinkMode="Profile" ListEntriesExpandable="False" ShowMembershipExpirationDate="False" DisplayGroupTitle="True" />
				<CM:ContactCommunities ID="ciCommunities" runat="server" ContentKey="93b0d127-0251-4fab-9121-cb109f0f7db6" ContentItemKey="6482d6d9-6598-40ae-85ab-6fb8ce765b8b" Title="Communities" ShowTitleFlag="False" PageTitle="My communities" DoNotRenderInDesignMode="False" ShowBorder="False" NotSubscribedMessage="This person has not joined any communities" PageSize="20" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:GroupListEditor ID="ciChaptersandSections" runat="server" ContentKey="93b0d127-0251-4fab-9121-cb109f0f7db6" ContentItemKey="b281e52e-3890-418c-834f-181f26f2819a" Title="Chapters and Sections" ShowTitleFlag="False" PageTitle="My chapters and sections" DoNotRenderInDesignMode="False" ShowBorder="False" CssClass="" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" AutoCreateGroupType="" SelectedGroupTypes="CHAPT,SEC" ParentType="false" GroupMode="PartyMemberships" UrlParameter="" OwnerType="" AllowEdit="False" AutoCreate="False" ShowInactive="False" DisplayProfileImage="False" AddMemberText="Add contact" DisplayForAuthorizedUsersOnly="True" LinkMode="Profile" ListEntriesExpandable="False" ShowMembershipExpirationDate="False" DisplayGroupTitle="True" />
				<CM:GroupListEditor ID="ciCommittees" runat="server" ContentKey="93b0d127-0251-4fab-9121-cb109f0f7db6" ContentItemKey="6500d43c-ee49-46d1-831e-555b082eba54" Title="Committees" ShowTitleFlag="False" PageTitle="My committees" DoNotRenderInDesignMode="False" ShowBorder="False" CssClass="" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" AutoCreateGroupType="" SelectedGroupTypes="COMMITTEE" ParentType="false" GroupMode="PartyMemberships" UrlParameter="" OwnerType="" AllowEdit="False" AutoCreate="False" ShowInactive="False" DisplayProfileImage="False" AddMemberText="Add contact" DisplayForAuthorizedUsersOnly="True" LinkMode="Profile" ListEntriesExpandable="False" ShowMembershipExpirationDate="False" DisplayGroupTitle="True" />
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
				<CM:OpenInvoiceListDisplay ID="ciOpenInvoiceListDisplayCommon" runat="server" ContentKey="93b0d127-0251-4fab-9121-cb109f0f7db6" ContentItemKey="04db09b3-1616-460f-a4fa-92f24283deb4" Title="OpenInvoiceListDisplayCommon" ShowTitleFlag="False" PartTitle="My open invoices" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayForAuthorizedUsersOnly="True" DisplayOption="Show" NoOpenInvoice="There are no open invoices at this time." FilterByFinancialEntity="False" SelectedFinancialEntity="" />
				<CM:BigButtonPanel ID="ciPrintStatement" runat="server" ContentKey="93b0d127-0251-4fab-9121-cb109f0f7db6" ContentItemKey="322f9791-2079-455d-a32b-e6f0903c6627" Title="Print Statement" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="BigButtonWrapper btn-Display" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="Actions" UsePopup="True" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="True" Links="&quot;@/iCore/Contacts/Account_Statement[ID=@SelectedID]|View Statement&quot;" />
				<CM:QueryMenu ID="ciCurrentBilling" runat="server" ContentKey="93b0d127-0251-4fab-9121-cb109f0f7db6" ContentItemKey="44492850-4e6c-4626-aec5-903b2db58392" Title="Current Billing" ShowTitleFlag="False" PartTitle="My current billing" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="True" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="10" PagerMode="Simple" MenuCaptionText="" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="$/ContactManagement/DefaultSystem/Queries/Advanced/Contact/Financial/Open Invoices Summary" SourceKey="e3da1e0f-1287-43d0-bf6c-5aaede33708b" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:AutomaticPaymentEnrollments ID="ciAutomaticrenewal" runat="server" ContentKey="93b0d127-0251-4fab-9121-cb109f0f7db6" ContentItemKey="6b5bbc6b-30cc-433f-a9bb-d2b2372a8ece" Title="Automatic renewal" ShowTitleFlag="False" PartTitle="Automatic renewal" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="True" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnrollmentTypeDisplayed="Membership" DisplayCancelledEnrollments="False" HideGridIfNoEnrollments="True" NoEnrollmentsMessage="You are not enrolled in automatic payments" />
				<CM:PaymentOptionManager ID="ciAutomaticpaymentoptions" runat="server" ContentKey="93b0d127-0251-4fab-9121-cb109f0f7db6" ContentItemKey="6749de83-1f3a-4c43-830d-bdb72e017fe3" Title="Automatic payment options" ShowTitleFlag="False" PartTitle="Automatic payment options" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" />
				<CM:QueryMenu ID="ciUpcomingMeetingsandEvents" runat="server" ContentKey="93b0d127-0251-4fab-9121-cb109f0f7db6" ContentItemKey="444d14b7-4630-4577-9189-e49b7eb6f9d5" Title="Upcoming Meetings and Events" ShowTitleFlag="False" PartTitle="My upcoming events" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="True" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="10" PagerMode="Simple" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="$/ContactManagement/DefaultSystem/Queries/My Registrations" SourceKey="a1804c87-e905-4080-9b8d-ac205af749e1" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:QueryMenu ID="ciTransactions" runat="server" ContentKey="93b0d127-0251-4fab-9121-cb109f0f7db6" ContentItemKey="67253b03-e396-41f3-b579-9172241c6c9f" Title="Transactions" ShowTitleFlag="False" PartTitle="My recent transactions" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="True" Collapsed="True" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="10" PagerMode="Simple" MenuCaptionText="" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="$/ContactManagement/DefaultSystem/Queries/Recent Activities/Transactions/Recent Transactions" SourceKey="09c85d7c-6aa1-485d-9caa-92910017b6c0" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:QueryMenu ID="ciInvoices" runat="server" ContentKey="93b0d127-0251-4fab-9121-cb109f0f7db6" ContentItemKey="0408dd64-0135-40f9-a11b-e8cef87c3c4f" Title="Invoices" ShowTitleFlag="False" PartTitle="My invoices" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="True" Collapsed="True" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="20" PagerMode="Simple" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="False" SourceFolderPathControl="$/ContactManagement/DefaultSystem/Queries/Recent Activities/Transactions/All Invoices" SourceKey="656d2ef4-a230-4a85-b776-fa5c7190f681" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:AutomaticPaymentEnrollments ID="ciMyrecurringdonations" runat="server" ContentKey="93b0d127-0251-4fab-9121-cb109f0f7db6" ContentItemKey="50e28252-7354-4055-b30d-55ab4c7dece7" Title="My recurring donations" ShowTitleFlag="False" PartTitle="My recurring donations" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="True" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnrollmentTypeDisplayed="Donation" DisplayCancelledEnrollments="False" HideGridIfNoEnrollments="True" NoEnrollmentsMessage="You are not enrolled in automatic payments" />
				<CM:QueryMenu ID="ciNewQueryMenuCommon" runat="server" ContentKey="93b0d127-0251-4fab-9121-cb109f0f7db6" ContentItemKey="b39289a3-4153-456a-8e78-98d04fda187d" Title="New QueryMenuCommon" ShowTitleFlag="False" PartTitle="My donation history" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="True" Collapsed="True" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="10" PagerMode="Simple" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="$/Fundraising/DefaultSystem/Queries/Giving History - Public/Contributions By Calendar Year" SourceKey="15ea55bc-c92a-4356-afeb-0fb49de98e1d" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:PanelEditor ID="ciVolunteerinformation" runat="server" ContentKey="93b0d127-0251-4fab-9121-cb109f0f7db6" ContentItemKey="57e5e5ff-ee09-4673-bf4c-eeb45635b7e6" Title="Volunteer information" ShowTitleFlag="False" PartTitle="Volunteer information" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="True" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PanelDefinitionId="296166f4-aeb5-42cf-9816-a87f2682d768" AllowEdit="True" DefaultEditMode="False" CommitSequence="0" AllowDelete="False" AllowAdd="True" EditWindowWidth="600" EditWindowHeight="400" DisplayForAuthorizedUsersOnly="True" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" HidePanelWhenEmpty="False" ScrollingCellsEnabled="False" />
				<CM:PanelCollectionEditor ID="ciVolunteeravailabilityandskills" runat="server" ContentKey="93b0d127-0251-4fab-9121-cb109f0f7db6" ContentItemKey="9180508a-c6a4-4bf0-abbd-a7de76c7c395" Title="Volunteer availability and skills" ShowTitleFlag="False" PartTitle="Volunteer availability and skills" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="True" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" AllowEdit="True" DefaultEditMode="False" CommitSequence="0" AllowDelete="True" EditWindowWidth="800" EditWindowHeight="600" AddAllWindows="False" SelectedPanelDefinitionIds="d3d3ceb1-be0f-4804-a399-e0ab416e8c02,c086ad78-2c17-45b4-becf-d1e2be67910f" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" ScrollingCellsEnabled="False" />
				<CM:PanelEditor ID="ciVolunteerhistoryandschedule" runat="server" ContentKey="93b0d127-0251-4fab-9121-cb109f0f7db6" ContentItemKey="6625bec9-3fa1-45b9-a22c-d990a79d6d63" Title="Volunteer history and schedule" ShowTitleFlag="False" PartTitle="Volunteer history and schedule" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="True" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PanelDefinitionId="16e0aedc-5942-4d8a-a312-66c401cbd4fe" AllowEdit="False" DefaultEditMode="False" CommitSequence="0" AllowDelete="True" AllowAdd="True" EditWindowWidth="600" EditWindowHeight="400" DisplayForAuthorizedUsersOnly="True" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" HidePanelWhenEmpty="False" ScrollingCellsEnabled="False" />
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