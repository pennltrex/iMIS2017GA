<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Moves management dashboard" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ProgressTracker" Src="~/iparts/Common/ProgressTracker/ProgressTrackerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryChartViewer" Src="~/iParts/Common/QueryChartViewer/QueryChartViewerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentCollectionOrganizer" Src="~/iParts/common/ContentCollectionOrganizer/ContentCollectionOrganizerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="AlertDisplay" Src="~/iParts/Communications/Notification/NotificationDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("8751c1a0-71cd-4837-85e0-8e515f400938"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("070f0169-9255-4fd5-9cbe-9cfecdefcc46"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewProgressTrackerCommon2 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a9ca4ed0-1285-4892-ba8a-04a8249687ab");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewProgressTrackerCommon2);

		AddChildUserControl(ContentPage2);

		childUserControl = ciNewProgressTrackerCommon3 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("2123db87-0ea4-42f9-9e0c-330f7f446a83");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewProgressTrackerCommon3);

		AddChildUserControl(ContentPage3);

		childUserControl = ciNewProgressTrackerCommon4 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("2f5b4682-a785-482a-aee5-2dc17eed1747");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewProgressTrackerCommon4);

		AddChildUserControl(ContentPage4);

		childUserControl = ciNewProgressTrackerCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("2d539e05-a7ed-4d75-a394-6719be658c6d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewProgressTrackerCommon);

		AddChildUserControl(ContentPage5);

		childUserControl = ciNewQueryChartViewerCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("d8fa038c-eeda-45de-abbc-d25adc6d937b");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewQueryChartViewerCommon);

		AddChildUserControl(ContentPage6);

		childUserControl = ciMembersByRegion as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("f86bc333-b472-4e1c-8774-f1349603c484");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMembersByRegion);

		AddChildUserControl(ContentPage7);

		childUserControl = ciNewContentCollectionOrganizerCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6ccf7afa-f320-43ee-a385-29afd2d7d087");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentCollectionOrganizerCommon);

		childUserControl = ciDashboardInfo_cbb4ef5ef4e94283be870e6126d53492 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("cbb4ef5e-f4e9-4283-be87-0e6126d53492");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDashboardInfo_cbb4ef5ef4e94283be870e6126d53492);

		AddChildUserControl(ContentPage8);

		childUserControl = ciAlerts as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("d08dddd3-0859-411c-ad0c-6914bbca0e38");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAlerts);

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
    <div class="col-sm-6 col-md-3">
			<CM:ContentPage ID="ContentPage1" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone1_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciNewProgressTrackerCommon2" runat="server" ContentKey="8751c1a0-71cd-4837-85e0-8e515f400938" ContentItemKey="a9ca4ed0-1285-4892-ba8a-04a8249687ab" Title="New ProgressTrackerCommon_2" ShowTitleFlag="False" PartTitle="Major donors" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor2" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="" ListSourceQuery="$/Samples/Dashboards/MovesManagement/OverallDashboard/Progress Trackers/ProgressTracker - Number of major donors" DataColumnName="(None)" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
</div>
    <div class="col-sm-6 col-md-3">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciNewProgressTrackerCommon3" runat="server" ContentKey="8751c1a0-71cd-4837-85e0-8e515f400938" ContentItemKey="2123db87-0ea4-42f9-9e0c-330f7f446a83" Title="New ProgressTrackerCommon_3" ShowTitleFlag="False" PartTitle="Revenue from donors" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor3" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="Last year&#39;s revenue: [GoalTotal]" QueryStringParameterName="" ListSourceQuery="$/Samples/Dashboards/MovesManagement/OverallDashboard/Progress Trackers/ProgressTracker - Revenue from donors" DataColumnName="(None)" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="Bottom" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
</div>
<div class="ClearFix visible-sm"></div>
    <div class="col-sm-6 col-md-3">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciNewProgressTrackerCommon4" runat="server" ContentKey="8751c1a0-71cd-4837-85e0-8e515f400938" ContentItemKey="2f5b4682-a785-482a-aee5-2dc17eed1747" Title="New ProgressTrackerCommon_4" ShowTitleFlag="False" PartTitle="Average gift amount" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor4" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="" ListSourceQuery="$/Samples/Dashboards/MovesManagement/OverallDashboard/Progress Trackers/ProgressTracker - Average gift amount" DataColumnName="(None)" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
</div>
    <div class="col-sm-6 col-md-3">
			<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciNewProgressTrackerCommon" runat="server" ContentKey="8751c1a0-71cd-4837-85e0-8e515f400938" ContentItemKey="2d539e05-a7ed-4d75-a394-6719be658c6d" Title="New ProgressTrackerCommon" ShowTitleFlag="False" PartTitle="Potential major donors" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor5" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="" ListSourceQuery="$/Samples/Dashboards/MovesManagement/OverallDashboard/Progress Trackers/Progress Tracker - Potential major donors" DataColumnName="(None)" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
</div>
</div>
<div class="row">
    <div class="col-sm-9">
<div class="row">
<div class="col-sm-6">
			<CM:ContentPage ID="ContentPage5" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone5_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:QueryChartViewer ID="ciNewQueryChartViewerCommon" runat="server" ContentKey="8751c1a0-71cd-4837-85e0-8e515f400938" ContentItemKey="d8fa038c-eeda-45de-abbc-d25adc6d937b" Title="New QueryChartViewerCommon" ShowTitleFlag="False" PageTitle="Stages of cultivation" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Samples/Dashboards/MovesManagement/OverallDashboard/Charts/Major donors by cultivation stage" ChartTitle="" ChartType="funnel" QuerySettings="" DataColumnName="Number of donors" LabelColumnName="CultivationStage" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="Default" ChartWidth="0" ChartHeight="400" ChartLabelRotationAngle="0" NoDataMessage="No data found" HideEmptyChart="False" DisplayChartLabels="True" ChartSeriesLegendPosition="right" EnableTooltips="True" SeriesColumnName="" SeriesColumnFormat="0	" EnableStackedSeries="False" DisplayForAuthorizedUsersOnly="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
</div>
<div class="col-sm-6">
			<CM:ContentPage ID="ContentPage6" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone6_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:QueryChartViewer ID="ciMembersByRegion" runat="server" ContentKey="8751c1a0-71cd-4837-85e0-8e515f400938" ContentItemKey="f86bc333-b472-4e1c-8774-f1349603c484" Title="Members By Region" ShowTitleFlag="False" PageTitle="Type of gifts" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Samples/Dashboards/MovesManagement/OverallDashboard/Charts/Major donors by gift type" ChartTitle="" ChartType="barvertical" QuerySettings="" DataColumnName="Records" LabelColumnName="Type" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="Metro" ChartWidth="0" ChartHeight="400" ChartLabelRotationAngle="90" NoDataMessage="No data found" HideEmptyChart="False" DisplayChartLabels="True" ChartSeriesLegendPosition="hidden" EnableTooltips="True" SeriesColumnName="" SeriesColumnFormat="0	" EnableStackedSeries="False" DisplayForAuthorizedUsersOnly="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
</div>
</div>
<div class="row">
<div class="col-sm-12">
			<CM:ContentPage ID="ContentPage7" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone7_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ContentCollectionOrganizer ID="ciNewContentCollectionOrganizerCommon" runat="server" ContentKey="8751c1a0-71cd-4837-85e0-8e515f400938" ContentItemKey="6ccf7afa-f320-43ee-a385-29afd2d7d087" Title="New ContentCollectionOrganizerCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" WizardMode="False" UseContentFolder="False" ContentFolder="" ContentFolderKey="00000000-0000-0000-0000-000000000000" SequentialSteps="False" DisplayStyle="HTop" URLKeyName="New_ContentCollectionOrganizerCommon" TabbedDialogSettings="0
a21d6592-ec59-40d7-9406-67d57d3db12d
Moves managers
0
0
2
0
e14e65bf-731b-4a70-99be-63a9b7dbfa12
Potential major donors
0
0
2
" UrlRedirect="" RedirectLocation="DoNotRedirect" RedirectOnFinish="False" IncludeIdAsQuerystringParameter="False" />
				<CM:ContentHtml ID="ciDashboardInfo_cbb4ef5ef4e94283be870e6126d53492" runat="server" ContentKey="8751c1a0-71cd-4837-85e0-8e515f400938" ContentItemKey="cbb4ef5e-f4e9-4283-be87-0e6126d53492" Title="Dashboard Info" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_DashboardInfo" runat="server"><p class="Info">Dashboard reflects all year-to-date data unless otherwise indicated.</p></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
</div>
</div>
</div>
    <div class="col-sm-3">
			<CM:ContentPage ID="ContentPage8" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone8_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:AlertDisplay ID="ciAlerts" runat="server" ContentKey="8751c1a0-71cd-4837-85e0-8e515f400938" ContentItemKey="d08dddd3-0859-411c-ad0c-6914bbca0e38" Title="Alerts" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="Alerts PanelNoPadding" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" SelectedNotificationSets="0417063d-960d-44e4-8bc6-8833fc6bd701" HideWhenEmpty="True" NoAlertMessage="" />
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