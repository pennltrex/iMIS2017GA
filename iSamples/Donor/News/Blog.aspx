<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Blog" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentBlock" Src="~/iParts/Common/ContentBlock/ContentBlockDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("a5379e99-a7d1-422a-96ae-3d5a5aa0013b"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("de7f6b1d-897b-4b87-bb0e-fda1edebf497"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciHeading_108805da5230496fb17e4cdd44c14562 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("108805da-5230-496f-b17e-4cdd44c14562");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciHeading_108805da5230496fb17e4cdd44c14562);

		childUserControl = ciBlog as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("c40d241d-7362-4ce9-a0d1-22dbc0f72cdd");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciBlog);

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
				<CM:ContentHtml ID="ciHeading_108805da5230496fb17e4cdd44c14562" runat="server" ContentKey="a5379e99-a7d1-422a-96ae-3d5a5aa0013b" ContentItemKey="108805da-5230-496f-b17e-4cdd44c14562" Title="Heading" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Heading" runat="server"><h1>iMIS Foundation Blog</h1></asp:Panel></CM:ContentHtml>
				<CM:ContentBlock ID="ciBlog" runat="server" ContentKey="a5379e99-a7d1-422a-96ae-3d5a5aa0013b" ContentItemKey="c40d241d-7362-4ce9-a0d1-22dbc0f72cdd" Title="Blog" ShowTitleFlag="False" PageTitle="" DoNotRenderInDesignMode="False" ShowBorder="False" SelectedTags="eba530d1-0f00-4de9-865a-ca6c29b6abbf,0184e688-3c17-4dfb-beb3-d930896ac553" AllowReplies="True" AllowHtml="True" AllowAttachments="False" ItemDefaultHtml="" DisplayMode="Summary" MaxDisplayItems="5" AllowChildPosts="False" IncludeSocialSharingIcons="False" PostSortType="CreatedDateDescending" DisplayPostDateAndAuthor="True" />
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