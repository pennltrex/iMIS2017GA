<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Profile" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactMiniProfile" Src="~/iParts/Contact Management/ContactMiniProfile/ContactMiniProfileDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="AddressMapper" Src="~/iParts/Contact Management/AddressMapper/AddressMapperDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="SocialShare" Src="~/iParts/Social/SocialShare/SocialShareDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="PanelEditor" Src="~/iparts/Common/PanelEditor/PanelEditorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="SocialProfileListCreator" Src="~/iParts/Contact Management/SocialProfileListCreator/SocialProfileListCreatorDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("4dfd64d7-b189-4fe8-a516-3e2c103fd5b5"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("aea82dee-5d76-4de4-b64c-aa0b60a3d0a7"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciMiniProfile as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("23d812bb-8ba8-470d-8001-c49f69aaee83");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMiniProfile);

		childUserControl = ciNewAddressMapperCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("2406ef84-af6c-4e28-8a4b-6a88ab0e20ac");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewAddressMapperCommon);

		AddChildUserControl(ContentPage2);

		childUserControl = ciNewSocialShareCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("8af7cc36-a679-4ff7-b98c-7d2ff96e69f4");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewSocialShareCommon);

		childUserControl = ciProfileSection as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("abc2fd89-fc85-4eb3-9640-9ab687a39bb1");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciProfileSection);

		childUserControl = ciSocialProfileListCreator as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e7d42036-5101-424d-b926-e03a16f35fe5");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSocialProfileListCreator);

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
    <div class="col-sm-4">
			<CM:ContentPage ID="ContentPage1" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone1_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContactMiniProfile ID="ciMiniProfile" runat="server" ContentKey="4dfd64d7-b189-4fe8-a516-3e2c103fd5b5" ContentItemKey="23d812bb-8ba8-470d-8001-c49f69aaee83" Title="Mini Profile" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="CalloutPart2" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" MaxFileSize="1024" FileTypes=".GIF,.JPG,.PNG,.BMP" MaxImageWidth="200" EnableEdit="False" DisplayForAuthorizedUsersOnly="False" DisplayContactName="True" DisplayContactTitle="False" DisplayInstitute="True" AddressToDisplay="Preferred Mailing" ChangeContactStatus="False" CustomerIdHeading="ID" CustomerBillingHeading="Billing category" CustomerJoinHeading="Join date" CustomerTypeHeading="Type" CustomerStatusHeading="Status" MobilePhoneHeading="" CustomerPaidThruHeading="Paid through" DisplayCustomerId="False" DisplayBillingCat="False" DisplayCustomerJoinDate="False" DisplayCustomerType="False" DisplayCustomerStatus="False" DisplayPaidThru="False" DisplayContactPicture="True" EditContactName="False" IncludePrimaryOrganizationSelection="False" RequirePrimaryOrganizationSelection="False" OrganizationListQueryPath="" DisplayMobilePhone="False" />
				<CM:AddressMapper ID="ciNewAddressMapperCommon" runat="server" ContentKey="4dfd64d7-b189-4fe8-a516-3e2c103fd5b5" ContentItemKey="2406ef84-af6c-4e28-8a4b-6a88ab0e20ac" Title="New AddressMapperCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" AddressToDisplay="Preferred Mailing" MapHeight="215" MapWidth="215" ZoomLevel="12" ApiKey="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-8">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:SocialShare ID="ciNewSocialShareCommon" runat="server" ContentKey="4dfd64d7-b189-4fe8-a516-3e2c103fd5b5" ContentItemKey="8af7cc36-a679-4ff7-b98c-7d2ff96e69f4" Title="New SocialShareCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" BorderVisible="False" UrlToShare="" IconDimension="16" LegendText="Share this page" />
				<CM:PanelEditor ID="ciProfileSection" runat="server" ContentKey="4dfd64d7-b189-4fe8-a516-3e2c103fd5b5" ContentItemKey="abc2fd89-fc85-4eb3-9640-9ab687a39bb1" Title="ProfileSection" ShowTitleFlag="False" PartTitle="Profile" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PanelDefinitionId="a27ea058-2c88-4227-99c4-9723b93b2d86" AllowEdit="True" DefaultEditMode="False" CommitSequence="0" AllowDelete="False" AllowAdd="True" EditWindowWidth="600" EditWindowHeight="400" DisplayForAuthorizedUsersOnly="False" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" HidePanelWhenEmpty="False" ScrollingCellsEnabled="False" />
				<CM:SocialProfileListCreator ID="ciSocialProfileListCreator" runat="server" ContentKey="4dfd64d7-b189-4fe8-a516-3e2c103fd5b5" ContentItemKey="e7d42036-5101-424d-b926-e03a16f35fe5" Title="Social Profile List Creator" ShowTitleFlag="False" PartTitle="Social profiles" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" NoRecordsFound="There are no social profiles defined." />
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