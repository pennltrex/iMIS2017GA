﻿<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Not recently engaged" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryMenu" Src="~/iparts/Common/QueryMenu/QueryMenuDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("dd8fa233-a98e-4462-936d-13ecf770778d"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("830c998f-a2fe-4300-86cc-407ded7e8c86"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewContentHtml_772f1b4061124f24b1d49e92110b1a7f as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("772f1b40-6112-4f24-b1d4-9e92110b1a7f");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml_772f1b4061124f24b1d49e92110b1a7f);

		childUserControl = ciNotrecentlyengaged as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("b8082e3c-1696-4df9-bad8-a70f98f1b57c");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNotrecentlyengaged);

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
				<CM:ContentHtml ID="ciNewContentHtml_772f1b4061124f24b1d49e92110b1a7f" runat="server" ContentKey="dd8fa233-a98e-4462-936d-13ecf770778d" ContentItemKey="772f1b40-6112-4f24-b1d4-9e92110b1a7f" Title="New ContentHtml" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml" runat="server">Contacts with a high engagement score who have not been engaged for at least 6 months.</asp:Panel></CM:ContentHtml>
				<CM:QueryMenu ID="ciNotrecentlyengaged" runat="server" ContentKey="dd8fa233-a98e-4462-936d-13ecf770778d" ContentItemKey="b8082e3c-1696-4df9-bad8-a70f98f1b57c" Title="Not recently engaged" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="False" MapResults="False" ListPageSize="30" PagerMode="NextPrevAndNumeric" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="False" SourceFolderPathControl="$/Samples/Dashboards/Engagement/Not recently engaged" SourceKey="02eeec04-f682-49f9-9955-31ae362f349e" ReloadRefresh="False" EnableEmailMerge="True" AutoRun="False" />
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