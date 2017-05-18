<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Management Console" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="BigButtonPanel" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/DisplayBigButtonPanel.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("0b406ce0-4f44-4efb-be82-e05dd9ec501a"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("eb29332a-a356-40e0-af27-7907611ada4f"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciMangementConsole_9ab9e701c7c84cfea2305f4848adf4f0 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9ab9e701-c7c8-4cfe-a230-5f4848adf4f0");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMangementConsole_9ab9e701c7c84cfea2305f4848adf4f0);

		AddChildUserControl(ContentPage2);

		childUserControl = ciSiteBuilder as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("3cd44a63-a11c-4d2c-aec4-2d733930dbc3");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSiteBuilder);

		childUserControl = ciPageBuilder as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("0bfd9105-4279-453f-9f04-aaa221a841f9");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciPageBuilder);

		childUserControl = ciTagging as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a994311d-1566-41ab-87b1-e867fa78d3f0");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciTagging);

		AddChildUserControl(ContentPage3);

		childUserControl = ciMaintenance as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("ce0f8503-51dc-4c76-8852-19792bd5f3b3");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMaintenance);

		childUserControl = ciTools as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e5648028-6f7a-418b-bb27-96facb0953c9");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciTools);

		childUserControl = ciStyleGuide as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("20e7064b-c4d0-448c-a360-0cc38df9540c");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciStyleGuide);

		childUserControl = ciSupport as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("ab698ab0-e6c5-4739-a088-eda7abedb61e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSupport);

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
				<CM:ContentHtml ID="ciMangementConsole_9ab9e701c7c84cfea2305f4848adf4f0" runat="server" ContentKey="0b406ce0-4f44-4efb-be82-e05dd9ec501a" ContentItemKey="9ab9e701-c7c8-4cfe-a230-5f4848adf4f0" Title="Mangement Console" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_MangementConsole" runat="server"><h1>Management Console</h1></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:BigButtonPanel ID="ciSiteBuilder" runat="server" ContentKey="0b406ce0-4f44-4efb-be82-e05dd9ec501a" ContentItemKey="3cd44a63-a11c-4d2c-aec4-2d733930dbc3" Title="Site Builder" ShowTitleFlag="False" PartTitle="Site Builder" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/con_sitemanage.png" NavigationIdentifier="~/Manage/Site_builder" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="" />
				<CM:BigButtonPanel ID="ciPageBuilder" runat="server" ContentKey="0b406ce0-4f44-4efb-be82-e05dd9ec501a" ContentItemKey="0bfd9105-4279-453f-9f04-aaa221a841f9" Title="Page Builder" ShowTitleFlag="False" PartTitle="Page Builder" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/con_contentmanage.png" NavigationIdentifier="~/Manage/Page_builder" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="" />
				<CM:BigButtonPanel ID="ciTagging" runat="server" ContentKey="0b406ce0-4f44-4efb-be82-e05dd9ec501a" ContentItemKey="a994311d-1566-41ab-87b1-e867fa78d3f0" Title="Tagging" ShowTitleFlag="False" PartTitle="Tagging" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/con_tagging.png" NavigationIdentifier="~/Manage/Tagging" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:BigButtonPanel ID="ciMaintenance" runat="server" ContentKey="0b406ce0-4f44-4efb-be82-e05dd9ec501a" ContentItemKey="ce0f8503-51dc-4c76-8852-19792bd5f3b3" Title="Maintenance" ShowTitleFlag="False" PartTitle="Maintenance" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/con_systemmain.png" NavigationIdentifier="~/Manage/Maintenance" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="Navigation" UsePopup="False" AltText="Maintenance" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="" />
				<CM:BigButtonPanel ID="ciTools" runat="server" ContentKey="0b406ce0-4f44-4efb-be82-e05dd9ec501a" ContentItemKey="e5648028-6f7a-418b-bb27-96facb0953c9" Title="Tools" ShowTitleFlag="False" PartTitle="Tools" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/utilities.png" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="" ActionMode="" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="&quot;iQA|Intelligent Query Architect&quot;,&quot;BOD|Business Object Designer&quot;,&quot;DocumentSystem|Document System&quot;" />
				<CM:BigButtonPanel ID="ciStyleGuide" runat="server" ContentKey="0b406ce0-4f44-4efb-be82-e05dd9ec501a" ContentItemKey="20e7064b-c4d0-448c-a360-0cc38df9540c" Title="Style Guide" ShowTitleFlag="False" PartTitle="Style Guide" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/book.png" NavigationIdentifier="~/Manage/Style_Guide" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="Navigation" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="" />
				<CM:BigButtonPanel ID="ciSupport" runat="server" ContentKey="0b406ce0-4f44-4efb-be82-e05dd9ec501a" ContentItemKey="ab698ab0-e6c5-4739-a088-eda7abedb61e" Title="Support" ShowTitleFlag="False" PartTitle="Support" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/help.png" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="&quot;http://docs.imis.com|iMIS Helpsite&quot;,&quot;http://www.imiscommunity.com|iMIS Community&quot;,&quot;http://www.imis.com/ProductReleases|Update iMIS&quot;,&quot;http://www.advsol.com/support|Tech Support&quot;,&quot;http://www.niug.org|NiUG&quot;,&quot;http://www.advsol.com/training|iMIS Training&quot;" />
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