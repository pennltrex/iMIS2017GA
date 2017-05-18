<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Community News Feed" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_BreadCrumb" Src="~/AsiCommon/Controls/CommunityManagement/Common/CommunityBreadCrumb.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_Announcements" Src="~/AsiCommon/Controls/CommunityManagement/Forum/Announcement.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_RecentActivity" Src="~/AsiCommon/Controls/CommunityManagement/Community/RecentActivity.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_CommunitySideBarHelperNeededforLeftNav" Src="~/AsiCommon/Controls/CommunityManagement/Community/CommunitySideBarHelper.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_FeaturedBlog" Src="~/AsiCommon/Controls/CommunityManagement/Blog/BlogList.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">
	<meta name="Description" content="Default community display template" />

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return true; } }

	override public Guid ContentRecordKey { get { return new Guid("98a98b8f-c33b-400a-8e81-b6708dbf8225"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("aa22e6d9-e51f-43ce-8b4b-31dc2928eedf"); } }

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

		childUserControl = ciAnnouncements as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("cee3e508-5b2b-46bd-8958-05e70bf47097");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAnnouncements);

		childUserControl = ciRecentActivity as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("be6f3df8-92be-4178-8fac-6fdec68e0dd9");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRecentActivity);

		childUserControl = ciCommunitySideBarHelperNeededforLeftNav as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6db1cbb1-5b5b-48eb-b22d-a0a9a7bcb8d0");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCommunitySideBarHelperNeededforLeftNav);

		AddChildUserControl(ContentPage3);

		childUserControl = ciFeaturedBlog as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("05cc8dce-8454-49e4-8319-7af41c2447aa");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciFeaturedBlog);

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
				<asp:Panel ID="ste_container_BreadCrumb" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_BreadCrumb ID="ciBreadCrumb" runat="server" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciBreadCrumb" runat="server" ContentKey="98a98b8f-c33b-400a-8e81-b6708dbf8225" ContentItemKey="76a77a36-a399-4529-bdc7-aaa7c429b80f" /></asp:Panel>
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
				<asp:Panel ID="ste_container_Announcements" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_Announcements ID="ciAnnouncements" runat="server" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciAnnouncements" runat="server" ContentKey="98a98b8f-c33b-400a-8e81-b6708dbf8225" ContentItemKey="cee3e508-5b2b-46bd-8958-05e70bf47097" /></asp:Panel>
				<asp:Panel ID="ste_container_RecentActivity" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_RecentActivity ID="ciRecentActivity" runat="server" MaximumResultsCount="3" CommunityDocumentKey="00000000-0000-0000-0000-000000000000" ShowParentLink="False" ShowBorder="False" UseParentAtomObject="False" UseKeyFromURL="False" CommitSequence="0" /><asiweb:SurfToEditButtonPanel ID="ste_ciRecentActivity" runat="server" ContentKey="98a98b8f-c33b-400a-8e81-b6708dbf8225" ContentItemKey="be6f3df8-92be-4178-8fac-6fdec68e0dd9" /></asp:Panel>
				<asp:Panel ID="ste_container_CommunitySideBarHelperNeededforLeftNav" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_CommunitySideBarHelperNeededforLeftNav ID="ciCommunitySideBarHelperNeededforLeftNav" runat="server" DisplayLinkAsButton="True" CommunityDocumentKey="00000000-0000-0000-0000-000000000000" ShowParentLink="False" ShowBorder="False" UseParentAtomObject="False" UseKeyFromURL="False" CommitSequence="0" /><asiweb:SurfToEditButtonPanel ID="ste_ciCommunitySideBarHelperNeededforLeftNav" runat="server" ContentKey="98a98b8f-c33b-400a-8e81-b6708dbf8225" ContentItemKey="6db1cbb1-5b5b-48eb-b22d-a0a9a7bcb8d0" /></asp:Panel>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<asp:Panel ID="ste_container_FeaturedBlog" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_FeaturedBlog ID="ciFeaturedBlog" runat="server" MaximumResultsCount="3" CommunityDocumentKey="00000000-0000-0000-0000-000000000000" ShowParentLink="False" ShowBorder="False" SurfToEditEnabled="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" UseParentAtomObject="False" UseKeyFromURL="False" CommitSequence="0" /><asiweb:SurfToEditButtonPanel ID="ste_ciFeaturedBlog" runat="server" ContentKey="98a98b8f-c33b-400a-8e81-b6708dbf8225" ContentItemKey="05cc8dce-8454-49e4-8319-7af41c2447aa" /></asp:Panel>
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