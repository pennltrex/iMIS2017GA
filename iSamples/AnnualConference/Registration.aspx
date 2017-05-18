<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Registration" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="SocialShare" Src="~/iParts/Social/SocialShare/SocialShareDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="EventDisplay" Src="~/iParts/Events/Events/EventDisplayDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="EventProgramDisplay" Src="~/iParts/Events/Events/EventProgramDisplayDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="BigButtonPanel" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/DisplayBigButtonPanel.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactSignIn" Src="~/iParts/Contact Management/ContactSignIn/ContactSignInDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="CartCheckoutButtonLink" Src="~/iParts/Commerce/CartCheckoutButtonLink/CartCheckoutButtonLinkDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("b6e761e7-04fc-42df-a836-385e11706c3d"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("cee21d5c-f7b5-4068-93da-380cd45a6055"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewSocialShareCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("1cbf2e21-0778-4d65-9cdd-4392ce07c6ac");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewSocialShareCommon);

		AddChildUserControl(ContentPage2);

		childUserControl = ciEventDisplay as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("69ce97ec-4871-4c6d-8331-db823f7410b1");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciEventDisplay);

		childUserControl = ciEventProgramDisplay as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("fbb39d1f-adbd-4740-aeb3-82e7dddb83a6");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciEventProgramDisplay);

		AddChildUserControl(ContentPage3);

		childUserControl = ciUsefulLinks as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("8faa6618-c180-4aa2-8eb7-0a1556794d19");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciUsefulLinks);

		childUserControl = ciSignIn as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9f429ad9-c999-4a37-aef8-322a9c96c125");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSignIn);

		AddChildUserControl(ContentPage4);

		childUserControl = ciNewCartCheckoutButtonLinkCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e3d51915-b6f0-46f4-9ffa-04a0d69e292d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewCartCheckoutButtonLinkCommon);

	}
</script>
<asp:Content ID="TemplateUserMessages" ContentPlaceHolderID="TemplateUserMessages" runat="server"></asp:Content>
<asp:Content ID="TemplateBody" ContentPlaceHolderID="TemplateBody" Runat="Server">
<script type="text/javascript">

</script>
	<asiweb:AsiWebPartManager id="WebPartManager1" runat="server">
		<StaticConnections>
			<asp:WebPartConnection ID="WebPartConnection1" ConsumerID="ciEventProgramDisplay" ConsumerConnectionPointID="AsiStringKey" ProviderID="ciEventDisplay" ProviderConnectionPointID="AsiStringKey" />
			<asp:WebPartConnection ID="WebPartConnection2" ConsumerID="ciNewCartCheckoutButtonLinkCommon" ConsumerConnectionPointID="AsiObject" ProviderID="ciEventDisplay" ProviderConnectionPointID="AsiObject" />
		</StaticConnections>
	</asiweb:AsiWebPartManager>
   <div>
	<div class="row">
    <div class="col-sm-12">
			<CM:ContentPage ID="ContentPage1" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone1_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:SocialShare ID="ciNewSocialShareCommon" runat="server" ContentKey="b6e761e7-04fc-42df-a836-385e11706c3d" ContentItemKey="1cbf2e21-0778-4d65-9cdd-4392ce07c6ac" Title="New SocialShareCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" BorderVisible="False" UrlToShare="" IconDimension="16" LegendText="Share this page" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
<div class="row">
    <div class="col-sm-9">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:EventDisplay ID="ciEventDisplay" runat="server" ContentKey="b6e761e7-04fc-42df-a836-385e11706c3d" ContentItemKey="69ce97ec-4871-4c6d-8331-db823f7410b1" Title="Event Display" ShowTitleFlag="False" PageTitle="" DoNotRenderInDesignMode="False" ShowBorder="False" EventKey="ANNCONF" ImageWidth="200" RegistrantInfoMessage="Edit registrant information" IQAQueryPath="" IQAQueryPathEvtGuest="" IQAQueryKey="d9ba33c4-07c3-4192-92bf-be2219347c87" IQAQueryKeyEvtGuest="f5ecbbfe-0fbf-491a-b1b7-45e19c2a288f" CreateAddressPurpose="" OrganizationListQueryPath="" AddToCalendarButtonDisplayMode="ShowAfterRegistration" />
				<CM:EventProgramDisplay ID="ciEventProgramDisplay" runat="server" ContentKey="b6e761e7-04fc-42df-a836-385e11706c3d" ContentItemKey="fbb39d1f-adbd-4740-aeb3-82e7dddb83a6" Title="Event Program Display" ShowTitleFlag="False" PageTitle="Program - [Name]" DoNotRenderInDesignMode="False" ShowBorder="False" SelectItineraryCheckBox="False" EventKey="ANNCONF" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-3">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:BigButtonPanel ID="ciUsefulLinks" runat="server" ContentKey="b6e761e7-04fc-42df-a836-385e11706c3d" ContentItemKey="8faa6618-c180-4aa2-8eb7-0a1556794d19" Title="Useful Links" ShowTitleFlag="False" PartTitle="Useful Links" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="Actions" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="&quot;@/iCore/Events/Events_List|Register for training&quot;,&quot;@/iSamples/AnnualConference/Product_Detail[iProductCode=CONFPROC]|Order conference proceedings&quot;" />
				<CM:ContactSignIn ID="ciSignIn" runat="server" ContentKey="b6e761e7-04fc-42df-a836-385e11706c3d" ContentItemKey="9f429ad9-c999-4a37-aef8-322a9c96c125" Title="Sign In" ShowTitleFlag="False" PartTitle="Sign In" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplaySignInFailedMessageLocal="False" SignInFailedMessageLocal="The username or password you entered is incorrect." DisplayForgotUserId="True" DisplayForgotPassword="True" DisplayCreateAccount="True" ForgotUserIdMessage="Enter the email associated with your account, then click Submit. We will email your username to the email address specified." ForgotPasswordMessage="Enter the Username for your user account, then click Submit. We will email you a link to a page where you can easily create a new password." CreateAccountLink="Create a new account" />
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
				<CM:CartCheckoutButtonLink ID="ciNewCartCheckoutButtonLinkCommon" runat="server" ContentKey="b6e761e7-04fc-42df-a836-385e11706c3d" ContentItemKey="e3d51915-b6f0-46f4-9ffa-04a0d69e292d" Title="New CartCheckoutButtonLinkCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayMode="Current Event" />
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