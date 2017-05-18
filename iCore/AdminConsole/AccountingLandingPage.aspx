<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Accounting Landing Page" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="QuickLinks" Src="~/iParts/Common/QuickLinks/QuickLinksDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("9961d654-d31e-4309-9b17-9c108ef7ec88"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("2515913c-adfe-4659-98d8-1b0f48cfeffb"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciTransactions as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("4ad4f858-92a7-4332-972d-2db8b832bd6b");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciTransactions);

		childUserControl = ciAdjustments as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9f5b2929-753b-40ab-b229-fd23e84a2a47");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAdjustments);

		AddChildUserControl(ContentPage2);

		childUserControl = ciProcesses as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("4e415fb5-0fad-48ac-a064-467c3bbbb449");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciProcesses);

		childUserControl = ciOptions as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("cfd10494-51bd-4d3d-828b-d4f6abd891c4");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciOptions);

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
				<CM:QuickLinks ID="ciTransactions" runat="server" ContentKey="9961d654-d31e-4309-9b17-9c108ef7ec88" ContentItemKey="4ad4f858-92a7-4332-972d-2db8b832bd6b" Title="Transactions" ShowTitleFlag="False" PartTitle="Transactions" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/icon_transactions.png" AltText="Transactions icon" NavigationDocumentPath="~/AR_Cash/Transactions" />
				<CM:QuickLinks ID="ciAdjustments" runat="server" ContentKey="9961d654-d31e-4309-9b17-9c108ef7ec88" ContentItemKey="9f5b2929-753b-40ab-b229-fd23e84a2a47" Title="Adjustments" ShowTitleFlag="False" PartTitle="Adjustments" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/icon_adjustments.png" AltText="Adjustments icon" NavigationDocumentPath="~/AR_Cash/Adjustments" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:QuickLinks ID="ciProcesses" runat="server" ContentKey="9961d654-d31e-4309-9b17-9c108ef7ec88" ContentItemKey="4e415fb5-0fad-48ac-a064-467c3bbbb449" Title="Processes" ShowTitleFlag="False" PartTitle="Processes" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/icon_processes.png" AltText="Processes icon" NavigationDocumentPath="~/AR_Cash/Processes" />
				<CM:QuickLinks ID="ciOptions" runat="server" ContentKey="9961d654-d31e-4309-9b17-9c108ef7ec88" ContentItemKey="cfd10494-51bd-4d3d-828b-d4f6abd891c4" Title="Options" ShowTitleFlag="False" PartTitle="Options" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="~/AsiCommon/Images/BSA/icon_options_finance.png" AltText="Options icon" NavigationDocumentPath="~/AR_Cash/Options" />
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