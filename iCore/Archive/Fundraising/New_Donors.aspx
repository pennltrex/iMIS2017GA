<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Acquisitions Dashboard" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryChartViewer" Src="~/iParts/Common/QueryChartViewer/QueryChartViewerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryMenu" Src="~/iparts/Common/QueryMenu/QueryMenuDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("58552117-d1ad-4303-bd1e-09fb73ac5cf0"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("39d50907-4c26-41ad-8187-0f915df97319"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		AddChildUserControl(ContentPage2);

		childUserControl = ciNumberofNewDonors as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6a83fbc1-c18b-4725-a658-937b9ab65724");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNumberofNewDonors);

		AddChildUserControl(ContentPage3);

		childUserControl = ciRevenuefromNewDonorsChart as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("370ae4eb-b852-4877-b2f6-8226dac0c338");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRevenuefromNewDonorsChart);

		AddChildUserControl(ContentPage4);

		childUserControl = ciNewDonorAverageGiftChart as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("96480182-836c-4a20-9f15-2931ba653ca2");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewDonorAverageGiftChart);

		AddChildUserControl(ContentPage5);

		childUserControl = ciDrilldownNewDonors as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("025f90ab-fcfb-4c70-92cc-27597d9e136a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDrilldownNewDonors);

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
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
    <div class="row">
        <div class="col-sm-4">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:QueryChartViewer ID="ciNumberofNewDonors" runat="server" ContentKey="58552117-d1ad-4303-bd1e-09fb73ac5cf0" ContentItemKey="6a83fbc1-c18b-4725-a658-937b9ab65724" Title="Number of New Donors " ShowTitleFlag="False" PageTitle="Number of New Donors" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Fundraising/DefaultSystem/Queries/Dashboards/New Donor Average Gift" ChartTitle="" ChartType="barvertical" QuerySettings="" DataColumnName="New Donors" LabelColumnName="Year" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="BlueStripes" ChartWidth="240" ChartHeight="200" ChartLabelRotationAngle="0" NoDataMessage="" HideEmptyChart="False" DisplayChartLabels="True" ChartSeriesLegendPosition="hidden" EnableTooltips="True" SeriesColumnName="" SeriesColumnFormat="" EnableStackedSeries="False" DisplayForAuthorizedUsersOnly="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-sm-4">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:QueryChartViewer ID="ciRevenuefromNewDonorsChart" runat="server" ContentKey="58552117-d1ad-4303-bd1e-09fb73ac5cf0" ContentItemKey="370ae4eb-b852-4877-b2f6-8226dac0c338" Title="Revenue from New Donors Chart" ShowTitleFlag="False" PageTitle="New Donor Revenue" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Fundraising/DefaultSystem/Queries/Dashboards/New Donor Average Gift" ChartTitle="" ChartType="barvertical" QuerySettings="" DataColumnName="TotalRevenue" LabelColumnName="Year" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="GreenStripes" ChartWidth="240" ChartHeight="200" ChartLabelRotationAngle="0" NoDataMessage="" HideEmptyChart="False" DisplayChartLabels="True" ChartSeriesLegendPosition="hidden" EnableTooltips="True" SeriesColumnName="" SeriesColumnFormat="" EnableStackedSeries="False" DisplayForAuthorizedUsersOnly="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-sm-4">
			<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:QueryChartViewer ID="ciNewDonorAverageGiftChart" runat="server" ContentKey="58552117-d1ad-4303-bd1e-09fb73ac5cf0" ContentItemKey="96480182-836c-4a20-9f15-2931ba653ca2" Title="New Donor Average Gift Chart" ShowTitleFlag="False" PageTitle="New Donor Average Gift" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Fundraising/DefaultSystem/Queries/Dashboards/New Donor Average Gift" ChartTitle="" ChartType="barvertical" QuerySettings="" DataColumnName="Amount" LabelColumnName="Year" DataColumnFormat="0	" LabelColumnFormat="0	" SkinName="BlueStripes" ChartWidth="240" ChartHeight="200" ChartLabelRotationAngle="0" NoDataMessage="" HideEmptyChart="False" DisplayChartLabels="True" ChartSeriesLegendPosition="hidden" EnableTooltips="True" SeriesColumnName="" SeriesColumnFormat="" EnableStackedSeries="False" DisplayForAuthorizedUsersOnly="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
    </div>
<div class="row">
    <div class="col-sm-12">
			<CM:ContentPage ID="ContentPage5" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone5_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:QueryMenu ID="ciDrilldownNewDonors" runat="server" ContentKey="58552117-d1ad-4303-bd1e-09fb73ac5cf0" ContentItemKey="025f90ab-fcfb-4c70-92cc-27597d9e136a" Title="Drilldown New Donors" ShowTitleFlag="False" PartTitle="New Donors" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="20" PagerMode="Advanced" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="False" SourceFolderPathControl="$/Fundraising/DefaultSystem/Queries/Dashboards/View New Donors" SourceKey="d60a2118-b382-482c-b05b-62a944345fcf" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
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