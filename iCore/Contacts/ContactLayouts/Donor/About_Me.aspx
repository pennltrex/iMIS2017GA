<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="About Me" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactMiniProfile" Src="~/iParts/Contact Management/ContactMiniProfile/ContactMiniProfileDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="BigButtonPanel" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/DisplayBigButtonPanel.ascx" %>
<%@ Register TagPrefix="CM" TagName="PanelEditor" Src="~/iparts/Common/PanelEditor/PanelEditorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="SocialProfileListCreator" Src="~/iParts/Contact Management/SocialProfileListCreator/SocialProfileListCreatorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactAddressEditor" Src="~/iParts/Contact Management/ContactAddressEditor/ContactAddressEditorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryMenu" Src="~/iparts/Common/QueryMenu/QueryMenuDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ChangeLogonPassword" Src="~/iParts/Contact Management/ChangeLogonPassword/LogonPasswordDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("e203e629-80f5-4557-b028-060c3e08639e"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("983351b1-7f6f-450e-96a4-69afa6af3e0f"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciMiniProfile as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("34dbc7ab-bb7b-4329-bb22-9a3d625170cb");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMiniProfile);

		childUserControl = ciNewContentBigButtonPanel as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("04f0a1f3-da8b-4932-aa7c-22ad92a124e3");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentBigButtonPanel);

		AddChildUserControl(ContentPage2);

		childUserControl = ciDonorAccountProfile as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("add9ba8d-02d3-4d51-b769-12c702c35573");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDonorAccountProfile);

		childUserControl = ciSocialProfileListCreator as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("d07bd3f6-3254-44e0-8743-3a62092b0d20");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSocialProfileListCreator);

		childUserControl = ciContactAddress as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("5eaa38bb-f275-4f1d-98ed-94cc6ff1060a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciContactAddress);

		childUserControl = ciNewQueryMenuCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("dd36a9cf-3f69-4fb3-b5a3-0a457ea5f135");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewQueryMenuCommon);

		childUserControl = ciUpcomingMeetingsandEvents as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("444d14b7-4630-4577-9189-e49b7eb6f9d5");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciUpcomingMeetingsandEvents);

		childUserControl = ciOrders as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("67253b03-e396-41f3-b579-9172241c6c9f");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciOrders);

		childUserControl = ciPasswordEditor as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("092586bc-49d0-4271-8f9d-886979840c04");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciPasswordEditor);

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
				<asp:WebPartZone ID="WebPartZone1_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContactMiniProfile ID="ciMiniProfile" runat="server" ContentKey="e203e629-80f5-4557-b028-060c3e08639e" ContentItemKey="34dbc7ab-bb7b-4329-bb22-9a3d625170cb" Title="Mini Profile" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="CalloutPart2" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" MaxFileSize="1024" FileTypes=".GIF,.JPG,.PNG,.BMP" MaxImageWidth="150" EnableEdit="True" DisplayForAuthorizedUsersOnly="True" DisplayContactName="True" DisplayContactTitle="True" DisplayInstitute="True" AddressToDisplay="" ChangeContactStatus="False" CustomerIdHeading="ID" CustomerBillingHeading="Billing category" CustomerJoinHeading="Join date" CustomerTypeHeading="Type" CustomerStatusHeading="Status" MobilePhoneHeading="" CustomerPaidThruHeading="Paid through" DisplayCustomerId="False" DisplayBillingCat="False" DisplayCustomerJoinDate="False" DisplayCustomerType="False" DisplayCustomerStatus="False" DisplayPaidThru="False" DisplayContactPicture="True" EditContactName="True" IncludePrimaryOrganizationSelection="False" RequirePrimaryOrganizationSelection="False" OrganizationListQueryPath="" DisplayMobilePhone="False" />
				<CM:BigButtonPanel ID="ciNewContentBigButtonPanel" runat="server" ContentKey="e203e629-80f5-4557-b028-060c3e08639e" ContentItemKey="04f0a1f3-da8b-4932-aa7c-22ad92a124e3" Title="New ContentBigButtonPanel" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="UsePrimaryButton UseLargeButton" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="Navigation" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="&quot;~/GiveNow|Donate Now&quot;" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-9">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:PanelEditor ID="ciDonorAccountProfile" runat="server" ContentKey="e203e629-80f5-4557-b028-060c3e08639e" ContentItemKey="add9ba8d-02d3-4d51-b769-12c702c35573" Title="DonorAccountProfile" ShowTitleFlag="False" PartTitle="About me" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PanelDefinitionId="3513efe1-a18f-4526-8cb7-b4cc38c57604" AllowEdit="True" DefaultEditMode="False" CommitSequence="0" AllowDelete="False" AllowAdd="True" EditWindowWidth="600" EditWindowHeight="400" DisplayForAuthorizedUsersOnly="True" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" HidePanelWhenEmpty="False" ScrollingCellsEnabled="False" />
				<CM:SocialProfileListCreator ID="ciSocialProfileListCreator" runat="server" ContentKey="e203e629-80f5-4557-b028-060c3e08639e" ContentItemKey="d07bd3f6-3254-44e0-8743-3a62092b0d20" Title="Social Profile List Creator" ShowTitleFlag="False" PartTitle="Social profiles" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" NoRecordsFound="There are no social profiles defined." />
				<CM:ContactAddressEditor ID="ciContactAddress" runat="server" ContentKey="e203e629-80f5-4557-b028-060c3e08639e" ContentItemKey="5eaa38bb-f275-4f1d-98ed-94cc6ff1060a" Title="Contact Address" ShowTitleFlag="False" PartTitle="My addresses" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="True" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayFaxNumber="True" DisplayAddressNotes="True" DisableAddressChecking="False" AutomaticallyAcceptAddressChanges="False" ChangeAddresses="True" CreateAddresses="True" CreateAddressPurpose="False" DisplayForAuthorizedUsersOnly="True" DisplayAddressMapLink="True" />
				<CM:QueryMenu ID="ciNewQueryMenuCommon" runat="server" ContentKey="e203e629-80f5-4557-b028-060c3e08639e" ContentItemKey="dd36a9cf-3f69-4fb3-b5a3-0a457ea5f135" Title="New QueryMenuCommon" ShowTitleFlag="False" PartTitle="My giving history" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="20" PagerMode="Simple" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="$/Fundraising/DefaultSystem/Queries/Giving History - Public/Contributions By Calendar Year" SourceKey="15ea55bc-c92a-4356-afeb-0fb49de98e1d" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:QueryMenu ID="ciUpcomingMeetingsandEvents" runat="server" ContentKey="e203e629-80f5-4557-b028-060c3e08639e" ContentItemKey="444d14b7-4630-4577-9189-e49b7eb6f9d5" Title="Upcoming Meetings and Events" ShowTitleFlag="False" PartTitle="My events" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="20" PagerMode="Simple" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="$/ContactManagement/DefaultSystem/Queries/My Registrations" SourceKey="a1804c87-e905-4080-9b8d-ac205af749e1" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:QueryMenu ID="ciOrders" runat="server" ContentKey="e203e629-80f5-4557-b028-060c3e08639e" ContentItemKey="67253b03-e396-41f3-b579-9172241c6c9f" Title="Orders" ShowTitleFlag="False" PartTitle="My orders" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="20" PagerMode="Simple" MenuCaptionText="" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="$/ContactManagement/DefaultSystem/Queries/Recent Activities/Transactions/Orders" SourceKey="e9f89d58-1b81-4cd4-8d59-ded40293a3b9" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:ChangeLogonPassword ID="ciPasswordEditor" runat="server" ContentKey="e203e629-80f5-4557-b028-060c3e08639e" ContentItemKey="092586bc-49d0-4271-8f9d-886979840c04" Title="Password Editor" ShowTitleFlag="False" PartTitle="Change my password" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ChangeSecurityMessage="Use the form below to change your password." ChangeLogon="False" ChangePassword="True" DisplayCurrentLogon="False" DisplayForAuthorizedUsersOnly="True" />
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