<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Donation importer" %>
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

	override public Guid ContentRecordKey { get { return new Guid("3e7abdbe-c330-45e0-8452-49e248dab9f0"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("d4fb3f82-6b34-4f15-900c-69d3f8d39149"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciImportdonations as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("dcb14ee4-16ee-4c1d-8c6d-ce55c1c6c679");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciImportdonations);

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
				<CM:FileImporterForWebServices ID="ciImportdonations" runat="server" ContentKey="3e7abdbe-c330-45e0-8452-49e248dab9f0" ContentItemKey="dcb14ee4-16ee-4c1d-8c6d-ce55c1c6c679" Title="Import donations" ShowTitleFlag="False" PageTitle="Import donations" DoNotRenderInDesignMode="False" ShowBorder="False" SelectedImportFileTypes="TabbedDelimitedFile" SelectedImportBuilderTypes="Donations" UseContractBuilders="True" />
				<CM:FileViewerForWebServices ID="ciProcessimportfiles" runat="server" ContentKey="3e7abdbe-c330-45e0-8452-49e248dab9f0" ContentItemKey="1a6ed6ab-36ad-4425-8110-6999e6e14250" Title="Process import files" ShowTitleFlag="False" PageTitle="Process import files" DoNotRenderInDesignMode="False" ShowBorder="False" BatchType="Donations" />
				<CM:LogViewerForWebServices ID="ciReviewlogfiles" runat="server" ContentKey="3e7abdbe-c330-45e0-8452-49e248dab9f0" ContentItemKey="0ea8712b-175c-4a24-b0b5-42888dc88f19" Title="Review log files" ShowTitleFlag="False" PageTitle="Review log files" DoNotRenderInDesignMode="False" ShowBorder="False" BatchType="Donations" />
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