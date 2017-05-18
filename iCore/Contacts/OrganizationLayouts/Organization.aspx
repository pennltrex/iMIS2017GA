<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Organization" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactMiniProfile" Src="~/iParts/Contact Management/ContactMiniProfile/ContactMiniProfileDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactAddressEditor" Src="~/iParts/Contact Management/ContactAddressEditor/ContactAddressEditorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="GroupListEditor" Src="~/iParts/Groups/GroupListEditor/GroupListEditorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactProfilePicture" Src="~/iparts/Contact Management/ContactMiniProfile/ContactProfilePictureDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactStatus" Src="~/iParts/Contact Management/ContactMiniProfile/ContactStatusDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("8b16d124-0b2b-42c8-a207-042e72b9e4b3"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("ff902ed0-e6af-41f3-b46b-ae9891f803e6"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciMiniProfile as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("d00aa456-4b29-42ad-b54c-ffb3388682d0");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMiniProfile);

		AddChildUserControl(ContentPage2);

		childUserControl = ciFullName as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e28fcdd7-60b9-4f9b-a71d-645d3e34a14e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciFullName);

		childUserControl = ciContactAddressEditor as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("5b6e4eb6-4e0b-4b78-9be8-23e8fcd1478b");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciContactAddressEditor);

		childUserControl = ciGroupListEditor as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("22ab30eb-bee3-4d87-bb95-636e5f561806");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciGroupListEditor);

		AddChildUserControl(ContentPage3);

		childUserControl = ciPicture as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("d61b954d-f762-45e4-b311-13cc65f7916c");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciPicture);

		childUserControl = ciStatus as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("cf5c50bb-c877-4728-903a-9fd151da13b2");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciStatus);

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
				<CM:ContactMiniProfile ID="ciMiniProfile" runat="server" ContentKey="8b16d124-0b2b-42c8-a207-042e72b9e4b3" ContentItemKey="d00aa456-4b29-42ad-b54c-ffb3388682d0" Title="Mini Profile" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" MaxFileSize="1024" FileTypes=".GIF,.JPG,.PNG,.BMP" MaxImageWidth="200" EnableEdit="False" DisplayForAuthorizedUsersOnly="False" DisplayContactName="True" DisplayContactTitle="True" DisplayInstitute="True" AddressToDisplay="Preferred Mailing" ChangeContactStatus="False" CustomerIdHeading="" CustomerBillingHeading="" CustomerJoinHeading="" CustomerTypeHeading="" CustomerStatusHeading="Status" MobilePhoneHeading="" CustomerPaidThruHeading="" DisplayCustomerId="False" DisplayBillingCat="False" DisplayCustomerJoinDate="False" DisplayCustomerType="False" DisplayCustomerStatus="False" DisplayPaidThru="True" DisplayContactPicture="False" EditContactName="True" IncludePrimaryOrganizationSelection="False" RequirePrimaryOrganizationSelection="False" OrganizationListQueryPath="" DisplayMobilePhone="False" />
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
				<CM:ContactMiniProfile ID="ciFullName" runat="server" ContentKey="8b16d124-0b2b-42c8-a207-042e72b9e4b3" ContentItemKey="e28fcdd7-60b9-4f9b-a71d-645d3e34a14e" Title="Full Name" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" MaxFileSize="1024" FileTypes=".GIF,.JPG,.PNG,.BMP" MaxImageWidth="0" EnableEdit="False" DisplayForAuthorizedUsersOnly="False" DisplayContactName="True" DisplayContactTitle="False" DisplayInstitute="True" AddressToDisplay="" ChangeContactStatus="False" CustomerIdHeading="" CustomerBillingHeading="" CustomerJoinHeading="" CustomerTypeHeading="" CustomerStatusHeading="Status" MobilePhoneHeading="" CustomerPaidThruHeading="" DisplayCustomerId="False" DisplayBillingCat="False" DisplayCustomerJoinDate="False" DisplayCustomerType="False" DisplayCustomerStatus="False" DisplayPaidThru="False" DisplayContactPicture="False" EditContactName="True" IncludePrimaryOrganizationSelection="False" RequirePrimaryOrganizationSelection="False" OrganizationListQueryPath="" DisplayMobilePhone="False" />
				<CM:ContactAddressEditor ID="ciContactAddressEditor" runat="server" ContentKey="8b16d124-0b2b-42c8-a207-042e72b9e4b3" ContentItemKey="5b6e4eb6-4e0b-4b78-9be8-23e8fcd1478b" Title="Contact Address Editor" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayFaxNumber="True" DisplayAddressNotes="True" DisableAddressChecking="False" AutomaticallyAcceptAddressChanges="False" ChangeAddresses="True" CreateAddresses="True" CreateAddressPurpose="False" DisplayForAuthorizedUsersOnly="True" DisplayAddressMapLink="False" />
				<CM:GroupListEditor ID="ciGroupListEditor" runat="server" ContentKey="8b16d124-0b2b-42c8-a207-042e72b9e4b3" ContentItemKey="22ab30eb-bee3-4d87-bb95-636e5f561806" Title="Group List Editor" ShowTitleFlag="False" PageTitle="Roster" DoNotRenderInDesignMode="True" ShowBorder="True" CssClass="" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" AutoCreateGroupType="" SelectedGroupTypes="ORGRELATIONSHIP" ParentType="false" GroupMode="OwnedGroups" UrlParameter="" OwnerType="" AllowEdit="True" AutoCreate="False" ShowInactive="False" DisplayProfileImage="False" AddMemberText="" DisplayForAuthorizedUsersOnly="False" LinkMode="Both" ListEntriesExpandable="True" ShowMembershipExpirationDate="False" DisplayGroupTitle="True" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

				</div>
				<div class="col-sm-3">
								<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContactProfilePicture ID="ciPicture" runat="server" ContentKey="8b16d124-0b2b-42c8-a207-042e72b9e4b3" ContentItemKey="d61b954d-f762-45e4-b311-13cc65f7916c" Title="Picture" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" MaxFileSize="1024" FileTypes=".GIF,.JPG,.PNG,.BMP" MaxImageWidth="150" EnableEdit="True" DisplayForAuthorizedUsersOnly="False" />
				<CM:ContactStatus ID="ciStatus" runat="server" ContentKey="8b16d124-0b2b-42c8-a207-042e72b9e4b3" ContentItemKey="cf5c50bb-c877-4728-903a-9fd151da13b2" Title="Status" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ChangeContactStatus="False" CustomerIdHeading="" CustomerBillingHeading="" CustomerJoinHeading="" CustomerTypeHeading="" CustomerStatusHeading="Status" CustomerPaidThruHeading="" DisplayCustomerId="False" DisplayBillingCat="False" DisplayCustomerJoinDate="False" DisplayCustomerType="False" DisplayCustomerStatus="False" DisplayPaidThru="False" DisplayForAuthorizedUsersOnly="False" />
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