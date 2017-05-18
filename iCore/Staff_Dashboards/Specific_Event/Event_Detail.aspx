<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Event Detail" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="DataShowcase" Src="~/iParts/Common/DataShowcase/DataShowcaseDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ProgressTracker" Src="~/iparts/Common/ProgressTracker/ProgressTrackerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryChartViewer" Src="~/iParts/Common/QueryChartViewer/QueryChartViewerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentCollectionOrganizer" Src="~/iParts/common/ContentCollectionOrganizer/ContentCollectionOrganizerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="AlertDisplay" Src="~/iParts/Communications/Notification/NotificationDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("42b966fb-093c-453e-9316-9eb7dbd59eaf"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("7a874754-85a5-42c7-a344-884e540a2cfb"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciEventDetailDataShowcaseCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("75c9b0fb-f6e9-440e-b671-a87adc0ef5cb");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciEventDetailDataShowcaseCommon);

		AddChildUserControl(ContentPage2);

		childUserControl = ciDaysremaining as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e910f39e-8c8e-4852-96d9-7e6ccedb7487");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDaysremaining);

		AddChildUserControl(ContentPage3);

		childUserControl = ciRevenue as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a06c4fa8-8e8d-4ae2-9611-a4509b550487");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRevenue);

		AddChildUserControl(ContentPage4);

		childUserControl = ciRegistrants as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("4f0c75c4-7a42-4627-a926-39d41c18d09e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRegistrants);

		AddChildUserControl(ContentPage5);

		childUserControl = ciCancellations as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("f5cb93b1-2eed-41e4-8116-835b10208683");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCancellations);

		AddChildUserControl(ContentPage6);

		AddChildUserControl(ContentPage7);

		AddChildUserControl(ContentPage8);

		childUserControl = ciRegistrationsovertime as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9c8a052f-7af9-4ec3-9301-521c12eb3255");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRegistrationsovertime);

		childUserControl = ciDashboardtabs as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("c1e05fce-bac8-41e2-bade-ff7c9f277e44");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDashboardtabs);

		AddChildUserControl(ContentPage9);

		childUserControl = ciReports as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("dcf6841c-45a0-4da8-ad1e-cf6c748b9494");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciReports);

		childUserControl = ciPrinttickets as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("d2282a70-4271-451d-aa0a-362bc99ea9c4");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciPrinttickets);

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
				<CM:DataShowcase ID="ciEventDetailDataShowcaseCommon" runat="server" ContentKey="42b966fb-093c-453e-9316-9eb7dbd59eaf" ContentItemKey="75c9b0fb-f6e9-440e-b671-a87adc0ef5cb" Title="EventDetailDataShowcaseCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" Content="&lt;h1&gt;{#event.Name}&lt;/h1&gt;
&lt;span id=&quot;DSEventStartDate&quot;&gt;{#event.StartDateTime format=&quot;D&quot;}&lt;/span&gt;&lt;span id=&quot;DSEnDash&quot;&gt; – &lt;/span&gt;&lt;span id=&quot;DSEventEndDate&quot;&gt;{#event.EndDateTime format=&quot;D&quot;}&lt;/span&gt;
&lt;span id=&quot;DSEventContactId&quot; style=&quot;display: none;&quot;&gt;{#event.NotificationPartyId}&lt;/span&gt;
&lt;div id=&quot;EventContactLink&quot;&gt;&lt;a href=&quot;[Website]Party.aspx?ID={#event.NotificationPartyId}&quot;&gt;View event contact&lt;/a&gt;&lt;/div&gt;
&lt;script&gt;
	var startDateSpan = jQuery(&quot;#DSEventStartDate&quot;);
	var endDateSpan = jQuery(&quot;#DSEventEndDate&quot;);
	var enDashSpan = jQuery(&quot;#DSEnDash&quot;);
	var eventContactSpan = jQuery(&quot;#DSEventContactId&quot;);
	var eventContactLink = jQuery(&quot;#EventContactLink&quot;);

	if (startDateSpan.text() == endDateSpan.text()) {  
		// if the dates are equal only show it once
		endDateSpan.css(&quot;display&quot;,&quot;none&quot;);
		enDashSpan.css(&quot;display&quot;,&quot;none&quot;);
	}
	if (startDateSpan.is(&quot;:empty&quot;) || endDateSpan.is(&quot;:empty&quot;)) {
		// if there is no start or end date don&#39;t show the dash
		enDashSpan.css(&quot;display&quot;, &quot;none&quot;);
	}
	if(eventContactSpan.is(&quot;:empty&quot;) || eventContactSpan.text() == &quot;&quot;) {
		eventContactLink.css(&quot;display&quot;, &quot;none&quot;);
	}
&lt;/script&gt;" SerializedDataSources="&lt;ArrayOfDataSource xmlns=&quot;http://schemas.datacontract.org/2004/07/Asi.Web.iParts.Common.DataShowcase&quot; xmlns:i=&quot;http://www.w3.org/2001/XMLSchema-instance&quot;&gt;&lt;DataSource&gt;&lt;DataSourceId&gt;event&lt;/DataSourceId&gt;&lt;EntityTypeName&gt;Event&lt;/EntityTypeName&gt;&lt;WhereProperty&gt;EventId&lt;/WhereProperty&gt;&lt;WhereValue&gt;url:EventKey&lt;/WhereValue&gt;&lt;/DataSource&gt;&lt;/ArrayOfDataSource&gt;" HideOnError="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

                </div>
        </div>
	<div class="row">
		<div class="col-sm-6 col-md-3">
						<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciDaysremaining" runat="server" ContentKey="42b966fb-093c-453e-9316-9eb7dbd59eaf" ContentItemKey="e910f39e-8c8e-4852-96d9-7e6ccedb7487" Title="Days remaining" ShowTitleFlag="False" PartTitle="Days until event" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor2" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="EventKey" ListSourceQuery="$/Samples/Dashboards/Events/Specific Events/Progress Tracker - Total Registrations" DataColumnName="EventCode" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="False" GoalCountTotalDescription="" DisplayGoalDaysRemaining="True" GoalDaysRemainingDescription="" ProgressBarLocation="" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-6 col-md-3">
						<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciRevenue" runat="server" ContentKey="42b966fb-093c-453e-9316-9eb7dbd59eaf" ContentItemKey="a06c4fa8-8e8d-4ae2-9611-a4509b550487" Title="Revenue" ShowTitleFlag="False" PartTitle="Revenue" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor3" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="EventKey" ListSourceQuery="$/Samples/Dashboards/Events/Specific Events/Progress Tracker - Total Revenue" DataColumnName="EventCode" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="ClearFix visible-sm">
		</div>
		<div class="col-sm-6 col-md-3">
						<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard Chart">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciRegistrants" runat="server" ContentKey="42b966fb-093c-453e-9316-9eb7dbd59eaf" ContentItemKey="4f0c75c4-7a42-4627-a926-39d41c18d09e" Title="Registrants" ShowTitleFlag="False" PartTitle="Registrants" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor4" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="Capacity: [GoalTotal]" QueryStringParameterName="EventKey" ListSourceQuery="$/Samples/Dashboards/Events/Specific Events/Progress Tracker - Total Registrations" DataColumnName="EventCode" DisplayGoalPercent="False" GoalPercentDescription="of capacity filled" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="days remaining until event" ProgressBarLocation="Bottom" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-6 col-md-3">
						<CM:ContentPage ID="ContentPage5" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone5_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciCancellations" runat="server" ContentKey="42b966fb-093c-453e-9316-9eb7dbd59eaf" ContentItemKey="f5cb93b1-2eed-41e4-8116-835b10208683" Title="Cancellations" ShowTitleFlag="False" PartTitle="Cancellations" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor5" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="EventKey" ListSourceQuery="$/Samples/Dashboards/Events/Specific Events/Progress Tracker - Total Cancellations" DataColumnName="EventCode" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
	</div>
	<div class="row">
		<div class="col-sm-9">
			<div class="row">
				<div class="col-sm-6">
								<CM:ContentPage ID="ContentPage6" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone6_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

				</div>
				<div class="col-sm-6">
								<CM:ContentPage ID="ContentPage7" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone7_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

				</div>
			</div>
			<div class="row">
				<div class="col-sm-12">
								<CM:ContentPage ID="ContentPage8" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone8_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard CenterChart">
					<ZoneTemplate>
				<CM:QueryChartViewer ID="ciRegistrationsovertime" runat="server" ContentKey="42b966fb-093c-453e-9316-9eb7dbd59eaf" ContentItemKey="9c8a052f-7af9-4ec3-9301-521c12eb3255" Title="Registrations over time" ShowTitleFlag="False" PageTitle="Registrations over time" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Samples/Dashboards/Events/Specific Events/Registrations over time" ChartTitle="" ChartType="area" QuerySettings="" DataColumnName="QuantityOrdered" LabelColumnName="OrderDate" DataColumnFormat="8	###,###" LabelColumnFormat="16	MMMM yyyy" SkinName="Metro" ChartWidth="0" ChartHeight="400" ChartLabelRotationAngle="90" NoDataMessage="No data found" HideEmptyChart="True" DisplayChartLabels="True" ChartSeriesLegendPosition="hidden" EnableTooltips="True" SeriesColumnName="" SeriesColumnFormat="0	" EnableStackedSeries="False" DisplayForAuthorizedUsersOnly="False" />
				<CM:ContentCollectionOrganizer ID="ciDashboardtabs" runat="server" ContentKey="42b966fb-093c-453e-9316-9eb7dbd59eaf" ContentItemKey="c1e05fce-bac8-41e2-bade-ff7c9f277e44" Title="Dashboard tabs" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" WizardMode="False" UseContentFolder="False" ContentFolder="" ContentFolderKey="00000000-0000-0000-0000-000000000000" SequentialSteps="False" DisplayStyle="HTop" URLKeyName="Dashboard_tabs" TabbedDialogSettings="0
76fe9477-1037-4cae-a279-d79c3a70113e
Registration options
0
0
1
0
f183597a-765d-43e3-b3db-26a429ef7cde
Program items
0
0
2
" UrlRedirect="" RedirectLocation="DoNotRedirect" RedirectOnFinish="False" IncludeIdAsQuerystringParameter="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

				</div>
			</div>
		</div>
		<div class="col-sm-3">
						<CM:ContentPage ID="ContentPage9" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone9_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard CenterChart">
					<ZoneTemplate>
				<CM:DataShowcase ID="ciReports" runat="server" ContentKey="42b966fb-093c-453e-9316-9eb7dbd59eaf" ContentItemKey="dcf6841c-45a0-4da8-ad1e-cf6c748b9494" Title="Reports" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" Content="&lt;script type=&quot;text/javascript&quot;&gt;
// Popup window code
function newPopup(url) {
    NewWindow(url, &#39;Report&#39;, &#39;current&#39;, &#39;nonmodal&#39;, false);
}
&lt;/script&gt;
&lt;div class=&quot;btn-group dropdown-toggle&quot;&gt;
&lt;button type=&quot;button&quot; class=&quot;TextButton dropdown-toggle&quot; data-toggle=&quot;dropdown&quot; aria-haspopup=&quot;true&quot; aria-expanded=&quot;false&quot;&gt;Run reports &lt;span class=&quot;caret&quot;&gt;&lt;/span&gt;&lt;/button&gt;
&lt;ul class=&quot;dropdown-menu&quot;&gt;
    &lt;li&gt;&lt;a href=&quot;JavaScript:newPopup(&#39;[Website]iCore/Staff_Dashboards/Specific_Event/Badge Report RDL.aspx?Event Code={#event.EventId}&amp;amp;First Name=&amp;amp;Last Name=&amp;amp;Include Guests=True&#39;);&quot;&gt;Print badges&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href=&quot;JavaScript:newPopup(&#39;[Website]iCore/Staff_Dashboards/Specific_Event/Event_confirmations_report.aspx?Event={#event.EventId}&#39;);&quot;&gt;Print confirmations&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href=&quot;JavaScript:newPopup(&#39;[Website]iCore/Staff_Dashboards/Specific_Event/Registrants Directory.aspx?Event={#event.EventId}&amp;amp;Include Guests=False&amp;amp;Include Cancelled=False&amp;amp;Include Full Address=False&amp;amp;Include Phone=False&#39;);&quot;&gt;Registrant directory&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href=&quot;JavaScript:newPopup(&#39;[Website]iCore/Staff_Dashboards/Specific_Event/Program Item Registrant.aspx?Event={#event.EventId}&amp;amp;Report Title=Registration Option Registrants&amp;amp;Show Registrants for=Registration Options&#39;);&quot;&gt;Registration option registrants&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href=&quot;JavaScript:newPopup(&#39;[Website]iCore/Staff_Dashboards/Specific_Event/Program Item Registrant.aspx?Event={#event.EventId}&amp;amp;Report Title=Program Item Registrants&amp;amp;Show Registrants for=Program Items&#39;);&quot;&gt;Program item registrants&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href=&quot;JavaScript:newPopup(&#39;[Website]iCore/Staff_Dashboards/Specific_Event/Event_certificates_report.aspx?Event={#event.EventId}&#39;);&quot;&gt;Print certificates&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href=&quot;JavaScript:newPopup(&#39;[Website]iCore/Staff_Dashboards/Specific_Event/Event_planning_report.aspx?Event={#event.EventId}&#39;);&quot;&gt;Planning report&lt;/a&gt;&lt;/li&gt;
    &lt;li&gt;&lt;a href=&quot;JavaScript:newPopup(&#39;[Website]iCore/Staff_Dashboards/Specific_Event/Event_weeks_out_report.aspx?Event={#event.EventId}&#39;);&quot;&gt;Weeks out report&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;
&lt;/div&gt;" SerializedDataSources="&lt;ArrayOfDataSource xmlns=&quot;http://schemas.datacontract.org/2004/07/Asi.Web.iParts.Common.DataShowcase&quot; xmlns:i=&quot;http://www.w3.org/2001/XMLSchema-instance&quot;&gt;&lt;DataSource&gt;&lt;DataSourceId&gt;event&lt;/DataSourceId&gt;&lt;EntityTypeName&gt;Event&lt;/EntityTypeName&gt;&lt;WhereProperty&gt;EventId&lt;/WhereProperty&gt;&lt;WhereValue&gt;url:EventKey&lt;/WhereValue&gt;&lt;/DataSource&gt;&lt;/ArrayOfDataSource&gt;" HideOnError="False" />
				<CM:AlertDisplay ID="ciPrinttickets" runat="server" ContentKey="42b966fb-093c-453e-9316-9eb7dbd59eaf" ContentItemKey="d2282a70-4271-451d-aa0a-362bc99ea9c4" Title="Print tickets" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="UnstyledListWrapper iPartChain LastPart" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" SelectedNotificationSets="9ce6c8b7-114f-49d2-85d9-e60aa8d613e6" HideWhenEmpty="True" NoAlertMessage="" />
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