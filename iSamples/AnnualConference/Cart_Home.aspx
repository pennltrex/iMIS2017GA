<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Cart Home" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="CartDetailsDisplay" Src="~/iParts/Commerce/CartDetailsDisplay/CartDetailsDisplayDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactSignIn" Src="~/iParts/Contact Management/ContactSignIn/ContactSignInDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ShippingMethodSelector" Src="~/iParts/Commerce/ShippingMethodSelector/ShippingMethodSelectorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="CartChargesDisplay" Src="~/iParts/Commerce/CartChargesDisplay/CartChargesDisplayDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="PromotionManager" Src="~/iParts/Commerce/PromotionManager/PromotionManagerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="PaymentCreator" Src="~/iParts/Commerce/PaymentCreator/PaymentCreatorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="SubmitOrderButtonLink" Src="~/iParts/Commerce/SubmitOrderButtonLink/SubmitOrderButtonLinkDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContinueShoppingButtonLink" Src="~/iParts/Commerce/ContinueShoppingButtonLink/ContinueShoppingButtonLinkDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("6630c1e9-bbf4-4ccd-b62d-3846d4894d9b"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("4214c062-cdc6-4b20-bb08-b248533e7fbe"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciShoppingCart as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("06919f62-34cc-4fd5-8f10-d703eb8d0439");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciShoppingCart);

		AddChildUserControl(ContentPage2);

		childUserControl = ciNewContactSignInCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("16a91679-ba5f-4fc2-9821-5f5fd90d29d6");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContactSignInCommon);

		childUserControl = ciShippingMethod as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("595426b9-d8b5-46c2-9997-4fcab4997d2e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciShippingMethod);

		AddChildUserControl(ContentPage3);

		childUserControl = ciCartCharges as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("1f4724e9-34b2-49f9-a432-93c4d2bf486d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCartCharges);

		childUserControl = ciPromotionManagerCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("8b5be2ac-8e05-4e12-985b-b5567ad63187");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciPromotionManagerCommon);

		childUserControl = ciPaymentDetails as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9db36c04-8350-445d-bdf7-cffea52d6108");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciPaymentDetails);

		AddChildUserControl(ContentPage4);

		childUserControl = ciNewSubmitOrderButtonLinkCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("04be89c6-91c1-4f45-af46-0f865735d692");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewSubmitOrderButtonLinkCommon);

		childUserControl = ciNewContinueShoppingButtonLinkCommon1 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("04db2947-cd9b-4df5-8c6e-e6fd38dcae16");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContinueShoppingButtonLinkCommon1);

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
    <div class="col-sm-12">
			<CM:ContentPage ID="ContentPage1" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone1_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:CartDetailsDisplay ID="ciShoppingCart" runat="server" ContentKey="6630c1e9-bbf4-4ccd-b62d-3846d4894d9b" ContentItemKey="06919f62-34cc-4fd5-8f10-d703eb8d0439" Title="Shopping Cart" ShowTitleFlag="False" PartTitle="Shopping Cart" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProductDetailContent="00000000-0000-0000-0000-000000000000" EventDetailContent="00000000-0000-0000-0000-000000000000" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
<div class="row">
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContactSignIn ID="ciNewContactSignInCommon" runat="server" ContentKey="6630c1e9-bbf4-4ccd-b62d-3846d4894d9b" ContentItemKey="16a91679-ba5f-4fc2-9821-5f5fd90d29d6" Title="New ContactSignInCommon" ShowTitleFlag="False" PartTitle="Sign In" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplaySignInFailedMessageLocal="False" SignInFailedMessageLocal="The username or password you entered is incorrect." DisplayForgotUserId="True" DisplayForgotPassword="True" DisplayCreateAccount="True" ForgotUserIdMessage="Enter the email associated with your account, then click Submit. We will email your username to the email address specified." ForgotPasswordMessage="Enter the Username for your user account, then click Submit. We will email you a link to a page where you can easily create a new password." CreateAccountLink="Create a new account" />
				<CM:ShippingMethodSelector ID="ciShippingMethod" runat="server" ContentKey="6630c1e9-bbf4-4ccd-b62d-3846d4894d9b" ContentItemKey="595426b9-d8b5-46c2-9997-4fcab4997d2e" Title="Shipping Method" ShowTitleFlag="False" PageTitle="" DoNotRenderInDesignMode="False" ShowBorder="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:CartChargesDisplay ID="ciCartCharges" runat="server" ContentKey="6630c1e9-bbf4-4ccd-b62d-3846d4894d9b" ContentItemKey="1f4724e9-34b2-49f9-a432-93c4d2bf486d" Title="Cart Charges" ShowTitleFlag="False" PageTitle="Cart Charges" DoNotRenderInDesignMode="False" ShowBorder="False" />
				<CM:PromotionManager ID="ciPromotionManagerCommon" runat="server" ContentKey="6630c1e9-bbf4-4ccd-b62d-3846d4894d9b" ContentItemKey="8b5be2ac-8e05-4e12-985b-b5567ad63187" Title="PromotionManagerCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="UsePrimaryButton" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" />
				<CM:PaymentCreator ID="ciPaymentDetails" runat="server" ContentKey="6630c1e9-bbf4-4ccd-b62d-3846d4894d9b" ContentItemKey="9db36c04-8350-445d-bdf7-cffea52d6108" Title="Payment Details" ShowTitleFlag="False" PartTitle="Payment Details" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PaymentPurpose="" DisplayUpdate="False" CommitSequence="0" PurchaseOrderNumberRequired="True" />
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
				<CM:SubmitOrderButtonLink ID="ciNewSubmitOrderButtonLinkCommon" runat="server" ContentKey="6630c1e9-bbf4-4ccd-b62d-3846d4894d9b" ContentItemKey="04be89c6-91c1-4f45-af46-0f865735d692" Title="New SubmitOrderButtonLinkCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PromptUnauthenticatedUsers="False" OrderConfirmationUrl="@/iCore/Store/StoreLayouts/Order_Confirmation" OrderPurpose="Cart" CommitSequence="0" OrderConfirmationContentKey="00000000-0000-0000-0000-000000000000" />
				<CM:ContinueShoppingButtonLink ID="ciNewContinueShoppingButtonLinkCommon1" runat="server" ContentKey="6630c1e9-bbf4-4ccd-b62d-3846d4894d9b" ContentItemKey="04db2947-cd9b-4df5-8c6e-e6fd38dcae16" Title="New ContinueShoppingButtonLinkCommon_1" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ContinueShoppingUrl="~/Store" />
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