<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Giving History" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactMiniProfile" Src="~/iParts/Contact Management/ContactMiniProfile/ContactMiniProfileDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="MiniGroupListDisplay" Src="~/iParts/Contact Management/MiniGroupListDisplay/MiniGroupListDisplayDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryMenu" Src="~/iparts/Common/QueryMenu/QueryMenuDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="SummaryDisplay" Src="~/iparts/Common/SummaryDisplay/SummaryDisplayDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryChartViewer" Src="~/iParts/Common/QueryChartViewer/QueryChartViewerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return true; } }

	override public Guid ContentRecordKey { get { return new Guid("25356a69-9951-4081-8809-3069c3146ea8"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("916ead55-85af-416b-a5f9-96c0e0d15219"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciMiniProfile as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("bf242fff-52ad-4d83-bcb2-84b35de411b0");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMiniProfile);

		childUserControl = ciMiniGroupListDisplay as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6cc9c92a-3f9f-4f32-abd8-1c51152b2ea4");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMiniGroupListDisplay);

		AddChildUserControl(ContentPage2);

		childUserControl = ciGiftHistoryDisplay as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("0d31911f-555f-4024-bc6b-978325deeb72");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciGiftHistoryDisplay);

		childUserControl = ciGiftSummaryDisplay as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("10fabbfa-2667-4a20-b012-bcb0a4ae2260");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciGiftSummaryDisplay);

		childUserControl = ciContributionsbyCalendarYear as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("45c88ea4-3da9-47fb-8c70-1b4152e6785a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciContributionsbyCalendarYear);

		childUserControl = ciDonorClubQueryMenu as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("1ca88926-3258-4951-9128-a31f032b95ad");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDonorClubQueryMenu);

		AddChildUserControl(ContentPage3);

		childUserControl = ciActionListLinks_9993b6a923a8497ab44324e0562315fe as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9993b6a9-23a8-497a-b443-24e0562315fe");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciActionListLinks_9993b6a923a8497ab44324e0562315fe);

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
				<CM:ContactMiniProfile ID="ciMiniProfile" runat="server" ContentKey="25356a69-9951-4081-8809-3069c3146ea8" ContentItemKey="bf242fff-52ad-4d83-bcb2-84b35de411b0" Title="Mini Profile" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" MaxFileSize="1024" FileTypes=".GIF,.JPG,.PNG,.BMP" MaxImageWidth="200" EnableEdit="False" DisplayForAuthorizedUsersOnly="True" DisplayContactName="True" DisplayContactTitle="True" DisplayInstitute="True" AddressToDisplay="Preferred Mailing" ChangeContactStatus="False" CustomerIdHeading="" CustomerBillingHeading="" CustomerJoinHeading="" CustomerTypeHeading="" CustomerStatusHeading="Status" MobilePhoneHeading="" CustomerPaidThruHeading="" DisplayCustomerId="False" DisplayBillingCat="False" DisplayCustomerJoinDate="False" DisplayCustomerType="False" DisplayCustomerStatus="False" DisplayPaidThru="True" DisplayContactPicture="False" EditContactName="False" IncludePrimaryOrganizationSelection="False" RequirePrimaryOrganizationSelection="False" OrganizationListQueryPath="" DisplayMobilePhone="False" />
				<CM:MiniGroupListDisplay ID="ciMiniGroupListDisplay" runat="server" ContentKey="25356a69-9951-4081-8809-3069c3146ea8" ContentItemKey="6cc9c92a-3f9f-4f32-abd8-1c51152b2ea4" Title="Mini Group List Display" ShowTitleFlag="False" PageTitle="Memberships" DoNotRenderInDesignMode="False" ShowBorder="True" />
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
				<CM:QueryMenu ID="ciGiftHistoryDisplay" runat="server" ContentKey="25356a69-9951-4081-8809-3069c3146ea8" ContentItemKey="0d31911f-555f-4024-bc6b-978325deeb72" Title="Gift History Display" ShowTitleFlag="False" PartTitle="Gift history" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="True" MapResults="False" ListPageSize="20" PagerMode="Advanced" MenuCaptionText="" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="$/Fundraising/DefaultSystem/Queries/Giving History - Public/Contributions By Calendar Year" SourceKey="15ea55bc-c92a-4356-afeb-0fb49de98e1d" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:SummaryDisplay ID="ciGiftSummaryDisplay" runat="server" ContentKey="25356a69-9951-4081-8809-3069c3146ea8" ContentItemKey="10fabbfa-2667-4a20-b012-bcb0a4ae2260" Title="Gift Summary Display" ShowTitleFlag="False" PartTitle="Gift summary" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayForAuthorizedUsersOnly="False" HideWhenNoData="False" HideFieldsWithNoData="False" IQAQueryPath="$/Fundraising/DefaultSystem/Queries/Donor Gift Summary" IQAQueryKey="15e194d4-2629-49b9-aa65-c335c02f976b" />
				<CM:QueryChartViewer ID="ciContributionsbyCalendarYear" runat="server" ContentKey="25356a69-9951-4081-8809-3069c3146ea8" ContentItemKey="45c88ea4-3da9-47fb-8c70-1b4152e6785a" Title="Contributions by Calendar Year" ShowTitleFlag="False" PageTitle="Contributions by calendar year" DoNotRenderInDesignMode="False" ShowBorder="True" ChartSeriesLabel="Amount" ChartSourceQuery="$/Fundraising/DefaultSystem/Queries/Charts/Contributions by Calendar Year Summary" ChartTitle="" ChartType="barvertical" QuerySettings="" DataColumnName="Given" LabelColumnName="Year" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="Default" ChartWidth="500" ChartHeight="400" ChartLabelRotationAngle="0" NoDataMessage="" HideEmptyChart="False" DisplayChartLabels="True" ChartSeriesLegendPosition="hidden" EnableTooltips="True" SeriesColumnName="" SeriesColumnFormat="0	" EnableStackedSeries="False" DisplayForAuthorizedUsersOnly="False" />
				<CM:QueryMenu ID="ciDonorClubQueryMenu" runat="server" ContentKey="25356a69-9951-4081-8809-3069c3146ea8" ContentItemKey="1ca88926-3258-4951-9128-a31f032b95ad" Title="DonorClubQueryMenu" ShowTitleFlag="False" PartTitle="Donor clubs" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="True" MapResults="False" ListPageSize="20" PagerMode="Advanced" MenuCaptionText="" UsePopup="False" DisplayForAuthorizedUsersOnly="False" SourceFolderPathControl="$/Fundraising/DefaultSystem/Queries/Donor Clubs" SourceKey="830818fe-25fb-4e9e-9658-ffa37194b2f6" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

				</div>
				<div class="col-sm-3">
								<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciActionListLinks_9993b6a923a8497ab44324e0562315fe" runat="server" ContentKey="25356a69-9951-4081-8809-3069c3146ea8" ContentItemKey="9993b6a9-23a8-497a-b443-24e0562315fe" Title="Action List Links" ShowTitleFlag="False" ShowBorder="True"><asp:Panel ID="Panel_ActionListLinks" runat="server"><div class="TitleBarCaption">
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