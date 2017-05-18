<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Membership dashboard" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ProgressTracker" Src="~/iparts/Common/ProgressTracker/ProgressTrackerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryChartViewer" Src="~/iParts/Common/QueryChartViewer/QueryChartViewerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentCollectionOrganizer" Src="~/iParts/common/ContentCollectionOrganizer/ContentCollectionOrganizerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="RecentHistory" Src="~/iParts/Common/RecentHistory/RecentHistoryDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="AlertDisplay" Src="~/iParts/Communications/Notification/NotificationDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("61a1bac3-ea70-444f-8b0f-cf94dc0aca01"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("d7c53503-2242-4937-a0f8-77657c5179fd"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciTotalmembers as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("5e211a00-d296-432a-aff5-468ff8b61730");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciTotalmembers);

		AddChildUserControl(ContentPage2);

		childUserControl = ciNewmembers as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("91816625-ffc4-4b90-bc8c-514a6b72d5d6");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewmembers);

		AddChildUserControl(ContentPage3);

		childUserControl = ciRenewals as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("3a854a87-563d-4344-b30b-c9b212a84475");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRenewals);

		AddChildUserControl(ContentPage4);

		childUserControl = ciLapsedmembers as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("694b5e31-4252-44e7-b23e-b071357df574");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciLapsedmembers);

		AddChildUserControl(ContentPage5);

		childUserControl = ciMembersbyMemberType as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("163dd830-9bf8-47e3-bb58-4aa4de2c54cb");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMembersbyMemberType);

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
		key = new System.Guid("3f19c315-a702-4a1b-8cf4-1a3b994a3725");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentCollectionOrganizerCommon);

		childUserControl = ciDashboardInfo_cbb4ef5ef4e94283be870e6126d53492 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("cbb4ef5e-f4e9-4283-be87-0e6126d53492");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDashboardInfo_cbb4ef5ef4e94283be870e6126d53492);

		AddChildUserControl(ContentPage8);

		childUserControl = ciRecenthistory as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a2781ba2-73b0-4964-9a60-a368d1540ab8");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRecenthistory);

		childUserControl = ciAlertDisplay as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9bd34b14-c781-4480-a6e3-2d65ee1b5789");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAlertDisplay);

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
				<CM:ProgressTracker ID="ciTotalmembers" runat="server" ContentKey="61a1bac3-ea70-444f-8b0f-cf94dc0aca01" ContentItemKey="5e211a00-d296-432a-aff5-468ff8b61730" Title="Total members" ShowTitleFlag="False" PartTitle="Total members" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor2" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="" ListSourceQuery="$/Samples/Dashboards/Membership/Progress Tracker - Total Active Members" DataColumnName="(None)" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
</div>
    <div class="col-sm-6 col-md-3">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciNewmembers" runat="server" ContentKey="61a1bac3-ea70-444f-8b0f-cf94dc0aca01" ContentItemKey="91816625-ffc4-4b90-bc8c-514a6b72d5d6" Title="New members" ShowTitleFlag="False" PartTitle="New members" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor3" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="Last year&#39;s count: [GoalTotal]" QueryStringParameterName="" ListSourceQuery="$/Samples/Dashboards/Membership/Progress Tracker - New members" DataColumnName="(None)" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="Bottom" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
</div>
<div class="ClearFix visible-sm"></div>
    <div class="col-sm-6 col-md-3">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciRenewals" runat="server" ContentKey="61a1bac3-ea70-444f-8b0f-cf94dc0aca01" ContentItemKey="3a854a87-563d-4344-b30b-c9b212a84475" Title="Renewals" ShowTitleFlag="False" PartTitle="Renewals" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor4" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="" ListSourceQuery="$/Samples/Dashboards/Membership/Progress Tracker - Renewals This Year" DataColumnName="(None)" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="Bottom" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
</div>
    <div class="col-sm-6 col-md-3">
			<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciLapsedmembers" runat="server" ContentKey="61a1bac3-ea70-444f-8b0f-cf94dc0aca01" ContentItemKey="694b5e31-4252-44e7-b23e-b071357df574" Title="Lapsed members" ShowTitleFlag="False" PartTitle="Lapsed members" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor5" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="" ListSourceQuery="$/Samples/Dashboards/Membership/Progress Tracker - Lapsed members" DataColumnName="(None)" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="" SuccessfulMessage="" />
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
				<CM:QueryChartViewer ID="ciMembersbyMemberType" runat="server" ContentKey="61a1bac3-ea70-444f-8b0f-cf94dc0aca01" ContentItemKey="163dd830-9bf8-47e3-bb58-4aa4de2c54cb" Title="Members by Member Type" ShowTitleFlag="False" PageTitle="Members by member type" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Samples/Dashboards/Membership/Active members by type" ChartTitle="" ChartType="pie" QuerySettings="" DataColumnName="Records" LabelColumnName="Customer Type" DataColumnFormat="0	" LabelColumnFormat="0	" SkinName="Metro" ChartWidth="0" ChartHeight="400" ChartLabelRotationAngle="90" NoDataMessage="No data found" HideEmptyChart="False" DisplayChartLabels="False" ChartSeriesLegendPosition="bottom" EnableTooltips="True" SeriesColumnName="" SeriesColumnFormat="0	" EnableStackedSeries="False" DisplayForAuthorizedUsersOnly="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
</div>
<div class="col-sm-6">
			<CM:ContentPage ID="ContentPage6" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone6_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:QueryChartViewer ID="ciMembersByRegion" runat="server" ContentKey="61a1bac3-ea70-444f-8b0f-cf94dc0aca01" ContentItemKey="f86bc333-b472-4e1c-8774-f1349603c484" Title="Members By Region" ShowTitleFlag="False" PageTitle="Members by region" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Samples/StaffHome/Members by Region" ChartTitle="" ChartType="barvertical" QuerySettings="" DataColumnName="Members" LabelColumnName="Region" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="Metro" ChartWidth="0" ChartHeight="400" ChartLabelRotationAngle="90" NoDataMessage="No data found" HideEmptyChart="False" DisplayChartLabels="True" ChartSeriesLegendPosition="hidden" EnableTooltips="True" SeriesColumnName="" SeriesColumnFormat="0	" EnableStackedSeries="False" DisplayForAuthorizedUsersOnly="False" />
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
				<CM:ContentCollectionOrganizer ID="ciNewContentCollectionOrganizerCommon" runat="server" ContentKey="61a1bac3-ea70-444f-8b0f-cf94dc0aca01" ContentItemKey="3f19c315-a702-4a1b-8cf4-1a3b994a3725" Title="New ContentCollectionOrganizerCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" WizardMode="False" UseContentFolder="False" ContentFolder="" ContentFolderKey="00000000-0000-0000-0000-000000000000" SequentialSteps="False" DisplayStyle="HTop" URLKeyName="New_ContentCollectionOrganizerCommon" TabbedDialogSettings="0
4fdccbc7-fff2-4fa8-8abc-0e4019e180b5
Chapters
0
0
1
0
31baab1c-2b58-4cab-95f0-4c68a5105981
New members
0
0
2
0
f6d821e9-8dbf-40b9-abc5-3d9f8f3eb7da
Lapsed members
0
0
3
" UrlRedirect="" RedirectLocation="DoNotRedirect" RedirectOnFinish="False" IncludeIdAsQuerystringParameter="False" />
				<CM:ContentHtml ID="ciDashboardInfo_cbb4ef5ef4e94283be870e6126d53492" runat="server" ContentKey="61a1bac3-ea70-444f-8b0f-cf94dc0aca01" ContentItemKey="cbb4ef5e-f4e9-4283-be87-0e6126d53492" Title="Dashboard Info" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_DashboardInfo" runat="server"><p class="Info">Dashboard reflects all year-to-date data unless otherwise indicated.</p></asp:Panel></CM:ContentHtml>
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
				<CM:RecentHistory ID="ciRecenthistory" runat="server" ContentKey="61a1bac3-ea70-444f-8b0f-cf94dc0aca01" ContentItemKey="a2781ba2-73b0-4964-9a60-a368d1540ab8" Title="Recent history" ShowTitleFlag="False" PartTitle="Recent history" DoNotRenderInDesignMode="False" CssClass="PanelNoPadding" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" MaxDisplayCount="10" ShowAllTypes="False" SelectedTypes="Contacts" AllowChangingType="False" StaffOnly="False" />
				<CM:AlertDisplay ID="ciAlertDisplay" runat="server" ContentKey="61a1bac3-ea70-444f-8b0f-cf94dc0aca01" ContentItemKey="9bd34b14-c781-4480-a6e3-2d65ee1b5789" Title="Alert Display" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="Alerts PanelNoPadding" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" SelectedNotificationSets="4606245e-9bbf-418a-9deb-3ab9d1890912" HideWhenEmpty="True" NoAlertMessage="" />
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