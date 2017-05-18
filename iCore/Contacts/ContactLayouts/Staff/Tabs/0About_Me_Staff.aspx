<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="About" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="EngagementScoreDisplay" Src="~/iParts/Communications/EngagementScoreDisplay/EngagementScoreDisplayDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryChartViewer" Src="~/iParts/Common/QueryChartViewer/QueryChartViewerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="PanelEditor" Src="~/iparts/Common/PanelEditor/PanelEditorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactAddressEditor" Src="~/iParts/Contact Management/ContactAddressEditor/ContactAddressEditorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="SocialProfileListCreator" Src="~/iParts/Contact Management/SocialProfileListCreator/SocialProfileListCreatorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="GroupListEditor" Src="~/iParts/Groups/GroupListEditor/GroupListEditorDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">
	<meta name="Description" content="gfjjf" />

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("34170dbb-b90d-47ef-ae06-32bd8e95ee41"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("1eed4b44-823e-4c27-ac26-6a54f2206978"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciEngagementscore as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("c749b180-cd4f-4c0a-a55f-08f255146f75");
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

		childUserControl = ciMembership as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("50c44a62-7437-4891-9d22-7cfdb1a98fb6");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMembership);

		childUserControl = ciContactAddress as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("5eaa38bb-f275-4f1d-98ed-94cc6ff1060a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciContactAddress);

		AddChildUserControl(ContentPage4);

		childUserControl = ciPersonalInformation as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("7e0f46aa-e201-4d75-bfed-9c8c677f276a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciPersonalInformation);

		AddChildUserControl(ContentPage5);

		childUserControl = ciSocialProfileListCreator as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("2d71f5fb-40d2-491f-a055-56e526dd61f6");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSocialProfileListCreator);

		childUserControl = ciRelationships as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("f98aed29-9a7c-430c-a5a7-8f65bd7e7bfc");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRelationships);

		AddChildUserControl(ContentPage6);

		childUserControl = ciFinancial as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("992d6205-010b-4b87-97a3-3ac1048d87fb");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciFinancial);

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
				<CM:EngagementScoreDisplay ID="ciEngagementscore" runat="server" ContentKey="34170dbb-b90d-47ef-ae06-32bd8e95ee41" ContentItemKey="c749b180-cd4f-4c0a-a55f-08f255146f75" Title="Engagement score" ShowTitleFlag="False" PartTitle="Engagement score" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EngagementScoreKey="d0292457-7eff-42e1-b655-be8715b78552" DonutChartSize="Large" ScoreDisplay="RelativePercentile" ChartType="Donut" Caption="" DisplayCategory="True" CategoryName="" DisplayForAuthorizedUsersOnly="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:QueryChartViewer ID="ciEngagementChart" runat="server" ContentKey="34170dbb-b90d-47ef-ae06-32bd8e95ee41" ContentItemKey="6291f6a7-d0af-4bb4-a8a7-cbb5c92f60f1" Title="EngagementChart" ShowTitleFlag="False" PageTitle="Engagement history" DoNotRenderInDesignMode="True" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Samples/Engagement scores/ScoresByContactByYearForChart" ChartTitle="" ChartType="barvertical" QuerySettings="" DataColumnName="Score" LabelColumnName="Component" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="Metro" ChartWidth="0" ChartHeight="300" ChartLabelRotationAngle="0" NoDataMessage="No data found" HideEmptyChart="False" DisplayChartLabels="True" ChartSeriesLegendPosition="bottom" EnableTooltips="True" SeriesColumnName="Year" SeriesColumnFormat="15	yyyy" EnableStackedSeries="True" DisplayForAuthorizedUsersOnly="False" />
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
				<CM:PanelEditor ID="ciMembership" runat="server" ContentKey="34170dbb-b90d-47ef-ae06-32bd8e95ee41" ContentItemKey="50c44a62-7437-4891-9d22-7cfdb1a98fb6" Title="Membership" ShowTitleFlag="False" PartTitle="Membership" DoNotRenderInDesignMode="False" CssClass="CalloutPart2" ShowBorder="False" Collapsible="True" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PanelDefinitionId="fbee0a7c-fd89-49e4-bcfc-7aeeca33653e" AllowEdit="True" DefaultEditMode="False" CommitSequence="0" AllowDelete="False" AllowAdd="True" EditWindowWidth="600" EditWindowHeight="400" DisplayForAuthorizedUsersOnly="True" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" HidePanelWhenEmpty="False" ScrollingCellsEnabled="False" />
				<CM:ContactAddressEditor ID="ciContactAddress" runat="server" ContentKey="34170dbb-b90d-47ef-ae06-32bd8e95ee41" ContentItemKey="5eaa38bb-f275-4f1d-98ed-94cc6ff1060a" Title="Contact Address" ShowTitleFlag="False" PartTitle="Addresses" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="True" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayFaxNumber="True" DisplayAddressNotes="True" DisableAddressChecking="False" AutomaticallyAcceptAddressChanges="False" ChangeAddresses="True" CreateAddresses="True" CreateAddressPurpose="False" DisplayForAuthorizedUsersOnly="True" DisplayAddressMapLink="True" />
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
				<CM:PanelEditor ID="ciPersonalInformation" runat="server" ContentKey="34170dbb-b90d-47ef-ae06-32bd8e95ee41" ContentItemKey="7e0f46aa-e201-4d75-bfed-9c8c677f276a" Title="PersonalInformation" ShowTitleFlag="False" PartTitle="Personal details" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="True" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PanelDefinitionId="e64dd2c5-71c9-485c-9671-8cc0852c9e9e" AllowEdit="True" DefaultEditMode="False" CommitSequence="0" AllowDelete="False" AllowAdd="True" EditWindowWidth="600" EditWindowHeight="400" DisplayForAuthorizedUsersOnly="True" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" HidePanelWhenEmpty="False" ScrollingCellsEnabled="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage5" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone5_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:SocialProfileListCreator ID="ciSocialProfileListCreator" runat="server" ContentKey="34170dbb-b90d-47ef-ae06-32bd8e95ee41" ContentItemKey="2d71f5fb-40d2-491f-a055-56e526dd61f6" Title="Social Profile List Creator" ShowTitleFlag="False" PartTitle="Social profiles" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" NoRecordsFound="There are no social profiles defined." />
				<CM:GroupListEditor ID="ciRelationships" runat="server" ContentKey="34170dbb-b90d-47ef-ae06-32bd8e95ee41" ContentItemKey="f98aed29-9a7c-430c-a5a7-8f65bd7e7bfc" Title="Relationships" ShowTitleFlag="False" PageTitle="Relationships" DoNotRenderInDesignMode="False" ShowBorder="False" CssClass="" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" AutoCreateGroupType="" SelectedGroupTypes="RELATIONSHIP" ParentType="false" GroupMode="MembershipsAndGroups" UrlParameter="" OwnerType="" AllowEdit="True" AutoCreate="False" ShowInactive="False" DisplayProfileImage="False" AddMemberText="Add relationship" DisplayForAuthorizedUsersOnly="True" LinkMode="MembershipDetails" ListEntriesExpandable="True" ShowMembershipExpirationDate="False" DisplayGroupTitle="True" />
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
				<CM:PanelEditor ID="ciFinancial" runat="server" ContentKey="34170dbb-b90d-47ef-ae06-32bd8e95ee41" ContentItemKey="992d6205-010b-4b87-97a3-3ac1048d87fb" Title="Financial" ShowTitleFlag="False" PartTitle="Financial" DoNotRenderInDesignMode="False" CssClass="CalloutPart2" ShowBorder="False" Collapsible="True" Collapsed="True" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PanelDefinitionId="28c05f2c-24cb-48f4-8cc7-05d7dafbc665" AllowEdit="True" DefaultEditMode="False" CommitSequence="0" AllowDelete="False" AllowAdd="True" EditWindowWidth="600" EditWindowHeight="400" DisplayForAuthorizedUsersOnly="True" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" HidePanelWhenEmpty="False" ScrollingCellsEnabled="False" />
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