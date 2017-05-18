<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Retrieve processed payments" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryMenu" Src="~/iparts/Common/QueryMenu/QueryMenuDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="EFTBatchStatus" Src="~/iParts/Fundraising/EFTBatchStatus/EbsDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("72659684-96a7-4509-a891-0e37bcfad6c6"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("e6e2a371-693a-48ec-a8f7-73685980128b"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewContentHtml_f17c9f62d8474ec482909ced5c23c2b6 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("f17c9f62-d847-4ec4-8290-9ced5c23c2b6");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml_f17c9f62d8474ec482909ced5c23c2b6);

		childUserControl = ciNewQueryMenuCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("cdc78cbb-c2c9-4630-a95c-74496638079e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewQueryMenuCommon);

		childUserControl = ciNewEbsCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("15571bb4-524a-4c2f-8083-78bf599afb23");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewEbsCommon);

		childUserControl = ciNewContentHtml2_06518fbb8fe942deb821bdfb184043a9 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("06518fbb-8fe9-42de-b821-bdfb184043a9");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml2_06518fbb8fe942deb821bdfb184043a9);

		childUserControl = ciNewQueryMenuCommon2 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("0c15c875-eee7-4908-b671-1b8e23bc68e0");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewQueryMenuCommon2);

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
				<CM:ContentHtml ID="ciNewContentHtml_f17c9f62d8474ec482909ced5c23c2b6" runat="server" ContentKey="72659684-96a7-4509-a891-0e37bcfad6c6" ContentItemKey="f17c9f62-d847-4ec4-8290-9ced5c23c2b6" Title="New ContentHtml" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml" runat="server"><p>Update iMIS to incorporate payments that have been processed. You may click the button repeatedly until all payments appear as processed.</p>
<p>If a payment is not processed successfully, return to step 3 to find the invoice and re-submit it. After 3 unsuccessful attempts to pay it, an invoice will no longer appear and should be processed manually.</p></asp:Panel></CM:ContentHtml>
				<CM:QueryMenu ID="ciNewQueryMenuCommon" runat="server" ContentKey="72659684-96a7-4509-a891-0e37bcfad6c6" ContentItemKey="cdc78cbb-c2c9-4630-a95c-74496638079e" Title="New QueryMenuCommon" ShowTitleFlag="False" PartTitle="Submitted payments" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="20" PagerMode="Advanced" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="False" SourceFolderPathControl="$/Fundraising/DefaultSystem/Queries/AutoPay/Submitted payments for recurring donations" SourceKey="33ce6f92-fe9a-46e6-b863-3b9e35df2358" ReloadRefresh="True" EnableEmailMerge="False" AutoRun="False" />
				<CM:EFTBatchStatus ID="ciNewEbsCommon" runat="server" ContentKey="72659684-96a7-4509-a891-0e37bcfad6c6" ContentItemKey="15571bb4-524a-4c2f-8083-78bf599afb23" Title="New EbsCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" RefreshButtonText="Retrieve processed payments" />
				<CM:ContentHtml ID="ciNewContentHtml2_06518fbb8fe942deb821bdfb184043a9" runat="server" ContentKey="72659684-96a7-4509-a891-0e37bcfad6c6" ContentItemKey="06518fbb-8fe9-42de-b821-bdfb184043a9" Title="New ContentHtml_2" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml2" runat="server"><br />
<br /></asp:Panel></CM:ContentHtml>
				<CM:QueryMenu ID="ciNewQueryMenuCommon2" runat="server" ContentKey="72659684-96a7-4509-a891-0e37bcfad6c6" ContentItemKey="0c15c875-eee7-4908-b671-1b8e23bc68e0" Title="New QueryMenuCommon_2" ShowTitleFlag="False" PartTitle="Processed payments" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="20" PagerMode="Advanced" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="False" SourceFolderPathControl="$/Fundraising/DefaultSystem/Queries/AutoPay/Processed payments for recurring donations" SourceKey="f420f2bf-8579-43f3-9e8a-9e9fda904412" ReloadRefresh="True" EnableEmailMerge="False" AutoRun="False" />
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