<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Advanced email dashboard" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="ProgressTracker" Src="~/iparts/Common/ProgressTracker/ProgressTrackerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryChartViewer" Src="~/iParts/Common/QueryChartViewer/QueryChartViewerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryMenu" Src="~/iparts/Common/QueryMenu/QueryMenuDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("27f294f2-f0cf-4a72-82cc-bd83e7341dc3"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("e30aa37a-5335-4ce6-b09a-4610b4cee966"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciHeadingContent_ecc64e2359b44da780e0f4e56e8b4e25 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("ecc64e23-59b4-4da7-80e0-f4e56e8b4e25");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciHeadingContent_ecc64e2359b44da780e0f4e56e8b4e25);

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

		childUserControl = ciOpenRate as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("c68f2609-ec04-4440-91a3-01ca5488ab35");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciOpenRate);

		AddChildUserControl(ContentPage5);

		childUserControl = ciClickRate as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("5e913425-42ab-4cb0-aa28-d72107b39fb7");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciClickRate);

		AddChildUserControl(ContentPage6);

		childUserControl = ciEventsbydate as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("4d1802f6-761b-48d3-b6eb-5f763f29118c");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciEventsbydate);

		AddChildUserControl(ContentPage7);

		childUserControl = ciResponsesbytype as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("24f50246-5cc2-442f-934e-a722c208b9e6");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciResponsesbytype);

		AddChildUserControl(ContentPage8);

		childUserControl = ciBytype as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("76e2c86c-b5a3-4777-a6a0-8e004952eaa0");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciBytype);

		AddChildUserControl(ContentPage9);

		childUserControl = ciDeliveredbymonth as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("8de617ad-d53b-4550-aead-0cfac01467db");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDeliveredbymonth);

		AddChildUserControl(ContentPage10);

		childUserControl = ciResponsesbycommunication as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("da80bc38-afbf-4b51-869b-f393022ac3b4");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciResponsesbycommunication);

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
				<CM:ContentHtml ID="ciHeadingContent_ecc64e2359b44da780e0f4e56e8b4e25" runat="server" ContentKey="27f294f2-f0cf-4a72-82cc-bd83e7341dc3" ContentItemKey="ecc64e23-59b4-4da7-80e0-f4e56e8b4e25" Title="Heading Content" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_HeadingContent" runat="server"><h2>Advanced email dashboard</h2>
<p class="Info">Results are of advanced email communications sent in the past 12 months, unless otherwise indicated.</p></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
<div class="row">
        <div class="col-md-3 col-sm-6">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciSent" runat="server" ContentKey="27f294f2-f0cf-4a72-82cc-bd83e7341dc3" ContentItemKey="4634ed89-ad30-4364-8bdc-18ba6c94ef8a" Title="Sent" ShowTitleFlag="False" PartTitle="Emails sent" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="ID" ListSourceQuery="$/Samples/Dashboards/Advanced Email/Progress Tracker - Total queued" DataColumnName="(None)" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="past 12 months" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-md-3 col-sm-6">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciDelivered" runat="server" ContentKey="27f294f2-f0cf-4a72-82cc-bd83e7341dc3" ContentItemKey="d5929653-0c5c-4b3b-a81e-229f4e21eb24" Title="Delivered" ShowTitleFlag="False" PartTitle="Delivered" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="ID" ListSourceQuery="$/Samples/Dashboards/Advanced Email/Progress Tracker - Total delivered" DataColumnName="(None)" DisplayGoalPercent="True" GoalPercentDescription="of sent" DisplayGoalCountTotal="False" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="Bottom" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
<div class="ClearFix visible-sm"></div>
        <div class="col-md-3 col-sm-6">
			<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciOpenRate" runat="server" ContentKey="27f294f2-f0cf-4a72-82cc-bd83e7341dc3" ContentItemKey="c68f2609-ec04-4440-91a3-01ca5488ab35" Title="Open Rate" ShowTitleFlag="False" PartTitle="Open rate" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="ID" ListSourceQuery="$/Samples/Dashboards/Advanced Email/Progress Tracker - Unique opens" DataColumnName="(None)" DisplayGoalPercent="True" GoalPercentDescription="of delivered" DisplayGoalCountTotal="False" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="Bottom" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-md-3 col-sm-6">
			<CM:ContentPage ID="ContentPage5" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone5_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciClickRate" runat="server" ContentKey="27f294f2-f0cf-4a72-82cc-bd83e7341dc3" ContentItemKey="5e913425-42ab-4cb0-aa28-d72107b39fb7" Title="Click Rate" ShowTitleFlag="False" PartTitle="Click rate" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="ID" ListSourceQuery="$/Samples/Dashboards/Advanced Email/Progress Tracker - Unique clicks" DataColumnName="(None)" DisplayGoalPercent="True" GoalPercentDescription="of opened" DisplayGoalCountTotal="False" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="Bottom" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
</div>
<div class="row">
    <div class="col-sm-9">
			<CM:ContentPage ID="ContentPage6" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone6_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:QueryChartViewer ID="ciEventsbydate" runat="server" ContentKey="27f294f2-f0cf-4a72-82cc-bd83e7341dc3" ContentItemKey="4d1802f6-761b-48d3-b6eb-5f763f29118c" Title="Events by date" ShowTitleFlag="False" PageTitle="Responses in the past 90 days" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Samples/Dashboards/Advanced Email/Chart - Events by date" ChartTitle="" ChartType="line" QuerySettings="" DataColumnName="Count" LabelColumnName="Response type" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="Metro" ChartWidth="0" ChartHeight="400" ChartLabelRotationAngle="45" NoDataMessage="No data found" HideEmptyChart="False" DisplayChartLabels="True" ChartSeriesLegendPosition="bottom" EnableTooltips="True" SeriesColumnName="Date" SeriesColumnFormat="0	" EnableStackedSeries="False" DisplayForAuthorizedUsersOnly="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-3">
			<CM:ContentPage ID="ContentPage7" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone7_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:QueryChartViewer ID="ciResponsesbytype" runat="server" ContentKey="27f294f2-f0cf-4a72-82cc-bd83e7341dc3" ContentItemKey="24f50246-5cc2-442f-934e-a722c208b9e6" Title="Responses by type" ShowTitleFlag="False" PageTitle="Last response per recipient" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Samples/Dashboards/Advanced Email/Chart - Last events" ChartTitle="" ChartType="pie" QuerySettings="" DataColumnName="Count" LabelColumnName="Event type" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="Metro" ChartWidth="0" ChartHeight="400" ChartLabelRotationAngle="0" NoDataMessage="No data found" HideEmptyChart="False" DisplayChartLabels="False" ChartSeriesLegendPosition="bottom" EnableTooltips="True" SeriesColumnName="" SeriesColumnFormat="0	" EnableStackedSeries="True" DisplayForAuthorizedUsersOnly="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
<div class="row">
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage8" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone8_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:QueryChartViewer ID="ciBytype" runat="server" ContentKey="27f294f2-f0cf-4a72-82cc-bd83e7341dc3" ContentItemKey="76e2c86c-b5a3-4777-a6a0-8e004952eaa0" Title="By type" ShowTitleFlag="False" PageTitle="By type" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Samples/Dashboards/Advanced Email/Chart - Events by type" ChartTitle="" ChartType="barvertical" QuerySettings="" DataColumnName="Count" LabelColumnName="Response type" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="Metro" ChartWidth="0" ChartHeight="400" ChartLabelRotationAngle="45" NoDataMessage="No data found" HideEmptyChart="False" DisplayChartLabels="True" ChartSeriesLegendPosition="bottom" EnableTooltips="True" SeriesColumnName="CommunicationType" SeriesColumnFormat="0	" EnableStackedSeries="False" DisplayForAuthorizedUsersOnly="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage9" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone9_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:QueryChartViewer ID="ciDeliveredbymonth" runat="server" ContentKey="27f294f2-f0cf-4a72-82cc-bd83e7341dc3" ContentItemKey="8de617ad-d53b-4550-aead-0cfac01467db" Title="Delivered by month" ShowTitleFlag="False" PageTitle="Delivered by month" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Samples/Dashboards/Advanced Email/Chart - Delivered by month" ChartTitle="" ChartType="barvertical" QuerySettings="" DataColumnName="TotalDelivered" LabelColumnName="CommunicationType" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="Metro" ChartWidth="0" ChartHeight="400" ChartLabelRotationAngle="45" NoDataMessage="No data found" HideEmptyChart="False" DisplayChartLabels="True" ChartSeriesLegendPosition="bottom" EnableTooltips="True" SeriesColumnName="CreatedOn" SeriesColumnFormat="16	MMMM yyyy" EnableStackedSeries="True" DisplayForAuthorizedUsersOnly="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
			<CM:ContentPage ID="ContentPage10" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone10_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:QueryMenu ID="ciResponsesbycommunication" runat="server" ContentKey="27f294f2-f0cf-4a72-82cc-bd83e7341dc3" ContentItemKey="da80bc38-afbf-4b51-869b-f393022ac3b4" Title="Responses by communication" ShowTitleFlag="False" PartTitle="By communication" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="20" PagerMode="Advanced" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="False" SourceFolderPathControl="$/Samples/Dashboards/Advanced Email/Responses by communication" SourceKey="44a0e66a-466f-4a45-ac88-606c50eae65b" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
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