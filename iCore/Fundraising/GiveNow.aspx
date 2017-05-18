<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Give Now (deprecated)" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="SocialShare" Src="~/iParts/Social/SocialShare/SocialShareDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="DonationCreator" Src="~/iParts/Fundraising/DonationCreator/DonationCreatorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactAccountCreator" Src="~/iParts/Contact Management/ContactAccountCreator/ContactAccountCreatorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="DisplayNameEditor" Src="~/iParts/Contact Management/DisplayNameEditor/DisplayNameEditorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="PaymentCreator" Src="~/iParts/Commerce/PaymentCreator/PaymentCreatorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="SubmitOrderButtonLink" Src="~/iParts/Commerce/SubmitOrderButtonLink/SubmitOrderButtonLinkDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("fb2a3e56-ef20-4107-aa2f-57c118f0084f"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("6ec117e8-f6a1-4d37-a030-85739d5cef3b"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewSocialShareCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("bbeb595e-0fbe-4dfc-b507-0e46a87f28ca");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewSocialShareCommon);

		AddChildUserControl(ContentPage2);

		childUserControl = ciContentHtmlLeft_308991c8c87845529afe5746ecd4fa84 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("308991c8-c878-4552-9afe-5746ecd4fa84");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciContentHtmlLeft_308991c8c87845529afe5746ecd4fa84);

		AddChildUserControl(ContentPage3);

		childUserControl = ciDonationCreator as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("32bccc6e-d0cd-4be9-9307-ae3ad2ea10c3");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDonationCreator);

		childUserControl = ciMakeDonationContact as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("4bed506e-e4f2-4834-8430-8144f451f760");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMakeDonationContact);

		childUserControl = ciDisplayNameEditor as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("c90b34c4-fa19-4894-b55b-798d6e06bd81");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDisplayNameEditor);

		childUserControl = ciPaymentCreator as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("d69326cd-33db-4800-8d47-441590fb957b");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciPaymentCreator);

		childUserControl = ciSubmitOrderButtonLink as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("adcf7231-6cef-49b2-80f0-c080b1e05623");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSubmitOrderButtonLink);

	}
</script>
<asp:Content ID="TemplateUserMessages" ContentPlaceHolderID="TemplateUserMessages" runat="server"></asp:Content>
<asp:Content ID="TemplateBody" ContentPlaceHolderID="TemplateBody" Runat="Server">
<script type="text/javascript">

</script>
	<asiweb:AsiWebPartManager id="WebPartManager1" runat="server">
		<StaticConnections>
			<asp:WebPartConnection ID="WebPartConnection1" ConsumerID="ciDisplayNameEditor" ConsumerConnectionPointID="AsiObject" ProviderID="ciDonationCreator" ProviderConnectionPointID="AsiObject" />
			<asp:WebPartConnection ID="WebPartConnection2" ConsumerID="ciSubmitOrderButtonLink" ConsumerConnectionPointID="AsiObject" ProviderID="ciPaymentCreator" ProviderConnectionPointID="AsiObject" />
		</StaticConnections>
	</asiweb:AsiWebPartManager>
<div>
	<div class="row">
		<div class="col-sm-12">
						<CM:ContentPage ID="ContentPage1" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone1_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:SocialShare ID="ciNewSocialShareCommon" runat="server" ContentKey="fb2a3e56-ef20-4107-aa2f-57c118f0084f" ContentItemKey="bbeb595e-0fbe-4dfc-b507-0e46a87f28ca" Title="New SocialShareCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" BorderVisible="False" UrlToShare="" IconDimension="24" LegendText="Share this page" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
		</div>
	</div>
	<div class="row">
		<div class="col-sm-4">
						<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciContentHtmlLeft_308991c8c87845529afe5746ecd4fa84" runat="server" ContentKey="fb2a3e56-ef20-4107-aa2f-57c118f0084f" ContentItemKey="308991c8-c878-4552-9afe-5746ecd4fa84" Title="ContentHtmlLeft" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_ContentHtmlLeft" runat="server"><p style="text-align: left;"><img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/ImageLibrary/Pelican.jpg" /></p></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
		</div>
		<div class="col-sm-8">
						<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:DonationCreator ID="ciDonationCreator" runat="server" ContentKey="fb2a3e56-ef20-4107-aa2f-57c118f0084f" ContentItemKey="32bccc6e-d0cd-4be9-9307-ae3ad2ea10c3" Title="DonationCreator" ShowTitleFlag="False" PartTitle="Make a donation" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayItemDescription="True" AllowSoftCreditAssignment="False" ProcessingMode="GiveNGo" PaymentTermOption="None" CommitSequence="2" DistributionMode="SelectFromList" DistributionValue="EMERG" PaymentTermOptionsValue="" ItemAddedLabel="" GiftArrayIQAQueryPath="" DisplayPremiums="False" PremiumDisplayMode="EnterAmountFirst" PremiumSectionTitle="" ChooseNoPremium="False" NoPremiumTitle="" NoPremiumDescription="" PremiumGiftAmountLabel="" />
				<CM:ContactAccountCreator ID="ciMakeDonationContact" runat="server" ContentKey="fb2a3e56-ef20-4107-aa2f-57c118f0084f" ContentItemKey="4bed506e-e4f2-4834-8430-8144f451f760" Title="MakeDonationContact" ShowTitleFlag="False" PartTitle="Personal details" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" HideForAuthenticatedUsers="True" AccountTypeAllowed="IndividualOnly" IncludeSuffix="False" IncludePrefix="False" IncludeDesignation="False" IncludeInformalName="False" IncludeTitle="False" IncludePhone="False" IncludeMobilePhone="False" IncludeEmail="False" RequireEmailForOrganization="False" IncludeEmailForIndividual="True" RequireEmailForIndividual="True" RequireAddress2="True" IncludeAddress="True" MultipleAddressLines="True" SingleTextAddress="False" NoEmailDuplicates="False" CreateAddressPurpose="Address" IncludeLogOnLink="False" IncludeOptionToCreateLogon="True" RequireUserToCreateLogon="True" UseEmailAsLogon="False" UrlRedirect="" RedirectLocation="DoNotRedirect" CommitSequence="1" IncludePrimaryOrganizationSelection="False" RequirePrimaryOrganizationSelection="False" OrganizationListQueryPath="" IncludeIdAsQuerystringParameter="False" IncludeSocialMediaSignupOption="False" AssignCompanyAdministrator="False" IncludeMiddleName="True" />
				<CM:DisplayNameEditor ID="ciDisplayNameEditor" runat="server" ContentKey="fb2a3e56-ef20-4107-aa2f-57c118f0084f" ContentItemKey="c90b34c4-fa19-4894-b55b-798d6e06bd81" Title="Display Name Editor" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" CommitSequence="3" SalutationType="LIST_AS" AnonCheckboxText="Please make this an anonymous gift" LabelText="Name(s) I would like to be recognized as for this gift:" DisplayForAuthorizedUsersOnly="False" />
				<CM:PaymentCreator ID="ciPaymentCreator" runat="server" ContentKey="fb2a3e56-ef20-4107-aa2f-57c118f0084f" ContentItemKey="d69326cd-33db-4800-8d47-441590fb957b" Title="PaymentCreator" ShowTitleFlag="False" PartTitle="Card details" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PaymentPurpose="Donation" DisplayUpdate="False" CommitSequence="5" PurchaseOrderNumberRequired="True" />
				<CM:SubmitOrderButtonLink ID="ciSubmitOrderButtonLink" runat="server" ContentKey="fb2a3e56-ef20-4107-aa2f-57c118f0084f" ContentItemKey="adcf7231-6cef-49b2-80f0-c080b1e05623" Title="SubmitOrderButtonLink" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PromptUnauthenticatedUsers="True" OrderConfirmationUrl="@/iCore/Fundraising/Donation_Thank_You_Page" OrderPurpose="Donation" CommitSequence="6" OrderConfirmationContentKey="00000000-0000-0000-0000-000000000000" />
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