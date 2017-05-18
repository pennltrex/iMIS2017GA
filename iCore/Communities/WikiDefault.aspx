<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Wiki Home" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_Breadcrumb" Src="~/AsiCommon/Controls/CommunityManagement/Common/CommunityBreadCrumb.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_WikiHome" Src="~/AsiCommon/Controls/CommunityManagement/Wiki/WikiHome.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_Communities" Src="~/AsiCommon/Controls/CommunityManagement/Community/CommunitySideBarHelper.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_Contents" Src="~/AsiCommon/Controls/CommunityManagement/Wiki/Contents.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return true; } }

	override public Guid ContentRecordKey { get { return new Guid("2365202c-3323-4e46-9153-05681f3d3f48"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("9d484c36-fd55-424c-9c7f-ef1c04c9f39c"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciBreadcrumb as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("10350d2d-ebaf-4cbe-839e-023f4c26dc95");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciBreadcrumb);

		AddChildUserControl(ContentPage2);

		childUserControl = ciWikiHome as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("c7386262-e96b-4050-b19f-fef5ea418085");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciWikiHome);

		childUserControl = ciCommunities as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6081f2d5-97e4-4678-8223-a36244d41cb9");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCommunities);

		AddChildUserControl(ContentPage3);

		childUserControl = ciContents as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e11bbf7e-21ea-461a-b409-520473a78f45");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciContents);

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
				<asp:Panel ID="ste_container_Breadcrumb" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_Breadcrumb ID="ciBreadcrumb" runat="server" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciBreadcrumb" runat="server" ContentKey="2365202c-3323-4e46-9153-05681f3d3f48" ContentItemKey="10350d2d-ebaf-4cbe-839e-023f4c26dc95" /></asp:Panel>
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
				<asp:Panel ID="ste_container_WikiHome" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_WikiHome ID="ciWikiHome" runat="server" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciWikiHome" runat="server" ContentKey="2365202c-3323-4e46-9153-05681f3d3f48" ContentItemKey="c7386262-e96b-4050-b19f-fef5ea418085" /></asp:Panel>
				<asp:Panel ID="ste_container_Communities" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_Communities ID="ciCommunities" runat="server" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciCommunities" runat="server" ContentKey="2365202c-3323-4e46-9153-05681f3d3f48" ContentItemKey="6081f2d5-97e4-4678-8223-a36244d41cb9" /></asp:Panel>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
		</div>
		<div class="col-sm-4">
						<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<asp:Panel ID="ste_container_Contents" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_Contents ID="ciContents" runat="server" UseParentAtomObject="False" UseKeyFromURL="False" /><asiweb:SurfToEditButtonPanel ID="ste_ciContents" runat="server" ContentKey="2365202c-3323-4e46-9153-05681f3d3f48" ContentItemKey="e11bbf7e-21ea-461a-b409-520473a78f45" /></asp:Panel>
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