<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Event blog" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="GeneralProductDisplay" Src="~/iParts/Commerce/GeneralProductDisplay/GeneralProductDisplayDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentBlock" Src="~/iParts/Common/ContentBlock/ContentBlockDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("2a2883b4-1b20-4584-87a6-87ecbc11ff87"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("528be984-1cd2-4d4f-8f32-276abc81e995"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciResourcesHeading_12e031dd2fd14586951d7dbdef87182c as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("12e031dd-2fd1-4586-951d-7dbdef87182c");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciResourcesHeading_12e031dd2fd14586951d7dbdef87182c);

		AddChildUserControl(ContentPage2);

		childUserControl = ciConferenceProceedingsproduct as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("ac8f8395-e98c-4747-b98c-9eac5fdb5338");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciConferenceProceedingsproduct);

		AddChildUserControl(ContentPage3);

		childUserControl = ciEventblog as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("59542007-d521-4621-9cbc-d68ee4de2a6a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciEventblog);

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
				<CM:ContentHtml ID="ciResourcesHeading_12e031dd2fd14586951d7dbdef87182c" runat="server" ContentKey="2a2883b4-1b20-4584-87a6-87ecbc11ff87" ContentItemKey="12e031dd-2fd1-4586-951d-7dbdef87182c" Title="Resources Heading" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_ResourcesHeading" runat="server"><h1>Resources for Attendees</h1></asp:Panel></CM:ContentHtml>
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
				<CM:GeneralProductDisplay ID="ciConferenceProceedingsproduct" runat="server" ContentKey="2a2883b4-1b20-4584-87a6-87ecbc11ff87" ContentItemKey="ac8f8395-e98c-4747-b98c-9eac5fdb5338" Title="Conference Proceedings product" ShowTitleFlag="False" PageTitle="" DoNotRenderInDesignMode="False" ShowBorder="False" DisplayPicture="True" MaxPictureWidth="150" ProductCode="CONFPROC" DisplayStyle="Vertical" CustomerPriceLabel="Your price:" StandardPriceLabel="Standard price:" DiscountPriceLabel="Attendee price:" DisplayComparisonPrices="CustomerPriceAndTwoComparisonPrices" DisplayDiscountPercentage="True" DiscountPercentageLabelWhenDiscountApplied="You save" DiscountPercentageLabelWhenDiscountNotApplied="You could save" DiscountPercentageFormat="0.0%" ItemAddedLabel="This item has been added to your cart" ItemUpdatedLabel="Your cart has been updated" AutoRenewalText="" AutoRenewalBottomText="" AutoRenewalLabel="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentBlock ID="ciEventblog" runat="server" ContentKey="2a2883b4-1b20-4584-87a6-87ecbc11ff87" ContentItemKey="59542007-d521-4621-9cbc-d68ee4de2a6a" Title="Event blog" ShowTitleFlag="False" PageTitle="Event blog" DoNotRenderInDesignMode="False" ShowBorder="False" SelectedTags="2d95a695-8178-4d46-9955-c22cded4e43d" AllowReplies="True" AllowHtml="True" AllowAttachments="True" ItemDefaultHtml="T&lt;span style=&quot;font-size: 16px; color: #0070c0;&quot;&gt;his is the place to make connections for attendees! Schedule outings, share vehicles, get to know each other.&lt;/span&gt;" DisplayMode="Summary" MaxDisplayItems="0" AllowChildPosts="False" IncludeSocialSharingIcons="False" PostSortType="CreatedDateDescending" DisplayPostDateAndAuthor="True" />
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