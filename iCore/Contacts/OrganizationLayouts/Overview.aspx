<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Overview" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactMiniProfile" Src="~/iParts/Contact Management/ContactMiniProfile/ContactMiniProfileDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="PanelEditor" Src="~/iparts/Common/PanelEditor/PanelEditorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="SocialProfileListCreator" Src="~/iParts/Contact Management/SocialProfileListCreator/SocialProfileListCreatorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="GroupListEditor" Src="~/iParts/Groups/GroupListEditor/GroupListEditorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("dfb18597-2c00-4f10-af0f-784d3b2bcdfd"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("93cb38fe-b4e7-4f01-82de-abc7e541ac51"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciMiniProfile as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("578ee015-17d1-4e7f-a7c4-b8c5617a7976");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMiniProfile);

		AddChildUserControl(ContentPage2);

		childUserControl = ciProfileSection as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("f9eea380-58db-4e1d-9019-9af737aafdd3");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciProfileSection);

		childUserControl = ciSocialProfileListCreator as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("c73af46f-47a7-4912-8a4c-c236af641249");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSocialProfileListCreator);

		childUserControl = ciGroupListEditor as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("15cb4672-4d28-4a5e-a961-4182994e13af");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciGroupListEditor);

		AddChildUserControl(ContentPage3);

		childUserControl = ciConference_0828e627eded45b8847d7e564134c795 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("0828e627-eded-45b8-847d-7e564134c795");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciConference_0828e627eded45b8847d7e564134c795);

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
				<CM:ContactMiniProfile ID="ciMiniProfile" runat="server" ContentKey="dfb18597-2c00-4f10-af0f-784d3b2bcdfd" ContentItemKey="578ee015-17d1-4e7f-a7c4-b8c5617a7976" Title="Mini Profile" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" MaxFileSize="1024" FileTypes=".GIF,.JPG,.PNG,.BMP" MaxImageWidth="200" EnableEdit="False" DisplayForAuthorizedUsersOnly="False" DisplayContactName="True" DisplayContactTitle="True" DisplayInstitute="True" AddressToDisplay="Preferred Mailing" ChangeContactStatus="False" CustomerIdHeading="" CustomerBillingHeading="" CustomerJoinHeading="" CustomerTypeHeading="" CustomerStatusHeading="Status" MobilePhoneHeading="" CustomerPaidThruHeading="" DisplayCustomerId="False" DisplayBillingCat="False" DisplayCustomerJoinDate="False" DisplayCustomerType="False" DisplayCustomerStatus="False" DisplayPaidThru="False" DisplayContactPicture="True" EditContactName="False" IncludePrimaryOrganizationSelection="False" RequirePrimaryOrganizationSelection="False" OrganizationListQueryPath="" DisplayMobilePhone="False" />
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
				<CM:PanelEditor ID="ciProfileSection" runat="server" ContentKey="dfb18597-2c00-4f10-af0f-784d3b2bcdfd" ContentItemKey="f9eea380-58db-4e1d-9019-9af737aafdd3" Title="ProfileSection" ShowTitleFlag="False" PartTitle="Profile" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PanelDefinitionId="a27ea058-2c88-4227-99c4-9723b93b2d86" AllowEdit="True" DefaultEditMode="False" CommitSequence="0" AllowDelete="False" AllowAdd="True" EditWindowWidth="600" EditWindowHeight="400" DisplayForAuthorizedUsersOnly="False" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" HidePanelWhenEmpty="False" ScrollingCellsEnabled="False" />
				<CM:SocialProfileListCreator ID="ciSocialProfileListCreator" runat="server" ContentKey="dfb18597-2c00-4f10-af0f-784d3b2bcdfd" ContentItemKey="c73af46f-47a7-4912-8a4c-c236af641249" Title="Social Profile List Creator" ShowTitleFlag="False" PartTitle="Social Profiles" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" NoRecordsFound="There are no social profiles defined." />
				<CM:GroupListEditor ID="ciGroupListEditor" runat="server" ContentKey="dfb18597-2c00-4f10-af0f-784d3b2bcdfd" ContentItemKey="15cb4672-4d28-4a5e-a961-4182994e13af" Title="Group List Editor" ShowTitleFlag="False" PageTitle="Roster" DoNotRenderInDesignMode="False" ShowBorder="True" CssClass="" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" AutoCreateGroupType="" SelectedGroupTypes="ORGRELATIONSHIP" ParentType="" GroupMode="OwnedGroups" UrlParameter="" OwnerType="" AllowEdit="True" AutoCreate="False" ShowInactive="False" DisplayProfileImage="False" AddMemberText="" DisplayForAuthorizedUsersOnly="False" LinkMode="MembershipDetails" ListEntriesExpandable="True" ShowMembershipExpirationDate="False" DisplayGroupTitle="True" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

				</div>
				<div class="col-sm-3">
								<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciConference_0828e627eded45b8847d7e564134c795" runat="server" ContentKey="dfb18597-2c00-4f10-af0f-784d3b2bcdfd" ContentItemKey="0828e627-eded-45b8-847d-7e564134c795" Title="Conference" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Conference" runat="server"><img src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/conferencebanner.jpg" style="vertical-align: top;" alt="Find out more about the upcoming Annual Conference" /></asp:Panel></CM:ContentHtml>
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