<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="General product display without cart button" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactSignIn" Src="~/iParts/Contact Management/ContactSignIn/ContactSignInDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="GeneralProductDisplay" Src="~/iParts/Commerce/GeneralProductDisplay/GeneralProductDisplayDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("339e3091-e79c-4c82-bdde-76203bae43db"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("0f6699e8-0a38-48eb-be5d-ce95b2808483"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewContactSignInCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("c1e008aa-845b-4202-9cf1-7fed7348cf7a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContactSignInCommon);

		childUserControl = ciNewGeneralProductDisplayCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("43bb71fe-5f8e-4b91-a3e1-efe51ac25415");
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
				<CM:ContactSignIn ID="ciNewContactSignInCommon" runat="server" ContentKey="339e3091-e79c-4c82-bdde-76203bae43db" ContentItemKey="c1e008aa-845b-4202-9cf1-7fed7348cf7a" Title="New ContactSignInCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplaySignInFailedMessageLocal="False" SignInFailedMessageLocal="The username or password you entered is incorrect." DisplayForgotUserId="True" DisplayForgotPassword="True" DisplayCreateAccount="True" ForgotUserIdMessage="Enter the email associated with your account, then click Submit. We will email your username to the email address specified." ForgotPasswordMessage="Enter the Username for your user account, then click Submit. We will email you a link to a page where you can easily create a new password." CreateAccountLink="Create a new account" />
				<CM:GeneralProductDisplay ID="ciNewGeneralProductDisplayCommon" runat="server" ContentKey="339e3091-e79c-4c82-bdde-76203bae43db" ContentItemKey="43bb71fe-5f8e-4b91-a3e1-efe51ac25415" Title="New GeneralProductDisplayCommon" ShowTitleFlag="False" PageTitle="" DoNotRenderInDesignMode="False" ShowBorder="False" DisplayPicture="True" MaxPictureWidth="150" ProductCode="" DisplayStyle="" CustomerPriceLabel="Your price:" StandardPriceLabel="Standard price:" DiscountPriceLabel="Discounted price:" DisplayComparisonPrices="CustomerPriceOnly" DisplayDiscountPercentage="False" DiscountPercentageLabelWhenDiscountApplied="You save" DiscountPercentageLabelWhenDiscountNotApplied="You could save" DiscountPercentageFormat="0.0%" ItemAddedLabel="This item has been added to your cart" ItemUpdatedLabel="Your cart has been updated" AutoRenewalText="" AutoRenewalBottomText="" AutoRenewalLabel="" />
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