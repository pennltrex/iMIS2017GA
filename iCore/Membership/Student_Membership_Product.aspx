<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Student Membership Product" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="GeneralProductDisplay" Src="~/iParts/Commerce/GeneralProductDisplay/GeneralProductDisplayDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("5baae91e-232e-4493-9d26-73ab9e470988"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("e4721259-4dda-4d5c-9784-4fd1f41b2b47"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewGeneralProductDisplayCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("67690b22-e3cc-4419-bbc8-37e5f1843a23");
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
				<CM:GeneralProductDisplay ID="ciNewGeneralProductDisplayCommon" runat="server" ContentKey="5baae91e-232e-4493-9d26-73ab9e470988" ContentItemKey="67690b22-e3cc-4419-bbc8-37e5f1843a23" Title="New GeneralProductDisplayCommon" ShowTitleFlag="False" PageTitle="" DoNotRenderInDesignMode="False" ShowBorder="False" DisplayPicture="True" MaxPictureWidth="150" ProductCode="STUDENT_MEMBERSHIP_FEES" DisplayStyle="" CustomerPriceLabel="Your price:" StandardPriceLabel="Standard price:" DiscountPriceLabel="Discounted price:" DisplayComparisonPrices="CustomerPriceOnly" DisplayDiscountPercentage="False" DiscountPercentageLabelWhenDiscountApplied="You save" DiscountPercentageLabelWhenDiscountNotApplied="You could save" DiscountPercentageFormat="0.0%" ItemAddedLabel="This item has been added to your cart" ItemUpdatedLabel="Your cart has been updated" AutoRenewalText="" AutoRenewalBottomText="" AutoRenewalLabel="" />
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