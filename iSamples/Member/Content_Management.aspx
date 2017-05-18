<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Content Management" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="BigButtonPanel" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/DisplayBigButtonPanel.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("a8590383-ff0b-4f58-8dd3-1ab70af8d740"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("e4165a7b-6c4b-46df-b387-faab2f273712"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciSiteBuilder as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("083e05bb-263d-45e9-b770-c89a11192f01");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSiteBuilder);

		childUserControl = ciTagging as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("532ec523-664c-468d-be82-0f6611fa1c61");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciTagging);

		AddChildUserControl(ContentPage2);

		childUserControl = ciPageBuilder as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("d9916c64-305f-45ad-a8a1-f1a585d59973");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciPageBuilder);

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
				<CM:BigButtonPanel ID="ciSiteBuilder" runat="server" ContentKey="a8590383-ff0b-4f58-8dd3-1ab70af8d740" ContentItemKey="083e05bb-263d-45e9-b770-c89a11192f01" Title="Site Builder" ShowTitleFlag="False" PartTitle="Site Builder" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/con_sitemanage.png" NavigationIdentifier="~/Manage/WebContentManagement/Site_builder" ChildLevelsToDisplay="1" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="" />
				<CM:BigButtonPanel ID="ciTagging" runat="server" ContentKey="a8590383-ff0b-4f58-8dd3-1ab70af8d740" ContentItemKey="532ec523-664c-468d-be82-0f6611fa1c61" Title="Tagging" ShowTitleFlag="False" PartTitle="Tagging" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/con_tagging.png" NavigationIdentifier="~/Manage/WebContentManagement/Tagging" ChildLevelsToDisplay="1" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:BigButtonPanel ID="ciPageBuilder" runat="server" ContentKey="a8590383-ff0b-4f58-8dd3-1ab70af8d740" ContentItemKey="d9916c64-305f-45ad-a8a1-f1a585d59973" Title="Page Builder" ShowTitleFlag="False" PartTitle="Page Builder" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/con_contentmanage.png" NavigationIdentifier="~/Manage/WebContentManagement/Page_builder" ChildLevelsToDisplay="1" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="" />
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