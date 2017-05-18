<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Downloadable Product: Association CEO's Guide" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentFile" Src="~/AsiCommon/Controls/ContentManagement/DisplayFile.ascx" %>
<%@ Register TagPrefix="CM" TagName="RelatedItems" Src="~/iparts/Common/RelatedItems/RelatedItemsDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("c1f1f5d1-060c-49b6-8dc1-a50c9501ba6a"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("853baf9d-68f8-4c2c-87df-ba64d894dd38"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciLogo_13859e5277b84814ae6c5429fb0a4b11 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("13859e52-77b8-4814-ae6c-5429fb0a4b11");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciLogo_13859e5277b84814ae6c5429fb0a4b11);

		childUserControl = ciCongratulationsonyourpurchase_c5e0c6a3da3a44e7b2a3dbb42e00d446 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("c5e0c6a3-da3a-44e7-b2a3-dbb42e00d446");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCongratulationsonyourpurchase_c5e0c6a3da3a44e7b2a3dbb42e00d446);

		AddChildUserControl(ContentPage2);

		childUserControl = ciAssociationCEOGuide as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("56639068-e1fa-4d07-b2de-06e4934978a1");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAssociationCEOGuide);

		AddChildUserControl(ContentPage3);

		childUserControl = ciRelatedDownloadableProducts as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("5b5ae90a-4763-4785-8906-e80f36ff96b1");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRelatedDownloadableProducts);

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
				<CM:ContentHtml ID="ciLogo_13859e5277b84814ae6c5429fb0a4b11" runat="server" ContentKey="c1f1f5d1-060c-49b6-8dc1-a50c9501ba6a" ContentItemKey="13859e52-77b8-4814-ae6c-5429fb0a4b11" Title="Logo" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Logo" runat="server"><img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/ImageLibrary/StaffSignInLogo.png" /><br />
<span style="color: #595959;">iMIS International<br />
8910 Sylvan Ridge<br />
Eden Prairie, MN 55347-3336<br />
(516) 987-2222 </span></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciCongratulationsonyourpurchase_c5e0c6a3da3a44e7b2a3dbb42e00d446" runat="server" ContentKey="c1f1f5d1-060c-49b6-8dc1-a50c9501ba6a" ContentItemKey="c5e0c6a3-da3a-44e7-b2a3-dbb42e00d446" Title="Congratulations on your purchase!" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Congratulationsonyourpurchase" runat="server"><span style="font-size: 18px; color: #0070c0;">Thank you for purchasing <em>The Association CEO's Guide to Improving Organizational Performance: How to make sure your business strategy drives your technology investments</em>. We offer you this book as a practical resource. Use it wisely and the rewards will be great!<br />
<br />
<span style="font-size: large; line-height: 25.7142868041992px; color: #0070c0;">Click to download your book. </span><br />
<br />
</span></asp:Panel></CM:ContentHtml>
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
				<CM:ContentFile ID="ciAssociationCEOGuide" runat="server" ContentKey="c1f1f5d1-060c-49b6-8dc1-a50c9501ba6a" ContentItemKey="56639068-e1fa-4d07-b2de-06e4934978a1" Title="Association CEO Guide" ShowTitleFlag="False" FileTypeCode="PDF" FileName="Association CEO Guide" FileDescription="" FileDocumentStorageKey="c291c2d1-a56d-49b1-bcad-6a4319e44937" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:RelatedItems ID="ciRelatedDownloadableProducts" runat="server" ContentKey="c1f1f5d1-060c-49b6-8dc1-a50c9501ba6a" ContentItemKey="5b5ae90a-4763-4785-8906-e80f36ff96b1" Title="Related Downloadable Products" ShowTitleFlag="False" PartTitle="More Resources" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" NoRecordsFound="No results found" ListDescription="" MaxRecords="3" ImageDimension="32" ClickUrl="" ImagePath="" DefaultImage="" DisplayOrientation="Vertical" DisplayNameOption="Label" QueryStringParameterName="" ListSourceQuery="$/Samples/RelatedItems/Related Products" DataColumnName="" LabelMaxLength="25" EnableHorizontalScrolling="False" HorizontalScrollWidth="0" />
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