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

	override public Guid ContentRecordKey { get { return new Guid("afb23f29-56de-40eb-8898-19b4357a5d29"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("acde1ce4-93f6-4c30-a83b-787b4ea558e7"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewContentHtml_9dc81c8ba14448f38cdacb9193040dcb as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9dc81c8b-a144-48f3-8cda-cb9193040dcb");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml_9dc81c8ba14448f38cdacb9193040dcb);

		childUserControl = ciNewQueryMenuCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("10ecce3b-1ce1-4452-9849-929cc49ba2bf");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewQueryMenuCommon);

		childUserControl = ciNewEbsCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6b2b51cc-8be6-4738-8b9f-3efd9ffec9aa");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewEbsCommon);

		childUserControl = ciNewQueryMenuCommon2 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("66f6c143-69ec-46de-a728-a3701760e0e1");
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
				<CM:ContentHtml ID="ciNewContentHtml_9dc81c8ba14448f38cdacb9193040dcb" runat="server" ContentKey="afb23f29-56de-40eb-8898-19b4357a5d29" ContentItemKey="9dc81c8b-a144-48f3-8cda-cb9193040dcb" Title="New ContentHtml" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml" runat="server"><p>Update iMIS to incorporate payments that have been processed. You may click the button repeatedly until all payments appear as processed.</p>
<p>If a payment is not processed successfully, return to step 1 to find the invoice and re-submit it. After 3 unsuccessful attempts to pay it, an invoice will no longer appear and should be processed manually.</p></asp:Panel></CM:ContentHtml>
				<CM:QueryMenu ID="ciNewQueryMenuCommon" runat="server" ContentKey="afb23f29-56de-40eb-8898-19b4357a5d29" ContentItemKey="10ecce3b-1ce1-4452-9849-929cc49ba2bf" Title="New QueryMenuCommon" ShowTitleFlag="False" PartTitle="Submitted payments" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="20" PagerMode="Advanced" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="False" SourceFolderPathControl="$/Membership/DefaultSystem/Queries/AutoPay/Submitted automatic payments for renewals" SourceKey="a15cda85-8206-405b-8c60-9980c7251c4a" ReloadRefresh="True" EnableEmailMerge="False" AutoRun="False" />
				<CM:EFTBatchStatus ID="ciNewEbsCommon" runat="server" ContentKey="afb23f29-56de-40eb-8898-19b4357a5d29" ContentItemKey="6b2b51cc-8be6-4738-8b9f-3efd9ffec9aa" Title="New EbsCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="Section" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" RefreshButtonText="Retrieve processed payments" />
				<CM:QueryMenu ID="ciNewQueryMenuCommon2" runat="server" ContentKey="afb23f29-56de-40eb-8898-19b4357a5d29" ContentItemKey="66f6c143-69ec-46de-a728-a3701760e0e1" Title="New QueryMenuCommon_2" ShowTitleFlag="False" PartTitle="Processed payments" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="20" PagerMode="Advanced" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="False" SourceFolderPathControl="$/Common/Queries/Commerce/Billing/Processed automatic payments for renewals" SourceKey="3715bc18-c0bd-443b-9d4a-5f628fc61490" ReloadRefresh="True" EnableEmailMerge="False" AutoRun="False" />
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