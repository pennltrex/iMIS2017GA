<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Give Now" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="SocialShare" Src="~/iParts/Social/SocialShare/SocialShareDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ProgressTracker" Src="~/iparts/Common/ProgressTracker/ProgressTrackerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="DonationCreator" Src="~/iParts/Fundraising/DonationCreator/DonationCreatorDisplay.ascx" %>
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

	override public Guid ContentRecordKey { get { return new Guid("991d8973-6ade-4ac5-aef3-c34945a8641a"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("d06b88d1-2f6e-49bc-b2a4-744926b9dd01"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewSocialShareCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("972bf93a-6883-4ba6-a97f-f5f8b92f2366");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewSocialShareCommon);

		childUserControl = ciNewProgressTrackerCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("bc6308be-0bb7-4a0f-a2f9-8433e8ab64d4");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewProgressTrackerCommon);

		childUserControl = ciDonateImage_5396151f70c04900acece90b9392270c as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("5396151f-70c0-4900-acec-e90b9392270c");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDonateImage_5396151f70c04900acece90b9392270c);

		childUserControl = ciMakeADifference_58dbf640b40242d7b635cf6265c24bc2 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("58dbf640-b402-42d7-b635-cf6265c24bc2");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMakeADifference_58dbf640b40242d7b635cf6265c24bc2);

		AddChildUserControl(ContentPage2);

		childUserControl = ciNewContentHtml_3e536356171e4e688f6d670bd6aa83c1 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("3e536356-171e-4e68-8f6d-670bd6aa83c1");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml_3e536356171e4e688f6d670bd6aa83c1);

		childUserControl = ciDonationCreator as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("32bccc6e-d0cd-4be9-9307-ae3ad2ea10c3");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDonationCreator);

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
    <div class="col-sm-4">
			<CM:ContentPage ID="ContentPage1" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone1_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:SocialShare ID="ciNewSocialShareCommon" runat="server" ContentKey="991d8973-6ade-4ac5-aef3-c34945a8641a" ContentItemKey="972bf93a-6883-4ba6-a97f-f5f8b92f2366" Title="New SocialShareCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" BorderVisible="False" UrlToShare="" IconDimension="16" LegendText="Share this page" />
				<CM:ProgressTracker ID="ciNewProgressTrackerCommon" runat="server" ContentKey="991d8973-6ade-4ac5-aef3-c34945a8641a" ContentItemKey="bc6308be-0bb7-4a0f-a2f9-8433e8ab64d4" Title="New ProgressTrackerCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="ProgressTracker2" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="False" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="" ListSourceQuery="$/Samples/ProgressTracker/Donations" DataColumnName="(None)" DisplayGoalPercent="True" GoalPercentDescription="achieved" DisplayGoalCountTotal="True" GoalCountTotalDescription="total given this year" DisplayGoalDaysRemaining="True" GoalDaysRemainingDescription="days remaining to give" ProgressBarLocation="Bottom" SuccessfulMessage="" />
				<CM:ContentHtml ID="ciDonateImage_5396151f70c04900acece90b9392270c" runat="server" ContentKey="991d8973-6ade-4ac5-aef3-c34945a8641a" ContentItemKey="5396151f-70c0-4900-acec-e90b9392270c" Title="Donate Image" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_DonateImage" runat="server"><a href="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>imisdonor" class="hidden-xs"><img style="max-width: 100%;" alt="wooden blocks spelling out the word Give" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/UploadedImages/Give.jpg" /></a></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciMakeADifference_58dbf640b40242d7b635cf6265c24bc2" runat="server" ContentKey="991d8973-6ade-4ac5-aef3-c34945a8641a" ContentItemKey="58dbf640-b402-42d7-b635-cf6265c24bc2" Title="Make A Difference" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_MakeADifference" runat="server"><div class="CalloutBlock2 hidden-xs">
<h2>Your Donations Make a Difference</h2>
<p>Every year the Foundation contributes to hundreds of projects to help restore the environment. Here's some of the ways that your donations help:<br />
<br />
<strong>25.00</strong> plants 10 trees in deforested areas<br />
<strong>50.00</strong> is enough to build a new frog pond<br />
<strong>100.00</strong> pays for 3 wildlife monitoring cameras<br />
<strong>250.00</strong> feeds 10 numbats for 6 months
</p>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-8">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciNewContentHtml_3e536356171e4e688f6d670bd6aa83c1" runat="server" ContentKey="991d8973-6ade-4ac5-aef3-c34945a8641a" ContentItemKey="3e536356-171e-4e68-8f6d-670bd6aa83c1" Title="New ContentHtml" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml" runat="server"><h1>Give Now</h1>
Your donations are put to use immediately. We have projects running year round that need your support--donate today to make a difference!</asp:Panel></CM:ContentHtml>
				<CM:DonationCreator ID="ciDonationCreator" runat="server" ContentKey="991d8973-6ade-4ac5-aef3-c34945a8641a" ContentItemKey="32bccc6e-d0cd-4be9-9307-ae3ad2ea10c3" Title="DonationCreator" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="iPartChain LastPart" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayItemDescription="True" AllowSoftCreditAssignment="False" ProcessingMode="GiveNGo" PaymentTermOption="None" CommitSequence="2" DistributionMode="SelectFromList" DistributionValue="WATER" PaymentTermOptionsValue="" ItemAddedLabel="" GiftArrayIQAQueryPath="" DisplayPremiums="False" PremiumDisplayMode="EnterAmountFirst" PremiumSectionTitle="Select a thank you gift" ChooseNoPremium="True" NoPremiumTitle="No thank you gift" NoPremiumDescription="I would like the entire amount of my contribution to benefit the organization." PremiumGiftAmountLabel="Gift Amount" />
				<CM:ContentHtml ID="ciMydetails_6e79d152c5b3411ebea8343590dfc6c4" runat="server" ContentKey="991d8973-6ade-4ac5-aef3-c34945a8641a" ContentItemKey="6e79d152-c5b3-411e-bea8-343590dfc6c4" Title="My details" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Mydetails" runat="server"><h2>My details</h2></asp:Panel></CM:ContentHtml>
				<CM:RecurringDonationCreator ID="ciRecurringDonationCreatorCommon" runat="server" ContentKey="991d8973-6ade-4ac5-aef3-c34945a8641a" ContentItemKey="337c9233-ac05-42c0-9a43-7d6b0c014397" Title="RecurringDonationCreatorCommon" ShowTitleFlag="False" PartTitle="Give regularly?" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" CommitSequence="3" RecurrentGiftFrequency="AllowUserToSpecifyFrequency" MakeRecurringTextYes="Yes, please make this a recurring gift" MakeRecurringTextNo="No, this is a one time gift" GiftFrequencyMessage="Select gift frequency" />
				<CM:ContactAccountCreator ID="ciMakedonationcontact" runat="server" ContentKey="991d8973-6ade-4ac5-aef3-c34945a8641a" ContentItemKey="4d8325f1-a070-4977-a1c5-4ee0def79652" Title="Make donation contact" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="iPartChain MiddlePart" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" HideForAuthenticatedUsers="True" AccountTypeAllowed="IndividualOnly" IncludeSuffix="True" IncludePrefix="False" IncludeDesignation="False" IncludeInformalName="False" IncludeTitle="False" IncludePhone="False" IncludeMobilePhone="False" IncludeEmail="True" RequireEmailForOrganization="True" IncludeEmailForIndividual="True" RequireEmailForIndividual="True" RequireAddress2="True" IncludeAddress="True" MultipleAddressLines="False" SingleTextAddress="False" NoEmailDuplicates="True" CreateAddressPurpose="Address" IncludeLogOnLink="True" IncludeOptionToCreateLogon="True" RequireUserToCreateLogon="True" UseEmailAsLogon="True" UrlRedirect="" RedirectLocation="DoNotRedirect" CommitSequence="1" IncludePrimaryOrganizationSelection="False" RequirePrimaryOrganizationSelection="False" OrganizationListQueryPath="" IncludeIdAsQuerystringParameter="False" IncludeSocialMediaSignupOption="False" AssignCompanyAdministrator="False" IncludeMiddleName="True" />
				<CM:DisplayNameEditor ID="ciDisplayName" runat="server" ContentKey="991d8973-6ade-4ac5-aef3-c34945a8641a" ContentItemKey="27862e68-73ab-42c6-b043-145b40ba79c9" Title="DisplayName" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="iPartChain MiddlePart" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" CommitSequence="3" SalutationType="LIST_AS" AnonCheckboxText="Please make this an anonymous gift" LabelText="Name(s) I would like to be recognized as for this gift:" DisplayForAuthorizedUsersOnly="True" />
				<CM:TributeGiftEditor ID="ciTributeGift" runat="server" ContentKey="991d8973-6ade-4ac5-aef3-c34945a8641a" ContentItemKey="679b72b6-01a1-412b-8b09-32a2ee50f1ab" Title="Tribute Gift" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="iPartChain LastPart" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" CommitSequence="4" ShowNotifyDetails="True" ShowNotifyText="Please inform the following person about my donation" HonoreeQueryKey="00000000-0000-0000-0000-000000000000" HonoreeQueryPath="" IncludeEmailForIndividual="True" RequireEmailForIndividual="False" RequireAddress="False" IncludeAddress="True" MultipleAddressLines="True" CreateAddressPurpose="Address" />
				<CM:PaymentCreator ID="ciPaymentCreator" runat="server" ContentKey="991d8973-6ade-4ac5-aef3-c34945a8641a" ContentItemKey="024f8b5c-0185-4d21-aa62-2e3e6b537edb" Title="PaymentCreator" ShowTitleFlag="False" PartTitle="Payment details" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PaymentPurpose="Donation" DisplayUpdate="False" CommitSequence="5" PurchaseOrderNumberRequired="True" />
				<CM:SubmitOrderButtonLink ID="ciSubmitDonation" runat="server" ContentKey="991d8973-6ade-4ac5-aef3-c34945a8641a" ContentItemKey="027e7d0c-e447-4ccd-8167-cce4d6655985" Title="Submit Donation" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PromptUnauthenticatedUsers="True" OrderConfirmationUrl="@/iCore/Fundraising/Donation_Thank_You_Page" OrderPurpose="Donation" CommitSequence="6" OrderConfirmationContentKey="00000000-0000-0000-0000-000000000000" />
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