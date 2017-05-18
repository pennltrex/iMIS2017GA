<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Gift Detail" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="DonationCreator" Src="~/iParts/Fundraising/DonationCreator/DonationCreatorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContinueShoppingButtonLink" Src="~/iParts/Commerce/ContinueShoppingButtonLink/ContinueShoppingButtonLinkDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("5f398b0a-ac7d-4e0b-b5a1-bf3574d9c82e"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("5615bb05-4eea-4c1d-b51c-f2b4423f308a"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciAddGift as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("c3b415b6-b735-47b0-bc9d-a3e35bf78866");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAddGift);

		childUserControl = ciContinueShoppingButton as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9c4909c0-78d7-4616-9f13-f102001ba5f8");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciContinueShoppingButton);

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
				<CM:DonationCreator ID="ciAddGift" runat="server" ContentKey="5f398b0a-ac7d-4e0b-b5a1-bf3574d9c82e" ContentItemKey="c3b415b6-b735-47b0-bc9d-a3e35bf78866" Title="Add Gift" ShowTitleFlag="False" PartTitle="Add Gift" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayItemDescription="True" AllowSoftCreditAssignment="False" ProcessingMode="UseCart" PaymentTermOption="None" CommitSequence="0" DistributionMode="SelectFromList" DistributionValue="" PaymentTermOptionsValue="" ItemAddedLabel="The item was added to your cart." GiftArrayIQAQueryPath="" DisplayPremiums="False" PremiumDisplayMode="EnterAmountFirst" PremiumSectionTitle="" ChooseNoPremium="False" NoPremiumTitle="" NoPremiumDescription="" PremiumGiftAmountLabel="" />
				<CM:ContinueShoppingButtonLink ID="ciContinueShoppingButton" runat="server" ContentKey="5f398b0a-ac7d-4e0b-b5a1-bf3574d9c82e" ContentItemKey="9c4909c0-78d7-4616-9f13-f102001ba5f8" Title="Continue Shopping Button" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ContinueShoppingUrl="~/Store" />
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