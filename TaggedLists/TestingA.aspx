<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="TestingA" %>
<%@ Register Src="~/AsiCommon/Controls/Navigation/PageClusterNavigation.ascx" TagPrefix="asi" TagName="PageClusterNavigation" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentTaggedList" Src="~/AsiCommon/Controls/ContentManagement/DisplayTaggedList.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">
	<meta name="Description" content="" />
	<meta name="Keywords" content="" />
	<meta name="PublicationDate" content="2008-08-15 03:15:19 PM" />

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite.Title %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("1e6aaf41-5381-4fb1-9791-523bf8c9255c"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("fd985193-3668-48d2-b10b-1ec13fef4fe6"); } }

	protected override void OnLoad(EventArgs e)
	{
		base.OnLoad(e);

		if (!IsPostBack)
			DataBind();
	}

	protected override void EnsureChildUserControls()
	{
		Asi.Web.UI.IUserControl childUserControl;
		AddChildUserControl(PageClusterNav);
		AddChildUserControl(ContentPage1);
		childUserControl = ciNewContentTaggedList as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		ContentItemKeyMap.Add(new System.Guid("27a7e89c-4035-4d0e-a43f-6bc298cde200"), ciNewContentTaggedList);
		AddChildUserControl(ContentPage2);
		childUserControl = ciNewContentTaggedList2 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		ContentItemKeyMap.Add(new System.Guid("a9d228a2-255c-4222-a74a-8c35ce807042"), ciNewContentTaggedList2);
		AddChildUserControl(ContentPage3);
		childUserControl = ciNewContentHtml as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		ContentItemKeyMap.Add(new System.Guid("c37ae1da-fb53-499b-b09a-b94db07df399"), ciNewContentHtml);

	}
</script>
<asp:Content ID="TemplateUserMessages" ContentPlaceHolderID="TemplateUserMessages" runat="server"></asp:Content>
<asp:Content ID="SideBarPlaceHolder" ContentPlaceHolderID="SideBarPlaceHolder" runat="server">
    <asi:PageClusterNavigation id="PageClusterNav" runat="server" SubjectUniformKey="1e6aaf41-5381-4fb1-9791-523bf8c9255c" />
</asp:Content>
<asp:Content ID="TemplateBody" ContentPlaceHolderID="TemplateBody" Runat="Server">
<script type="text/javascript">

</script>
	<asiweb:AsiWebPartManager id="WebPartManager1" runat="server">
		<StaticConnections>
		</StaticConnections>
	</asiweb:AsiWebPartManager>
   <div id="bd">
	<div class="yui-g">
	<asp:WebPartZone ID="WebPartZone1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="">
		<ZoneTemplate>
			<div ID="WebPartZone1Header" runat="server" class=""></div>
			<CM:ContentPage ID="ContentPage1" runat="server" PageNumber="1">
				<CM:ContentTaggedList ID="ciNewContentTaggedList" runat="server" ContentKey="1e6aaf41-5381-4fb1-9791-523bf8c9255c" ContentItemKey="27a7e89c-4035-4d0e-a43f-6bc298cde200" ShowTitleFlag="False" ListFormatKey="2408ed97-49db-44bd-996d-a911886aab9c" ShowTitleNoContentFlag="True" ListTitle="Axe List" FilterByPropertyName="" SortByPropertyName="" MaxNumResults="5" ViewAllMessage="View all" ViewAllCssClass="" TagMatchType="ANY" SortType="ASC" SelectedTags="53b0f973-8bf3-4645-85d6-ecc8bb6cbba5,39857702-8406-45b9-b0b6-2fb458d758ac,45c28740-ef56-4ecc-9b2b-c58c7070d02d,9dbeb7a6-4f68-43a6-b5ad-76c8b7bbbcce" />
			</CM:ContentPage>
		</ZoneTemplate>
	</asp:WebPartZone>
</div>
<div class="yui-g">
    <div class="yui-u first">
	<asp:WebPartZone ID="WebPartZone2" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="">
		<ZoneTemplate>
			<div ID="WebPartZone2Header" runat="server" class=""></div>
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<CM:ContentTaggedList ID="ciNewContentTaggedList2" runat="server" ContentKey="1e6aaf41-5381-4fb1-9791-523bf8c9255c" ContentItemKey="a9d228a2-255c-4222-a74a-8c35ce807042" ShowTitleFlag="False" ListFormatKey="2408ed97-49db-44bd-996d-a911886aab9c" ShowTitleNoContentFlag="True" ListTitle="Tag List 2" FilterByPropertyName="" SortByPropertyName="" MaxNumResults="5" ViewAllMessage="View all" ViewAllCssClass="" TagMatchType="ANY" SortType="ASC" SelectedTags="39857702-8406-45b9-b0b6-2fb458d758ac" />
			</CM:ContentPage>
		</ZoneTemplate>
	</asp:WebPartZone>
    </div>
    <div class="yui-u">
	<asp:WebPartZone ID="WebPartZone3" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="">
		<ZoneTemplate>
			<div ID="WebPartZone3Header" runat="server" class=""></div>
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<CM:ContentHtml ID="ciNewContentHtml" runat="server" ContentKey="1e6aaf41-5381-4fb1-9791-523bf8c9255c" ContentItemKey="c37ae1da-fb53-499b-b09a-b94db07df399" ShowTitleFlag="False" Title=""><asp:Panel ID="Panel_NewContentHtml" runat="server">asdfasdfasdfasdfasdfasdfff
</asp:Panel></CM:ContentHtml>
			</CM:ContentPage>
		</ZoneTemplate>
	</asp:WebPartZone>
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