<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Account Page Staff" %>
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

	override public Guid ContentRecordKey { get { return new Guid("800bdcf0-7d26-447c-aa0c-4dd15008b423"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("8a206686-f750-473e-ba85-61b935488874"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciMiniProfile as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("656cd28e-9e60-45e8-93b4-cba82e5c8b8e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMiniProfile);

		childUserControl = ciPrintandProfileButtons as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("d3e5db6d-90fc-4a10-b4a6-f4a625622537");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciPrintandProfileButtons);

		childUserControl = ciActionButtons as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("437368d8-fdee-4371-9bd9-2832b99cf551");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciActionButtons);

		childUserControl = ciRenewalButton as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("1763e838-2ad9-40ba-8a20-66dd9a826467");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRenewalButton);

		childUserControl = ciAlertDisplay as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("bf15f070-a589-44bb-bda7-2ad8ef74bc29");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAlertDisplay);

		AddChildUserControl(ContentPage2);

		childUserControl = ciAccountpagetabs as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("b511e4d0-55d8-4a38-b20d-f26d82b1af72");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAccountpagetabs);

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
				<CM:ContactMiniProfile ID="ciMiniProfile" runat="server" ContentKey="800bdcf0-7d26-447c-aa0c-4dd15008b423" ContentItemKey="656cd28e-9e60-45e8-93b4-cba82e5c8b8e" Title="Mini Profile" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="CalloutPart2" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" MaxFileSize="1024" FileTypes=".GIF,.JPG,.PNG,.BMP" MaxImageWidth="150" EnableEdit="True" DisplayForAuthorizedUsersOnly="True" DisplayContactName="True" DisplayContactTitle="True" DisplayInstitute="True" AddressToDisplay="" ChangeContactStatus="True" CustomerIdHeading="ID" CustomerBillingHeading="Billing category" CustomerJoinHeading="Member since" CustomerTypeHeading="Member type" CustomerStatusHeading="Status" MobilePhoneHeading="Mobile" CustomerPaidThruHeading="Paid through" DisplayCustomerId="True" DisplayBillingCat="False" DisplayCustomerJoinDate="True" DisplayCustomerType="True" DisplayCustomerStatus="True" DisplayPaidThru="True" DisplayContactPicture="True" EditContactName="True" IncludePrimaryOrganizationSelection="True" RequirePrimaryOrganizationSelection="False" OrganizationListQueryPath="" DisplayMobilePhone="True" />
				<CM:BigButtonPanel ID="ciPrintandProfileButtons" runat="server" ContentKey="800bdcf0-7d26-447c-aa0c-4dd15008b423" ContentItemKey="d3e5db6d-90fc-4a10-b4a6-f4a625622537" Title="Print and Profile Buttons" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="PanelNoPadding HorizontalButtons BigButtonWrapper btn-Display BigButtonPanelArea1" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="Actions" UsePopup="True" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="&quot;~/PrintProfile[ID=@SelectedID]|Print Info&quot;,&quot;Profile[ContactKey=@SelectedUser]|Public Profile&quot;,&quot;@/iCore/Tools/Duplicate_Merge[ID=@SelectedID]|Resolve Duplicates&quot;" />
				<CM:BigButtonPanel ID="ciActionButtons" runat="server" ContentKey="800bdcf0-7d26-447c-aa0c-4dd15008b423" ContentItemKey="437368d8-fdee-4371-9bd9-2832b99cf551" Title="Action Buttons" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="PanelNoPadding HorizontalButtons BigButtonWrapper btn-Dislpay BigButtonPanelArea2" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="Actions" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="&quot;~/GiveNow[ContactKey=@selecteduser](obo)|Donate&quot;,&quot;@/iCore/Content/Search[InitialArea=5A219272-F056-480A-84D3-D3EDA8365A99](obo)|Order&quot;,&quot;@/iCore/Content/Search[InitialArea=82BAE9D2-BBF2-4341-AF96-D280EA988D1D](obo)|Register&quot;,&quot;CreateCommunication[PartyId=@SelectedID]|Email&quot;" />
				<CM:InvoicePaymentLink ID="ciRenewalButton" runat="server" ContentKey="800bdcf0-7d26-447c-aa0c-4dd15008b423" ContentItemKey="1763e838-2ad9-40ba-8a20-66dd9a826467" Title="Renewal Button" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="Section PanelNoPadding CenterText" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" LinkText="Renew Now" CancelLinkText="" InvoiceLegend="" AutoPayInvoiceLegend="Your membership will be automatically paid using {0} when due." InvoicePurposeCaption="" InvoicePurposeStandard="False" InvoicePurposeRenewal="True" DisplayOption="Hide" NoOpenInvoice="Membership is not due for renewal at this time." FilterByFinancialEntity="False" SelectedFinancialEntity="" EnableJoinButton="True" JoinDisplayToStaffOnly="False" JoinButtonText="Join Now" JoinButtonMessage="" JoinContentOrUrl="~/JoinNow" EnableRenewInAdvanceCheckbox="False" EnableRenewInAdvanceInfoMessage="" EnableRenewInAdvanceButtonText="" EnableRenewInAdvanceMessageText="" />
				<CM:AlertDisplay ID="ciAlertDisplay" runat="server" ContentKey="800bdcf0-7d26-447c-aa0c-4dd15008b423" ContentItemKey="bf15f070-a589-44bb-bda7-2ad8ef74bc29" Title="Alert Display" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="Alerts PanelNoPadding" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" SelectedNotificationSets="845f59db-52b9-4448-8209-c77b8fc1fe60" HideWhenEmpty="True" NoAlertMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-9">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:DynamicContentCollectionOrganizer ID="ciAccountpagetabs" runat="server" ContentKey="800bdcf0-7d26-447c-aa0c-4dd15008b423" ContentItemKey="b511e4d0-55d8-4a38-b20d-f26d82b1af72" Title="Account page tabs" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" SourceFolder="@/Shared_Content/Staff/Tabs" SourceKey="a12f5e50-3a0a-42f0-ba47-23898b7f561f" DefaultSourceFolder="@/iCore/Contacts/ContactLayouts/Staff/Tabs" DefaultSourceKey="2b018016-b481-4fc8-82ee-a98efe006789" />
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