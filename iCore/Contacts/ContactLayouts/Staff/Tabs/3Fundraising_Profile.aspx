<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Giving" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="PanelEditor" Src="~/iparts/Common/PanelEditor/PanelEditorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="DisplayNameEditor" Src="~/iParts/Contact Management/DisplayNameEditor/DisplayNameEditorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="AutomaticPaymentEnrollments" Src="~/iParts/Commerce/AutoPayEnrollments/AutoPayEnrollmentsDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="SummaryDisplay" Src="~/iparts/Common/SummaryDisplay/SummaryDisplayDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryMenu" Src="~/iparts/Common/QueryMenu/QueryMenuDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryChartViewer" Src="~/iParts/Common/QueryChartViewer/QueryChartViewerDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("1920ca8a-9560-4506-990f-6e45986955f5"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("16b42d95-8be5-4e46-9212-e049967cfa13"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciFRProfileDonorData as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("70d5d323-4de5-41ff-bf8e-4341751b6e0d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciFRProfileDonorData);

		childUserControl = ciFRProfileListAs as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("245149b1-f5a5-4a05-9dcf-bc0c40107b58");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciFRProfileListAs);

		childUserControl = ciRecurringdonations as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("b25244f8-72c6-46c0-af84-70bdd1fdd61d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRecurringdonations);

		childUserControl = ciGiftSummary as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e6989d70-6c0b-41ca-9360-ad93ba3d969b");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciGiftSummary);

		childUserControl = ciGivingHistoryDisplay as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("21f5a8ec-0a2f-4bb6-9771-1f8d4144ba60");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciGivingHistoryDisplay);

		childUserControl = ciQueryChartViewer as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("76206dc0-b57f-47ad-88ec-60edfc2284dd");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciQueryChartViewer);

		childUserControl = ciDonorClubQueryMenu as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("85827610-7b2c-451b-8c15-a73721080019");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDonorClubQueryMenu);

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
				<CM:PanelEditor ID="ciFRProfileDonorData" runat="server" ContentKey="1920ca8a-9560-4506-990f-6e45986955f5" ContentItemKey="70d5d323-4de5-41ff-bf8e-4341751b6e0d" Title="FR Profile Donor Data" ShowTitleFlag="False" PartTitle="Donor info" DoNotRenderInDesignMode="False" CssClass="iPartChain FirstPart CalloutPart2" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PanelDefinitionId="503ca4f2-5b4e-437f-ab3b-baf5bc3b09e6" AllowEdit="True" DefaultEditMode="False" CommitSequence="0" AllowDelete="False" AllowAdd="True" EditWindowWidth="600" EditWindowHeight="400" DisplayForAuthorizedUsersOnly="True" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" HidePanelWhenEmpty="False" ScrollingCellsEnabled="False" />
				<CM:DisplayNameEditor ID="ciFRProfileListAs" runat="server" ContentKey="1920ca8a-9560-4506-990f-6e45986955f5" ContentItemKey="245149b1-f5a5-4a05-9dcf-bc0c40107b58" Title="FR Profile List As" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="iPartChain LastPart CalloutPart2" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" CommitSequence="0" SalutationType="LIST_AS" AnonCheckboxText="List this donor as anonymous" LabelText="Name(s) this donor would like to be recognized as:" DisplayForAuthorizedUsersOnly="True" />
				<CM:AutomaticPaymentEnrollments ID="ciRecurringdonations" runat="server" ContentKey="1920ca8a-9560-4506-990f-6e45986955f5" ContentItemKey="b25244f8-72c6-46c0-af84-70bdd1fdd61d" Title="Recurring donations" ShowTitleFlag="False" PartTitle="Recurring donations" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnrollmentTypeDisplayed="Donation" DisplayCancelledEnrollments="True" HideGridIfNoEnrollments="True" NoEnrollmentsMessage="You are not enrolled in automatic payments" />
				<CM:SummaryDisplay ID="ciGiftSummary" runat="server" ContentKey="1920ca8a-9560-4506-990f-6e45986955f5" ContentItemKey="e6989d70-6c0b-41ca-9360-ad93ba3d969b" Title="Gift Summary" ShowTitleFlag="False" PartTitle="Gift summary" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayForAuthorizedUsersOnly="False" HideWhenNoData="False" HideFieldsWithNoData="False" IQAQueryPath="$/Fundraising/DefaultSystem/Queries/Donor Gift Summary" IQAQueryKey="15e194d4-2629-49b9-aa65-c335c02f976b" />
				<CM:QueryMenu ID="ciGivingHistoryDisplay" runat="server" ContentKey="1920ca8a-9560-4506-990f-6e45986955f5" ContentItemKey="21f5a8ec-0a2f-4bb6-9771-1f8d4144ba60" Title="Giving History Display" ShowTitleFlag="False" PartTitle="Giving history" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="True" MapResults="False" ListPageSize="10" PagerMode="Simple" MenuCaptionText="" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="$/Fundraising/DefaultSystem/Queries/Giving History - Staff" SourceKey="0bd57283-c7bd-438d-be5e-1e1e4149d117" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:QueryChartViewer ID="ciQueryChartViewer" runat="server" ContentKey="1920ca8a-9560-4506-990f-6e45986955f5" ContentItemKey="76206dc0-b57f-47ad-88ec-60edfc2284dd" Title="Query Chart Viewer" ShowTitleFlag="False" PageTitle="Giving history by calendar year" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="Amount" ChartSourceQuery="$/Fundraising/DefaultSystem/Queries/Charts/Giving History by Calendar Year Summary" ChartTitle="" ChartType="barvertical" QuerySettings="" DataColumnName="Amount" LabelColumnName="Year" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="Default" ChartWidth="500" ChartHeight="400" ChartLabelRotationAngle="0" NoDataMessage="" HideEmptyChart="True" DisplayChartLabels="True" ChartSeriesLegendPosition="hidden" EnableTooltips="True" SeriesColumnName="" SeriesColumnFormat="0	" EnableStackedSeries="False" DisplayForAuthorizedUsersOnly="False" />
				<CM:QueryMenu ID="ciDonorClubQueryMenu" runat="server" ContentKey="1920ca8a-9560-4506-990f-6e45986955f5" ContentItemKey="85827610-7b2c-451b-8c15-a73721080019" Title="DonorClubQueryMenu" ShowTitleFlag="False" PartTitle="Donor clubs" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="True" MapResults="False" ListPageSize="10" PagerMode="Simple" MenuCaptionText="" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="$/Fundraising/DefaultSystem/Queries/Donor Clubs" SourceKey="830818fe-25fb-4e9e-9658-ffa37194b2f6" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
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