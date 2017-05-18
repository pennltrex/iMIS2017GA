<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Volunteers dashboard" %>
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

	override public Guid ContentRecordKey { get { return new Guid("3895ee92-10a1-4e6d-b798-983006cb02e7"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("dd681c95-8ee1-4bb0-9bc8-6cfc23e7953f"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciRegisteredvolunteers as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a0b37532-63aa-40b2-8125-bcb92719d110");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRegisteredvolunteers);

		AddChildUserControl(ContentPage2);

		childUserControl = ciNewvolunteers as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9e995f0d-5e26-4f3d-8eb7-b79880e8ada6");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewvolunteers);

		AddChildUserControl(ContentPage3);

		childUserControl = ciActivevolunteers as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a1081d74-f908-4d77-8226-ea9991ce74c4");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciActivevolunteers);

		AddChildUserControl(ContentPage4);

		childUserControl = ciVolunteerhours as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("b93d2575-5958-453a-9878-24655b11fd0c");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciVolunteerhours);

		AddChildUserControl(ContentPage5);

		AddChildUserControl(ContentPage6);

		AddChildUserControl(ContentPage7);

		childUserControl = ciVolunteerhoursbymonth as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("831914b1-00b5-48cc-b7a5-1b799bba86c0");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciVolunteerhoursbymonth);

		childUserControl = ciQuerytabs as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a25cc618-3659-4f2a-aafe-35b06a66cb9f");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciQuerytabs);

		childUserControl = ciNewContentHtml_55c53222ac8445dfb05dbab3692796a6 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("55c53222-ac84-45df-b05d-bab3692796a6");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml_55c53222ac8445dfb05dbab3692796a6);

		AddChildUserControl(ContentPage8);

		childUserControl = ciRecenthistory as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("29a760e7-5b5d-496b-9e38-e8b38cf427a8");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRecenthistory);

		childUserControl = ciAlerts as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("df3ffbc1-9b9a-4d09-8afa-0cdc38be570a");
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
				<CM:ProgressTracker ID="ciRegisteredvolunteers" runat="server" ContentKey="3895ee92-10a1-4e6d-b798-983006cb02e7" ContentItemKey="a0b37532-63aa-40b2-8125-bcb92719d110" Title="Registered volunteers" ShowTitleFlag="False" PartTitle="Registered volunteers" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor2" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="" ListSourceQuery="$/Samples/Dashboards/Volunteers/Progress tracker - Registered volunteers" DataColumnName="(None)" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
</div>
    <div class="col-sm-6 col-md-3">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciNewvolunteers" runat="server" ContentKey="3895ee92-10a1-4e6d-b798-983006cb02e7" ContentItemKey="9e995f0d-5e26-4f3d-8eb7-b79880e8ada6" Title="New volunteers" ShowTitleFlag="False" PartTitle="New volunteers" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor3" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="Last year&#39;s count: [GoalTotal]" QueryStringParameterName="" ListSourceQuery="$/Samples/Dashboards/Volunteers/Progress tracker - New volunteers" DataColumnName="(None)" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="Bottom" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
</div>
<div class="ClearFix visible-sm"></div>
    <div class="col-sm-6 col-md-3">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciActivevolunteers" runat="server" ContentKey="3895ee92-10a1-4e6d-b798-983006cb02e7" ContentItemKey="a1081d74-f908-4d77-8226-ea9991ce74c4" Title="Active volunteers" ShowTitleFlag="False" PartTitle="Active volunteers" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor4" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="Last year&#39;s count: [GoalTotal]" QueryStringParameterName="" ListSourceQuery="$/Samples/Dashboards/Volunteers/Progress tracker - Active volunteers" DataColumnName="(None)" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="Bottom" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
</div>
    <div class="col-sm-6 col-md-3">
			<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciVolunteerhours" runat="server" ContentKey="3895ee92-10a1-4e6d-b798-983006cb02e7" ContentItemKey="b93d2575-5958-453a-9878-24655b11fd0c" Title="Volunteer hours" ShowTitleFlag="False" PartTitle="Volunteer hours" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor5" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="Last year&#39;s total: [GoalTotal]" QueryStringParameterName="" ListSourceQuery="$/Samples/Dashboards/Volunteers/Progress tracker - Volunteer hours" DataColumnName="(None)" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="Bottom" SuccessfulMessage="" />
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
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
</div>
<div class="col-sm-6">
			<CM:ContentPage ID="ContentPage6" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone6_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
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
				<CM:QueryChartViewer ID="ciVolunteerhoursbymonth" runat="server" ContentKey="3895ee92-10a1-4e6d-b798-983006cb02e7" ContentItemKey="831914b1-00b5-48cc-b7a5-1b799bba86c0" Title="Volunteer hours by month" ShowTitleFlag="False" PageTitle="Volunteer hours by month" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Samples/Dashboards/Volunteers/Volunteer hours by month" ChartTitle="" ChartType="barvertical" QuerySettings="" DataColumnName="Hours" LabelColumnName="Date" DataColumnFormat="8	###,###" LabelColumnFormat="16	MMMM yyyy" SkinName="Metro" ChartWidth="0" ChartHeight="400" ChartLabelRotationAngle="90" NoDataMessage="No data found" HideEmptyChart="False" DisplayChartLabels="True" ChartSeriesLegendPosition="hidden" EnableTooltips="True" SeriesColumnName="" SeriesColumnFormat="0	" EnableStackedSeries="False" DisplayForAuthorizedUsersOnly="False" />
				<CM:ContentCollectionOrganizer ID="ciQuerytabs" runat="server" ContentKey="3895ee92-10a1-4e6d-b798-983006cb02e7" ContentItemKey="a25cc618-3659-4f2a-aafe-35b06a66cb9f" Title="Query tabs" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" WizardMode="False" UseContentFolder="False" ContentFolder="" ContentFolderKey="00000000-0000-0000-0000-000000000000" SequentialSteps="False" DisplayStyle="HTop" URLKeyName="Query_tabs" TabbedDialogSettings="0
3d5e5772-534e-4bf4-a24f-effdfca95346
Top volunteers
0
0
1
0
1d05d70d-b7cd-4c37-8934-3d93dac14758
Availability and skills
0
0
2
0
86a56fd4-48e2-48d1-8447-fedf1d97584f
Recent and upcoming
0
0
4
0
bed7a59a-45cd-45aa-bb3a-e0d4e5d4f4fd
Data integrity
0
0
3
" UrlRedirect="" RedirectLocation="DoNotRedirect" RedirectOnFinish="False" IncludeIdAsQuerystringParameter="False" />
				<CM:ContentHtml ID="ciNewContentHtml_55c53222ac8445dfb05dbab3692796a6" runat="server" ContentKey="3895ee92-10a1-4e6d-b798-983006cb02e7" ContentItemKey="55c53222-ac84-45df-b05d-bab3692796a6" Title="New ContentHtml" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml" runat="server"><p class="Info">Dashboard reflects all year-to-date data, unless otherwise indicated.</p></asp:Panel></CM:ContentHtml>
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
				<CM:RecentHistory ID="ciRecenthistory" runat="server" ContentKey="3895ee92-10a1-4e6d-b798-983006cb02e7" ContentItemKey="29a760e7-5b5d-496b-9e38-e8b38cf427a8" Title="Recent history" ShowTitleFlag="False" PartTitle="Recent history" DoNotRenderInDesignMode="False" CssClass="PanelNoPadding" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" MaxDisplayCount="10" ShowAllTypes="False" SelectedTypes="Contacts" AllowChangingType="False" StaffOnly="False" />
				<CM:AlertDisplay ID="ciAlerts" runat="server" ContentKey="3895ee92-10a1-4e6d-b798-983006cb02e7" ContentItemKey="df3ffbc1-9b9a-4d09-8afa-0cdc38be570a" Title="Alerts" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="Alerts PanelNoPadding" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" SelectedNotificationSets="69e0dd96-2adc-4ac4-8fcb-20b4f06caf90" HideWhenEmpty="True" NoAlertMessage="" />
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