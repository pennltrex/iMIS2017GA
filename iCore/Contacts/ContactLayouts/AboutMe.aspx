<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="About Me" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="EngagementScoreDisplay" Src="~/iParts/Communications/EngagementScoreDisplay/EngagementScoreDisplayDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryChartViewer" Src="~/iParts/Common/QueryChartViewer/QueryChartViewerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="PanelEditor" Src="~/iparts/Common/PanelEditor/PanelEditorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactAddressEditor" Src="~/iParts/Contact Management/ContactAddressEditor/ContactAddressEditorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="SocialProfileListCreator" Src="~/iParts/Contact Management/SocialProfileListCreator/SocialProfileListCreatorDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("eee11a3b-f250-4875-93c7-28ee5d69badc"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("72c73978-a0fb-4728-bfaa-9359b4c30bed"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciEngagementscore as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9d50fc39-9130-45dc-bbc8-bb87207c8b4d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciEngagementscore);

		AddChildUserControl(ContentPage2);

		childUserControl = ciEngagementChart as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6291f6a7-d0af-4bb4-a8a7-cbb5c92f60f1");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciEngagementChart);

		AddChildUserControl(ContentPage3);

		childUserControl = ciMyProfile as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a47bbcb9-7f17-4c7a-b102-f2060894c420");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMyProfile);

		childUserControl = ciContactAddress as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("5eaa38bb-f275-4f1d-98ed-94cc6ff1060a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciContactAddress);

		AddChildUserControl(ContentPage4);

		childUserControl = ciPersonalInformationPanel as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("7e0f46aa-e201-4d75-bfed-9c8c677f276a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciPersonalInformationPanel);

		AddChildUserControl(ContentPage5);

		childUserControl = ciSocialProfileListCreator as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("064b207f-4fed-4efd-82aa-a518f405ec8c");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSocialProfileListCreator);

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
				<CM:EngagementScoreDisplay ID="ciEngagementscore" runat="server" ContentKey="eee11a3b-f250-4875-93c7-28ee5d69badc" ContentItemKey="9d50fc39-9130-45dc-bbc8-bb87207c8b4d" Title="Engagement score" ShowTitleFlag="False" PartTitle="My engagement score" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EngagementScoreKey="d0292457-7eff-42e1-b655-be8715b78552" DonutChartSize="Large" ScoreDisplay="RelativePercentile" ChartType="Donut" Caption="" DisplayCategory="False" CategoryName="" DisplayForAuthorizedUsersOnly="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:QueryChartViewer ID="ciEngagementChart" runat="server" ContentKey="eee11a3b-f250-4875-93c7-28ee5d69badc" ContentItemKey="6291f6a7-d0af-4bb4-a8a7-cbb5c92f60f1" Title="EngagementChart" ShowTitleFlag="False" PageTitle="Engagement history" DoNotRenderInDesignMode="True" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Samples/Engagement scores/ScoresByContactByYearForChart" ChartTitle="" ChartType="barvertical" QuerySettings="" DataColumnName="Score" LabelColumnName="Component" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="Metro" ChartWidth="0" ChartHeight="300" ChartLabelRotationAngle="0" NoDataMessage="No data found" HideEmptyChart="False" DisplayChartLabels="True" ChartSeriesLegendPosition="bottom" EnableTooltips="True" SeriesColumnName="Year" SeriesColumnFormat="15	yyyy" EnableStackedSeries="True" DisplayForAuthorizedUsersOnly="False" />
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
				<CM:PanelEditor ID="ciMyProfile" runat="server" ContentKey="eee11a3b-f250-4875-93c7-28ee5d69badc" ContentItemKey="a47bbcb9-7f17-4c7a-b102-f2060894c420" Title="My Profile" ShowTitleFlag="False" PartTitle="My profile" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="True" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PanelDefinitionId="36e47f1c-bb0e-4536-999f-88021acc087c" AllowEdit="True" DefaultEditMode="False" CommitSequence="0" AllowDelete="False" AllowAdd="True" EditWindowWidth="600" EditWindowHeight="400" DisplayForAuthorizedUsersOnly="True" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" HidePanelWhenEmpty="False" ScrollingCellsEnabled="False" />
				<CM:ContactAddressEditor ID="ciContactAddress" runat="server" ContentKey="eee11a3b-f250-4875-93c7-28ee5d69badc" ContentItemKey="5eaa38bb-f275-4f1d-98ed-94cc6ff1060a" Title="Contact Address" ShowTitleFlag="False" PartTitle="My addresses" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="True" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayFaxNumber="True" DisplayAddressNotes="True" DisableAddressChecking="False" AutomaticallyAcceptAddressChanges="False" ChangeAddresses="True" CreateAddresses="True" CreateAddressPurpose="False" DisplayForAuthorizedUsersOnly="True" DisplayAddressMapLink="True" />
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
				<CM:PanelEditor ID="ciPersonalInformationPanel" runat="server" ContentKey="eee11a3b-f250-4875-93c7-28ee5d69badc" ContentItemKey="7e0f46aa-e201-4d75-bfed-9c8c677f276a" Title="PersonalInformationPanel" ShowTitleFlag="False" PartTitle="My details" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="True" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PanelDefinitionId="e64dd2c5-71c9-485c-9671-8cc0852c9e9e" AllowEdit="True" DefaultEditMode="False" CommitSequence="0" AllowDelete="False" AllowAdd="True" EditWindowWidth="600" EditWindowHeight="400" DisplayForAuthorizedUsersOnly="True" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" HidePanelWhenEmpty="False" ScrollingCellsEnabled="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage5" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone5_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:SocialProfileListCreator ID="ciSocialProfileListCreator" runat="server" ContentKey="eee11a3b-f250-4875-93c7-28ee5d69badc" ContentItemKey="064b207f-4fed-4efd-82aa-a518f405ec8c" Title="Social Profile List Creator" ShowTitleFlag="False" PartTitle="Social profiles" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" NoRecordsFound="There are no social profiles defined." />
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