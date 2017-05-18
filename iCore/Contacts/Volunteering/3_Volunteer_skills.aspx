<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Volunteer skills" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="PanelEditor" Src="~/iparts/Common/PanelEditor/PanelEditorDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("3b1311eb-774a-4e66-af74-b2ce254c144f"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("73f8c654-0475-4761-9918-4f82bf2f4a0d"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewContentHtml_8c3bd3f4eda84ce6bf534100683e78ee as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("8c3bd3f4-eda8-4ce6-bf53-4100683e78ee");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml_8c3bd3f4eda84ce6bf534100683e78ee);

		childUserControl = ciNewPanelEditorCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9066d6ca-4d54-432d-8e7a-e5f177c97927");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewPanelEditorCommon);

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
				<CM:ContentHtml ID="ciNewContentHtml_8c3bd3f4eda84ce6bf534100683e78ee" runat="server" ContentKey="3b1311eb-774a-4e66-af74-b2ce254c144f" ContentItemKey="8c3bd3f4-eda8-4ce6-bf53-4100683e78ee" Title="New ContentHtml" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml" runat="server"><p class="lead">Thanks! Now let us know about any skills and interests you have. Click the "+" icon to add a new entry for each interest. If you want to include a skill that's not in our list, select "Other" in the dropdown and describe your skill in the notes box.</p></asp:Panel></CM:ContentHtml>
				<CM:PanelEditor ID="ciNewPanelEditorCommon" runat="server" ContentKey="3b1311eb-774a-4e66-af74-b2ce254c144f" ContentItemKey="9066d6ca-4d54-432d-8e7a-e5f177c97927" Title="New PanelEditorCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="iPartChain LastPart" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PanelDefinitionId="c086ad78-2c17-45b4-becf-d1e2be67910f" AllowEdit="True" DefaultEditMode="False" CommitSequence="0" AllowDelete="True" AllowAdd="True" EditWindowWidth="800" EditWindowHeight="600" DisplayForAuthorizedUsersOnly="True" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" HidePanelWhenEmpty="False" ScrollingCellsEnabled="False" />
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