<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Automatic payment enrollments" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="AlertDisplay" Src="~/iParts/Communications/Notification/NotificationDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryMenu" Src="~/iparts/Common/QueryMenu/QueryMenuDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("990daf47-3d0b-440d-a8a5-00fa445ef152"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("736c2744-a5ef-411e-8365-d72a61afe0f7"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciAlerts as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("be4f1319-5110-4de2-9f55-f6c31ad26f0c");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAlerts);

		childUserControl = ciAutomaticPaymentInstructions as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("73e5b796-0b73-4303-8b92-ce4e6f492d1c");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAutomaticPaymentInstructions);

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
				<CM:AlertDisplay ID="ciAlerts" runat="server" ContentKey="990daf47-3d0b-440d-a8a5-00fa445ef152" ContentItemKey="be4f1319-5110-4de2-9f55-f6c31ad26f0c" Title="Alerts" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="Alerts PanelNoPadding" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" SelectedNotificationSets="7b2bdece-380b-4cf1-839d-14f4f1b41e07" HideWhenEmpty="True" NoAlertMessage="" />
				<CM:QueryMenu ID="ciAutomaticPaymentInstructions" runat="server" ContentKey="990daf47-3d0b-440d-a8a5-00fa445ef152" ContentItemKey="73e5b796-0b73-4303-8b92-ce4e6f492d1c" Title="AutomaticPaymentInstructions" ShowTitleFlag="False" PartTitle="Automatic payment enrollments" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="True" MapResults="False" ListPageSize="20" PagerMode="Advanced" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="False" SourceFolderPathControl="$/Membership/DefaultSystem/Queries/AutoPay/Automatic payment enrollments" SourceKey="4e40a44c-8b2e-4ad4-8844-db1d8be50760" ReloadRefresh="True" EnableEmailMerge="True" AutoRun="True" />
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