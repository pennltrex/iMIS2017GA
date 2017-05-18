<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Scorecard" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ReportDisplay" Src="~/iParts/Common/ReportDisplay/ReportDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="BigButtonPanel" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/DisplayBigButtonPanel.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("0d3900b5-5fba-4ef4-a321-0b379a06e7ff"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("61e94852-c7f3-4437-a1c3-5d66e4f655c9"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciScorecard as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("140e25b3-a2ab-4fc6-98ff-17452d7e1b21");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciScorecard);

		childUserControl = ciNewContentBigButtonPanel as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("1acad0de-a78d-4918-b70a-dfb9f3e99e3e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentBigButtonPanel);

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
				<asp:WebPartZone ID="WebPartZone1_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ReportDisplay ID="ciScorecard" runat="server" ContentKey="0d3900b5-5fba-4ef4-a321-0b379a06e7ff" ContentItemKey="140e25b3-a2ab-4fc6-98ff-17452d7e1b21" Title="Scorecard" ShowTitleFlag="False" PageTitle="" DoNotRenderInDesignMode="False" ShowBorder="False" ShowPDFButton="False" HasParametersInUrl="False" DisplayForAuthorizedUsersOnly="False" HideParametersIfInUrl="False" ShowExcelButton="False" ReportTemplatePath="$/Samples/Guided Performance Scorecard/GPS.rdl" HideParameterPanel="False" HasParametersInSession="False" HideToolbar="True" HidePageNavigationControls="False" HideAllButPrint="False" />
				<CM:BigButtonPanel ID="ciNewContentBigButtonPanel" runat="server" ContentKey="0d3900b5-5fba-4ef4-a321-0b379a06e7ff" ContentItemKey="1acad0de-a78d-4918-b70a-dfb9f3e99e3e" Title="New ContentBigButtonPanel" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="HorizontalButtons BigButtonWrapper btn-Dislpay" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="Actions" UsePopup="True" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="&quot;@/iCore/Staff_Dashboards/Guided_Performance_Scorecard/GpsMeasureInputs[Mode=Goal]|Update Goals&quot;,&quot;@/iCore/Staff_Dashboards/Guided_Performance_Scorecard/GpsMeasureInputs[Mode=Industry]|Update Industry Values&quot;,&quot;@/iCore/Staff_Dashboards/Guided_Performance_Scorecard/GpsRefreshData|Refresh Data&quot;" />
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