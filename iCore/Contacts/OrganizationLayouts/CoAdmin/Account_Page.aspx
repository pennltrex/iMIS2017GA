<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Account" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactMiniProfile" Src="~/iParts/Contact Management/ContactMiniProfile/ContactMiniProfileDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="BigButtonPanel" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/DisplayBigButtonPanel.ascx" %>
<%@ Register TagPrefix="CM" TagName="InvoicePaymentLink" Src="~/iParts/Commerce/InvoicePaymentLink/InvoicePaymentLinkDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="AlertDisplay" Src="~/iParts/Communications/Notification/NotificationDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="DynamicContentCollectionOrganizer" Src="~/iParts/common/ContentCollectionOrganizer/DynamicContentCollectionOrganizerDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return true; } }

	override public Guid ContentRecordKey { get { return new Guid("9829e708-688c-4c69-87de-feac9e549a2b"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("b35bd84d-418c-4dca-8071-6b79deb1972e"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciMiniProfile as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("12217d61-fce3-44ef-93f3-3d1b6d46523e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMiniProfile);

		childUserControl = ciViewprofile as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("69b597ec-a1d6-4340-b563-ef2ef2e13a93");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciViewprofile);

		childUserControl = ciRenewalButton as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("f42c7d44-75c7-44ff-a93a-fe57af42869c");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRenewalButton);

		childUserControl = ciAlertDisplay as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("bf15f070-a589-44bb-bda7-2ad8ef74bc29");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAlertDisplay);

		AddChildUserControl(ContentPage2);

		childUserControl = ciOrganizationAccountTabs1 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("f83a8caa-d5e2-4c3c-aa0b-b03ed2188c2f");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciOrganizationAccountTabs1);

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
				<CM:ContactMiniProfile ID="ciMiniProfile" runat="server" ContentKey="9829e708-688c-4c69-87de-feac9e549a2b" ContentItemKey="12217d61-fce3-44ef-93f3-3d1b6d46523e" Title="Mini Profile" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="CalloutPart2" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" MaxFileSize="1024" FileTypes=".GIF,.JPG,.PNG,.BMP" MaxImageWidth="200" EnableEdit="True" DisplayForAuthorizedUsersOnly="True" DisplayContactName="True" DisplayContactTitle="True" DisplayInstitute="True" AddressToDisplay="Preferred Mailing" ChangeContactStatus="True" CustomerIdHeading="ID" CustomerBillingHeading="Billing category" CustomerJoinHeading="Join date" CustomerTypeHeading="Type" CustomerStatusHeading="Status" MobilePhoneHeading="" CustomerPaidThruHeading="Paid through" DisplayCustomerId="False" DisplayBillingCat="False" DisplayCustomerJoinDate="False" DisplayCustomerType="False" DisplayCustomerStatus="True" DisplayPaidThru="True" DisplayContactPicture="True" EditContactName="True" IncludePrimaryOrganizationSelection="False" RequirePrimaryOrganizationSelection="False" OrganizationListQueryPath="" DisplayMobilePhone="False" />
				<CM:BigButtonPanel ID="ciViewprofile" runat="server" ContentKey="9829e708-688c-4c69-87de-feac9e549a2b" ContentItemKey="69b597ec-a1d6-4340-b563-ef2ef2e13a93" Title="View profile" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="HorizontalButtons BigButtonWrapper btn-Dislpay" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="Actions" UsePopup="True" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="&quot;Organization[ContactKey=@SelectedUser]|Public profile&quot;" />
				<CM:InvoicePaymentLink ID="ciRenewalButton" runat="server" ContentKey="9829e708-688c-4c69-87de-feac9e549a2b" ContentItemKey="f42c7d44-75c7-44ff-a93a-fe57af42869c" Title="Renewal Button" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="CenterText" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" LinkText="Renew Now" CancelLinkText="" InvoiceLegend="Membership is due for renewal." AutoPayInvoiceLegend="" InvoicePurposeCaption="" InvoicePurposeStandard="False" InvoicePurposeRenewal="True" DisplayOption="Hide" NoOpenInvoice="Membership is not due for renewal at this time." FilterByFinancialEntity="False" SelectedFinancialEntity="" EnableJoinButton="True" JoinDisplayToStaffOnly="False" JoinButtonText="Join Now" JoinButtonMessage="" JoinContentOrUrl="~/OrganizationJoinNow" EnableRenewInAdvanceCheckbox="False" EnableRenewInAdvanceInfoMessage="" EnableRenewInAdvanceButtonText="" EnableRenewInAdvanceMessageText="" />
				<CM:AlertDisplay ID="ciAlertDisplay" runat="server" ContentKey="9829e708-688c-4c69-87de-feac9e549a2b" ContentItemKey="bf15f070-a589-44bb-bda7-2ad8ef74bc29" Title="Alert Display" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="Alerts PanelNoPadding" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" SelectedNotificationSets="0cf4d85a-9925-4c3b-b86a-2936640e1031" HideWhenEmpty="True" NoAlertMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-9">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:DynamicContentCollectionOrganizer ID="ciOrganizationAccountTabs1" runat="server" ContentKey="9829e708-688c-4c69-87de-feac9e549a2b" ContentItemKey="f83a8caa-d5e2-4c3c-aa0b-b03ed2188c2f" Title="Organization Account Tabs_1" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" SourceFolder="@/Shared_Content/Staff/CoAdmin_Tabs" SourceKey="66e87055-d805-4243-860b-39bd83e9fc5e" DefaultSourceFolder="@/iCore/Contacts/OrganizationLayouts/CoAdmin/CoAdmin_Tabs" DefaultSourceKey="cc7ead83-0ae5-49bf-a57d-772c86b7c051" />
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