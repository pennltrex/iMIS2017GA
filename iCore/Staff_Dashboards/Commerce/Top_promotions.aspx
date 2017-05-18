<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Top promotions" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryMenu" Src="~/iparts/Common/QueryMenu/QueryMenuDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("995b4346-6921-4d9c-a55c-15f375704c15"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("de5ce75d-7fcd-4f2f-980a-1456c09212fc"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciToppromotions as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("111f8a1d-06fe-49d1-9c11-c05fd632e349");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciToppromotions);

		childUserControl = ciReport_90a1bcaebeba45f0946886dceb2f5fb7 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("90a1bcae-beba-45f0-9468-86dceb2f5fb7");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciReport_90a1bcaebeba45f0946886dceb2f5fb7);

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
				<CM:QueryMenu ID="ciToppromotions" runat="server" ContentKey="995b4346-6921-4d9c-a55c-15f375704c15" ContentItemKey="111f8a1d-06fe-49d1-9c11-c05fd632e349" Title="Top promotions" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="True" MapResults="False" ListPageSize="20" PagerMode="NextPrevAndNumeric" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="False" SourceFolderPathControl="$/Samples/Dashboards/Commerce/Product Sales/Top promotion codes" SourceKey="0e74d77f-7c49-4da3-a91c-5b211a46aa55" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:ContentHtml ID="ciReport_90a1bcaebeba45f0946886dceb2f5fb7" runat="server" ContentKey="995b4346-6921-4d9c-a55c-15f375704c15" ContentItemKey="90a1bcae-beba-45f0-9468-86dceb2f5fb7" Title="Report" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Report" runat="server"><script type="text/javascript">
   var TodayDate = new Date();   
   var TodayStr = TodayDate.toLocaleDateString();
   var Jan1Date = new Date(TodayDate.getFullYear(), 0, 1);
  var Jan1Str = Jan1Date.toLocaleDateString();
</script>
<a class="btn" href="JavaScript:NewWindow('<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>iCore/Staff_Dashboards/Commerce/Promotion_report.aspx?Begin Date='+Jan1Str, 'Promotion Analysis Report', 'current', 'nonmodal', false);">Promotion Analysis Report</a></asp:Panel></CM:ContentHtml>
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