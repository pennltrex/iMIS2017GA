<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Friendraising Imports" %>
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

	override public Guid ContentRecordKey { get { return new Guid("f923d314-33e7-4cb7-baf2-dae3728bf744"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("b55a9953-e054-4d8a-9705-e155b8b43d7b"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciFileImporter as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a0f019d0-9b23-4398-aad4-19ac41657d2c");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciFileImporter);

		childUserControl = ciFileViewer as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("cb70ca29-600c-4f11-bdfd-4b120738d478");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciFileViewer);

		childUserControl = ciLogViewer as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("bf69e801-7d21-415b-8b61-550686d87964");
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
				<CM:FileImporterForWebServices ID="ciFileImporter" runat="server" ContentKey="f923d314-33e7-4cb7-baf2-dae3728bf744" ContentItemKey="a0f019d0-9b23-4398-aad4-19ac41657d2c" Title="File Importer" ShowTitleFlag="False" PageTitle="Friendraising Imports" DoNotRenderInDesignMode="False" ShowBorder="False" SelectedImportFileTypes="GenericFileType" SelectedImportBuilderTypes="" UseContractBuilders="False" />
				<CM:FileViewerForWebServices ID="ciFileViewer" runat="server" ContentKey="f923d314-33e7-4cb7-baf2-dae3728bf744" ContentItemKey="cb70ca29-600c-4f11-bdfd-4b120738d478" Title="File Viewer" ShowTitleFlag="False" PageTitle="" DoNotRenderInDesignMode="False" ShowBorder="False" BatchType="GenericFileType" />
				<CM:LogViewerForWebServices ID="ciLogViewer" runat="server" ContentKey="f923d314-33e7-4cb7-baf2-dae3728bf744" ContentItemKey="bf69e801-7d21-415b-8b61-550686d87964" Title="Log Viewer" ShowTitleFlag="False" PageTitle="" DoNotRenderInDesignMode="False" ShowBorder="False" BatchType="GenericFileType" />
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