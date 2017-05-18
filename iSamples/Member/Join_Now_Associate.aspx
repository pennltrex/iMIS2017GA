<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Join Now Associate" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactSignIn" Src="~/iParts/Contact Management/ContactSignIn/ContactSignInDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="GeneralProductDisplay" Src="~/iParts/Commerce/GeneralProductDisplay/GeneralProductDisplayDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("b0da1a19-9360-4eb1-b070-30bb3f436061"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("5be922bc-3ff2-4ab1-905b-18764e8d47c2"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewContactSignInCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e4dea8bb-7f6e-402b-a4bb-d99d1a57f543");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContactSignInCommon);

		childUserControl = ciNewGeneralProductDisplayCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("cb8d9175-71c3-4828-90b1-9cb302286f60");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewGeneralProductDisplayCommon);

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
				<CM:ContactSignIn ID="ciNewContactSignInCommon" runat="server" ContentKey="b0da1a19-9360-4eb1-b070-30bb3f436061" ContentItemKey="e4dea8bb-7f6e-402b-a4bb-d99d1a57f543" Title="New ContactSignInCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplaySignInFailedMessageLocal="False" SignInFailedMessageLocal="The username or password you entered is incorrect." DisplayForgotUserId="True" DisplayForgotPassword="True" DisplayCreateAccount="True" ForgotUserIdMessage="Enter the email associated with your account, then click Submit. We will email your username to the email address specified." ForgotPasswordMessage="Enter the Username for your user account, then click Submit. We will email you a link to a page where you can easily create a new password." CreateAccountLink="Create a new account" />
				<CM:GeneralProductDisplay ID="ciNewGeneralProductDisplayCommon" runat="server" ContentKey="b0da1a19-9360-4eb1-b070-30bb3f436061" ContentItemKey="cb8d9175-71c3-4828-90b1-9cb302286f60" Title="New GeneralProductDisplayCommon" ShowTitleFlag="False" PageTitle="" DoNotRenderInDesignMode="False" ShowBorder="False" DisplayPicture="True" MaxPictureWidth="150" ProductCode="JOIN_NOW_AS_ASSOCIATE_MEMBER" DisplayStyle="" CustomerPriceLabel="Your price:" StandardPriceLabel="Standard price:" DiscountPriceLabel="Discounted price:" DisplayComparisonPrices="CustomerPriceOnly" DisplayDiscountPercentage="False" DiscountPercentageLabelWhenDiscountApplied="You save" DiscountPercentageLabelWhenDiscountNotApplied="You could save" DiscountPercentageFormat="0.0%" ItemAddedLabel="This item has been added to your cart" ItemUpdatedLabel="Your cart has been updated" AutoRenewalText="" AutoRenewalBottomText="" AutoRenewalLabel="" />
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