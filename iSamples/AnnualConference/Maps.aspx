<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Maps" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("49064c13-ef93-495b-91bb-4a0885258b37"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("1b6a108c-de92-42ce-a83c-f9b1023892db"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciMaps_bb5b55b0221c484cae8d88a7e56d89c0 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("bb5b55b0-221c-484c-ae8d-88a7e56d89c0");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMaps_bb5b55b0221c484cae8d88a7e56d89c0);

		AddChildUserControl(ContentPage2);

		childUserControl = ciMaps1_564ba47374c64a60b02ea1f01e4a1592 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("564ba473-74c6-4a60-b02e-a1f01e4a1592");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMaps1_564ba47374c64a60b02ea1f01e4a1592);

		AddChildUserControl(ContentPage3);

		childUserControl = ciExhibitHallMap_7aca392dfa0e4ad48f7defff1c79de40 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("7aca392d-fa0e-4ad4-8f7d-efff1c79de40");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciExhibitHallMap_7aca392dfa0e4ad48f7defff1c79de40);

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
				<CM:ContentHtml ID="ciMaps_bb5b55b0221c484cae8d88a7e56d89c0" runat="server" ContentKey="49064c13-ef93-495b-91bb-4a0885258b37" ContentItemKey="bb5b55b0-221c-484c-ae8d-88a7e56d89c0" Title="Maps" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Maps" runat="server"><h1>Resources: Maps</h1></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciMaps1_564ba47374c64a60b02ea1f01e4a1592" runat="server" ContentKey="49064c13-ef93-495b-91bb-4a0885258b37" ContentItemKey="564ba473-74c6-4a60-b02e-a1f01e4a1592" Title="Maps_1" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Maps1" runat="server"><h2>Meeting Room Map</h2>
<img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/UploadedImages/MicrositeRoomMap.gif" style="width: 326px; height: 376px;" /><br /></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciExhibitHallMap_7aca392dfa0e4ad48f7defff1c79de40" runat="server" ContentKey="49064c13-ef93-495b-91bb-4a0885258b37" ContentItemKey="7aca392d-fa0e-4ad4-8f7d-efff1c79de40" Title="Exhibit Hall Map" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_ExhibitHallMap" runat="server"><h2>Exhibit Hall Map</h2>
<img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/UploadedImages/ExhibitHallLayout.png" style="width: 347px; height: 527px;" /><br /></asp:Panel></CM:ContentHtml>
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