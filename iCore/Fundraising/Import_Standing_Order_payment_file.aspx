<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Import Standing Order payment file" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="FileImporterForWebServices" Src="~/iparts/Common/FileImporterForWebServices/FileImporterForWebServicesDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="FileViewerForWebServices" Src="~/iparts/Common/FileViewerForWebServices/FileViewerForWebServicesDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="LogViewerForWebServices" Src="~/iparts/Common/LogViewerForWebServices/LogViewerForWebServicesDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("b8a20014-5fd3-49ae-bee5-29aff2dbe132"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("ab2f886f-7a21-4b9d-a912-341a351583da"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciFileImporter as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("d2594619-e01f-478b-9082-ecb8e78580ea");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciFileImporter);

		childUserControl = ciFileViewer as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("903f0058-1cdf-42c2-9500-1e98a24e9778");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciFileViewer);

		childUserControl = ciLogViewer as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("3e299e6b-9eb4-45e7-90a4-a180f6af2c91");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciLogViewer);

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
				<CM:FileImporterForWebServices ID="ciFileImporter" runat="server" ContentKey="b8a20014-5fd3-49ae-bee5-29aff2dbe132" ContentItemKey="d2594619-e01f-478b-9082-ecb8e78580ea" Title="File Importer" ShowTitleFlag="False" PageTitle="" DoNotRenderInDesignMode="False" ShowBorder="False" SelectedImportFileTypes="StandingOrderPaymentsBACS" SelectedImportBuilderTypes="" UseContractBuilders="False" />
				<CM:FileViewerForWebServices ID="ciFileViewer" runat="server" ContentKey="b8a20014-5fd3-49ae-bee5-29aff2dbe132" ContentItemKey="903f0058-1cdf-42c2-9500-1e98a24e9778" Title="File Viewer" ShowTitleFlag="False" PageTitle="Files awaiting processing" DoNotRenderInDesignMode="False" ShowBorder="False" BatchType="StandingOrderPaymentsBACS" />
				<CM:LogViewerForWebServices ID="ciLogViewer" runat="server" ContentKey="b8a20014-5fd3-49ae-bee5-29aff2dbe132" ContentItemKey="3e299e6b-9eb4-45e7-90a4-a180f6af2c91" Title="Log Viewer" ShowTitleFlag="False" PageTitle="Log Viewer" DoNotRenderInDesignMode="False" ShowBorder="False" BatchType="StandingOrderPaymentsBACS" />
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