<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="News" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="SocialShare" Src="~/iParts/Social/SocialShare/SocialShareDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="CommonSearch" Src="~/iParts/Common/Search/SearchDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("0b432742-f2cf-4acb-98d2-71b6b420495f"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("ae7c517f-d175-43f6-b36c-dffc4fa7a797"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewSocialShareCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("8c2b2406-7e14-4920-b94f-24f84d88095e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewSocialShareCommon);

		childUserControl = ciHeader_bec727a1963a466b9d433cd0682da586 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("bec727a1-963a-466b-9d43-3cd0682da586");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciHeader_bec727a1963a466b9d433cd0682da586);

		childUserControl = ciConferencepicture_1cc2bc87c24a4597b1574849d73a2a65 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("1cc2bc87-c24a-4597-b157-4849d73a2a65");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciConferencepicture_1cc2bc87c24a4597b1574849d73a2a65);

		AddChildUserControl(ContentPage2);

		childUserControl = ciNewContentHtml2_86623d8a4d6d480fabefa90e19faaf38 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("86623d8a-4d6d-480f-abef-a90e19faaf38");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml2_86623d8a4d6d480fabefa90e19faaf38);

		AddChildUserControl(ContentPage3);

		childUserControl = ciNewContentHtml_e83d447e8d1b4ce6a8b6a12963fc551b as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e83d447e-8d1b-4ce6-a8b6-a12963fc551b");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml_e83d447e8d1b4ce6a8b6a12963fc551b);

		AddChildUserControl(ContentPage4);

		childUserControl = ciNewSearchCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("fc973324-50d9-4261-98b4-656759eebdd7");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewSearchCommon);

		childUserControl = ciNewSearchCommon2 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("23d51d94-a6bd-4d8d-9bcd-4a1ea2436751");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewSearchCommon2);

		childUserControl = ciNewSearchCommon3 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("bd9d1332-d719-4fda-ab09-3ae1dfd86238");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewSearchCommon3);

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
				<CM:SocialShare ID="ciNewSocialShareCommon" runat="server" ContentKey="0b432742-f2cf-4acb-98d2-71b6b420495f" ContentItemKey="8c2b2406-7e14-4920-b94f-24f84d88095e" Title="New SocialShareCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" BorderVisible="False" UrlToShare="" IconDimension="16" LegendText="Share this page" />
				<CM:ContentHtml ID="ciHeader_bec727a1963a466b9d433cd0682da586" runat="server" ContentKey="0b432742-f2cf-4acb-98d2-71b6b420495f" ContentItemKey="bec727a1-963a-466b-9d43-3cd0682da586" Title="Header" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Header" runat="server"><h1 class="BigHeader">Association News</h1></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciConferencepicture_1cc2bc87c24a4597b1574849d73a2a65" runat="server" ContentKey="0b432742-f2cf-4acb-98d2-71b6b420495f" ContentItemKey="1cc2bc87-c24a-4597-b157-4849d73a2a65" Title="Conference picture" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Conferencepicture" runat="server"><img alt="Business Feature" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/member/businessfeature.gif" class="FloatLeft" style="max-width: 100%; padding-right: 1em;" />
<p>Performance improvement is a topic that is on a lot of association member's minds at this time of year, as annual budgets are evaluated and we look for ways to streamline and improve productivity and performance in our industry.</p>
<p>Board member Dominique Barclay, vice president of finance for Versaton Canada, explains how her company conducts an annual performance improvement evaluation of their manufacturing processes--an evaluation that last year saved Versaton over $750,000!</p></asp:Panel></CM:ContentHtml>
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
				<CM:ContentHtml ID="ciNewContentHtml2_86623d8a4d6d480fabefa90e19faaf38" runat="server" ContentKey="0b432742-f2cf-4acb-98d2-71b6b420495f" ContentItemKey="86623d8a-4d6d-480f-abef-a90e19faaf38" Title="New ContentHtml_2" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml2" runat="server"><h2>Job Openings</h2>
<h3>Accounting Manager - Versaton Canada</h3>
The Accounting Manager is responsible for all areas relating to
financial reporting. Responsible for developing and maintaining
accounting principles, practices and procedures to ensure accurate and
timely financial statements. Coordinates with department heads to
address the reporting needs of each area and program of the
organization. This position operates under tight deadlines and a wide
range of accounting activities including bookkeeping, financial
reporting, year-end audit preparation and budget preparation. Contact Amelie Venet (amelie@versaton.ca), HR Director at
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>Party.aspx?ID=23090">Versaton Canada.</a><br />
<br />
<h3>Database Administrator - Opus West</h3>
Opus West is searching for a Database Manager, who will be
primarily responsible for supervising & maintaining the member
database in iMIS. Duties include but are not limited to the
accurate execution of the entire donation process, from donation entry,
credit card processing, acknowledgement letters, billing, importing and
exporting data, daily and monthly report generation and account
reconciliation; and providing general membership assistance and customer
service. Contact Clara Chen at <a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>Party.aspx?ID=19800"> Opus West. </a><br /></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-4">
						<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciNewContentHtml_e83d447e8d1b4ce6a8b6a12963fc551b" runat="server" ContentKey="0b432742-f2cf-4acb-98d2-71b6b420495f" ContentItemKey="e83d447e-8d1b-4ce6-a8b6-a12963fc551b" Title="New ContentHtml" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml" runat="server"><h2>Member Spotlight</h2>
<div class="Center">
<img alt="Jane Johnson" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Member/memberspotlight.gif" />
</div>
Jane Johnson is the Director of Accounting for<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>Party.aspx?ID=23088"> Versaton Europe</a>. A native of Scotland, Jane is a graduate of Cambridge University and worked at Dun and Bradstreet for six years before joining Versaton. At Versaton, she worked with John Tan in the marketing department at the corporate headquarters in Los Angeles before transferring back to the UK to head the membership department in the European office. Jane loves living in London and feels fortunate to work with so many talented people!<br />
<br />
Jane is a member of the iMIS Association's Awards Committee, and particularly enjoys event planning and celebrating the achievements of the best and brightest in our industry. (If you have enjoyed attending our annual gala, Jane is one reason we have such fantastic entertainment and a beautiful setting for the awards.)  She is married to William, an anesthesiologist with the NHS, and is the mother of  first graders Clare and Cecilia. She enjoys biking and hiking with her girls.</asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-4">
						<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:CommonSearch ID="ciNewSearchCommon" runat="server" ContentKey="0b432742-f2cf-4acb-98d2-71b6b420495f" ContentItemKey="fc973324-50d9-4261-98b4-656759eebdd7" Title="New SearchCommon" ShowTitleFlag="False" PartTitle="Discounted This Month" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayTextBox="False" DisplayInactiveResultsCheckBox="False" InitialDisplay="True" InitialText="journal" InitialLogic="Or" SearchLabel="" DisplayAreaOptions="False" Options="" InitialArea="Product" ErrorMsg="Could not load featured product." ExceedResultsMsg="." MaxResults="1000" NoResultMsg="Could not load featured product." PageSize="25" Sort="Rank" Tags="" PagerMode="NextPrevAndNumeric" PagerDisplay="Both" AddContentItem="00000000-0000-0000-0000-000000000000" />
				<CM:CommonSearch ID="ciNewSearchCommon2" runat="server" ContentKey="0b432742-f2cf-4acb-98d2-71b6b420495f" ContentItemKey="23d51d94-a6bd-4d8d-9bcd-4a1ea2436751" Title="New SearchCommon_2" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayTextBox="False" DisplayInactiveResultsCheckBox="False" InitialDisplay="True" InitialText="skills" InitialLogic="Or" SearchLabel="" DisplayAreaOptions="False" Options="" InitialArea="Product" ErrorMsg="Could not load featured product." ExceedResultsMsg="." MaxResults="1000" NoResultMsg="Could not load featured product." PageSize="25" Sort="Rank" Tags="" PagerMode="NextPrevAndNumeric" PagerDisplay="Both" AddContentItem="00000000-0000-0000-0000-000000000000" />
				<CM:CommonSearch ID="ciNewSearchCommon3" runat="server" ContentKey="0b432742-f2cf-4acb-98d2-71b6b420495f" ContentItemKey="bd9d1332-d719-4fda-ab09-3ae1dfd86238" Title="New SearchCommon_3" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayTextBox="False" DisplayInactiveResultsCheckBox="False" InitialDisplay="True" InitialText="certification study" InitialLogic="And" SearchLabel="" DisplayAreaOptions="False" Options="" InitialArea="Product" ErrorMsg="Could not load featured product." ExceedResultsMsg="." MaxResults="1000" NoResultMsg="Could not load featured product." PageSize="25" Sort="Rank" Tags="" PagerMode="NextPrevAndNumeric" PagerDisplay="Both" AddContentItem="00000000-0000-0000-0000-000000000000" />
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