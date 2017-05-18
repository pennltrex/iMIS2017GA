<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Communication Preferences Settings" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_CommunicationPreferencesSettings" Src="~/iparts/Contact Management/CommunicationPreferencesEditor/CommunicationTypes.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_UserMessages" Src="~/iparts/Contact Management/CommunicationPreferencesEditor/UserMessages.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("131fbc8b-cf43-473e-8bf0-12acb94ce791"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("3ac2477d-447b-467e-91ff-e534a969e894"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciCommunicationPreferencesSettings as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("73613dd0-66fb-44a1-a398-644b3e69a3fc");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCommunicationPreferencesSettings);

		childUserControl = ciUserMessages as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("d5d45101-cefc-4038-8c9e-3e8ea628cf07");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciUserMessages);

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
			<div ID="WebPartZone1Header" runat="server" class="PanelTitle">Communication preferences settings</div>
			<CM:ContentPage ID="ContentPage1" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone1_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<asp:Panel ID="ste_container_CommunicationPreferencesSettings" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_CommunicationPreferencesSettings ID="ciCommunicationPreferencesSettings" runat="server" ShowBorder="False" UseParentAtomObject="False" UseKeyFromURL="False" CommitSequence="0" /><asiweb:SurfToEditButtonPanel ID="ste_ciCommunicationPreferencesSettings" runat="server" ContentKey="131fbc8b-cf43-473e-8bf0-12acb94ce791" ContentItemKey="73613dd0-66fb-44a1-a398-644b3e69a3fc" /></asp:Panel>
				<asp:Panel ID="ste_container_UserMessages" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_UserMessages ID="ciUserMessages" runat="server" ShowBorder="False" UseParentAtomObject="False" UseKeyFromURL="False" CommitSequence="0" /><asiweb:SurfToEditButtonPanel ID="ste_ciUserMessages" runat="server" ContentKey="131fbc8b-cf43-473e-8bf0-12acb94ce791" ContentItemKey="d5d45101-cefc-4038-8c9e-3e8ea628cf07" /></asp:Panel>
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