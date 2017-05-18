<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="About" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="EngagementScoreDisplay" Src="~/iParts/Communications/EngagementScoreDisplay/EngagementScoreDisplayDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="PanelEditor" Src="~/iparts/Common/PanelEditor/PanelEditorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryChartViewer" Src="~/iParts/Common/QueryChartViewer/QueryChartViewerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="SocialProfileListCreator" Src="~/iParts/Contact Management/SocialProfileListCreator/SocialProfileListCreatorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactAddressEditor" Src="~/iParts/Contact Management/ContactAddressEditor/ContactAddressEditorDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("adea6100-2fef-49d9-8bb8-dd984de380f1"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("39433ef8-a5a0-40ee-938c-04401c35d357"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciEngagementscore as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("43607902-7117-4434-9e82-5d52b1ea2946");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciEngagementscore);

		childUserControl = ciOrganizationProfile as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("997fce17-4060-4e75-8bc7-6d91a0482efc");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciOrganizationProfile);

		AddChildUserControl(ContentPage2);

		childUserControl = ciEngagementChart as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6291f6a7-d0af-4bb4-a8a7-cbb5c92f60f1");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciEngagementChart);

		childUserControl = ciPanelEditorCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6343fb3f-1cb1-40cb-b7ed-f99cd5620f5d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciPanelEditorCommon);

		childUserControl = ciSocialProfileListCreator as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("85f6565f-aab3-41d3-8c97-1b77eb078e7d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSocialProfileListCreator);

		AddChildUserControl(ContentPage3);

		childUserControl = ciContactAddressEditor as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("7ed939f6-7323-4cd6-b9bf-1b6e3225e0f8");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciContactAddressEditor);

		AddChildUserControl(ContentPage4);

		AddChildUserControl(ContentPage5);

		AddChildUserControl(ContentPage6);

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
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage1" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone1_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:EngagementScoreDisplay ID="ciEngagementscore" runat="server" ContentKey="adea6100-2fef-49d9-8bb8-dd984de380f1" ContentItemKey="43607902-7117-4434-9e82-5d52b1ea2946" Title="Engagement score" ShowTitleFlag="False" PartTitle="Engagement score" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EngagementScoreKey="73c94168-8893-4d25-bfca-78ef4dbdee60" DonutChartSize="Large" ScoreDisplay="RelativePercentile" ChartType="Donut" Caption="" DisplayCategory="True" CategoryName="" DisplayForAuthorizedUsersOnly="False" />
				<CM:PanelEditor ID="ciOrganizationProfile" runat="server" ContentKey="adea6100-2fef-49d9-8bb8-dd984de380f1" ContentItemKey="997fce17-4060-4e75-8bc7-6d91a0482efc" Title="Organization Profile" ShowTitleFlag="False" PartTitle="Profile" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PanelDefinitionId="a27ea058-2c88-4227-99c4-9723b93b2d86" AllowEdit="True" DefaultEditMode="False" CommitSequence="0" AllowDelete="False" AllowAdd="True" EditWindowWidth="600" EditWindowHeight="400" DisplayForAuthorizedUsersOnly="True" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" HidePanelWhenEmpty="False" ScrollingCellsEnabled="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:QueryChartViewer ID="ciEngagementChart" runat="server" ContentKey="adea6100-2fef-49d9-8bb8-dd984de380f1" ContentItemKey="6291f6a7-d0af-4bb4-a8a7-cbb5c92f60f1" Title="EngagementChart" ShowTitleFlag="False" PageTitle="Engagement history" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Samples/Engagement scores/OrgScoresByContactByYearForChart" ChartTitle="" ChartType="barvertical" QuerySettings="" DataColumnName="Score" LabelColumnName="Component" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="Metro" ChartWidth="0" ChartHeight="300" ChartLabelRotationAngle="0" NoDataMessage="No data found" HideEmptyChart="False" DisplayChartLabels="True" ChartSeriesLegendPosition="bottom" EnableTooltips="True" SeriesColumnName="Year" SeriesColumnFormat="15	yyyy" EnableStackedSeries="True" DisplayForAuthorizedUsersOnly="False" />
				<CM:PanelEditor ID="ciPanelEditorCommon" runat="server" ContentKey="adea6100-2fef-49d9-8bb8-dd984de380f1" ContentItemKey="6343fb3f-1cb1-40cb-b7ed-f99cd5620f5d" Title="PanelEditorCommon" ShowTitleFlag="False" PartTitle="Demographics" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PanelDefinitionId="1591133f-3b63-4747-b3a7-84ff6aa6265c" AllowEdit="True" DefaultEditMode="False" CommitSequence="0" AllowDelete="False" AllowAdd="True" EditWindowWidth="600" EditWindowHeight="400" DisplayForAuthorizedUsersOnly="True" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" HidePanelWhenEmpty="False" ScrollingCellsEnabled="False" />
				<CM:SocialProfileListCreator ID="ciSocialProfileListCreator" runat="server" ContentKey="adea6100-2fef-49d9-8bb8-dd984de380f1" ContentItemKey="85f6565f-aab3-41d3-8c97-1b77eb078e7d" Title="Social Profile List Creator" ShowTitleFlag="False" PartTitle="Social profiles" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" NoRecordsFound="There are no social profiles defined." />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContactAddressEditor ID="ciContactAddressEditor" runat="server" ContentKey="adea6100-2fef-49d9-8bb8-dd984de380f1" ContentItemKey="7ed939f6-7323-4cd6-b9bf-1b6e3225e0f8" Title="Contact Address Editor" ShowTitleFlag="False" PartTitle="Addresses" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayFaxNumber="True" DisplayAddressNotes="True" DisableAddressChecking="False" AutomaticallyAcceptAddressChanges="False" ChangeAddresses="True" CreateAddresses="True" CreateAddressPurpose="False" DisplayForAuthorizedUsersOnly="True" DisplayAddressMapLink="True" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
<div class="row">
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage5" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone5_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
			<CM:ContentPage ID="ContentPage6" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone6_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
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