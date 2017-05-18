<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Source code importer" %>
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

	override public Guid ContentRecordKey { get { return new Guid("23863721-974b-4ff8-9188-02d80afb291b"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("5d839bed-c8bf-4d94-a7e9-349e51c32763"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciImportsourcecodes as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("dcb14ee4-16ee-4c1d-8c6d-ce55c1c6c679");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciImportsourcecodes);

		childUserControl = ciProcessimportfiles as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("1a6ed6ab-36ad-4425-8110-6999e6e14250");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciProcessimportfiles);

		childUserControl = ciReviewlogfiles as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("0ea8712b-175c-4a24-b0b5-42888dc88f19");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciReviewlogfiles);

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
				<CM:FileImporterForWebServices ID="ciImportsourcecodes" runat="server" ContentKey="23863721-974b-4ff8-9188-02d80afb291b" ContentItemKey="dcb14ee4-16ee-4c1d-8c6d-ce55c1c6c679" Title="Import source codes" ShowTitleFlag="False" PageTitle="Import source codes" DoNotRenderInDesignMode="False" ShowBorder="False" SelectedImportFileTypes="TabbedDelimitedFile" SelectedImportBuilderTypes="Source Codes" UseContractBuilders="True" />
				<CM:FileViewerForWebServices ID="ciProcessimportfiles" runat="server" ContentKey="23863721-974b-4ff8-9188-02d80afb291b" ContentItemKey="1a6ed6ab-36ad-4425-8110-6999e6e14250" Title="Process import files" ShowTitleFlag="False" PageTitle="Process import files" DoNotRenderInDesignMode="False" ShowBorder="False" BatchType="Source Codes" />
				<CM:LogViewerForWebServices ID="ciReviewlogfiles" runat="server" ContentKey="23863721-974b-4ff8-9188-02d80afb291b" ContentItemKey="0ea8712b-175c-4a24-b0b5-42888dc88f19" Title="Review log files" ShowTitleFlag="False" PageTitle="Review log files" DoNotRenderInDesignMode="False" ShowBorder="False" BatchType="Source Codes" />
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