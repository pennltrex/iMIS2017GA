<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Presentations" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="GeneralProductDisplay" Src="~/iParts/Commerce/GeneralProductDisplay/GeneralProductDisplayDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("97e37366-c625-439b-9776-56452c1652cb"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("55f6d24a-487c-4fcc-bd71-38b3c02f65be"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewContentHtml_96f70b9e3fdf42dfaab4d9e40376ac57 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("96f70b9e-3fdf-42df-aab4-d9e40376ac57");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml_96f70b9e3fdf42dfaab4d9e40376ac57);

		AddChildUserControl(ContentPage2);

		childUserControl = ciArchivedPresentations_eed10cdf37874783b1c97dd23ec1b4c7 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("eed10cdf-3787-4783-b1c9-7dd23ec1b4c7");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciArchivedPresentations_eed10cdf37874783b1c97dd23ec1b4c7);

		AddChildUserControl(ContentPage3);

		childUserControl = ciConferenceProceedingsproduct as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("91bbde25-da16-4556-93b4-148396fe5f99");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciConferenceProceedingsproduct);

		AddChildUserControl(ContentPage4);

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
				<CM:ContentHtml ID="ciNewContentHtml_96f70b9e3fdf42dfaab4d9e40376ac57" runat="server" ContentKey="97e37366-c625-439b-9776-56452c1652cb" ContentItemKey="96f70b9e-3fdf-42df-aab4-d9e40376ac57" Title="New ContentHtml" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml" runat="server"><h1>Presentation Access</h1>
All conference attendees are eligible to access the enormous amount of information presented at our last three Annual Conferences.</asp:Panel></CM:ContentHtml>
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
				<CM:ContentHtml ID="ciArchivedPresentations_eed10cdf37874783b1c97dd23ec1b4c7" runat="server" ContentKey="97e37366-c625-439b-9776-56452c1652cb" ContentItemKey="eed10cdf-3787-4783-b1c9-7dd23ec1b4c7" Title="Archived Presentations" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_ArchivedPresentations" runat="server"><h2>Check out the archives!</h2>
Conference attendees have free access to all presentations from all conferences!<br />
<br />
At <span style="text-decoration: underline;">presentations.imisdemo.com</span>. enter your registration number and enjoy the wide array of videos, slide presentations, and white papers. Some of the most frequently-downloaded content includes:<br />
<ul>
    <li>A Discussion of Nonresponse Bias Studies</li>
    <li>The OMB Clearance Process for Federal Surveys</li>
    <li>Is it Culturally Ethical? Human Rights Challenges in International Survey Research</li>
</ul>
<br /></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:GeneralProductDisplay ID="ciConferenceProceedingsproduct" runat="server" ContentKey="97e37366-c625-439b-9776-56452c1652cb" ContentItemKey="91bbde25-da16-4556-93b4-148396fe5f99" Title="Conference Proceedings product" ShowTitleFlag="False" PageTitle="" DoNotRenderInDesignMode="False" ShowBorder="False" DisplayPicture="True" MaxPictureWidth="150" ProductCode="CONFPROC" DisplayStyle="Vertical" CustomerPriceLabel="Your price:" StandardPriceLabel="Standard price:" DiscountPriceLabel="Discounted price:" DisplayComparisonPrices="CustomerPriceOnly" DisplayDiscountPercentage="True" DiscountPercentageLabelWhenDiscountApplied="You save" DiscountPercentageLabelWhenDiscountNotApplied="You could save" DiscountPercentageFormat="0.0%" ItemAddedLabel="This item has been added to your cart" ItemUpdatedLabel="Your cart has been updated" AutoRenewalText="" AutoRenewalBottomText="" AutoRenewalLabel="" />
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