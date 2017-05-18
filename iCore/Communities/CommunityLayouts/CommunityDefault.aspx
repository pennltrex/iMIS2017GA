<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Community" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_BreadCrumb" Src="~/AsiCommon/Controls/CommunityManagement/Common/CommunityBreadCrumb.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_ResourceBlog" Src="~/AsiCommon/Controls/CommunityManagement/Blog/BlogList.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_Forums" Src="~/AsiCommon/Controls/CommunityManagement/Forum/ForumList.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_Wikis" Src="~/AsiCommon/Controls/CommunityManagement/Wiki/WikiList.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_CommunitySideBarHelperNeededforLeftNav" Src="~/AsiCommon/Controls/CommunityManagement/Community/CommunitySideBarHelper.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_Announcements" Src="~/AsiCommon/Controls/CommunityManagement/Forum/Announcement.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_ResourceLibrary" Src="~/AsiCommon/Controls/CommunityManagement/Community/ResourceLibrary.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_CommunityMembers" Src="~/AsiCommon/Controls/CommunityManagement/Community/CommunityRoster.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">
	<meta name="Description" content="Default community display template" />

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return true; } }

	override public Guid ContentRecordKey { get { return new Guid("2723f4b3-83a5-4374-902f-62d3a38800cc"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("d995a147-89e7-4331-bb80-d47a219f89a3"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciBreadCrumb as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("76a77a36-a399-4529-bdc7-aaa7c429b80f");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciBreadCrumb);

		AddChildUserControl(ContentPage2);

		childUserControl = ciResourceBlog as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("05cc8dce-8454-49e4-8319-7af41c2447aa");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciResourceBlog);

		childUserControl = ciForums as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("df5c409c-8028-460d-9f51-73206952863d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciForums);

		childUserControl = ciWikis as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("ee40d17a-831c-4e55-9067-2203686a9d25");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciWikis);

		childUserControl = ciCommunitySideBarHelperNeededforLeftNav as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6e6fa956-d43d-42aa-a6d8-d4460c84eb34");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCommunitySideBarHelperNeededforLeftNav);

		AddChildUserControl(ContentPage3);

		childUserControl = ciAnnouncements as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("cee3e508-5b2b-46bd-8958-05e70bf47097");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAnnouncements);

		childUserControl = ciResourceLibrary as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("77b68955-317f-4520-99b4-b615fd120021");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciResourceLibrary);

		childUserControl = ciCommunityMembers as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("3ff18fe0-420f-4938-ab5d-cdf16835d0c0");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCommunityMembers);

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
				<asp:Panel ID="ste_container_BreadCrumb" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_BreadCrumb ID="ciBreadCrumb" runat="server" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciBreadCrumb" runat="server" ContentKey="2723f4b3-83a5-4374-902f-62d3a38800cc" ContentItemKey="76a77a36-a399-4529-bdc7-aaa7c429b80f" /></asp:Panel>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<asp:Panel ID="ste_container_ResourceBlog" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_ResourceBlog ID="ciResourceBlog" runat="server" MaximumResultsCount="3" CommunityDocumentKey="00000000-0000-0000-0000-000000000000" ShowParentLink="False" ShowBorder="False" SurfToEditEnabled="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" UseParentAtomObject="False" UseKeyFromURL="False" CommitSequence="0" /><asiweb:SurfToEditButtonPanel ID="ste_ciResourceBlog" runat="server" ContentKey="2723f4b3-83a5-4374-902f-62d3a38800cc" ContentItemKey="05cc8dce-8454-49e4-8319-7af41c2447aa" /></asp:Panel>
				<asp:Panel ID="ste_container_Forums" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_Forums ID="ciForums" runat="server" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciForums" runat="server" ContentKey="2723f4b3-83a5-4374-902f-62d3a38800cc" ContentItemKey="df5c409c-8028-460d-9f51-73206952863d" /></asp:Panel>
				<asp:Panel ID="ste_container_Wikis" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_Wikis ID="ciWikis" runat="server" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciWikis" runat="server" ContentKey="2723f4b3-83a5-4374-902f-62d3a38800cc" ContentItemKey="ee40d17a-831c-4e55-9067-2203686a9d25" /></asp:Panel>
				<asp:Panel ID="ste_container_CommunitySideBarHelperNeededforLeftNav" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_CommunitySideBarHelperNeededforLeftNav ID="ciCommunitySideBarHelperNeededforLeftNav" runat="server" ShowParentLink="False" UseParentAtomObject="False" UseKeyFromURL="False" DisplayLinkAsButton="True" CommunityDocumentKey="00000000-0000-0000-0000-000000000000" ShowBorder="False" CommitSequence="0" /><asiweb:SurfToEditButtonPanel ID="ste_ciCommunitySideBarHelperNeededforLeftNav" runat="server" ContentKey="2723f4b3-83a5-4374-902f-62d3a38800cc" ContentItemKey="6e6fa956-d43d-42aa-a6d8-d4460c84eb34" /></asp:Panel>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<asp:Panel ID="ste_container_Announcements" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_Announcements ID="ciAnnouncements" runat="server" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciAnnouncements" runat="server" ContentKey="2723f4b3-83a5-4374-902f-62d3a38800cc" ContentItemKey="cee3e508-5b2b-46bd-8958-05e70bf47097" /></asp:Panel>
				<asp:Panel ID="ste_container_ResourceLibrary" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_ResourceLibrary ID="ciResourceLibrary" runat="server" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciResourceLibrary" runat="server" ContentKey="2723f4b3-83a5-4374-902f-62d3a38800cc" ContentItemKey="77b68955-317f-4520-99b4-b615fd120021" /></asp:Panel>
				<asp:Panel ID="ste_container_CommunityMembers" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_CommunityMembers ID="ciCommunityMembers" runat="server" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciCommunityMembers" runat="server" ContentKey="2723f4b3-83a5-4374-902f-62d3a38800cc" ContentItemKey="3ff18fe0-420f-4938-ab5d-cdf16835d0c0" /></asp:Panel>
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