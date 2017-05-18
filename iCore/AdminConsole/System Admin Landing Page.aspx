<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="System Admin Landing Page" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="QuickLinks" Src="~/iParts/Common/QuickLinks/QuickLinksDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("95084246-0463-4513-b2fa-f2cda28df7b5"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("c686669a-ee1e-4f79-9983-d9f431925a38"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciSiteBuilder as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("ce4370a5-aef3-4d99-b1bc-fc650534bfe5");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSiteBuilder);

		childUserControl = ciiMISManagement as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("670b7918-e6ce-4a77-8394-007dbb39a29c");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciiMISManagement);

		AddChildUserControl(ContentPage2);

		childUserControl = ciWorkflow as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("10b8178c-a5a8-4aba-8bcf-12328e7002e1");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciWorkflow);

		childUserControl = ciUtilities as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("36e7bba7-7544-4173-8392-7aa963879f09");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciUtilities);

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
				<CM:QuickLinks ID="ciSiteBuilder" runat="server" ContentKey="95084246-0463-4513-b2fa-f2cda28df7b5" ContentItemKey="ce4370a5-aef3-4d99-b1bc-fc650534bfe5" Title="Site Builder" ShowTitleFlag="False" PartTitle="Site Builder" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/icon_web.png" AltText="Site builder icon" NavigationDocumentPath="~/System_admin/Site_builder" />
				<CM:QuickLinks ID="ciiMISManagement" runat="server" ContentKey="95084246-0463-4513-b2fa-f2cda28df7b5" ContentItemKey="670b7918-e6ce-4a77-8394-007dbb39a29c" Title="iMIS Management" ShowTitleFlag="False" PartTitle="iMIS Management" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/icon_imismgmt.png" AltText="iMIS management icon" NavigationDocumentPath="~/System_admin/iMISManagement" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:QuickLinks ID="ciWorkflow" runat="server" ContentKey="95084246-0463-4513-b2fa-f2cda28df7b5" ContentItemKey="10b8178c-a5a8-4aba-8bcf-12328e7002e1" Title="Workflow" ShowTitleFlag="False" PartTitle="Workflow" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/icon_workflow.png" AltText="Workflow icon" NavigationDocumentPath="~/System_admin/Workflow" />
				<CM:QuickLinks ID="ciUtilities" runat="server" ContentKey="95084246-0463-4513-b2fa-f2cda28df7b5" ContentItemKey="36e7bba7-7544-4173-8392-7aa963879f09" Title="Utilities" ShowTitleFlag="False" PartTitle="Utilities" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/icon_tools.png" AltText="Utilities icon" NavigationDocumentPath="~/System_admin/Utilities" />
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