<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Communication dashboard" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="DataShowcase" Src="~/iParts/Common/DataShowcase/DataShowcaseDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ProgressTracker" Src="~/iparts/Common/ProgressTracker/ProgressTrackerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryChartViewer" Src="~/iParts/Common/QueryChartViewer/QueryChartViewerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryMenu" Src="~/iparts/Common/QueryMenu/QueryMenuDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentCollectionOrganizer" Src="~/iParts/common/ContentCollectionOrganizer/ContentCollectionOrganizerDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("f890bd4c-3579-4da5-bf78-8ab5c91ad4f2"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("51b0bc2c-f435-477c-a564-b0db598ba8ef"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewDataShowcaseCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("d76e033f-736d-4cf3-9bd3-dfacf6ec6284");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewDataShowcaseCommon);

		AddChildUserControl(ContentPage2);

		childUserControl = ciSent as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("4634ed89-ad30-4364-8bdc-18ba6c94ef8a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSent);

		AddChildUserControl(ContentPage3);

		childUserControl = ciDelivered as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("d5929653-0c5c-4b3b-a81e-229f4e21eb24");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDelivered);

		AddChildUserControl(ContentPage4);

		childUserControl = ciOpenrate as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("c68f2609-ec04-4440-91a3-01ca5488ab35");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciOpenrate);

		AddChildUserControl(ContentPage5);

		childUserControl = ciClickrate as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("d74cad82-3d83-43ce-8df7-2736ae99628e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciClickrate);

		AddChildUserControl(ContentPage6);

		childUserControl = ciDeliveredchart as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("4e2d9fa9-f059-4f1d-a20f-c94dfefe53ed");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDeliveredchart);

		AddChildUserControl(ContentPage7);

		childUserControl = ciOpens as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("bf906f92-73cd-4aad-9505-35f6e0cb0cb4");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciOpens);

		AddChildUserControl(ContentPage8);

		childUserControl = ciAllresponsesbytype as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("cae9f852-0ebf-439a-8017-a1deac642b35");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAllresponsesbytype);

		AddChildUserControl(ContentPage9);

		childUserControl = ciBydate as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("5f5fd28a-102b-4808-ad78-759490327fc1");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciBydate);

		childUserControl = ciLinksclicked as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("53c529c8-cde3-4b8c-aeaa-35e70e29fb00");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciLinksclicked);

		childUserControl = ciNewContentCollectionOrganizerCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("4c7e5141-91ea-43db-ab71-8ab54aa34c10");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentCollectionOrganizerCommon);

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
				<asp:WebPartZone ID="WebPartZone1_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:DataShowcase ID="ciNewDataShowcaseCommon" runat="server" ContentKey="f890bd4c-3579-4da5-bf78-8ab5c91ad4f2" ContentItemKey="d76e033f-736d-4cf3-9bd3-dfacf6ec6284" Title="New DataShowcaseCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="PanelNoPadding" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" Content="&lt;h2&gt;{#communication.Subject}&lt;/h2&gt;" SerializedDataSources="&lt;ArrayOfDataSource xmlns=&quot;http://schemas.datacontract.org/2004/07/Asi.Web.iParts.Common.DataShowcase&quot; xmlns:i=&quot;http://www.w3.org/2001/XMLSchema-instance&quot;&gt;&lt;DataSource&gt;&lt;DataSourceId&gt;communication&lt;/DataSourceId&gt;&lt;EntityTypeName&gt;CommunicationLogSummary&lt;/EntityTypeName&gt;&lt;WhereProperty&gt;CommunicationLogId&lt;/WhereProperty&gt;&lt;WhereValue&gt;url:ID&lt;/WhereValue&gt;&lt;/DataSource&gt;&lt;/ArrayOfDataSource&gt;" HideOnError="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
<div class="row">
        <div class="col-sm-3">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciSent" runat="server" ContentKey="f890bd4c-3579-4da5-bf78-8ab5c91ad4f2" ContentItemKey="4634ed89-ad30-4364-8bdc-18ba6c94ef8a" Title="Sent" ShowTitleFlag="False" PartTitle="Emails Sent" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="ID" ListSourceQuery="$/Samples/Dashboards/Advanced Email/Specific Communication/Progress Tracker - Total queued" DataColumnName="CommunicationLogKey" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-sm-3">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciDelivered" runat="server" ContentKey="f890bd4c-3579-4da5-bf78-8ab5c91ad4f2" ContentItemKey="d5929653-0c5c-4b3b-a81e-229f4e21eb24" Title="Delivered" ShowTitleFlag="False" PartTitle="Delivered" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="ID" ListSourceQuery="$/Samples/Dashboards/Advanced Email/Specific Communication/Progress Tracker - Total delivered" DataColumnName="CommunicationLogKey" DisplayGoalPercent="True" GoalPercentDescription="of sent" DisplayGoalCountTotal="False" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="Bottom" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-sm-3">
			<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciOpenrate" runat="server" ContentKey="f890bd4c-3579-4da5-bf78-8ab5c91ad4f2" ContentItemKey="c68f2609-ec04-4440-91a3-01ca5488ab35" Title="Open rate" ShowTitleFlag="False" PartTitle="Open rate" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="ID" ListSourceQuery="$/Samples/Dashboards/Advanced Email/Specific Communication/Progress Tracker - Unique opens" DataColumnName="CommunicationLogKey" DisplayGoalPercent="True" GoalPercentDescription="of delivered" DisplayGoalCountTotal="False" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="Bottom" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-sm-3">
			<CM:ContentPage ID="ContentPage5" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone5_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciClickrate" runat="server" ContentKey="f890bd4c-3579-4da5-bf78-8ab5c91ad4f2" ContentItemKey="d74cad82-3d83-43ce-8df7-2736ae99628e" Title="Click rate" ShowTitleFlag="False" PartTitle="Click rate" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="ID" ListSourceQuery="$/Samples/Dashboards/Advanced Email/Specific Communication/Progress Tracker - Unique clicks" DataColumnName="CommunicationLogKey" DisplayGoalPercent="True" GoalPercentDescription="of opened" DisplayGoalCountTotal="False" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="Bottom" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
</div>
    <div class="row">
        <div class="col-sm-4">
			<CM:ContentPage ID="ContentPage6" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone6_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:QueryChartViewer ID="ciDeliveredchart" runat="server" ContentKey="f890bd4c-3579-4da5-bf78-8ab5c91ad4f2" ContentItemKey="4e2d9fa9-f059-4f1d-a20f-c94dfefe53ed" Title="Delivered chart" ShowTitleFlag="False" PageTitle="Sent" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Samples/Dashboards/Advanced Email/Specific Communication/Chart - Delivered" ChartTitle="" ChartType="pie" QuerySettings="" DataColumnName="Count" LabelColumnName="Response type" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="Metro" ChartWidth="0" ChartHeight="300" ChartLabelRotationAngle="0" NoDataMessage="No data found" HideEmptyChart="False" DisplayChartLabels="False" ChartSeriesLegendPosition="bottom" EnableTooltips="True" SeriesColumnName="" SeriesColumnFormat="0	" EnableStackedSeries="False" DisplayForAuthorizedUsersOnly="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-sm-4">
			<CM:ContentPage ID="ContentPage7" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone7_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:QueryChartViewer ID="ciOpens" runat="server" ContentKey="f890bd4c-3579-4da5-bf78-8ab5c91ad4f2" ContentItemKey="bf906f92-73cd-4aad-9505-35f6e0cb0cb4" Title="Opens" ShowTitleFlag="False" PageTitle="Last response for delivered" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Samples/Dashboards/Advanced Email/Specific Communication/Chart - Opened" ChartTitle="" ChartType="pie" QuerySettings="" DataColumnName="Count" LabelColumnName="Event type" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="Metro" ChartWidth="0" ChartHeight="300" ChartLabelRotationAngle="0" NoDataMessage="No data found" HideEmptyChart="False" DisplayChartLabels="False" ChartSeriesLegendPosition="bottom" EnableTooltips="True" SeriesColumnName="" SeriesColumnFormat="0	" EnableStackedSeries="False" DisplayForAuthorizedUsersOnly="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-sm-4">
			<CM:ContentPage ID="ContentPage8" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone8_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:QueryChartViewer ID="ciAllresponsesbytype" runat="server" ContentKey="f890bd4c-3579-4da5-bf78-8ab5c91ad4f2" ContentItemKey="cae9f852-0ebf-439a-8017-a1deac642b35" Title="All responses by type" ShowTitleFlag="False" PageTitle="" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Samples/Dashboards/Advanced Email/Specific Communication/Chart - All events except queued" ChartTitle="" ChartType="barhorizontal" QuerySettings="" DataColumnName="Count" LabelColumnName="Response type" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="Metro" ChartWidth="0" ChartHeight="300" ChartLabelRotationAngle="0" NoDataMessage="No data found" HideEmptyChart="False" DisplayChartLabels="True" ChartSeriesLegendPosition="hidden" EnableTooltips="True" SeriesColumnName="" SeriesColumnFormat="0	" EnableStackedSeries="False" DisplayForAuthorizedUsersOnly="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
    </div>
<div class="row">
    <div class="col-sm-12">
			<CM:ContentPage ID="ContentPage9" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone9_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:QueryChartViewer ID="ciBydate" runat="server" ContentKey="f890bd4c-3579-4da5-bf78-8ab5c91ad4f2" ContentItemKey="5f5fd28a-102b-4808-ad78-759490327fc1" Title="By date" ShowTitleFlag="False" PageTitle="By date" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Samples/Dashboards/Advanced Email/Specific Communication/Chart - Events by date" ChartTitle="" ChartType="line" QuerySettings="" DataColumnName="Count" LabelColumnName="Response type" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="Metro" ChartWidth="0" ChartHeight="400" ChartLabelRotationAngle="45" NoDataMessage="No data found" HideEmptyChart="True" DisplayChartLabels="True" ChartSeriesLegendPosition="bottom" EnableTooltips="True" SeriesColumnName="Date" SeriesColumnFormat="0	" EnableStackedSeries="False" DisplayForAuthorizedUsersOnly="False" />
				<CM:QueryMenu ID="ciLinksclicked" runat="server" ContentKey="f890bd4c-3579-4da5-bf78-8ab5c91ad4f2" ContentItemKey="53c529c8-cde3-4b8c-aeaa-35e70e29fb00" Title="Links clicked" ShowTitleFlag="False" PartTitle="Links clicked" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="20" PagerMode="Simple" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="False" SourceFolderPathControl="$/Samples/Dashboards/Advanced Email/Specific Communication/Links clicked" SourceKey="b47ef5a4-899f-43bc-8208-975540236a2a" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:ContentCollectionOrganizer ID="ciNewContentCollectionOrganizerCommon" runat="server" ContentKey="f890bd4c-3579-4da5-bf78-8ab5c91ad4f2" ContentItemKey="4c7e5141-91ea-43db-ab71-8ab54aa34c10" Title="New ContentCollectionOrganizerCommon" ShowTitleFlag="False" PartTitle="Delivery failures" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" WizardMode="False" UseContentFolder="False" ContentFolder="" ContentFolderKey="00000000-0000-0000-0000-000000000000" SequentialSteps="False" DisplayStyle="HTop" URLKeyName="New_ContentCollectionOrganizerCommon" TabbedDialogSettings="1
ea0e7dc4-ab64-49b3-8cb7-53ee00415dbc
Bounces
0
0
10
51da27cb-7ee1-4976-b378-91d0459a326b
Spam Reports
0
0
20
cce48703-7f71-493a-b7cc-837a06ccc5d9
Deferred
0
0
30
c46c310d-4831-4118-a690-62ca0de74e61
Dropped
0
0
4" UrlRedirect="" RedirectLocation="DoNotRedirect" RedirectOnFinish="False" IncludeIdAsQuerystringParameter="False" />
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