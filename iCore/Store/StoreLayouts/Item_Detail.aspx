<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Item Detail" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContinueShoppingButtonLink" Src="~/iParts/Commerce/ContinueShoppingButtonLink/ContinueShoppingButtonLinkDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="GeneralProductDisplay" Src="~/iParts/Commerce/GeneralProductDisplay/GeneralProductDisplayDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="CartCheckoutButtonLink" Src="~/iParts/Commerce/CartCheckoutButtonLink/CartCheckoutButtonLinkDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="RelatedItems" Src="~/iparts/Common/RelatedItems/RelatedItemsDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("44d850e7-d388-4bd1-866a-bc5ad6ed80af"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("1805b99a-740f-42a5-9218-66bb7bfeadc7"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciContinueShoppingButton as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("ac5cf1ee-701c-4602-a547-a32eae1ea868");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciContinueShoppingButton);

		childUserControl = ciGeneralProductDisplay as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("2e3da479-63db-4e89-ac99-17c71860167d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciGeneralProductDisplay);

		childUserControl = ciProceedtoCheckout as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("cc224f44-5332-45e1-a894-c825b19752d4");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciProceedtoCheckout);

		childUserControl = ciSimilarproducts as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("c50ff608-9e2c-446b-a7e4-bfc2a40032dc");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSimilarproducts);

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
				<CM:ContinueShoppingButtonLink ID="ciContinueShoppingButton" runat="server" ContentKey="44d850e7-d388-4bd1-866a-bc5ad6ed80af" ContentItemKey="ac5cf1ee-701c-4602-a547-a32eae1ea868" Title="Continue Shopping Button" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ContinueShoppingUrl="~/Store" />
				<CM:GeneralProductDisplay ID="ciGeneralProductDisplay" runat="server" ContentKey="44d850e7-d388-4bd1-866a-bc5ad6ed80af" ContentItemKey="2e3da479-63db-4e89-ac99-17c71860167d" Title="General Product Display" ShowTitleFlag="False" PageTitle="" DoNotRenderInDesignMode="False" ShowBorder="False" DisplayPicture="True" MaxPictureWidth="150" ProductCode="" DisplayStyle="" CustomerPriceLabel="Your price:" StandardPriceLabel="Non-member price:" DiscountPriceLabel="Discounted member price:" DisplayComparisonPrices="CustomerPriceAndOneComparisonPrice" DisplayDiscountPercentage="True" DiscountPercentageLabelWhenDiscountApplied="You save:" DiscountPercentageLabelWhenDiscountNotApplied="You could save:" DiscountPercentageFormat="0.0%" ItemAddedLabel="This item has been added to your cart" ItemUpdatedLabel="Your cart has been updated" AutoRenewalText="" AutoRenewalBottomText="" AutoRenewalLabel="" />
				<CM:CartCheckoutButtonLink ID="ciProceedtoCheckout" runat="server" ContentKey="44d850e7-d388-4bd1-866a-bc5ad6ed80af" ContentItemKey="cc224f44-5332-45e1-a894-c825b19752d4" Title="Proceed to Checkout" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayMode="Any Item" />
				<CM:RelatedItems ID="ciSimilarproducts" runat="server" ContentKey="44d850e7-d388-4bd1-866a-bc5ad6ed80af" ContentItemKey="c50ff608-9e2c-446b-a7e4-bfc2a40032dc" Title="Similar products" ShowTitleFlag="False" PartTitle="Similar products" DoNotRenderInDesignMode="False" CssClass="RelatedItemsHorizontalEffect" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" NoRecordsFound="No products found" ListDescription="" MaxRecords="6" ImageDimension="85" ClickUrl="ItemDetail?iProductCode={key_Id}&amp;Category={ProductCategory}" ImagePath="" DefaultImage="/App_Themes/Austin/images/icon_product.png" DisplayOrientation="Horizontal" DisplayNameOption="Label" QueryStringParameterName="Category" ListSourceQuery="$/Samples/RelatedItems/Related Products" DataColumnName="ProductCategory" LabelMaxLength="50" EnableHorizontalScrolling="False" HorizontalScrollWidth="0" />
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