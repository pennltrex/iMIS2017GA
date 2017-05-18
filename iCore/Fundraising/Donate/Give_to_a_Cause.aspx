<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Give to a Cause" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="DonationCreator" Src="~/iParts/Fundraising/DonationCreator/DonationCreatorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="RecurringDonationCreator" Src="~/iParts/Fundraising/RecurringDonationCreator/RecurringDonationCreatorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactAccountCreator" Src="~/iParts/Contact Management/ContactAccountCreator/ContactAccountCreatorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="DisplayNameEditor" Src="~/iParts/Contact Management/DisplayNameEditor/DisplayNameEditorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="TributeGiftEditor" Src="~/iParts/Fundraising/TributeGiftEditor/TributeGiftEditorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="PaymentCreator" Src="~/iParts/Commerce/PaymentCreator/PaymentCreatorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="SubmitOrderButtonLink" Src="~/iParts/Commerce/SubmitOrderButtonLink/SubmitOrderButtonLinkDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("e399c2f7-e6d7-41f9-980c-da07ac31deb1"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("dfd9a3cc-0380-4df2-b90b-8678706f811f"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciDonationCreator as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("32bccc6e-d0cd-4be9-9307-ae3ad2ea10c3");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDonationCreator);

		childUserControl = ciAnnualRecurringClause_6c36a5a389b745bb9449f789f0c5c8d8 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6c36a5a3-89b7-45bb-9449-f789f0c5c8d8");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAnnualRecurringClause_6c36a5a389b745bb9449f789f0c5c8d8);

		childUserControl = ciMydetails_6e79d152c5b3411ebea8343590dfc6c4 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6e79d152-c5b3-411e-bea8-343590dfc6c4");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMydetails_6e79d152c5b3411ebea8343590dfc6c4);

		childUserControl = ciRecurringDonationCreatorCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("337c9233-ac05-42c0-9a43-7d6b0c014397");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRecurringDonationCreatorCommon);

		childUserControl = ciMakedonationcontact as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("4d8325f1-a070-4977-a1c5-4ee0def79652");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMakedonationcontact);

		childUserControl = ciDisplayName as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("27862e68-73ab-42c6-b043-145b40ba79c9");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDisplayName);

		childUserControl = ciTributeGift as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("679b72b6-01a1-412b-8b09-32a2ee50f1ab");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciTributeGift);

		childUserControl = ciPaymentCreator as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("024f8b5c-0185-4d21-aa62-2e3e6b537edb");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciPaymentCreator);

		childUserControl = ciSubmitDonation as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("027e7d0c-e447-4ccd-8167-cce4d6655985");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSubmitDonation);

	}
</script>
<asp:Content ID="TemplateUserMessages" ContentPlaceHolderID="TemplateUserMessages" runat="server"></asp:Content>
<asp:Content ID="TemplateBody" ContentPlaceHolderID="TemplateBody" Runat="Server">
<script type="text/javascript">

</script>
	<asiweb:AsiWebPartManager id="WebPartManager1" runat="server">
		<StaticConnections>
			<asp:WebPartConnection ID="WebPartConnection1" ConsumerID="ciDisplayName" ConsumerConnectionPointID="AsiObject" ProviderID="ciDonationCreator" ProviderConnectionPointID="AsiObject" />
			<asp:WebPartConnection ID="WebPartConnection2" ConsumerID="ciTributeGift" ConsumerConnectionPointID="AsiObject" ProviderID="ciDonationCreator" ProviderConnectionPointID="AsiObject" />
			<asp:WebPartConnection ID="WebPartConnection3" ConsumerID="ciPaymentCreator" ConsumerConnectionPointID="AsiObject" ProviderID="ciDonationCreator" ProviderConnectionPointID="AsiObject" />
			<asp:WebPartConnection ID="WebPartConnection4" ConsumerID="ciRecurringDonationCreatorCommon" ConsumerConnectionPointID="AsiObject" ProviderID="ciDonationCreator" ProviderConnectionPointID="AsiObject" />
			<asp:WebPartConnection ID="WebPartConnection5" ConsumerID="ciSubmitDonation" ConsumerConnectionPointID="AsiObject" ProviderID="ciPaymentCreator" ProviderConnectionPointID="AsiObject" />
		</StaticConnections>
	</asiweb:AsiWebPartManager>
<div>
	<div class="row">
		<div class="col-sm-12">
						<CM:ContentPage ID="ContentPage1" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone1_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:DonationCreator ID="ciDonationCreator" runat="server" ContentKey="e399c2f7-e6d7-41f9-980c-da07ac31deb1" ContentItemKey="32bccc6e-d0cd-4be9-9307-ae3ad2ea10c3" Title="DonationCreator" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="donate-page" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayItemDescription="True" AllowSoftCreditAssignment="False" ProcessingMode="GiveNGo" PaymentTermOption="Fixed" CommitSequence="2" DistributionMode="SelectFromList" DistributionValue="" PaymentTermOptionsValue="f5357185-db9e-4844-bf57-93865dcf6cf0" ItemAddedLabel="" GiftArrayIQAQueryPath="" DisplayPremiums="True" PremiumDisplayMode="EnterAmountFirst" PremiumSectionTitle="Select a thank you gift" ChooseNoPremium="True" NoPremiumTitle="No thank you gift" NoPremiumDescription="I would like the entire amount of my contribution to benefit the organization." PremiumGiftAmountLabel="Gift Amount:" />
				<CM:ContentHtml ID="ciAnnualRecurringClause_6c36a5a389b745bb9449f789f0c5c8d8" runat="server" ContentKey="e399c2f7-e6d7-41f9-980c-da07ac31deb1" ContentItemKey="6c36a5a3-89b7-45bb-9449-f789f0c5c8d8" Title="Annual Recurring Clause" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_AnnualRecurringClause" runat="server"><h3><span>Your annually recurring gift will provide crucial protection for habitats around the world.</span></h3></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciMydetails_6e79d152c5b3411ebea8343590dfc6c4" runat="server" ContentKey="e399c2f7-e6d7-41f9-980c-da07ac31deb1" ContentItemKey="6e79d152-c5b3-411e-bea8-343590dfc6c4" Title="My details" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Mydetails" runat="server"><h2>My details</h2></asp:Panel></CM:ContentHtml>
				<CM:RecurringDonationCreator ID="ciRecurringDonationCreatorCommon" runat="server" ContentKey="e399c2f7-e6d7-41f9-980c-da07ac31deb1" ContentItemKey="337c9233-ac05-42c0-9a43-7d6b0c014397" Title="RecurringDonationCreatorCommon" ShowTitleFlag="False" PartTitle="Give regularly?" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" CommitSequence="3" RecurrentGiftFrequency="FixedAnnualFrequency" MakeRecurringTextYes="Yes, please make this a recurring gift" MakeRecurringTextNo="No, this is a one time gift" GiftFrequencyMessage="Select gift frequency" />
				<CM:ContactAccountCreator ID="ciMakedonationcontact" runat="server" ContentKey="e399c2f7-e6d7-41f9-980c-da07ac31deb1" ContentItemKey="4d8325f1-a070-4977-a1c5-4ee0def79652" Title="Make donation contact" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="iPartChain MiddlePart" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" HideForAuthenticatedUsers="True" AccountTypeAllowed="IndividualOnly" IncludeSuffix="True" IncludePrefix="False" IncludeDesignation="False" IncludeInformalName="False" IncludeTitle="False" IncludePhone="False" IncludeMobilePhone="False" IncludeEmail="True" RequireEmailForOrganization="True" IncludeEmailForIndividual="True" RequireEmailForIndividual="True" RequireAddress2="True" IncludeAddress="True" MultipleAddressLines="False" SingleTextAddress="False" NoEmailDuplicates="True" CreateAddressPurpose="Address" IncludeLogOnLink="True" IncludeOptionToCreateLogon="True" RequireUserToCreateLogon="True" UseEmailAsLogon="True" UrlRedirect="" RedirectLocation="DoNotRedirect" CommitSequence="1" IncludePrimaryOrganizationSelection="False" RequirePrimaryOrganizationSelection="False" OrganizationListQueryPath="" IncludeIdAsQuerystringParameter="False" IncludeSocialMediaSignupOption="False" AssignCompanyAdministrator="False" IncludeMiddleName="True" />
				<CM:DisplayNameEditor ID="ciDisplayName" runat="server" ContentKey="e399c2f7-e6d7-41f9-980c-da07ac31deb1" ContentItemKey="27862e68-73ab-42c6-b043-145b40ba79c9" Title="DisplayName" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="iPartChain MiddlePart" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" CommitSequence="3" SalutationType="LIST_AS" AnonCheckboxText="Please make this an anonymous gift" LabelText="Name(s) I would like to be recognized as for this gift:" DisplayForAuthorizedUsersOnly="True" />
				<CM:TributeGiftEditor ID="ciTributeGift" runat="server" ContentKey="e399c2f7-e6d7-41f9-980c-da07ac31deb1" ContentItemKey="679b72b6-01a1-412b-8b09-32a2ee50f1ab" Title="Tribute Gift" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="iPartChain LastPart" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" CommitSequence="4" ShowNotifyDetails="True" ShowNotifyText="Please inform the following person about my donation" HonoreeQueryKey="00000000-0000-0000-0000-000000000000" HonoreeQueryPath="" IncludeEmailForIndividual="True" RequireEmailForIndividual="False" RequireAddress="False" IncludeAddress="True" MultipleAddressLines="True" CreateAddressPurpose="Address" />
				<CM:PaymentCreator ID="ciPaymentCreator" runat="server" ContentKey="e399c2f7-e6d7-41f9-980c-da07ac31deb1" ContentItemKey="024f8b5c-0185-4d21-aa62-2e3e6b537edb" Title="PaymentCreator" ShowTitleFlag="False" PartTitle="Payment details" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PaymentPurpose="Donation" DisplayUpdate="False" CommitSequence="5" PurchaseOrderNumberRequired="True" />
				<CM:SubmitOrderButtonLink ID="ciSubmitDonation" runat="server" ContentKey="e399c2f7-e6d7-41f9-980c-da07ac31deb1" ContentItemKey="027e7d0c-e447-4ccd-8167-cce4d6655985" Title="Submit Donation" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PromptUnauthenticatedUsers="True" OrderConfirmationUrl="@/iCore/Fundraising/Donation_Thank_You_Page" OrderPurpose="Donation" CommitSequence="6" OrderConfirmationContentKey="00000000-0000-0000-0000-000000000000" />
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