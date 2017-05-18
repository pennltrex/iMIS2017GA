<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Giving History Staff" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactMiniProfile" Src="~/iParts/Contact Management/ContactMiniProfile/ContactMiniProfileDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="MiniGroupListDisplay" Src="~/iParts/Contact Management/MiniGroupListDisplay/MiniGroupListDisplayDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="SummaryDisplay" Src="~/iparts/Common/SummaryDisplay/SummaryDisplayDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryMenu" Src="~/iparts/Common/QueryMenu/QueryMenuDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryChartViewer" Src="~/iParts/Common/QueryChartViewer/QueryChartViewerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return true; } }

	override public Guid ContentRecordKey { get { return new Guid("b8500959-b2f9-4cdb-b8f8-1cf96649f1ea"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("fc28aa07-330f-4586-ab45-f9d1a1d7be49"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciMiniProfile as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("328a889e-72d9-4a9e-937a-3cba886c26a9");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMiniProfile);

		childUserControl = ciMiniGroupListDisplay as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("ab6b644c-899d-4264-bb31-9379e19be1f0");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMiniGroupListDisplay);

		AddChildUserControl(ContentPage2);

		childUserControl = ciGiftSummaryDisplay as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6d2a5f58-5439-494a-8923-26513de2d6f8");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciGiftSummaryDisplay);

		childUserControl = ciGiftHistoryDisplay as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a98d5e05-2017-4aff-95ed-58e483425d05");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciGiftHistoryDisplay);

		childUserControl = ciQueryChartViewer as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("ec9d799a-378b-4e33-bb95-a2520930495a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciQueryChartViewer);

		childUserControl = ciDonorClubQueryMenu as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a175f4dd-02e4-4438-a5ed-45c7dd2e226a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDonorClubQueryMenu);

		AddChildUserControl(ContentPage3);

		childUserControl = ciActionListLinks_d50b0d592fb148f3b362ae3657d4d166 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("d50b0d59-2fb1-48f3-b362-ae3657d4d166");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciActionListLinks_d50b0d592fb148f3b362ae3657d4d166);

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
		<div class="col-sm-3">
						<CM:ContentPage ID="ContentPage1" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone1_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContactMiniProfile ID="ciMiniProfile" runat="server" ContentKey="b8500959-b2f9-4cdb-b8f8-1cf96649f1ea" ContentItemKey="328a889e-72d9-4a9e-937a-3cba886c26a9" Title="Mini Profile" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" MaxFileSize="1024" FileTypes=".GIF,.JPG,.PNG,.BMP" MaxImageWidth="200" EnableEdit="False" DisplayForAuthorizedUsersOnly="True" DisplayContactName="True" DisplayContactTitle="True" DisplayInstitute="True" AddressToDisplay="Preferred Mailing" ChangeContactStatus="False" CustomerIdHeading="" CustomerBillingHeading="" CustomerJoinHeading="" CustomerTypeHeading="" CustomerStatusHeading="Status" MobilePhoneHeading="" CustomerPaidThruHeading="" DisplayCustomerId="False" DisplayBillingCat="False" DisplayCustomerJoinDate="False" DisplayCustomerType="False" DisplayCustomerStatus="False" DisplayPaidThru="True" DisplayContactPicture="False" EditContactName="False" IncludePrimaryOrganizationSelection="False" RequirePrimaryOrganizationSelection="False" OrganizationListQueryPath="" DisplayMobilePhone="False" />
				<CM:MiniGroupListDisplay ID="ciMiniGroupListDisplay" runat="server" ContentKey="b8500959-b2f9-4cdb-b8f8-1cf96649f1ea" ContentItemKey="ab6b644c-899d-4264-bb31-9379e19be1f0" Title="Mini Group List Display" ShowTitleFlag="False" PageTitle="Memberships" DoNotRenderInDesignMode="False" ShowBorder="True" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-9">
			<div class="row">
				<div class="col-sm-9">
								<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:SummaryDisplay ID="ciGiftSummaryDisplay" runat="server" ContentKey="b8500959-b2f9-4cdb-b8f8-1cf96649f1ea" ContentItemKey="6d2a5f58-5439-494a-8923-26513de2d6f8" Title="Gift Summary Display" ShowTitleFlag="False" PartTitle="Gift summary" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayForAuthorizedUsersOnly="False" HideWhenNoData="False" HideFieldsWithNoData="False" IQAQueryPath="$/Fundraising/DefaultSystem/Queries/Donor Gift Summary" IQAQueryKey="15e194d4-2629-49b9-aa65-c335c02f976b" />
				<CM:QueryMenu ID="ciGiftHistoryDisplay" runat="server" ContentKey="b8500959-b2f9-4cdb-b8f8-1cf96649f1ea" ContentItemKey="a98d5e05-2017-4aff-95ed-58e483425d05" Title="Gift History Display" ShowTitleFlag="False" PartTitle="Gift history" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="True" MapResults="False" ListPageSize="20" PagerMode="Advanced" MenuCaptionText="" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="$/Fundraising/DefaultSystem/Queries/Giving History - Staff" SourceKey="0bd57283-c7bd-438d-be5e-1e1e4149d117" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:QueryChartViewer ID="ciQueryChartViewer" runat="server" ContentKey="b8500959-b2f9-4cdb-b8f8-1cf96649f1ea" ContentItemKey="ec9d799a-378b-4e33-bb95-a2520930495a" Title="Query Chart Viewer" ShowTitleFlag="False" PageTitle="Giving history by calendar year" DoNotRenderInDesignMode="False" ShowBorder="True" ChartSeriesLabel="Amount" ChartSourceQuery="$/Fundraising/DefaultSystem/Queries/Charts/Giving History by Calendar Year Summary" ChartTitle="" ChartType="barvertical" QuerySettings="" DataColumnName="Amount" LabelColumnName="Year" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="Default" ChartWidth="500" ChartHeight="400" ChartLabelRotationAngle="0" NoDataMessage="" HideEmptyChart="False" DisplayChartLabels="True" ChartSeriesLegendPosition="hidden" EnableTooltips="True" SeriesColumnName="" SeriesColumnFormat="0	" EnableStackedSeries="False" DisplayForAuthorizedUsersOnly="False" />
				<CM:QueryMenu ID="ciDonorClubQueryMenu" runat="server" ContentKey="b8500959-b2f9-4cdb-b8f8-1cf96649f1ea" ContentItemKey="a175f4dd-02e4-4438-a5ed-45c7dd2e226a" Title="DonorClubQueryMenu" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="True" MapResults="False" ListPageSize="20" PagerMode="Advanced" MenuCaptionText="" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="" SourceKey="4b31552b-965a-47b4-b6d7-7f73a3d28986" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

				</div>
				<div class="col-sm-3">
								<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciActionListLinks_d50b0d592fb148f3b362ae3657d4d166" runat="server" ContentKey="b8500959-b2f9-4cdb-b8f8-1cf96649f1ea" ContentItemKey="d50b0d59-2fb1-48f3-b362-ae3657d4d166" Title="Action List Links" ShowTitleFlag="False" ShowBorder="True"><asp:Panel ID="Panel_ActionListLinks" runat="server"><div class="TitleBarCaption">
<div>Action List Links </div>
</div>
<span>
<p><a href="Account_Page.aspx?AccountPages=Personal"><span style="color: #0000ff;">Edit Contact Info</span></a></p>
<p><a href="Account_Page.aspx?AccountPages=Groups"><span style="color: #0000ff;">Edit Group Memberships</span></a></p>
<p><a href="Account_Page.aspx?AccountPages=Preferences"><span style="color: #0000ff;">Edit Preferences</span></a></p>
<p><a href="Account_Page.aspx?AccountPages=Profile"><span style="color: #0000ff;">Edit Public Profile</span></a></p>
<p><a href="Account_Page.aspx?AccountPages=Demographics"><span style="color: #0000ff;">Update Demographics</span></a></p>
<p><a href="Account_Page.aspx?AccountPages=Overview"><span style="color: #0000ff;">View Participation Reports</span></a></p>
<p><a href="Account_Page.aspx?AccountPages=Participation"><span style="color: #0000ff;">View Transaction Reports</span></a></p>
</span></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

				</div>
			</div>
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