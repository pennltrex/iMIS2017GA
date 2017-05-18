<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Discussion Home" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_Breadcrumb" Src="~/AsiCommon/Controls/CommunityManagement/Common/CommunityBreadCrumb.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_Topics" Src="~/AsiCommon/Controls/CommunityManagement/Forum/TopicList.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_Communities" Src="~/AsiCommon/Controls/CommunityManagement/Community/CommunitySideBarHelper.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_RecentActivity" Src="~/AsiCommon/Controls/CommunityManagement/Common/RecentActivity.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_SubscriberList" Src="~/AsiCommon/Controls/CommunityManagement/Common/SubscriberList.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return true; } }

	override public Guid ContentRecordKey { get { return new Guid("ed1c0843-b946-4dcb-8cbb-2be5027c8fe2"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("a847779d-d261-4baa-924c-08c051a08345"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciBreadcrumb as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("0576dbb7-0868-4a9e-971e-29e43f0879be");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciBreadcrumb);

		AddChildUserControl(ContentPage2);

		childUserControl = ciTopics as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("b84fa5f0-7bff-4d92-bb83-1d896ccf2d7b");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciTopics);

		childUserControl = ciCommunities as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("76bceba1-9ba9-4b67-95c9-07600fd85484");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCommunities);

		AddChildUserControl(ContentPage3);

		childUserControl = ciRecentActivity as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("869515cb-6893-4a90-a25a-9c620dfa4f05");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRecentActivity);

		childUserControl = ciSubscriberList as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("2605ff11-1238-47c0-9ab1-e6e79753ddcc");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSubscriberList);

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
				<asp:Panel ID="ste_container_Breadcrumb" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_Breadcrumb ID="ciBreadcrumb" runat="server" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciBreadcrumb" runat="server" ContentKey="ed1c0843-b946-4dcb-8cbb-2be5027c8fe2" ContentItemKey="0576dbb7-0868-4a9e-971e-29e43f0879be" /></asp:Panel>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
		</div>
	</div>
	<div class="row">
		<div class="col-sm-8">
						<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<asp:Panel ID="ste_container_Topics" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_Topics ID="ciTopics" runat="server" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciTopics" runat="server" ContentKey="ed1c0843-b946-4dcb-8cbb-2be5027c8fe2" ContentItemKey="b84fa5f0-7bff-4d92-bb83-1d896ccf2d7b" /></asp:Panel>
				<asp:Panel ID="ste_container_Communities" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_Communities ID="ciCommunities" runat="server" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciCommunities" runat="server" ContentKey="ed1c0843-b946-4dcb-8cbb-2be5027c8fe2" ContentItemKey="76bceba1-9ba9-4b67-95c9-07600fd85484" /></asp:Panel>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
		</div>
		<div class="col-sm-4">
						<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<asp:Panel ID="ste_container_RecentActivity" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_RecentActivity ID="ciRecentActivity" runat="server" PanelTitle="Recent posts" MaximumResultsCount="10" CommunityDocumentKey="00000000-0000-0000-0000-000000000000" ShowParentLink="False" ShowBorder="False" UseParentAtomObject="False" UseKeyFromURL="False" CommitSequence="0" /><asiweb:SurfToEditButtonPanel ID="ste_ciRecentActivity" runat="server" ContentKey="ed1c0843-b946-4dcb-8cbb-2be5027c8fe2" ContentItemKey="869515cb-6893-4a90-a25a-9c620dfa4f05" /></asp:Panel>
				<asp:Panel ID="ste_container_SubscriberList" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_SubscriberList ID="ciSubscriberList" runat="server" CommunityDocumentKey="00000000-0000-0000-0000-000000000000" ShowParentLink="False" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciSubscriberList" runat="server" ContentKey="ed1c0843-b946-4dcb-8cbb-2be5027c8fe2" ContentItemKey="2605ff11-1238-47c0-9ab1-e6e79753ddcc" /></asp:Panel>
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