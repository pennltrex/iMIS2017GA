<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Participant List" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_CommunityBreadCrumb" Src="~/AsiCommon/Controls/CommunityManagement/Common/CommunityBreadCrumb.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_CommunityMembers" Src="~/AsiCommon/Controls/CommunityManagement/Community/CommunityRoster.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_CommunityNavigation" Src="~/AsiCommon/Controls/CommunityManagement/Community/CommunitySideBarHelper.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return true; } }

	override public Guid ContentRecordKey { get { return new Guid("84089ea5-2e78-4683-83ac-98aa7aacb241"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("1741fda9-8d16-4d92-a7d5-a18e524999d0"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciCommunityBreadCrumb as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("adb1dd6c-4e54-46b4-9d30-f3345dfe5172");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCommunityBreadCrumb);

		childUserControl = ciCommunityMembers as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("5ec4d593-f097-43c7-813b-492e184eb658");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCommunityMembers);

		childUserControl = ciCommunityNavigation as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("16d4c2e4-f9bf-4929-927f-139be51168f1");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCommunityNavigation);

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
				<asp:Panel ID="ste_container_CommunityBreadCrumb" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_CommunityBreadCrumb ID="ciCommunityBreadCrumb" runat="server" ShowParentLink="False" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciCommunityBreadCrumb" runat="server" ContentKey="84089ea5-2e78-4683-83ac-98aa7aacb241" ContentItemKey="adb1dd6c-4e54-46b4-9d30-f3345dfe5172" /></asp:Panel>
				<asp:Panel ID="ste_container_CommunityMembers" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_CommunityMembers ID="ciCommunityMembers" runat="server" UseParentAtomObject="False" UseKeyFromURL="False" MaximumResultsCount="20" ShowParentLink="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciCommunityMembers" runat="server" ContentKey="84089ea5-2e78-4683-83ac-98aa7aacb241" ContentItemKey="5ec4d593-f097-43c7-813b-492e184eb658" /></asp:Panel>
				<asp:Panel ID="ste_container_CommunityNavigation" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_CommunityNavigation ID="ciCommunityNavigation" runat="server" UseParentAtomObject="False" UseKeyFromURL="False" DisplayLinkAsButton="True" CommunityDocumentKey="00000000-0000-0000-0000-000000000000" ShowParentLink="False" ShowBorder="False" CommitSequence="0" /><asiweb:SurfToEditButtonPanel ID="ste_ciCommunityNavigation" runat="server" ContentKey="84089ea5-2e78-4683-83ac-98aa7aacb241" ContentItemKey="16d4c2e4-f9bf-4929-927f-139be51168f1" /></asp:Panel>
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