<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Commerce Dashboard" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ProgressTracker" Src="~/iparts/Common/ProgressTracker/ProgressTrackerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryChartViewer" Src="~/iParts/Common/QueryChartViewer/QueryChartViewerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentCollectionOrganizer" Src="~/iParts/common/ContentCollectionOrganizer/ContentCollectionOrganizerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="BigButtonPanel" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/DisplayBigButtonPanel.ascx" %>
<%@ Register TagPrefix="CM" TagName="AlertDisplay" Src="~/iParts/Communications/Notification/NotificationDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("e7a6499d-6c15-4fb3-ae5e-997ff0cf7ed1"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("486d237a-96e4-4cd8-b60e-bdfacc0f4712"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciRevenue as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("336b4ce9-08d9-43c8-93cf-a55f81b22ce8");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRevenue);

		AddChildUserControl(ContentPage2);

		childUserControl = ciOrders as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("19360385-0aef-4227-8a29-c698b6c4fda5");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciOrders);

		AddChildUserControl(ContentPage3);

		childUserControl = ciProductssold as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("444bdaa3-7b4e-4eb5-b5ed-11cb4a40cc0f");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciProductssold);

		AddChildUserControl(ContentPage4);

		childUserControl = ciUniquecustomers as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("2793ce7d-5a75-4b65-82b1-905e27cf2386");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciUniquecustomers);

		AddChildUserControl(ContentPage5);

		childUserControl = ciProductspurchasedbymembertype as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("1aa9dd75-a81d-43ff-a294-43898d54df53");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciProductspurchasedbymembertype);

		AddChildUserControl(ContentPage6);

		childUserControl = ciProductsalesbycategory as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("095a31c5-bcee-41ee-8edf-824b51df2ba0");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciProductsalesbycategory);

		AddChildUserControl(ContentPage7);

		childUserControl = ciNewContentCollectionOrganizerCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("35e3330d-c435-4ad5-a1ec-b146eb4d2691");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentCollectionOrganizerCommon);

		childUserControl = ciDashboardInfo_738a20ac4f7f47f1bf6d5825f8df996e as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("738a20ac-4f7f-47f1-bf6d-5825f8df996e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDashboardInfo_738a20ac4f7f47f1bf6d5825f8df996e);

		AddChildUserControl(ContentPage8);

		childUserControl = ciCommercereports as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("4182014e-3a08-4b07-aa61-41e71d6f85a8");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCommercereports);

		childUserControl = ciAlertDisplay as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("ef9b9fa2-031c-4bf9-980f-297aa88d2fc2");
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
				<CM:ProgressTracker ID="ciRevenue" runat="server" ContentKey="e7a6499d-6c15-4fb3-ae5e-997ff0cf7ed1" ContentItemKey="336b4ce9-08d9-43c8-93cf-a55f81b22ce8" Title="Revenue" ShowTitleFlag="False" PartTitle="Product revenue" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor2" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="Last year&#39;s total: [GoalTotal]" QueryStringParameterName="" ListSourceQuery="$/Samples/Dashboards/Commerce/Product Sales/Progress Tracker - Sales Revenue This Year" DataColumnName="(None)" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="Bottom" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
</div>
    <div class="col-sm-6 col-md-3">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciOrders" runat="server" ContentKey="e7a6499d-6c15-4fb3-ae5e-997ff0cf7ed1" ContentItemKey="19360385-0aef-4227-8a29-c698b6c4fda5" Title="Orders" ShowTitleFlag="False" PartTitle="Product orders" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor3" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="Last year&#39;s count: [GoalTotal]" QueryStringParameterName="" ListSourceQuery="$/Samples/Dashboards/Commerce/Product Sales/Progress Tracker - Orders This Year" DataColumnName="(None)" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="Bottom" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
</div>
<div class="ClearFix visible-sm"></div>
    <div class="col-sm-6 col-md-3">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciProductssold" runat="server" ContentKey="e7a6499d-6c15-4fb3-ae5e-997ff0cf7ed1" ContentItemKey="444bdaa3-7b4e-4eb5-b5ed-11cb4a40cc0f" Title="Products sold" ShowTitleFlag="False" PartTitle="Products sold" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor4" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="Last year&#39;s count: [GoalTotal]" QueryStringParameterName="" ListSourceQuery="$/Samples/Dashboards/Commerce/Product Sales/Progress Tracker - Item Sales This Year" DataColumnName="(None)" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="Bottom" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
</div>
    <div class="col-sm-6 col-md-3">
			<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciUniquecustomers" runat="server" ContentKey="e7a6499d-6c15-4fb3-ae5e-997ff0cf7ed1" ContentItemKey="2793ce7d-5a75-4b65-82b1-905e27cf2386" Title="Unique customers" ShowTitleFlag="False" PartTitle="Unique customers" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor5" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="Last year&#39;s count: [GoalTotal]" QueryStringParameterName="" ListSourceQuery="$/Samples/Dashboards/Commerce/Product Sales/Progress Tracker - Unique customers this year" DataColumnName="(None)" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="Bottom" SuccessfulMessage="" />
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
				<CM:QueryChartViewer ID="ciProductspurchasedbymembertype" runat="server" ContentKey="e7a6499d-6c15-4fb3-ae5e-997ff0cf7ed1" ContentItemKey="1aa9dd75-a81d-43ff-a294-43898d54df53" Title="Products purchased by member type" ShowTitleFlag="False" PageTitle="Product sales by member type " DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Samples/Dashboards/Commerce/Product Sales/Orders by Member Type This Year" ChartTitle="" ChartType="pie" QuerySettings="" DataColumnName="Products ordered" LabelColumnName="Member type" DataColumnFormat="0	" LabelColumnFormat="0	" SkinName="Metro" ChartWidth="0" ChartHeight="0" ChartLabelRotationAngle="0" NoDataMessage="No data found" HideEmptyChart="False" DisplayChartLabels="False" ChartSeriesLegendPosition="bottom" EnableTooltips="True" SeriesColumnName="" SeriesColumnFormat="0	" EnableStackedSeries="False" DisplayForAuthorizedUsersOnly="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
</div>
<div class="col-sm-6">
			<CM:ContentPage ID="ContentPage6" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone6_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone StaffDashboard">
					<ZoneTemplate>
				<CM:QueryChartViewer ID="ciProductsalesbycategory" runat="server" ContentKey="e7a6499d-6c15-4fb3-ae5e-997ff0cf7ed1" ContentItemKey="095a31c5-bcee-41ee-8edf-824b51df2ba0" Title="Product sales by category" ShowTitleFlag="False" PageTitle="Product sales by category" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Samples/Dashboards/Commerce/Product Sales/Orders By Product Category This Year" ChartTitle="" ChartType="barvertical" QuerySettings="" DataColumnName="Times ordered" LabelColumnName="Category" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="Metro" ChartWidth="0" ChartHeight="400" ChartLabelRotationAngle="90" NoDataMessage="No data found" HideEmptyChart="False" DisplayChartLabels="True" ChartSeriesLegendPosition="hidden" EnableTooltips="True" SeriesColumnName="" SeriesColumnFormat="0	" EnableStackedSeries="True" DisplayForAuthorizedUsersOnly="False" />
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
				<CM:ContentCollectionOrganizer ID="ciNewContentCollectionOrganizerCommon" runat="server" ContentKey="e7a6499d-6c15-4fb3-ae5e-997ff0cf7ed1" ContentItemKey="35e3330d-c435-4ad5-a1ec-b146eb4d2691" Title="New ContentCollectionOrganizerCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" WizardMode="False" UseContentFolder="False" ContentFolder="" ContentFolderKey="00000000-0000-0000-0000-000000000000" SequentialSteps="False" DisplayStyle="HTop" URLKeyName="New_ContentCollectionOrganizerCommon" TabbedDialogSettings="0
4b810a85-0be7-4cc1-93dd-782dc8e81eb4
Top products
0
0
2
0
5580b7cd-0839-409d-b25c-f447be0dc84e
Top customers
0
0
1
0
995b4346-6921-4d9c-a55c-15f375704c15
Top promos
0
0
5
0
322cc6a5-bbb1-4090-8f48-0228f9814ada
Invoices due
0
0
3
0
4df6059f-0ebb-4ed1-b763-3713a60c7a6b
Open orders
0
0
1
" UrlRedirect="" RedirectLocation="DoNotRedirect" RedirectOnFinish="False" IncludeIdAsQuerystringParameter="False" />
				<CM:ContentHtml ID="ciDashboardInfo_738a20ac4f7f47f1bf6d5825f8df996e" runat="server" ContentKey="e7a6499d-6c15-4fb3-ae5e-997ff0cf7ed1" ContentItemKey="738a20ac-4f7f-47f1-bf6d-5825f8df996e" Title="Dashboard Info" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_DashboardInfo" runat="server"><p class="Info">Dashboard reflects all year-to-date data unless otherwise indicated.</p></asp:Panel></CM:ContentHtml>
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
				<CM:BigButtonPanel ID="ciCommercereports" runat="server" ContentKey="e7a6499d-6c15-4fb3-ae5e-997ff0cf7ed1" ContentItemKey="4182014e-3a08-4b07-aa61-41e71d6f85a8" Title="Commerce reports" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="BigButtonWrapper PanelNoPadding btn-Display" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="" NavigationIdentifier="~/Continuum/Commerce_reports" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="Navigation" UsePopup="False" AltText="" IncludeParentLevelItem="True" DisplayForAuthorizedUsersOnly="False" Links="" />
				<CM:AlertDisplay ID="ciAlertDisplay" runat="server" ContentKey="e7a6499d-6c15-4fb3-ae5e-997ff0cf7ed1" ContentItemKey="ef9b9fa2-031c-4bf9-980f-297aa88d2fc2" Title="Alert Display" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="Alerts PanelNoPadding" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" SelectedNotificationSets="497e2174-fb50-430c-a8eb-d1a62a9d53be" HideWhenEmpty="True" NoAlertMessage="" />
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