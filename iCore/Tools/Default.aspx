<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Tools" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="BigButtonPanel" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/DisplayBigButtonPanel.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("486f02d0-a395-48cf-956e-41abfbea6679"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("46be1605-9613-439f-98a8-5c6dfb013d26"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciIntelligentQueryArchitect as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("1c74173d-4fa7-4aab-9732-bfa10bfb438b");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciIntelligentQueryArchitect);

		childUserControl = ciSiteBuilder as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("c58cecbb-c3c3-4c6a-9348-ce9b5b649420");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSiteBuilder);

		childUserControl = ciUtilities as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e2c3943b-4c2b-4835-88c2-69cf4dbc219c");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciUtilities);

		AddChildUserControl(ContentPage2);

		childUserControl = ciBusinessObjectDesigner as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("099ef72d-dcbf-4be1-8e74-a20626d4b7ac");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciBusinessObjectDesigner);

		childUserControl = ciWorkflow as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9ad11b4d-c8a8-461f-acb2-029a9f69a3dd");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciWorkflow);

		childUserControl = ciReports as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("82a80110-1c61-4ecc-aef2-febd94e0d79a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciReports);

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
				<CM:BigButtonPanel ID="ciIntelligentQueryArchitect" runat="server" ContentKey="486f02d0-a395-48cf-956e-41abfbea6679" ContentItemKey="1c74173d-4fa7-4aab-9732-bfa10bfb438b" Title="Intelligent Query Architect" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/query.png" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="" ActionMode="" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="&quot;ISA.Queries|Intelligent Query Architect&quot;" />
				<CM:BigButtonPanel ID="ciSiteBuilder" runat="server" ContentKey="486f02d0-a395-48cf-956e-41abfbea6679" ContentItemKey="c58cecbb-c3c3-4c6a-9348-ce9b5b649420" Title="Site Builder" ShowTitleFlag="False" PartTitle="Site Builder" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/con_sitemanage.png" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="&quot;ISA.Sitemaps|Manage Sitemaps&quot;,&quot;ISA.Websites|Manage Websites&quot;,&quot;ISA.URLs|Manage URLs&quot;" />
				<CM:BigButtonPanel ID="ciUtilities" runat="server" ContentKey="486f02d0-a395-48cf-956e-41abfbea6679" ContentItemKey="e2c3943b-4c2b-4835-88c2-69cf4dbc219c" Title="Utilities" ShowTitleFlag="False" PartTitle="Utilities" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/utilities.png" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="&quot;ISA.DocumentSystem|Document System&quot;,&quot;ISA.UDTables|User defined tables&quot;,&quot;ISA.PackageInstaller|Package installer&quot;,&quot;Localization.Management|Language translation management&quot;" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:BigButtonPanel ID="ciBusinessObjectDesigner" runat="server" ContentKey="486f02d0-a395-48cf-956e-41abfbea6679" ContentItemKey="099ef72d-dcbf-4be1-8e74-a20626d4b7ac" Title="Business Object Designer" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/asicommon/images/bsa/businessobject.png" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="" ActionMode="" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="&quot;ISA.BusinessObjects|Business Object Designer&quot;" />
				<CM:BigButtonPanel ID="ciWorkflow" runat="server" ContentKey="486f02d0-a395-48cf-956e-41abfbea6679" ContentItemKey="9ad11b4d-c8a8-461f-acb2-029a9f69a3dd" Title="Workflow" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/workflowdesign.png" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="" ActionMode="" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="&quot;~/AsiNavigator.aspx?iNavMarker=Workflow.Monitor&amp;amp;amp;amp;amp;amp;amp;amp;amp;ShowTaskBar=false|Workflow&quot;,&quot;ISA.WorkflowConsole|Work item console&quot;,&quot;ISA.WorkflowProcesses|Monitor processes&quot;" />
				<CM:BigButtonPanel ID="ciReports" runat="server" ContentKey="486f02d0-a395-48cf-956e-41abfbea6679" ContentItemKey="82a80110-1c61-4ecc-aef2-febd94e0d79a" Title="Reports" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/reports.png" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="" ActionMode="" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="&quot;ISA.Reports|Reports&quot;" />
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