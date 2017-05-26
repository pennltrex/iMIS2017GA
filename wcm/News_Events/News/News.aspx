<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="News" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentTaggedList" Src="~/AsiCommon/Controls/ContentManagement/DisplayTaggedList.ascx" %>
<%@ Register TagPrefix="CM" TagName="AdvancedSearch" Src="~/AsiCommon/Controls/ContentManagement/SearchForm.ascx" %>
<%@ Register TagPrefix="CM" TagName="CommonSearch" Src="~/iParts/Common/Search/SearchDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">
	<meta name="Keywords" content="News" />

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("761d16b6-c60d-4a8e-a94c-d69af9aece39"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("7ae176ac-4a71-44ca-ab85-01928a0f6eab"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewContentTaggedList as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6d4d0ede-5083-48a7-b151-95ce7dc6d9cb");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentTaggedList);

		childUserControl = ciNewAdvancedSearch as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("8cb43d61-0e4f-4b45-a04a-f4069d847c2f");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewAdvancedSearch);

		childUserControl = ciNewSearchCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("49dab502-fdc7-45fb-97be-9b957e64cfdc");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewSearchCommon);

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
				<CM:ContentTaggedList ID="ciNewContentTaggedList" runat="server" ContentKey="761d16b6-c60d-4a8e-a94c-d69af9aece39" ContentItemKey="6d4d0ede-5083-48a7-b151-95ce7dc6d9cb" Title="New ContentTaggedList" ShowTitleFlag="False" ListFormatKey="98c95035-b151-4c2f-a8cc-5fdf7a6fa1b0" ShowTitleNoContentFlag="False" ListTitle="" FilterByPropertyName="" DateRangeType="REL" RelNumDaysBefore="0" RelNumDaysAfter="0" FixedStartDate="1/1/0001 12:00:00 AM" FixedEndDate="1/1/0001 12:00:00 AM" SortByPropertyName="PublicationDate" MaxNumResults="5" ViewAllMessage="View all" ViewAllCssClass="" IncludeSocialSharingIcons="False" TagMatchType="ANY" SortType="ASC" SelectedTags="ec401384-08e9-4c44-8f63-5041282c288e" />
				<CM:AdvancedSearch ID="ciNewAdvancedSearch" runat="server" ContentKey="761d16b6-c60d-4a8e-a94c-d69af9aece39" ContentItemKey="8cb43d61-0e4f-4b45-a04a-f4069d847c2f" Title="New AdvancedSearch" ShowTitleFlag="False" Introduction="" AllowKeywordSearch="True" AllowDateRangeSearch="False" AllowUdfSearch="" SearchOperator="And" />
				<CM:CommonSearch ID="ciNewSearchCommon" runat="server" ContentKey="761d16b6-c60d-4a8e-a94c-d69af9aece39" ContentItemKey="49dab502-fdc7-45fb-97be-9b957e64cfdc" Title="New SearchCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayTextBox="True" DisplayInactiveResultsCheckBox="False" InitialDisplay="False" InitialText="" InitialLogic="And" SearchLabel="Search" DisplayAreaOptions="False" Options="Content" InitialArea="All" ErrorMsg="There was a problem running your search. Please try again." ExceedResultsMsg="Your search criteria returned over {0} records. To see more results, please modify your query to add more criteria." MaxResults="1000" NoResultMsg="No search results match your specified criteria. Please try again with fewer or different criteria." PageSize="25" Sort="Rank" Tags="ec401384-08e9-4c44-8f63-5041282c288e" PagerMode="NextPrevAndNumeric" PagerDisplay="Both" AddContentItem="00000000-0000-0000-0000-000000000000" />
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