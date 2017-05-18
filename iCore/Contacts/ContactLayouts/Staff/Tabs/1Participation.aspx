<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Participation" %>
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

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("98ca3c60-fde2-4597-867c-283e33dc25a8"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("cd852729-32ce-4ae1-905f-755c9e90d2ee"); } }

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
		key = new System.Guid("a6e585fa-fd91-4f86-96e0-807ed6e2b8f4");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciOrganizations);

		childUserControl = ciChaptersandSections as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("b281e52e-3890-418c-834f-181f26f2819a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciChaptersandSections);

		AddChildUserControl(ContentPage3);

		childUserControl = ciCommunities as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6482d6d9-6598-40ae-85ab-6fb8ce765b8b");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCommunities);

		childUserControl = ciCommittees as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6500d43c-ee49-46d1-831e-555b082eba54");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCommittees);

		AddChildUserControl(ContentPage4);

		childUserControl = ciOpenInvoiceList as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a093cee8-701e-4a79-8c4a-7fb3a45a8d83");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciOpenInvoiceList);

		childUserControl = ciNewContentBigButtonPanel as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("322f9791-2079-455d-a32b-e6f0903c6627");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentBigButtonPanel);

		childUserControl = ciCurrentBilling as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("44492850-4e6c-4626-aec5-903b2db58392");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCurrentBilling);

		childUserControl = ciAutomaticrenewal as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("0282ffdc-8d3b-4d8c-9245-a906c583da87");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAutomaticrenewal);

		childUserControl = ciAutomaticpaymentoptions as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("928b51a1-794f-4d16-8712-53ade2e88bb8");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAutomaticpaymentoptions);

		childUserControl = ciUpcomingEventRegistrations as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("444d14b7-4630-4577-9189-e49b7eb6f9d5");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciUpcomingEventRegistrations);

		childUserControl = ciContinuingeducationcredits as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("8d3f3a5e-c730-4353-8b39-e2039d8c5bdf");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciContinuingeducationcredits);

		childUserControl = ciVolunteerinformation as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("04a10791-b460-4377-b9c0-0bde26f5dbeb");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciVolunteerinformation);

		childUserControl = ciVolunteeravailability as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("85aaa109-7c5b-4c40-b815-3c6f4b8a4def");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciVolunteeravailability);

		childUserControl = ciVolunteerskillsandinterests as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a9afae02-15a5-428b-9353-4bbd9cdaad81");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciVolunteerskillsandinterests);

		childUserControl = ciVolunteerhistoryandschedule as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("17edb148-d228-4651-9de1-03df21dd3469");
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
				<CM:GroupListEditor ID="ciOrganizations" runat="server" ContentKey="98ca3c60-fde2-4597-867c-283e33dc25a8" ContentItemKey="a6e585fa-fd91-4f86-96e0-807ed6e2b8f4" Title="Organizations" ShowTitleFlag="False" PageTitle="Organizations" DoNotRenderInDesignMode="False" ShowBorder="False" CssClass="" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" AutoCreateGroupType="" SelectedGroupTypes="ORGRELATIONSHIP" ParentType="false" GroupMode="PartyMemberships" UrlParameter="" OwnerType="" AllowEdit="True" AutoCreate="False" ShowInactive="False" DisplayProfileImage="False" AddMemberText="Add contact" DisplayForAuthorizedUsersOnly="True" LinkMode="Both" ListEntriesExpandable="False" ShowMembershipExpirationDate="False" DisplayGroupTitle="True" />
				<CM:GroupListEditor ID="ciChaptersandSections" runat="server" ContentKey="98ca3c60-fde2-4597-867c-283e33dc25a8" ContentItemKey="b281e52e-3890-418c-834f-181f26f2819a" Title="Chapters and Sections" ShowTitleFlag="False" PageTitle="Chapters and sections" DoNotRenderInDesignMode="False" ShowBorder="False" CssClass="" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" AutoCreateGroupType="" SelectedGroupTypes="CHAPT,SEC" ParentType="false" GroupMode="PartyMemberships" UrlParameter="" OwnerType="" AllowEdit="True" AutoCreate="False" ShowInactive="False" DisplayProfileImage="False" AddMemberText="Add contact" DisplayForAuthorizedUsersOnly="True" LinkMode="Both" ListEntriesExpandable="False" ShowMembershipExpirationDate="False" DisplayGroupTitle="True" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContactCommunities ID="ciCommunities" runat="server" ContentKey="98ca3c60-fde2-4597-867c-283e33dc25a8" ContentItemKey="6482d6d9-6598-40ae-85ab-6fb8ce765b8b" Title="Communities" ShowTitleFlag="False" PageTitle="Communities" DoNotRenderInDesignMode="False" ShowBorder="False" NotSubscribedMessage="This person has not joined any communities" PageSize="20" />
				<CM:GroupListEditor ID="ciCommittees" runat="server" ContentKey="98ca3c60-fde2-4597-867c-283e33dc25a8" ContentItemKey="6500d43c-ee49-46d1-831e-555b082eba54" Title="Committees" ShowTitleFlag="False" PageTitle="Committees" DoNotRenderInDesignMode="False" ShowBorder="False" CssClass="" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" AutoCreateGroupType="" SelectedGroupTypes="COMMITTEE" ParentType="false" GroupMode="PartyMemberships" UrlParameter="" OwnerType="" AllowEdit="True" AutoCreate="False" ShowInactive="False" DisplayProfileImage="False" AddMemberText="Add contact" DisplayForAuthorizedUsersOnly="True" LinkMode="Both" ListEntriesExpandable="False" ShowMembershipExpirationDate="False" DisplayGroupTitle="True" />
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
				<CM:OpenInvoiceListDisplay ID="ciOpenInvoiceList" runat="server" ContentKey="98ca3c60-fde2-4597-867c-283e33dc25a8" ContentItemKey="a093cee8-701e-4a79-8c4a-7fb3a45a8d83" Title="Open Invoice List" ShowTitleFlag="False" PartTitle="Open invoices" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayForAuthorizedUsersOnly="True" DisplayOption="Show" NoOpenInvoice="There are no open invoices at this time." FilterByFinancialEntity="False" SelectedFinancialEntity="" />
				<CM:BigButtonPanel ID="ciNewContentBigButtonPanel" runat="server" ContentKey="98ca3c60-fde2-4597-867c-283e33dc25a8" ContentItemKey="322f9791-2079-455d-a32b-e6f0903c6627" Title="New ContentBigButtonPanel" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="BigButtonWrapper btn-Display" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="Actions" UsePopup="True" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="True" Links="&quot;@/iCore/Contacts/Account_Statement[ID=@SelectedID]|View Statement&quot;" />
				<CM:QueryMenu ID="ciCurrentBilling" runat="server" ContentKey="98ca3c60-fde2-4597-867c-283e33dc25a8" ContentItemKey="44492850-4e6c-4626-aec5-903b2db58392" Title="Current Billing" ShowTitleFlag="False" PartTitle="Current billing" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="10" PagerMode="Simple" MenuCaptionText="" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="$/ContactManagement/DefaultSystem/Queries/Advanced/Contact/Financial/Open Invoices Summary" SourceKey="e3da1e0f-1287-43d0-bf6c-5aaede33708b" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:AutomaticPaymentEnrollments ID="ciAutomaticrenewal" runat="server" ContentKey="98ca3c60-fde2-4597-867c-283e33dc25a8" ContentItemKey="0282ffdc-8d3b-4d8c-9245-a906c583da87" Title="Automatic renewal" ShowTitleFlag="False" PartTitle="Automatic renewal" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnrollmentTypeDisplayed="Membership" DisplayCancelledEnrollments="True" HideGridIfNoEnrollments="True" NoEnrollmentsMessage="You are not enrolled in automatic payments" />
				<CM:PaymentOptionManager ID="ciAutomaticpaymentoptions" runat="server" ContentKey="98ca3c60-fde2-4597-867c-283e33dc25a8" ContentItemKey="928b51a1-794f-4d16-8712-53ade2e88bb8" Title="Automatic payment options" ShowTitleFlag="False" PartTitle="Automatic payment options" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" />
				<CM:QueryMenu ID="ciUpcomingEventRegistrations" runat="server" ContentKey="98ca3c60-fde2-4597-867c-283e33dc25a8" ContentItemKey="444d14b7-4630-4577-9189-e49b7eb6f9d5" Title="Upcoming Event Registrations" ShowTitleFlag="False" PartTitle="Upcoming event registrations" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="10" PagerMode="Simple" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="$/ContactManagement/DefaultSystem/Queries/My Registrations" SourceKey="a1804c87-e905-4080-9b8d-ac205af749e1" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:PanelEditor ID="ciContinuingeducationcredits" runat="server" ContentKey="98ca3c60-fde2-4597-867c-283e33dc25a8" ContentItemKey="8d3f3a5e-c730-4353-8b39-e2039d8c5bdf" Title="Continuing education credits" ShowTitleFlag="False" PartTitle="Continuing education credits" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="True" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PanelDefinitionId="e98cc9ac-d98b-4487-90b3-52bedd95314c" AllowEdit="True" DefaultEditMode="False" CommitSequence="0" AllowDelete="True" AllowAdd="True" EditWindowWidth="600" EditWindowHeight="400" DisplayForAuthorizedUsersOnly="True" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" HidePanelWhenEmpty="False" ScrollingCellsEnabled="False" />
				<CM:PanelEditor ID="ciVolunteerinformation" runat="server" ContentKey="98ca3c60-fde2-4597-867c-283e33dc25a8" ContentItemKey="04a10791-b460-4377-b9c0-0bde26f5dbeb" Title="Volunteer information" ShowTitleFlag="False" PartTitle="Volunteer information" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="True" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PanelDefinitionId="5d7560a2-fe51-4f31-a0c1-aaca85d63753" AllowEdit="True" DefaultEditMode="False" CommitSequence="0" AllowDelete="False" AllowAdd="True" EditWindowWidth="600" EditWindowHeight="400" DisplayForAuthorizedUsersOnly="True" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" HidePanelWhenEmpty="False" ScrollingCellsEnabled="False" />
				<CM:PanelEditor ID="ciVolunteeravailability" runat="server" ContentKey="98ca3c60-fde2-4597-867c-283e33dc25a8" ContentItemKey="85aaa109-7c5b-4c40-b815-3c6f4b8a4def" Title="Volunteer availability" ShowTitleFlag="False" PartTitle="Volunteer availability" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="True" Collapsed="True" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PanelDefinitionId="d3d3ceb1-be0f-4804-a399-e0ab416e8c02" AllowEdit="True" DefaultEditMode="False" CommitSequence="0" AllowDelete="True" AllowAdd="True" EditWindowWidth="600" EditWindowHeight="400" DisplayForAuthorizedUsersOnly="True" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" HidePanelWhenEmpty="False" ScrollingCellsEnabled="False" />
				<CM:PanelEditor ID="ciVolunteerskillsandinterests" runat="server" ContentKey="98ca3c60-fde2-4597-867c-283e33dc25a8" ContentItemKey="a9afae02-15a5-428b-9353-4bbd9cdaad81" Title="Volunteer skills and interests" ShowTitleFlag="False" PartTitle="Volunteer skills and interests" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="True" Collapsed="True" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PanelDefinitionId="30ed046c-4d22-4f62-b352-39468fabcee8" AllowEdit="True" DefaultEditMode="False" CommitSequence="0" AllowDelete="True" AllowAdd="True" EditWindowWidth="800" EditWindowHeight="600" DisplayForAuthorizedUsersOnly="True" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" HidePanelWhenEmpty="False" ScrollingCellsEnabled="False" />
				<CM:PanelEditor ID="ciVolunteerhistoryandschedule" runat="server" ContentKey="98ca3c60-fde2-4597-867c-283e33dc25a8" ContentItemKey="17edb148-d228-4651-9de1-03df21dd3469" Title="Volunteer history and schedule" ShowTitleFlag="False" PartTitle="Volunteer history and schedule" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="True" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PanelDefinitionId="7a418ab4-8a05-47e8-b559-89e2552a41ef" AllowEdit="True" DefaultEditMode="False" CommitSequence="0" AllowDelete="True" AllowAdd="True" EditWindowWidth="600" EditWindowHeight="400" DisplayForAuthorizedUsersOnly="True" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" HidePanelWhenEmpty="False" ScrollingCellsEnabled="False" />
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