﻿<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Search" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="CommonSearch" Src="~/iParts/Common/Search/SearchDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">
	<meta name="Description" content="The default search page for the iMIS application and its content." />

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("5ad71ee6-102e-4d19-9294-83caf6fe96f6"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("bff5c412-0cbb-401b-a5db-6db4862d39be"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciSearchresults as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("4ff9bbda-62fa-4aa3-b896-9b8ec7f94a31");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSearchresults);

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
				<CM:CommonSearch ID="ciSearchresults" runat="server" ContentKey="5ad71ee6-102e-4d19-9294-83caf6fe96f6" ContentItemKey="4ff9bbda-62fa-4aa3-b896-9b8ec7f94a31" Title="Search results" ShowTitleFlag="False" PartTitle="Search results" DoNotRenderInDesignMode="False" CssClass="GridCardStyle" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayTextBox="True" DisplayInactiveResultsCheckBox="True" InitialDisplay="True" InitialText="" InitialLogic="And" SearchLabel="Search" DisplayAreaOptions="True" Options="All,Community,Content,Donation,Event,Organization,People,Post,Product" InitialArea="All" ErrorMsg="There was a problem running your search. Please try again." ExceedResultsMsg="Your search criteria returned over {0} records. To see more results, please modify your query to add more criteria." MaxResults="1000" NoResultMsg="No search results match your specified criteria. Please try again with fewer or different criteria." PageSize="15" Sort="PublicationDate_DESC" Tags="" PagerMode="NextPrevAndNumeric" PagerDisplay="Both" AddContentItem="00000000-0000-0000-0000-000000000000" />
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