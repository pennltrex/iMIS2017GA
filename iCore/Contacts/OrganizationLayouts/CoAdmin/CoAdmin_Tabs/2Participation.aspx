<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Participation" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryMenu" Src="~/iparts/Common/QueryMenu/QueryMenuDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="OpenInvoiceListDisplay" Src="~/iParts/Commerce/OpenInvoiceListDisplay/OpenInvoiceListDisplayDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="BigButtonPanel" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/DisplayBigButtonPanel.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("4d1422a0-5a25-4264-aba1-1006c84b85fd"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("9bfd861d-0af8-4e21-87d2-f78249c81dc5"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciCurrentBilling as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("44492850-4e6c-4626-aec5-903b2db58392");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCurrentBilling);

		childUserControl = ciNewOpenInvoiceListDisplayCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("f56bb936-38d5-43ad-bdb3-b2e82f125c14");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewOpenInvoiceListDisplayCommon);

		childUserControl = ciViewStatement as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("5cbf9092-971f-4a65-8236-f6201d571536");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciViewStatement);

		childUserControl = ciUpcomingEventRegistrations as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("444d14b7-4630-4577-9189-e49b7eb6f9d5");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciUpcomingEventRegistrations);

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
				<CM:QueryMenu ID="ciCurrentBilling" runat="server" ContentKey="4d1422a0-5a25-4264-aba1-1006c84b85fd" ContentItemKey="44492850-4e6c-4626-aec5-903b2db58392" Title="Current Billing" ShowTitleFlag="False" PartTitle="Current billing" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="10" PagerMode="Simple" MenuCaptionText="" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="$/ContactManagement/DefaultSystem/Queries/Advanced/Contact/Financial/Open Invoices Summary" SourceKey="e3da1e0f-1287-43d0-bf6c-5aaede33708b" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:OpenInvoiceListDisplay ID="ciNewOpenInvoiceListDisplayCommon" runat="server" ContentKey="4d1422a0-5a25-4264-aba1-1006c84b85fd" ContentItemKey="f56bb936-38d5-43ad-bdb3-b2e82f125c14" Title="New OpenInvoiceListDisplayCommon" ShowTitleFlag="False" PartTitle="Open invoices" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayForAuthorizedUsersOnly="True" DisplayOption="Show" NoOpenInvoice="There are no open invoices at this time." FilterByFinancialEntity="False" SelectedFinancialEntity="" />
				<CM:BigButtonPanel ID="ciViewStatement" runat="server" ContentKey="4d1422a0-5a25-4264-aba1-1006c84b85fd" ContentItemKey="5cbf9092-971f-4a65-8236-f6201d571536" Title="View Statement" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="BigButtonWrapper btn-Display" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="Actions" UsePopup="True" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="True" Links="&quot;@/iCore/Contacts/Account_Statement[ID (or All)=@SelectedID]|View Statement&quot;" />
				<CM:QueryMenu ID="ciUpcomingEventRegistrations" runat="server" ContentKey="4d1422a0-5a25-4264-aba1-1006c84b85fd" ContentItemKey="444d14b7-4630-4577-9189-e49b7eb6f9d5" Title="Upcoming Event Registrations" ShowTitleFlag="False" PartTitle="Upcoming event registrations" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="10" PagerMode="Simple" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="$/ContactManagement/DefaultSystem/Queries/Org Registrations" SourceKey="96069e9e-72b4-489d-ba6b-429a7f7c3b44" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
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