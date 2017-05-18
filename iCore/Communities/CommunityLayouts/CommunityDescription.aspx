<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Community Description" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_CommunityBreadCrumb" Src="~/AsiCommon/Controls/CommunityManagement/Common/CommunityBreadCrumb.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_CommunityDescription" Src="~/AsiCommon/Controls/CommunityManagement/Community/CommunityDescription.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_RecentActivity" Src="~/AsiCommon/Controls/CommunityManagement/Community/RecentActivity.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_CommunitySideBarHelperNeededforLeftNav" Src="~/AsiCommon/Controls/CommunityManagement/Community/CommunitySideBarHelper.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return true; } }

	override public Guid ContentRecordKey { get { return new Guid("ffd73063-5d78-4f4c-818e-5b44fde0e5ab"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("06076f6b-104b-4abe-b3d7-f29537d5b8be"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciCommunityBreadCrumb as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("1ffa6f4c-a351-4596-a57a-708449fd4f35");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCommunityBreadCrumb);

		childUserControl = ciCommunityDescription as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("1dd685d1-7e61-414d-b4cf-a40fc8fdffd8");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCommunityDescription);

		childUserControl = ciRecentActivity as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("13340637-932b-40f0-b0c7-3d3c2a666dc0");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRecentActivity);

		childUserControl = ciCommunitySideBarHelperNeededforLeftNav as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("8afdf449-3a09-4522-981e-e4cb20f1db73");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCommunitySideBarHelperNeededforLeftNav);

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
				<asp:Panel ID="ste_container_CommunityBreadCrumb" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_CommunityBreadCrumb ID="ciCommunityBreadCrumb" runat="server" ShowParentLink="False" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciCommunityBreadCrumb" runat="server" ContentKey="ffd73063-5d78-4f4c-818e-5b44fde0e5ab" ContentItemKey="1ffa6f4c-a351-4596-a57a-708449fd4f35" /></asp:Panel>
				<asp:Panel ID="ste_container_CommunityDescription" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_CommunityDescription ID="ciCommunityDescription" runat="server" ShowParentLink="False" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciCommunityDescription" runat="server" ContentKey="ffd73063-5d78-4f4c-818e-5b44fde0e5ab" ContentItemKey="1dd685d1-7e61-414d-b4cf-a40fc8fdffd8" /></asp:Panel>
				<asp:Panel ID="ste_container_RecentActivity" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_RecentActivity ID="ciRecentActivity" runat="server" MaximumResultsCount="10" ShowParentLink="False" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciRecentActivity" runat="server" ContentKey="ffd73063-5d78-4f4c-818e-5b44fde0e5ab" ContentItemKey="13340637-932b-40f0-b0c7-3d3c2a666dc0" /></asp:Panel>
				<asp:Panel ID="ste_container_CommunitySideBarHelperNeededforLeftNav" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_CommunitySideBarHelperNeededforLeftNav ID="ciCommunitySideBarHelperNeededforLeftNav" runat="server" ShowParentLink="False" UseParentAtomObject="False" UseKeyFromURL="False" DisplayLinkAsButton="True" CommunityDocumentKey="00000000-0000-0000-0000-000000000000" ShowBorder="False" CommitSequence="0" /><asiweb:SurfToEditButtonPanel ID="ste_ciCommunitySideBarHelperNeededforLeftNav" runat="server" ContentKey="ffd73063-5d78-4f4c-818e-5b44fde0e5ab" ContentItemKey="8afdf449-3a09-4522-981e-e4cb20f1db73" /></asp:Panel>
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