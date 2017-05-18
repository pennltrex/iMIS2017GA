<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Home" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentTaggedList" Src="~/AsiCommon/Controls/ContentManagement/DisplayTaggedList.ascx" %>
<%@ Register TagPrefix="CM" TagName="RelatedItems" Src="~/iparts/Common/RelatedItems/RelatedItemsDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ProgressTracker" Src="~/iparts/Common/ProgressTracker/ProgressTrackerDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("22374b4a-69a6-4f99-808e-29b639c4cff2"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("e0b86572-277d-4090-9581-79cf7e7ca473"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciSpotlight_e65961212c7a49b68afc30d49e51d828 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e6596121-2c7a-49b6-8afc-30d49e51d828");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSpotlight_e65961212c7a49b68afc30d49e51d828);

		AddChildUserControl(ContentPage2);

		childUserControl = ciNews as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("8cc46ee2-56d3-43a6-871f-61203a85a3c5");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNews);

		childUserControl = ciUpcomingEvents as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("64458c84-b8e5-4ed5-b118-0d60023fd5a1");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciUpcomingEvents);

		AddChildUserControl(ContentPage3);

		childUserControl = ciMemberCount as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("83bc4864-2a80-4457-8131-a84c6b4f8339");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMemberCount);

		childUserControl = ciMemberBenefits_d75e088abaac43d393220fb72a906e9b as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("d75e088a-baac-43d3-9322-0fb72a906e9b");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMemberBenefits_d75e088abaac43d393220fb72a906e9b);

		AddChildUserControl(ContentPage4);

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
				<CM:ContentHtml ID="ciSpotlight_e65961212c7a49b68afc30d49e51d828" runat="server" ContentKey="22374b4a-69a6-4f99-808e-29b639c4cff2" ContentItemKey="e6596121-2c7a-49b6-8afc-30d49e51d828" Title="Spotlight" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Spotlight" runat="server"><div class="ClearFix SpotlightRow ThreeAcross">
<div class="Spotlight">
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>ItemDetail?iProductCode=FR002" style="font-size: 14px; line-height: 1.428571429;"></a>
<img alt="Going Mobile Workbook" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Member/GoingMobileSpotlight_2.png" /><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>ItemDetail?iProductCode=FR002"><br />
<span class="SectionLabel">Going Mobile Workbook</span>
</a>
<p>The Going Mobile Workbook has everything you need to know to get your mobile strategy up and going. Members receive a 10% discount on this book.</p>
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>ItemDetail?iProductCode=FR002" class="TextButton">Learn more »</a>
</div>
<div class="Spotlight">
<a href="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>imisannualconference"><img alt="Boat in Cairns" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Member/AnnualConferenceSpotlight_2.png" /><br />
<span class="SectionLabel">Annual Conference</span>
</a>
<p>This year's Annual Conference is fast-approaching. Sessions this year include tips for industry success and a technology exhibit. Don't miss out!</p>
<a href="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>iMISAnnualConference/Registration/iSamples/AnnualConference/Registration.aspx" class="TextButton">Register now »</a>
</div>
<div class="Spotlight">
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>iSamples/Member/Benefits.aspx"><img alt="Smiling member" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Member/membershipspotlight_2.png" /><br />
<span class="SectionLabel">Become a Member</span>
</a>
<p>Members enjoy many benefits including networking opportunities, discounts on events and in the shop and up-to-date information on industry news. Join us today!</p>
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>iSamples/Member/Benefits.aspx" class="TextButton">Join now »</a>
</div>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
<div class="row">
    <div class="col-sm-9">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentTaggedList ID="ciNews" runat="server" ContentKey="22374b4a-69a6-4f99-808e-29b639c4cff2" ContentItemKey="8cc46ee2-56d3-43a6-871f-61203a85a3c5" Title="News" ShowTitleFlag="False" ListFormatKey="b0261208-6b29-4334-acf4-9a76a48b0e88" ShowTitleNoContentFlag="False" ListTitle="LATEST NEWS" FilterByPropertyName="" DateRangeType="REL" RelNumDaysBefore="0" RelNumDaysAfter="0" FixedStartDate="1/1/0001 12:00:00 AM" FixedEndDate="1/1/0001 12:00:00 AM" SortByPropertyName="PublishedDateTime" MaxNumResults="3" ViewAllMessage="View all &amp;raquo;" ViewAllCssClass="TextButton" IncludeSocialSharingIcons="False" TagMatchType="ANY" SortType="DESC" SelectedTags="ec401384-08e9-4c44-8f63-5041282c288e" />
				<CM:RelatedItems ID="ciUpcomingEvents" runat="server" ContentKey="22374b4a-69a6-4f99-808e-29b639c4cff2" ContentItemKey="64458c84-b8e5-4ed5-b118-0d60023fd5a1" Title="Upcoming Events" ShowTitleFlag="False" PartTitle="Don&#39;t miss these upcoming events" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" NoRecordsFound="No results found" ListDescription="" MaxRecords="15" ImageDimension="85" ClickUrl="EventDetail?EventKey={key_Id}" ImagePath="" DefaultImage="~/AsiCommon/images/BSA/icon_event.png" DisplayOrientation="Horizontal" DisplayNameOption="Label" QueryStringParameterName="" ListSourceQuery="$/Samples/RelatedItems/Upcoming Events" DataColumnName="" LabelMaxLength="50" EnableHorizontalScrolling="True" HorizontalScrollWidth="0" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-3">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciMemberCount" runat="server" ContentKey="22374b4a-69a6-4f99-808e-29b639c4cff2" ContentItemKey="83bc4864-2a80-4457-8131-a84c6b4f8339" Title="Member Count" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="ProgressTracker2 NoPanelPadding" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="" ListSourceQuery="$/Samples/ProgressTracker/Progress Tracker - Total Active Members" DataColumnName="(None)" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="members strong" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="" SuccessfulMessage="" />
				<CM:ContentHtml ID="ciMemberBenefits_d75e088abaac43d393220fb72a906e9b" runat="server" ContentKey="22374b4a-69a6-4f99-808e-29b639c4cff2" ContentItemKey="d75e088a-baac-43d3-9322-0fb72a906e9b" Title="Member Benefits" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_MemberBenefits" runat="server"><div class="iPartChain MiddlePart">
<div class="AltBgColor1">
Join us today and become a part of our growing community.<br />
Benefits of membership include:<br />
<ul>
    <li>Instant connections to our growing community of over 2,000 members.</li>
    <li>Discounts on products and events</li>
    <li>Early registration opportunities</li>
    <li>Access to the comprehensive Resource Library</li>
    <li>... and much more!</li>
</ul>
</div>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
			<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
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