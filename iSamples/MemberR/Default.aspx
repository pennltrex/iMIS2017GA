<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Home" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="ProgressTracker" Src="~/iparts/Common/ProgressTracker/ProgressTrackerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentTaggedList" Src="~/AsiCommon/Controls/ContentManagement/DisplayTaggedList.ascx" %>
<%@ Register TagPrefix="CM" TagName="RelatedItems" Src="~/iparts/Common/RelatedItems/RelatedItemsDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("8e48f3d0-7af0-4777-8c3d-36719f9ce0a0"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("5fb06c7e-01f8-4705-bd40-adbd7a52749c"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciSpotlight_cd6fef81724c44d08a0f773eca65df90 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("cd6fef81-724c-44d0-8a0f-773eca65df90");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSpotlight_cd6fef81724c44d08a0f773eca65df90);

		AddChildUserControl(ContentPage2);

		childUserControl = ciSpotlight2_538f7ef7ae064977bd5f36842e6a9ce9 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("538f7ef7-ae06-4977-bd5f-36842e6a9ce9");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSpotlight2_538f7ef7ae064977bd5f36842e6a9ce9);

		AddChildUserControl(ContentPage3);

		childUserControl = ciSpotlight3_c783df76775142149a75afeaa2b710e5 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("c783df76-7751-4214-9a75-afeaa2b710e5");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSpotlight3_c783df76775142149a75afeaa2b710e5);

		AddChildUserControl(ContentPage4);

		childUserControl = ciMemberCount as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("897ae6f4-5879-4b16-8e48-df1185e1e569");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMemberCount);

		childUserControl = ciMemberBenefits_a7695dd5fd3e451fb3a9a7bb3febaa93 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a7695dd5-fd3e-451f-b3a9-a7bb3febaa93");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMemberBenefits_a7695dd5fd3e451fb3a9a7bb3febaa93);

		AddChildUserControl(ContentPage5);

		childUserControl = ciNewContentHtml2_3a7f78580aab40cfbebfe613901e8463 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("3a7f7858-0aab-40cf-bebf-e613901e8463");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml2_3a7f78580aab40cfbebfe613901e8463);

		AddChildUserControl(ContentPage6);

		childUserControl = ciNews as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("fb4c5582-576c-4d15-8e1a-a8df3d895d1b");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNews);

		AddChildUserControl(ContentPage7);

		childUserControl = ciNewContentHtml_089bf782e25c4380a0541fead0fc297d as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("089bf782-e25c-4380-a054-1fead0fc297d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml_089bf782e25c4380a0541fead0fc297d);

		AddChildUserControl(ContentPage8);

		childUserControl = ciUpcomingEvents as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("dfcbfc3f-ffed-4a24-af60-088b0f388f7a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciUpcomingEvents);

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
	<div class="FullWidthArea-StyleBg1">
		<div class="container-inner">
			<div class="row">
				<div class="col-sm-4">
								<CM:ContentPage ID="ContentPage1" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone1_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciSpotlight_cd6fef81724c44d08a0f773eca65df90" runat="server" ContentKey="8e48f3d0-7af0-4777-8c3d-36719f9ce0a0" ContentItemKey="cd6fef81-724c-44d0-8a0f-773eca65df90" Title="Spotlight" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Spotlight" runat="server"><div class="Spotlight">
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>ItemDetail?iProductCode=FR002"><img alt="Going Mobile Workbook" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Member/GoingMobileSpotlight_2.png" /><br />
<span class="SectionLabel">Going Mobile Workbook</span>
</a>
<p>The Going Mobile Workbook has everything you need to know to get your mobile strategy up and going. Members receive a 10% discount on this book.</p>
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>ItemDetail?iProductCode=FR002" class="TextButton">Learn more »</a>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

				</div>
				<div class="col-sm-4">
								<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciSpotlight2_538f7ef7ae064977bd5f36842e6a9ce9" runat="server" ContentKey="8e48f3d0-7af0-4777-8c3d-36719f9ce0a0" ContentItemKey="538f7ef7-ae06-4977-bd5f-36842e6a9ce9" Title="Spotlight2" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Spotlight2" runat="server"><div class="Spotlight">
<a href="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>imisannualconference"><img alt="Boat in Cairns" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Member/AnnualConferenceSpotlight_2.png" /><br />
<span class="SectionLabel">Annual Conference</span>
</a>
<p>This year's Annual Conference is fast-approaching. Sessions this year include tips for industry success and a technology exhibit. Don't miss out!</p>
<a href="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>iMISAnnualConference/Registration/iSamples/AnnualConference/Registration.aspx" class="TextButton">Register now »</a>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

				</div>
				<div class="col-sm-4">
								<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciSpotlight3_c783df76775142149a75afeaa2b710e5" runat="server" ContentKey="8e48f3d0-7af0-4777-8c3d-36719f9ce0a0" ContentItemKey="c783df76-7751-4214-9a75-afeaa2b710e5" Title="Spotlight3" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Spotlight3" runat="server"><div class="Spotlight">
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>iSamples/Member/Benefits.aspx"><img alt="Smiling member" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Member/membershipspotlight_2.png" /><br />
<span class="SectionLabel">Become a Member</span>
</a>
<p>Members enjoy many benefits including networking opportunities, discounts on events and in the shop and up-to-date information on industry news. Join us today!</p>
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>iSamples/Member/Benefits.aspx" class="TextButton">Join now »</a>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

				</div>
			</div>
		</div>
	</div>
	<div class="FullWidthArea-StyleBg2">
		<div class="container-inner">
			<div class="row">
				<div class="col-sm-6">
								<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciMemberCount" runat="server" ContentKey="8e48f3d0-7af0-4777-8c3d-36719f9ce0a0" ContentItemKey="897ae6f4-5879-4b16-8e48-df1185e1e569" Title="Member Count" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="ProgressTracker2 NoPanelPadding" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="" ListSourceQuery="$/Samples/ProgressTracker/Progress Tracker - Total Active Members" DataColumnName="(None)" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="members strong" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="" SuccessfulMessage="" />
				<CM:ContentHtml ID="ciMemberBenefits_a7695dd5fd3e451fb3a9a7bb3febaa93" runat="server" ContentKey="8e48f3d0-7af0-4777-8c3d-36719f9ce0a0" ContentItemKey="a7695dd5-fd3e-451f-b3a9-a7bb3febaa93" Title="Member Benefits" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_MemberBenefits" runat="server"><div class="iPartChain MiddlePart">
Join us today and become a part of our growing community.<br />
Benefits of membership include:<br />
<ul>
    <li>Instant connections to our growing community of over 2,000 members.</li>
    <li>Discounts on products and events</li>
    <li>Early registration opportunities</li>
    <li>Access to the comprehensive Resource Library</li>
    <li>... and much more!</li>
</ul>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

				</div>
				<div class="col-sm-6">
								<CM:ContentPage ID="ContentPage5" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone5_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone TestimonialArea">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciNewContentHtml2_3a7f78580aab40cfbebfe613901e8463" runat="server" ContentKey="8e48f3d0-7af0-4777-8c3d-36719f9ce0a0" ContentItemKey="3a7f7858-0aab-40cf-bebf-e613901e8463" Title="New ContentHtml_2" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml2" runat="server"><img alt="Alex Kuznetsov Testimonial" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>/images/SampleSites/Member/AlexKuznetsov.jpg" width="100" />
<blockquote>" I've always considered my membership a great investment. It's not just the opportunities to connect and learn - or how iMIS has allowed my voice to be heard - but it's the little things too, like being in the National Membership Achievement Program." <em>-Alex Kuznetsov</em></blockquote></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

				</div>
			</div>
		</div>
	</div>
	<div class="FullWidthArea-StyleBg3">
		<div class="container-inner">
			<div class="row">
				<div class="col-sm-12">
								<CM:ContentPage ID="ContentPage6" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone6_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentTaggedList ID="ciNews" runat="server" ContentKey="8e48f3d0-7af0-4777-8c3d-36719f9ce0a0" ContentItemKey="fb4c5582-576c-4d15-8e1a-a8df3d895d1b" Title="News" ShowTitleFlag="False" ListFormatKey="b0261208-6b29-4334-acf4-9a76a48b0e88" ShowTitleNoContentFlag="False" ListTitle="Latest News" FilterByPropertyName="" DateRangeType="REL" RelNumDaysBefore="0" RelNumDaysAfter="0" FixedStartDate="1/1/0001 12:00:00 AM" FixedEndDate="1/1/0001 12:00:00 AM" SortByPropertyName="PublishedDateTime" MaxNumResults="3" ViewAllMessage="View all &amp;raquo;" ViewAllCssClass="TextButton" IncludeSocialSharingIcons="False" TagMatchType="ANY" SortType="DESC" SelectedTags="ec401384-08e9-4c44-8f63-5041282c288e" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

				</div>
			</div>
		</div>
	</div>
	<div class="FullWidthArea-StyleBg4">
		<div class="container-inner">
			<div class="row">
				<div class="col-sm-12">
								<CM:ContentPage ID="ContentPage7" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone7_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciNewContentHtml_089bf782e25c4380a0541fead0fc297d" runat="server" ContentKey="8e48f3d0-7af0-4777-8c3d-36719f9ce0a0" ContentItemKey="089bf782-e25c-4380-a054-1fead0fc297d" Title="New ContentHtml" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml" runat="server"><blockquote>"Very interesting and exciting to share ideas with other members and see what other companies are doing"<em>- Patricia Ballinger</em></blockquote></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

				</div>
			</div>
		</div>
	</div>
	<div class="FullWidthArea-StyleBg5">
		<div class="container-inner">
			<div class="row">
				<div class="col-sm-12">
								<CM:ContentPage ID="ContentPage8" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone8_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone UpcomingEventsHome">
					<ZoneTemplate>
				<CM:RelatedItems ID="ciUpcomingEvents" runat="server" ContentKey="8e48f3d0-7af0-4777-8c3d-36719f9ce0a0" ContentItemKey="dfcbfc3f-ffed-4a24-af60-088b0f388f7a" Title="Upcoming Events" ShowTitleFlag="False" PartTitle="Upcoming Events" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" NoRecordsFound="No upcoming events found" ListDescription="" MaxRecords="4" ImageDimension="85" ClickUrl="EventDetail?EventKey={key_Id}" ImagePath="" DefaultImage="~/AsiCommon/images/BSA/icon_event.png" DisplayOrientation="Horizontal" DisplayNameOption="Label" QueryStringParameterName="" ListSourceQuery="$/Samples/RelatedItems/Upcoming Events" DataColumnName="" LabelMaxLength="50" EnableHorizontalScrolling="False" HorizontalScrollWidth="0" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

				</div>
			</div>
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