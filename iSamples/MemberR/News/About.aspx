<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="About Us" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="SocialShare" Src="~/iParts/Social/SocialShare/SocialShareDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentTaggedList" Src="~/AsiCommon/Controls/ContentManagement/DisplayTaggedList.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_Community" Src="~/AsiCommon/Controls/CommunityManagement/Forum/ForumHome.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("dc2bd180-1127-4485-8c61-11debb19306e"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("09b73b13-b8b2-45b6-8cc7-ada6ab889fd6"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciAboutUsSocialShare as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("3bb8f439-b51c-4a37-a13f-89ae53080bf7");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAboutUsSocialShare);

		childUserControl = ciOurOrganization_37b4b506815247dda0f827932e46db7c as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("37b4b506-8152-47dd-a0f8-27932e46db7c");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciOurOrganization_37b4b506815247dda0f827932e46db7c);

		AddChildUserControl(ContentPage2);

		childUserControl = ciNewContentTaggedList as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("3a7c5d06-f823-40dc-8fb7-3900d6c720cf");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentTaggedList);

		childUserControl = ciAdvocacy_761524a097e341f5949faa742d2b02ba as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("761524a0-97e3-41f5-949f-aa742d2b02ba");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAdvocacy_761524a097e341f5949faa742d2b02ba);

		AddChildUserControl(ContentPage3);

		childUserControl = ciCommunity as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6d1e21ec-6c5d-46af-b30d-7f679b666f8e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCommunity);

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
				<CM:SocialShare ID="ciAboutUsSocialShare" runat="server" ContentKey="dc2bd180-1127-4485-8c61-11debb19306e" ContentItemKey="3bb8f439-b51c-4a37-a13f-89ae53080bf7" Title="About Us Social Share" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" BorderVisible="False" UrlToShare="" IconDimension="16" LegendText="Share this page" />
				<CM:ContentHtml ID="ciOurOrganization_37b4b506815247dda0f827932e46db7c" runat="server" ContentKey="dc2bd180-1127-4485-8c61-11debb19306e" ContentItemKey="37b4b506-8152-47dd-a0f8-27932e46db7c" Title="Our Organization" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_OurOrganization" runat="server"><div class="ClearFix">
<div class="ContentBlockPrimary">
<div class="ContentBlockLeft">
<img alt="Our Organization" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/UploadedImages/HappyBusinessTeam.jpg" />
</div>
<div class="ContentBlockRight">
<h1 class="ContentTitle">Our Association</h1>
<p>We are the leading association for the industry. We help professionals develop their skills and further their careers by providing access to unique and relevant content and exclusive member services. We provide continuity and support, guidance and leadership development opportunities to over 200 local and regional chapters.</p>
<p>
Our independent non-profit association was created to provide leadership for the development, promotion, and improvement of our profession. Our strategic plan calls for continued work in the areas of advocacy, diversity, education, and organizational excellence.</p>
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>JoinNow" class="btn PrimaryButton LargeButton" style="float: right;">Become a member</a>
</div>
</div>
</div></asp:Panel></CM:ContentHtml>
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
				<CM:ContentTaggedList ID="ciNewContentTaggedList" runat="server" ContentKey="dc2bd180-1127-4485-8c61-11debb19306e" ContentItemKey="3a7c5d06-f823-40dc-8fb7-3900d6c720cf" Title="New ContentTaggedList" ShowTitleFlag="False" ListFormatKey="b0261208-6b29-4334-acf4-9a76a48b0e88" ShowTitleNoContentFlag="True" ListTitle="News" FilterByPropertyName="" DateRangeType="REL" RelNumDaysBefore="0" RelNumDaysAfter="0" FixedStartDate="1/1/0001 12:00:00 AM" FixedEndDate="1/1/0001 12:00:00 AM" SortByPropertyName="" MaxNumResults="5" ViewAllMessage="View all" ViewAllCssClass="" IncludeSocialSharingIcons="False" TagMatchType="ANY" SortType="ASC" SelectedTags="ec401384-08e9-4c44-8f63-5041282c288e" />
				<CM:ContentHtml ID="ciAdvocacy_761524a097e341f5949faa742d2b02ba" runat="server" ContentKey="dc2bd180-1127-4485-8c61-11debb19306e" ContentItemKey="761524a0-97e3-41f5-949f-aa742d2b02ba" Title="Advocacy" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Advocacy" runat="server"><div class="PanelHead Distinguish">
<span class="PanelTitle">Advocacy</span>
</div>
<p style="padding-top: 10px;">
We advocate by uniting members around the world to work on the most important issues facing the profession.</p>
<br />
<p>We initiate and manage programs with governmental and non-governmental agencies, presenting industry positions and supporting documentation on key issues.</p></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<asp:Panel ID="ste_container_Community" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_Community ID="ciCommunity" runat="server" CommunityDocumentKey="81fcd2d3-acbe-4f54-9947-6aa2bcd407ff" ShowParentLink="False" ShowBorder="False" UseParentAtomObject="False" UseKeyFromURL="False" CommitSequence="0" /><asiweb:SurfToEditButtonPanel ID="ste_ciCommunity" runat="server" ContentKey="dc2bd180-1127-4485-8c61-11debb19306e" ContentItemKey="6d1e21ec-6c5d-46af-b30d-7f679b666f8e" /></asp:Panel>
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