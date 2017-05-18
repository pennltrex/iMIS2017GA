<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Content Management" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="BigButtonPanel" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/DisplayBigButtonPanel.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("7196a7b3-77c5-4428-be2a-102e402360ab"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("0de88cf0-3cf2-4669-a8fc-5c40fee75838"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciSiteBuilder as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("5633e87f-d7f5-49f3-b263-0f632d3cc71f");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSiteBuilder);

		childUserControl = ciTagging as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("0de3e9a1-3234-4850-a5f1-b5e593d7960b");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciTagging);

		childUserControl = ciReports as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("71bd9438-4155-447b-8937-6a973658ce51");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciReports);

		AddChildUserControl(ContentPage2);

		childUserControl = ciPageBuilder as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("2c491d02-dc31-47da-806a-729a7ee8b1db");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciPageBuilder);

		childUserControl = ciTemplateGallery as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("569cce01-5927-440d-a52e-319b78c7367e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciTemplateGallery);

		childUserControl = ciMaintenance as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("7e68b5d1-45de-422a-8352-7dbbace2b799");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMaintenance);

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
				<CM:BigButtonPanel ID="ciSiteBuilder" runat="server" ContentKey="7196a7b3-77c5-4428-be2a-102e402360ab" ContentItemKey="5633e87f-d7f5-49f3-b263-0f632d3cc71f" Title="Site Builder" ShowTitleFlag="False" PartTitle="Site Builder" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/con_sitemanage.png" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="&quot;CM.Sitemaps|Manage sitemaps&quot;,&quot;CM.Websites|Manage websites&quot;,&quot;CM.URLs|Manage URLs&quot;" />
				<CM:BigButtonPanel ID="ciTagging" runat="server" ContentKey="7196a7b3-77c5-4428-be2a-102e402360ab" ContentItemKey="0de3e9a1-3234-4850-a5f1-b5e593d7960b" Title="Tagging" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/con_tagging.png" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="" ActionMode="" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="&quot;CM.Tags|Define tags&quot;,&quot;CM.TaggedListFormats|Define tagged list formats&quot;" />
				<CM:BigButtonPanel ID="ciReports" runat="server" ContentKey="7196a7b3-77c5-4428-be2a-102e402360ab" ContentItemKey="71bd9438-4155-447b-8937-6a973658ce51" Title="Reports" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/reports.png" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="" ActionMode="" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="&quot;CM.Reports|Reports&quot;" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:BigButtonPanel ID="ciPageBuilder" runat="server" ContentKey="7196a7b3-77c5-4428-be2a-102e402360ab" ContentItemKey="2c491d02-dc31-47da-806a-729a7ee8b1db" Title="Page Builder" ShowTitleFlag="False" PartTitle="Page Builder" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/con_contentmanage.png" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="&quot;CM.Content|Manage content&quot;,&quot;CM.Tasks|View task list&quot;,&quot;CM.Layouts|Manage content layouts&quot;,&quot;CM.Images|Manage images&quot;" />
				<CM:BigButtonPanel ID="ciTemplateGallery" runat="server" ContentKey="7196a7b3-77c5-4428-be2a-102e402360ab" ContentItemKey="569cce01-5927-440d-a52e-319b78c7367e" Title="Template Gallery" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/con_templategal.png" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="" ActionMode="" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="&quot;CM.TemplateGallery|Template gallery&quot;" />
				<CM:BigButtonPanel ID="ciMaintenance" runat="server" ContentKey="7196a7b3-77c5-4428-be2a-102e402360ab" ContentItemKey="7e68b5d1-45de-422a-8352-7dbbace2b799" Title="Maintenance" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/con_systemmain.png" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="" ActionMode="" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="&quot;CM.PublishServers|Publishing servers&quot;,&quot;CM.UDFields|User defined fields&quot;,&quot;CM.ContentTypes|Content types&quot;,&quot;CM.ContentAuthorityGroups|Content authority groups&quot;" />
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