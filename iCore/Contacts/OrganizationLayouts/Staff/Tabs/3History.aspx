<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="History" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryMenu" Src="~/iparts/Common/QueryMenu/QueryMenuDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="InteractionLog" Src="~/iParts/Common/InteractionLog/InteractionLogDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ChangeHistoryDisplay" Src="~/iparts/common/ChangeHistoryDisplay/ChangeHistoryDisplayDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("b53a5197-883e-4b01-8cdf-1650dc5f4ef3"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("297fc0d6-42f9-478f-ae8b-d4d5c36ea80d"); } }

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

		childUserControl = ciInvoices as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("46284820-6f2c-43dd-95ff-35c5f2efd900");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciInvoices);

		childUserControl = ciInteractionLogCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("c7900142-53c7-4af3-af52-cf068b82e583");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciInteractionLogCommon);

		childUserControl = ciBillingHistory as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9c31361b-0e5a-45dc-9991-c86579ef7bc8");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciBillingHistory);

		childUserControl = ciNewQueryMenuCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("b39289a3-4153-456a-8e78-98d04fda187d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewQueryMenuCommon);

		childUserControl = ciChangeHistoryDisplayCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("46fd64f7-49f4-4451-a881-2c3af7886197");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciChangeHistoryDisplayCommon);

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
				<CM:QueryMenu ID="ciTransactions" runat="server" ContentKey="b53a5197-883e-4b01-8cdf-1650dc5f4ef3" ContentItemKey="67253b03-e396-41f3-b579-9172241c6c9f" Title="Transactions" ShowTitleFlag="False" PartTitle="Recent transactions" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="10" PagerMode="Simple" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="$/ContactManagement/DefaultSystem/Queries/Recent Activities/Transactions/Recent Transactions for Org" SourceKey="d726b8e1-be94-4b05-91ac-48d66665e1a1" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:QueryMenu ID="ciInvoices" runat="server" ContentKey="b53a5197-883e-4b01-8cdf-1650dc5f4ef3" ContentItemKey="46284820-6f2c-43dd-95ff-35c5f2efd900" Title="Invoices" ShowTitleFlag="False" PartTitle="Closed invoices" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="True" Collapsed="True" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="20" PagerMode="Simple" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="False" SourceFolderPathControl="$/ContactManagement/DefaultSystem/Queries/Recent Activities/Transactions/Closed Invoices" SourceKey="656d2ef4-a230-4a85-b776-fa5c7190f681" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:InteractionLog ID="ciInteractionLogCommon" runat="server" ContentKey="b53a5197-883e-4b01-8cdf-1650dc5f4ef3" ContentItemKey="c7900142-53c7-4af3-af52-cf068b82e583" Title="InteractionLogCommon" ShowTitleFlag="False" PartTitle="Recent interactions" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayForAuthorizedUsersOnly="True" />
				<CM:QueryMenu ID="ciBillingHistory" runat="server" ContentKey="b53a5197-883e-4b01-8cdf-1650dc5f4ef3" ContentItemKey="9c31361b-0e5a-45dc-9991-c86579ef7bc8" Title="Billing History" ShowTitleFlag="False" PartTitle="Billing history" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="True" MapResults="False" ListPageSize="10" PagerMode="Simple" MenuCaptionText="" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="$/ContactManagement/DefaultSystem/Queries/Advanced/Contact/Financial/Billing Payments" SourceKey="1d6bf170-e7ea-47a3-8a5f-4663c02eef9a" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:QueryMenu ID="ciNewQueryMenuCommon" runat="server" ContentKey="b53a5197-883e-4b01-8cdf-1650dc5f4ef3" ContentItemKey="b39289a3-4153-456a-8e78-98d04fda187d" Title="New QueryMenuCommon" ShowTitleFlag="False" PartTitle="Donation history" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="10" PagerMode="Simple" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="$/Fundraising/DefaultSystem/Queries/Organization/Donation History" SourceKey="40939530-24d8-4572-9a8a-86d3d8e0d201" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:ChangeHistoryDisplay ID="ciChangeHistoryDisplayCommon" runat="server" ContentKey="b53a5197-883e-4b01-8cdf-1650dc5f4ef3" ContentItemKey="46fd64f7-49f4-4451-a881-2c3af7886197" Title="ChangeHistoryDisplayCommon" ShowTitleFlag="False" PartTitle="Change history" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="True" Collapsed="True" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayForAuthorizedUsersOnly="True" />
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