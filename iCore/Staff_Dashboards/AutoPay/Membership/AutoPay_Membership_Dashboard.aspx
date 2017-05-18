<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="AutoPay Membership Dashboard" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ProgressTracker" Src="~/iparts/Common/ProgressTracker/ProgressTrackerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryChartViewer" Src="~/iParts/Common/QueryChartViewer/QueryChartViewerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentCollectionOrganizer" Src="~/iParts/common/ContentCollectionOrganizer/ContentCollectionOrganizerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="RecentHistory" Src="~/iParts/Common/RecentHistory/RecentHistoryDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="AlertDisplay" Src="~/iParts/Communications/Notification/NotificationDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("c544e92c-68d8-46c6-a3e9-8eceacf54fd4"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("4ded54ed-d569-4bd4-a664-ade407b2b352"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewProgressTrackerCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("d4a4e98d-553a-45a5-99b2-4292af6a7344");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewProgressTrackerCommon);

		AddChildUserControl(ContentPage2);

		childUserControl = ciNewProgressTrackerCommon2 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("971784eb-e3eb-40fe-a440-03423b70c9c5");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewProgressTrackerCommon2);

		AddChildUserControl(ContentPage3);

		childUserControl = ciNewProgressTrackerCommon3 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e93c9bb8-45de-4afe-aefb-c22c3bce1aa7");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewProgressTrackerCommon3);

		AddChildUserControl(ContentPage4);

		childUserControl = ciNewProgressTrackerCommon4 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("8708e5a9-2399-45fd-a3ff-3e505f1dab2a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewProgressTrackerCommon4);

		AddChildUserControl(ContentPage5);

		childUserControl = ciNewQueryChartViewerCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9981f0ad-96cb-442e-a1f7-87976e369802");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewQueryChartViewerCommon);

		AddChildUserControl(ContentPage6);

		childUserControl = ciNewQueryChartViewerCommon2 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a1561e7f-37b4-4067-8d5d-3eb5ab5d56ac");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewQueryChartViewerCommon2);

		AddChildUserControl(ContentPage7);

		childUserControl = ciNewContentCollectionOrganizerCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9c9da835-d529-4b84-9bbf-dd04227e2138");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentCollectionOrganizerCommon);

		AddChildUserControl(ContentPage8);

		childUserControl = ciRecenthistory as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("0252d49d-dce1-41af-a5c5-329bb6b49a48");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRecenthistory);

		childUserControl = ciAlertDisplay as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("bd0c757c-6364-4fdf-8076-efa2e913e6d3");
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
				<CM:ProgressTracker ID="ciNewProgressTrackerCommon" runat="server" ContentKey="c544e92c-68d8-46c6-a3e9-8eceacf54fd4" ContentItemKey="d4a4e98d-553a-45a5-99b2-4292af6a7344" Title="New ProgressTrackerCommon" ShowTitleFlag="False" PartTitle="Total auto renew members" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor2" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="" ListSourceQuery="$/Samples/Dashboards/AutoPay/Membership/Total active auto-renew members" DataColumnName="(None)" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="Bottom" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
</div>
    <div class="col-sm-6 col-md-3">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciNewProgressTrackerCommon2" runat="server" ContentKey="c544e92c-68d8-46c6-a3e9-8eceacf54fd4" ContentItemKey="971784eb-e3eb-40fe-a440-03423b70c9c5" Title="New ProgressTrackerCommon_2" ShowTitleFlag="False" PartTitle="Cancelled enrollments" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor3" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="" ListSourceQuery="$/Samples/Dashboards/AutoPay/Membership/Total cancelled auto-pay memberships" DataColumnName="(None)" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="Bottom" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
</div>
<div class="ClearFix visible-sm"></div>
    <div class="col-sm-6 col-md-3">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciNewProgressTrackerCommon3" runat="server" ContentKey="c544e92c-68d8-46c6-a3e9-8eceacf54fd4" ContentItemKey="e93c9bb8-45de-4afe-aefb-c22c3bce1aa7" Title="New ProgressTrackerCommon_3" ShowTitleFlag="False" PartTitle="Failed payments" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor4" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="" ListSourceQuery="$/Samples/Dashboards/AutoPay/Membership/Total Auto-Pay Membership Payment Attempts Failed" DataColumnName="(None)" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
</div>
    <div class="col-sm-6 col-md-3">
			<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciNewProgressTrackerCommon4" runat="server" ContentKey="c544e92c-68d8-46c6-a3e9-8eceacf54fd4" ContentItemKey="8708e5a9-2399-45fd-a3ff-3e505f1dab2a" Title="New ProgressTrackerCommon_4" ShowTitleFlag="False" PartTitle="Expired credit cards" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor5" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="" ListSourceQuery="$/Samples/Dashboards/AutoPay/Membership/Total membership credit cards expired" DataColumnName="(None)" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="" SuccessfulMessage="" />
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
				<CM:QueryChartViewer ID="ciNewQueryChartViewerCommon" runat="server" ContentKey="c544e92c-68d8-46c6-a3e9-8eceacf54fd4" ContentItemKey="9981f0ad-96cb-442e-a1f7-87976e369802" Title="New QueryChartViewerCommon" ShowTitleFlag="False" PageTitle="Recurring members by membership type" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Samples/Dashboards/AutoPay/Membership/Recurring memberships by member type" ChartTitle="" ChartType="pie" QuerySettings="" DataColumnName="Number of donors" LabelColumnName="Description" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="Metro" ChartWidth="0" ChartHeight="400" ChartLabelRotationAngle="0" NoDataMessage="No data found" HideEmptyChart="False" DisplayChartLabels="False" ChartSeriesLegendPosition="bottom" EnableTooltips="True" SeriesColumnName="" SeriesColumnFormat="0	" EnableStackedSeries="False" DisplayForAuthorizedUsersOnly="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
</div>
<div class="col-sm-6">
			<CM:ContentPage ID="ContentPage6" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone6_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:QueryChartViewer ID="ciNewQueryChartViewerCommon2" runat="server" ContentKey="c544e92c-68d8-46c6-a3e9-8eceacf54fd4" ContentItemKey="a1561e7f-37b4-4067-8d5d-3eb5ab5d56ac" Title="New QueryChartViewerCommon_2" ShowTitleFlag="False" PageTitle="Recurring members by region" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Samples/Dashboards/AutoPay/Membership/Auto-pay members by region" ChartTitle="" ChartType="barvertical" QuerySettings="" DataColumnName="Members" LabelColumnName="Region" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="Metro" ChartWidth="0" ChartHeight="400" ChartLabelRotationAngle="90" NoDataMessage="No data found" HideEmptyChart="False" DisplayChartLabels="True" ChartSeriesLegendPosition="hidden" EnableTooltips="True" SeriesColumnName="" SeriesColumnFormat="0	" EnableStackedSeries="False" DisplayForAuthorizedUsersOnly="False" />
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
				<CM:ContentCollectionOrganizer ID="ciNewContentCollectionOrganizerCommon" runat="server" ContentKey="c544e92c-68d8-46c6-a3e9-8eceacf54fd4" ContentItemKey="9c9da835-d529-4b84-9bbf-dd04227e2138" Title="New ContentCollectionOrganizerCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" WizardMode="False" UseContentFolder="False" ContentFolder="" ContentFolderKey="00000000-0000-0000-0000-000000000000" SequentialSteps="False" DisplayStyle="HTop" URLKeyName="New_ContentCollectionOrganizerCommon" TabbedDialogSettings="0
0c8c9a2f-7aa9-46a1-939a-dd4f38b0bc5c
Recurring members
0
0
4
0
a601770c-73ad-4a7e-b10f-2d744e9e73ff
Cancelled enrollments
0
0
1
0
b0245246-3176-4628-b317-1de80d2c5943
Failed payments
0
0
3
0
a47739b1-1b2d-4eea-b962-fa4c85a1f94f
Expiring cards
0
0
1
" UrlRedirect="" RedirectLocation="DoNotRedirect" RedirectOnFinish="False" IncludeIdAsQuerystringParameter="False" />
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
				<CM:RecentHistory ID="ciRecenthistory" runat="server" ContentKey="c544e92c-68d8-46c6-a3e9-8eceacf54fd4" ContentItemKey="0252d49d-dce1-41af-a5c5-329bb6b49a48" Title="Recent history" ShowTitleFlag="False" PartTitle="Recent history" DoNotRenderInDesignMode="False" CssClass="PanelNoPadding" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" MaxDisplayCount="10" ShowAllTypes="False" SelectedTypes="Contacts,Groups" AllowChangingType="False" StaffOnly="False" />
				<CM:AlertDisplay ID="ciAlertDisplay" runat="server" ContentKey="c544e92c-68d8-46c6-a3e9-8eceacf54fd4" ContentItemKey="bd0c757c-6364-4fdf-8076-efa2e913e6d3" Title="Alert Display" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="Alerts PanelNoPadding" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" SelectedNotificationSets="fc0b1493-7016-4dd9-aaa3-9d930be83124" HideWhenEmpty="True" NoAlertMessage="" />
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