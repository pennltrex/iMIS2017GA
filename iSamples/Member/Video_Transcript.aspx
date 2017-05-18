<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Video Transcript: Guide Dogs Foundation Success with iMIS" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="SocialShare" Src="~/iParts/Social/SocialShare/SocialShareDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="YouTubeVideo" Src="~/iparts/Common/YouTubeVideo/YouTubeVideoDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="BigButtonPanel" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/DisplayBigButtonPanel.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("6bf6e480-6582-43fa-973c-877f9f0920f6"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("d0aeee36-b659-452c-9c20-32fa781f03bc"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciVideoTranscriptSocialShare as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("94ae0249-94a3-4f84-9cba-36f0e85410c7");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciVideoTranscriptSocialShare);

		childUserControl = ciVideoTitle_ae83a2a96cac490bbec223100e39cd49 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("ae83a2a9-6cac-490b-bec2-23100e39cd49");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciVideoTitle_ae83a2a96cac490bbec223100e39cd49);

		childUserControl = ciGuideDogsFoundationSuccesswithiMIS as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("578ece6c-ff36-4731-86a9-2237e9e0adee");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciGuideDogsFoundationSuccesswithiMIS);

		childUserControl = ciVideoTranscript_a5e5e28867444e668fd9d46db0f98ac7 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a5e5e288-6744-4e66-8fd9-d46db0f98ac7");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciVideoTranscript_a5e5e28867444e668fd9d46db0f98ac7);

		AddChildUserControl(ContentPage2);

		AddChildUserControl(ContentPage3);

		AddChildUserControl(ContentPage4);

		childUserControl = ciReturntoAboutUspage as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("7d6e9d2c-133d-44aa-b1dd-96ad33eaa425");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciReturntoAboutUspage);

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
				<CM:SocialShare ID="ciVideoTranscriptSocialShare" runat="server" ContentKey="6bf6e480-6582-43fa-973c-877f9f0920f6" ContentItemKey="94ae0249-94a3-4f84-9cba-36f0e85410c7" Title="Video Transcript Social Share" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" BorderVisible="False" UrlToShare="" IconDimension="16" LegendText="Share this page" />
				<CM:ContentHtml ID="ciVideoTitle_ae83a2a96cac490bbec223100e39cd49" runat="server" ContentKey="6bf6e480-6582-43fa-973c-877f9f0920f6" ContentItemKey="ae83a2a9-6cac-490b-bec2-23100e39cd49" Title="Video Title" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_VideoTitle" runat="server"><h2>Guide Dog Foundation for the Blind and America's VetDogs | Success with iMIS</h2></asp:Panel></CM:ContentHtml>
				<CM:YouTubeVideo ID="ciGuideDogsFoundationSuccesswithiMIS" runat="server" ContentKey="6bf6e480-6582-43fa-973c-877f9f0920f6" ContentItemKey="578ece6c-ff36-4731-86a9-2237e9e0adee" Title="Guide Dogs Foundation Success with iMIS" ShowTitleFlag="False" PageTitle="" DoNotRenderInDesignMode="False" ShowBorder="False" YouTubeUrl="http://www.youtube.com/watch?v=XXWgoVDx1II" AutoPlay="False" HideControls="False" Width="475" Height="400" />
				<CM:ContentHtml ID="ciVideoTranscript_a5e5e28867444e668fd9d46db0f98ac7" runat="server" ContentKey="6bf6e480-6582-43fa-973c-877f9f0920f6" ContentItemKey="a5e5e288-6744-4e66-8fd9-d46db0f98ac7" Title="Video Transcript" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_VideoTranscript" runat="server"><h2><span style="font-size: 17px; font-family: arial, helvetica, clean, sans-serif;">Transcript</span></h2>
I'm Wells Jones. I'm Chief Executive Officer of both the Guide Dog Foundation for the Blind and America's VetDogs, the veteran's canine corps.<br />
<br />
The Guide Dog Foundation's mission is to improve the quality of life for people who are blind or visually impaired or who have other special needs, and America's VetDogs' mission is to improve the quality of life for those who have served our country honorably.<br />
<br />
Due to the economy and other conditions, we've certainly had to make a number of changes. We've had to take a look at reducing our staff costs and have done some things to try and reduce staff without reducing services and without hurting the services we provide to our clients. We've also tried to look more creatively at how we raise funds. <br />
<br />
We use iMIS in many ways to assist many departments. iMIS is our basic name and address recordkeeping system, first of all. Anyone who is a constituent at the Guide Dog Foundation exists in iMIS. iMIS is very key in bringing all of that information together. If a person purchases an item from us, then that's also being tracked in iMIS. iMIS prepares the General Ledger batches, the Accounts Receivable batches for both organizations (America's VetDogs and the Guide Dog Foundation), and transfers them straight into our General Ledger.<br />
<br />
iMIS tracks all of our volunteers and specific information about our volunteers. We're able to keep close track on what's happening with our contributions, how many gifts we're receiving, how much those gifts are, what appeals they're coming in response to. iMIS helps us be more productive by, first of all, integrating all of the information across platforms. <br />
<br />
Our revenue is rising. We have revenue coming from new sources. That's exciting! We have had increased program service success. We've made some exciting placements. We're also very pleased with the growth of the volunteer programs and how many different ways volunteers are able to work with us and help our program. <br />
<br />
In each of those ways, iMIS has assisted us in accomplishing those successes. It gives us the ability to spread our message to every corner and crevice around the world to let people know what we're doing and the difference that people can help us make in others' lives. This has been a great year! </asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
	</div>
	<div class="row">
		<div class="col-sm-4">
						<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-4">
						<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-4">
						<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:BigButtonPanel ID="ciReturntoAboutUspage" runat="server" ContentKey="6bf6e480-6582-43fa-973c-877f9f0920f6" ContentItemKey="7d6e9d2c-133d-44aa-b1dd-96ad33eaa425" Title="Return to About Us page" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="Navigation" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="False" Links="&quot;@/iSamples/Member/About|Return to About Us page&quot;" />
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