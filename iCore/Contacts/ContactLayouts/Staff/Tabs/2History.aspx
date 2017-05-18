<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="History" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryMenu" Src="~/iparts/Common/QueryMenu/QueryMenuDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="InteractionLog" Src="~/iParts/Common/InteractionLog/InteractionLogDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="PanelEditor" Src="~/iparts/Common/PanelEditor/PanelEditorDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ChangeHistoryDisplay" Src="~/iparts/common/ChangeHistoryDisplay/ChangeHistoryDisplayDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("66a5509a-f178-46be-a746-d9b13f53a752"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("0438db9b-70bb-44eb-8af0-c4a7484ac9a7"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciTransactions as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("67253b03-e396-41f3-b579-9172241c6c9f");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciTransactions);

		childUserControl = ciNewInteractionLogCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("7e9c600f-239c-431c-b7d2-b49c63a3e4d1");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewInteractionLogCommon);

		childUserControl = ciInvoices as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("46284820-6f2c-43dd-95ff-35c5f2efd900");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciInvoices);

		childUserControl = ciCallHistory as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("4de49053-9413-40d3-a8e5-86815bb15ab8");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCallHistory);

		childUserControl = ciBillingHistory as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9c31361b-0e5a-45dc-9991-c86579ef7bc8");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciBillingHistory);

		childUserControl = ciChangeHistory as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("7b81c5f8-d27c-4a66-93d1-4b0f160514e5");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciChangeHistory);

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
				<CM:QueryMenu ID="ciTransactions" runat="server" ContentKey="66a5509a-f178-46be-a746-d9b13f53a752" ContentItemKey="67253b03-e396-41f3-b579-9172241c6c9f" Title="Transactions" ShowTitleFlag="False" PartTitle="Recent transactions" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="10" PagerMode="Simple" MenuCaptionText="" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="$/ContactManagement/DefaultSystem/Queries/Recent Activities/Transactions/Recent Transactions" SourceKey="09c85d7c-6aa1-485d-9caa-92910017b6c0" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:InteractionLog ID="ciNewInteractionLogCommon" runat="server" ContentKey="66a5509a-f178-46be-a746-d9b13f53a752" ContentItemKey="7e9c600f-239c-431c-b7d2-b49c63a3e4d1" Title="New InteractionLogCommon" ShowTitleFlag="False" PartTitle="Recent interactions" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayForAuthorizedUsersOnly="True" />
				<CM:QueryMenu ID="ciInvoices" runat="server" ContentKey="66a5509a-f178-46be-a746-d9b13f53a752" ContentItemKey="46284820-6f2c-43dd-95ff-35c5f2efd900" Title="Invoices" ShowTitleFlag="False" PartTitle="Invoices" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="True" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="10" PagerMode="Simple" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="False" SourceFolderPathControl="$/ContactManagement/DefaultSystem/Queries/Recent Activities/Transactions/All Invoices" SourceKey="656d2ef4-a230-4a85-b776-fa5c7190f681" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:PanelEditor ID="ciCallHistory" runat="server" ContentKey="66a5509a-f178-46be-a746-d9b13f53a752" ContentItemKey="4de49053-9413-40d3-a8e5-86815bb15ab8" Title="Call History" ShowTitleFlag="False" PartTitle="Call history" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PanelDefinitionId="a0a867c2-7a69-4897-8ad3-b45f8e4fc915" AllowEdit="True" DefaultEditMode="False" CommitSequence="0" AllowDelete="False" AllowAdd="True" EditWindowWidth="600" EditWindowHeight="400" DisplayForAuthorizedUsersOnly="True" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" HidePanelWhenEmpty="False" ScrollingCellsEnabled="False" />
				<CM:QueryMenu ID="ciBillingHistory" runat="server" ContentKey="66a5509a-f178-46be-a746-d9b13f53a752" ContentItemKey="9c31361b-0e5a-45dc-9991-c86579ef7bc8" Title="Billing History" ShowTitleFlag="False" PartTitle="Billing history" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="10" PagerMode="Simple" MenuCaptionText="" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="$/ContactManagement/DefaultSystem/Queries/Advanced/Contact/Financial/Billing Payments" SourceKey="1d6bf170-e7ea-47a3-8a5f-4663c02eef9a" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:ChangeHistoryDisplay ID="ciChangeHistory" runat="server" ContentKey="66a5509a-f178-46be-a746-d9b13f53a752" ContentItemKey="7b81c5f8-d27c-4a66-93d1-4b0f160514e5" Title="Change History" ShowTitleFlag="False" PartTitle="Change history" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="True" Collapsed="True" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayForAuthorizedUsersOnly="True" />
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