<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Batch detail" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryMenu" Src="~/iparts/Common/QueryMenu/QueryMenuDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="DataShowcase" Src="~/iParts/Common/DataShowcase/DataShowcaseDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("0262611e-fae4-47bd-b7da-8a43eea68285"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("ded76b0a-5813-48fd-a547-7ef46da8f7d4"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewContentHtml_9e63d10a7c7e45e4b27dd3e5b0a77502 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9e63d10a-7c7e-45e4-b27d-d3e5b0a77502");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml_9e63d10a7c7e45e4b27dd3e5b0a77502);

		childUserControl = ciNewQueryMenuCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("acac43b1-9943-41d0-947b-4efa3d226846");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewQueryMenuCommon);

		childUserControl = ciNewDataShowcaseCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("925814dd-891c-4e64-ab3c-aaf2fb20365b");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewDataShowcaseCommon);

		childUserControl = ciNewQueryMenuCommon2 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("b35a35a5-3cb5-444c-a5a5-de1fc2afd8c0");
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
				<CM:ContentHtml ID="ciNewContentHtml_9e63d10a7c7e45e4b27dd3e5b0a77502" runat="server" ContentKey="0262611e-fae4-47bd-b7da-8a43eea68285" ContentItemKey="9e63d10a-7c7e-45e4-b27d-d3e5b0a77502" Title="New ContentHtml" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml" runat="server"><h2>Selected batch</h2></asp:Panel></CM:ContentHtml>
				<CM:QueryMenu ID="ciNewQueryMenuCommon" runat="server" ContentKey="0262611e-fae4-47bd-b7da-8a43eea68285" ContentItemKey="acac43b1-9943-41d0-947b-4efa3d226846" Title="New QueryMenuCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="20" PagerMode="Advanced" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="False" SourceFolderPathControl="$/Commerce/DefaultSystem/Queries/Batches/BatchInfo" SourceKey="f097fb4a-ab58-407c-9852-f64d3a96fd3b" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
				<CM:DataShowcase ID="ciNewDataShowcaseCommon" runat="server" ContentKey="0262611e-fae4-47bd-b7da-8a43eea68285" ContentItemKey="925814dd-891c-4e64-ab3c-aaf2fb20365b" Title="New DataShowcaseCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" Content="&lt;div style=&quot;text-align: center;&quot;&gt;&lt;a class=&quot;btn&quot; onclick=&quot;ShowDialog(&#39;[~]/PrintBatchTransactionSummary?Batch%20Number={#batch.BATCH_NUM}&#39;,null,&#39;90%&#39;,&#39;90%&#39;,&#39;Batch Transaction Summary&#39;,null,&#39;E&#39;,null,null,null,true,null,null);return false;&quot;&gt;Print Summary&lt;/a&gt;
&amp;nbsp;
&lt;a class=&quot;btn&quot; onclick=&quot;ShowDialog(&#39;[~]/PrintBatchTransactionDetails?Batch%20Number={#batch.BATCH_NUM}&#39;,null,&#39;90%&#39;,&#39;90%&#39;,&#39;Batch Transaction Details&#39;,null,&#39;E&#39;,null,null,null,true,null,null);return false;&quot;&gt;Print Details&lt;/a&gt;
&amp;nbsp;
&lt;a class=&quot;btn&quot; onclick=&quot;ShowDialog(&#39;[~]/PrintBatchTransactionSummaryByPaymentMethod?Batch%20Number={#batch.BATCH_NUM}&#39;,null,&#39;90%&#39;,&#39;90%&#39;,&#39;Batch Transaction Summary by Payment Method&#39;,null,&#39;E&#39;,null,null,null,true,null,null);return false;&quot;&gt;Print Summary by Payment Method&lt;/a&gt;
&amp;nbsp;
&lt;a class=&quot;btn&quot; onclick=&quot;ShowDialog(&#39;[~]/PrintBatchTransactionDetailsByPaymentMethod?Batch%20Number={#batch.BATCH_NUM}&#39;,null,&#39;90%&#39;,&#39;90%&#39;,&#39;Batch Transaction Details by Payment Method&#39;,null,&#39;E&#39;,null,null,null,true,null,null);return false;&quot;&gt;Print Details by Payment Method&lt;/a&gt;&lt;/div&gt;" SerializedDataSources="&lt;ArrayOfDataSource xmlns=&quot;http://schemas.datacontract.org/2004/07/Asi.Web.iParts.Common.DataShowcase&quot; xmlns:i=&quot;http://www.w3.org/2001/XMLSchema-instance&quot;&gt;&lt;DataSource&gt;&lt;DataSourceId&gt;batch&lt;/DataSourceId&gt;&lt;EntityTypeName&gt;Batch&lt;/EntityTypeName&gt;&lt;WhereProperty&gt;BATCH_NUM&lt;/WhereProperty&gt;&lt;WhereValue&gt;url:batchnum&lt;/WhereValue&gt;&lt;/DataSource&gt;&lt;/ArrayOfDataSource&gt;" HideOnError="False" />
				<CM:QueryMenu ID="ciNewQueryMenuCommon2" runat="server" ContentKey="0262611e-fae4-47bd-b7da-8a43eea68285" ContentItemKey="b35a35a5-3cb5-444c-a5a5-de1fc2afd8c0" Title="New QueryMenuCommon_2" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="True" MapResults="False" ListPageSize="20" PagerMode="Simple" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="$/Accounting/DefaultSystem/Queries/Batches/Batch Details" SourceKey="9cc5c257-aed5-4c28-b868-f412386e1ea9" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
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