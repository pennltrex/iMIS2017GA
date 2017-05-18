<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Record-Breaking NiUG Conference" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">
	<meta name="Description" content="NiUG&#39;s sixth annual Discovery Conference went off without a hitch! Read about this year&#39;s conference and learn how to become a NiUG member in this article." />

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("d52ab590-fe47-4be8-89ea-c7372818e550"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("5f93a318-169b-4d68-af42-cc77541b2958"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciSixthNiUGConference_08bf68ecf6164863828a13e5a8529123 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("08bf68ec-f616-4863-828a-13e5a8529123");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSixthNiUGConference_08bf68ecf6164863828a13e5a8529123);

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
				<CM:ContentHtml ID="ciSixthNiUGConference_08bf68ecf6164863828a13e5a8529123" runat="server" ContentKey="d52ab590-fe47-4be8-89ea-c7372818e550" ContentItemKey="08bf68ec-f616-4863-828a-13e5a8529123" Title="Sixth NiUG Conference" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_SixthNiUGConference" runat="server"><h1>NiUG Concludes Sixth, Record-Breaking Discovery Conference</h1>
<h3>14th Annual iMIS User Group Event Attendance Up 92%, Sponsorship Increases by 32%</h3>
<p><strong>BALTIMORE, MD (November 17, 2011)</strong> - NiUG International, the largest independent, volunteer-run user group in the not-for-profit software industry, today announced that it continued to achieve record growth at its sixth annual Discovery Conference, held October 18-21 in Baltimore, Maryland. Nearly 380 iMIS users and partners participated in more than 50 educational sessions, training classes and networking events. The 14th annual iMIS User Group event also drew 33 sponsors, including ASI and iMIS technology partners, resellers and consultants.</p>
<p>"NiUG International's annual Discovery Conference has been the mainstay for communication and collaboration among iMIS customers, partners and other key organizations since 2006," said Bob Alves, chairman and CEO of Advanced Solutions International. "From the educational sessions and training courses to the networking events, the user conference has been instrumental in providing not-for-profits with the knowledge they need to utilize our software to the fullest, to achieve their business goals and progress their missions."</p>
<h3>Conference Highlights</h3>
<ul>
    <li>Bob Alves recognized a number of iMIS customers who are doing great things and furthering their missions with the web-based software. This year's Great Things Award winners represent a wide range of worthy organizations, including Salesian Missions, Aging Services of California, Missouri State Teachers Association, Wipfli and The Payments Authority.</li>
    <li>The John Howarth Memorial Award recognizes those who through their passion, persistence, optiMISm and grace under pressure have represented the mission of NiUG. This year, the organization presented the award to Jeff Golembiewski, senior consultant for NimbleUser, for his dedication and outstanding contributions to the iMIS community.</li>
    <li>iMIS 15.2 was also unveiled at the conference. ASI staff demoed the latest release and the new look and feel of its improved self-service options and enhanced social networking capabilities. Attendees were encouraged to record a short video and tell the user community what they are most excited about with iMIS 15.2.</li>
</ul>
<h4>Resources</h4>
<ul>
    <li>To become a NiUG International member, please fill out an online application, contact <a href="mailto:membership@NiUG.org?subject=NiUG Membership">membership@NiUG.org</a> or call <a href="tel:+1 866 301 6484">+1 866 301 6484</a>. Membership options include regular members (iMIS user-based companies) and associate members (resellers/vendor-based companies). Once a company establishes itself as a NiUG member, all staff within that organization receives NiUG member benefits, including reduced rates for training and conference registrations. Follow NiUG on Twitter and Facebook.</li>
    <li>Learn more about iMIS and find additional ASI news. Don't forget to engage with ASI on Twitter, Facebook and LinkedIn.</li>
</ul></asp:Panel></CM:ContentHtml>
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