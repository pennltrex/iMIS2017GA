<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Discussion List" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_Breadcrumb" Src="~/AsiCommon/Controls/CommunityManagement/Common/CommunityBreadCrumb.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_ForumList" Src="~/AsiCommon/Controls/CommunityManagement/Forum/ForumList.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_Communities" Src="~/AsiCommon/Controls/CommunityManagement/Community/CommunitySideBarHelper.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return true; } }

	override public Guid ContentRecordKey { get { return new Guid("d8503f8d-d076-44e0-9d5c-b70e1814e18a"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("27ec080d-a370-4658-b07e-c06ea18a4db6"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciBreadcrumb as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("75498239-710d-45d0-968d-307eb6d1e334");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciBreadcrumb);

		childUserControl = ciForumList as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("4ed071c1-8480-4f76-b066-eb9e848a8539");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciForumList);

		childUserControl = ciCommunities as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("5774416d-9d97-44c7-9ba3-c967c4c028a0");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCommunities);

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
				<asp:Panel ID="ste_container_Breadcrumb" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_Breadcrumb ID="ciBreadcrumb" runat="server" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciBreadcrumb" runat="server" ContentKey="d8503f8d-d076-44e0-9d5c-b70e1814e18a" ContentItemKey="75498239-710d-45d0-968d-307eb6d1e334" /></asp:Panel>
				<asp:Panel ID="ste_container_ForumList" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_ForumList ID="ciForumList" runat="server" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciForumList" runat="server" ContentKey="d8503f8d-d076-44e0-9d5c-b70e1814e18a" ContentItemKey="4ed071c1-8480-4f76-b066-eb9e848a8539" /></asp:Panel>
				<asp:Panel ID="ste_container_Communities" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_Communities ID="ciCommunities" runat="server" UseParentAtomObject="False" UseKeyFromURL="False" DisplayLinkAsButton="True" CommunityDocumentKey="00000000-0000-0000-0000-000000000000" ShowParentLink="False" ShowBorder="False" CommitSequence="0" /><asiweb:SurfToEditButtonPanel ID="ste_ciCommunities" runat="server" ContentKey="d8503f8d-d076-44e0-9d5c-b70e1814e18a" ContentItemKey="5774416d-9d97-44c7-9ba3-c967c4c028a0" /></asp:Panel>
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