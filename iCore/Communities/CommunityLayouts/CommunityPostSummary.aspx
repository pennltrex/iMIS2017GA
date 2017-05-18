<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Community Post Summary" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_CommunityBreadCrumb" Src="~/AsiCommon/Controls/CommunityManagement/Common/CommunityBreadCrumb.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_RecentActivity" Src="~/AsiCommon/Controls/CommunityManagement/Community/RecentActivity.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_CommunitySideBarHelperNeededforLeftNav" Src="~/AsiCommon/Controls/CommunityManagement/Community/CommunitySideBarHelper.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_Announcements" Src="~/AsiCommon/Controls/CommunityManagement/Forum/Announcement.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_ResourceLibrary" Src="~/AsiCommon/Controls/CommunityManagement/Community/ResourceLibrary.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_CommunityRoster" Src="~/AsiCommon/Controls/CommunityManagement/Community/CommunityRoster.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return true; } }

	override public Guid ContentRecordKey { get { return new Guid("f61c4ca6-7c5c-4e5a-b555-8c4bd9bcc032"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("53942216-1b20-4f2e-8274-f0768a30a7e5"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciCommunityBreadCrumb as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("ed1349bf-92b2-4d4b-87bf-783f68ab379a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCommunityBreadCrumb);

		childUserControl = ciRecentActivity as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("ae9f2b57-784c-4d4f-9108-28a49acc635e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRecentActivity);

		childUserControl = ciCommunitySideBarHelperNeededforLeftNav as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("25c23c52-71bc-4203-89b6-43b121d51136");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCommunitySideBarHelperNeededforLeftNav);

		AddChildUserControl(ContentPage2);

		childUserControl = ciAnnouncements as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("70acad31-a1e6-4a1c-bfa4-14227be7e884");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAnnouncements);

		childUserControl = ciResourceLibrary as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("af11e8b1-4147-4253-9c52-73807fa463dd");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciResourceLibrary);

		childUserControl = ciCommunityRoster as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("59df2c49-e571-4279-96b2-077fb4b3b5ca");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCommunityRoster);

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
				<asp:Panel ID="ste_container_CommunityBreadCrumb" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_CommunityBreadCrumb ID="ciCommunityBreadCrumb" runat="server" ShowParentLink="False" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciCommunityBreadCrumb" runat="server" ContentKey="f61c4ca6-7c5c-4e5a-b555-8c4bd9bcc032" ContentItemKey="ed1349bf-92b2-4d4b-87bf-783f68ab379a" /></asp:Panel>
				<asp:Panel ID="ste_container_RecentActivity" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_RecentActivity ID="ciRecentActivity" runat="server" MaximumResultsCount="10" ShowParentLink="False" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciRecentActivity" runat="server" ContentKey="f61c4ca6-7c5c-4e5a-b555-8c4bd9bcc032" ContentItemKey="ae9f2b57-784c-4d4f-9108-28a49acc635e" /></asp:Panel>
				<asp:Panel ID="ste_container_CommunitySideBarHelperNeededforLeftNav" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_CommunitySideBarHelperNeededforLeftNav ID="ciCommunitySideBarHelperNeededforLeftNav" runat="server" ShowParentLink="False" UseParentAtomObject="False" UseKeyFromURL="False" DisplayLinkAsButton="True" CommunityDocumentKey="00000000-0000-0000-0000-000000000000" ShowBorder="False" CommitSequence="0" /><asiweb:SurfToEditButtonPanel ID="ste_ciCommunitySideBarHelperNeededforLeftNav" runat="server" ContentKey="f61c4ca6-7c5c-4e5a-b555-8c4bd9bcc032" ContentItemKey="25c23c52-71bc-4203-89b6-43b121d51136" /></asp:Panel>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<asp:Panel ID="ste_container_Announcements" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_Announcements ID="ciAnnouncements" runat="server" UseParentAtomObject="False" UseKeyFromURL="False" ShowParentLink="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciAnnouncements" runat="server" ContentKey="f61c4ca6-7c5c-4e5a-b555-8c4bd9bcc032" ContentItemKey="70acad31-a1e6-4a1c-bfa4-14227be7e884" /></asp:Panel>
				<asp:Panel ID="ste_container_ResourceLibrary" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_ResourceLibrary ID="ciResourceLibrary" runat="server" CommunityDocumentKey="00000000-0000-0000-0000-000000000000" ShowParentLink="False" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciResourceLibrary" runat="server" ContentKey="f61c4ca6-7c5c-4e5a-b555-8c4bd9bcc032" ContentItemKey="af11e8b1-4147-4253-9c52-73807fa463dd" /></asp:Panel>
				<asp:Panel ID="ste_container_CommunityRoster" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_CommunityRoster ID="ciCommunityRoster" runat="server" UseParentAtomObject="False" UseKeyFromURL="False" MaximumResultsCount="20" ShowParentLink="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciCommunityRoster" runat="server" ContentKey="f61c4ca6-7c5c-4e5a-b555-8c4bd9bcc032" ContentItemKey="59df2c49-e571-4279-96b2-077fb4b3b5ca" /></asp:Panel>
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