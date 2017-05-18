<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Education_Staff" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_CertificationProgramHistory" Src="~/AsiCommon/Controls/CertificationManagement/CertificationProgramHistory.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_Defineavailablelocations" Src="~/AsiCommon/Controls/ExperienceManagement/LocationList.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("0a33c718-ab68-47f2-a56e-50a1b7cc3a0c"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("95d8c0e0-079d-44f1-a036-a85d9d70fd4a"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciCertificationProgramHistoryExplanation_3c8394c6effc4470b71faa14f89afc5b as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("3c8394c6-effc-4470-b71f-aa14f89afc5b");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCertificationProgramHistoryExplanation_3c8394c6effc4470b71faa14f89afc5b);

		childUserControl = ciCertificationProgramHistory as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("77662117-08ad-4613-9f6f-ef3b44bdfa9d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCertificationProgramHistory);

		childUserControl = ciDefineAvailableLocationsExplanation_a56a4584d9f5469ea522c137da9da8bd as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a56a4584-d9f5-469e-a522-c137da9da8bd");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDefineAvailableLocationsExplanation_a56a4584d9f5469ea522c137da9da8bd);

		childUserControl = ciDefineavailablelocations as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("41d44789-e205-4b33-93e4-17e59ab8bd2c");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDefineavailablelocations);

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
				<CM:ContentHtml ID="ciCertificationProgramHistoryExplanation_3c8394c6effc4470b71faa14f89afc5b" runat="server" ContentKey="0a33c718-ab68-47f2-a56e-50a1b7cc3a0c" ContentItemKey="3c8394c6-effc-4470-b71f-aa14f89afc5b" Title="Certification Program History Explanation" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_CertificationProgramHistoryExplanation" runat="server">Below is a list of the certification program history on your record:</asp:Panel></CM:ContentHtml>
				<asp:Panel ID="ste_container_CertificationProgramHistory" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_CertificationProgramHistory ID="ciCertificationProgramHistory" runat="server" ShowBorder="False" UseParentAtomObject="False" UseKeyFromURL="False" CommitSequence="0" /><asiweb:SurfToEditButtonPanel ID="ste_ciCertificationProgramHistory" runat="server" ContentKey="0a33c718-ab68-47f2-a56e-50a1b7cc3a0c" ContentItemKey="77662117-08ad-4613-9f6f-ef3b44bdfa9d" /></asp:Panel>
				<CM:ContentHtml ID="ciDefineAvailableLocationsExplanation_a56a4584d9f5469ea522c137da9da8bd" runat="server" ContentKey="0a33c718-ab68-47f2-a56e-50a1b7cc3a0c" ContentItemKey="a56a4584-d9f5-469e-a522-c137da9da8bd" Title="Define Available Locations Explanation" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_DefineAvailableLocationsExplanation" runat="server"><br />
<br />
<br />
Below you are able to add/edit/delete your available locations:</asp:Panel></CM:ContentHtml>
				<asp:Panel ID="ste_container_Defineavailablelocations" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_Defineavailablelocations ID="ciDefineavailablelocations" runat="server" ShowBorder="False" UseParentAtomObject="False" UseKeyFromURL="False" CommitSequence="0" /><asiweb:SurfToEditButtonPanel ID="ste_ciDefineavailablelocations" runat="server" ContentKey="0a33c718-ab68-47f2-a56e-50a1b7cc3a0c" ContentItemKey="41d44789-e205-4b33-93e4-17e59ab8bd2c" /></asp:Panel>
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