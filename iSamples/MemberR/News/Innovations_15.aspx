<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="ASI's 15th iNNOVATIONS Partner Conference Sees Record Breaking Attendance" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">
	<meta name="Description" content="NiUG&#39;s sixth annual Discovery Conference went off without a hitch! Read about this year&#39;s conference and learn how to become a NiUG member in this article." />
	<meta name="Keywords" content="news" />

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("9b2934dc-1047-48e7-8435-f10ea8b54714"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("081132ac-ba7f-4f28-aec4-2daa42bb5dac"); } }

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
				<CM:ContentHtml ID="ciSixthNiUGConference_08bf68ecf6164863828a13e5a8529123" runat="server" ContentKey="9b2934dc-1047-48e7-8435-f10ea8b54714" ContentItemKey="08bf68ec-f616-4863-828a-13e5a8529123" Title="Sixth NiUG Conference" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_SixthNiUGConference" runat="server"><h1>ASI's 15th Annual iNNOVATIONS Partner Conference Sees Record-Breaking Attendance</h1>
<h3></h3>
<h4>ASI Previews its New Game-Changing iMIS 20 Engagement Management
System (EMS)™</h4>
<br />
<p><strong>Alexandria, VA (April 2, 2013)</strong> - Advanced Solutions
International (ASI), the largest, privately-owned global provider of
software for member and donor-based not-for-profits, today announced
that its 15th annual iNNOVATIONS partner conference reached a record
number of attendees, including more than 110 partners from around the
world. </p>
<p><strong>(C) Systems</strong> was recognized as the <strong>Authorized
iMIS Solution Provider (AiSP) of the Year</strong> and several other
partners were recognized for specific outstanding achievement in
2012:</p>
<ul class="rightCT">
    <li class="rightCT"><strong>iMIS 20-100 AiSP of the Year:</strong>
    IServices Consulting
    Pty. Ltd.</li>
    <li class="rightCT"><strong>New Account Leader of the Year
    Award:</strong> Get
    Efficient</li>
    <li class="rightCT"><strong>Customer Sales Leader of the Year:</strong>
    (C) Systems</li>
    <li class="rightCT"><strong>Customer Satisfaction Leader of the
    Year:</strong> Computer
    System Innovations, Inc.</li>
    <li class="rightCT"><strong>Customer Satisfaction:</strong>
    <ul class="rightCT">
        <li class="rightCT">ISG Solutions, LLC</li>
        <li class="rightCT">Avant-Garde Consulting Services, Inc.</li>
        <li class="rightCT">Accounting & Association Software Group</li>
    </ul>
    </li>
</ul>
<p>The three-day conference offered more than 24 educational breakout
sessions covering technical, implementation and product-related topics.
Attendees were particularly excited by a pre-launch overview of the iMIS
20 Engagement Management System (EMS)™. iMIS 20 enables
organizations to engage members, donors, and other constituents—as well
as staff—anytime, anywhere, from any device. It includes constituent
management, constituent self-service, online fundraising, social
engagement, private communities, mobile access, and website management
in one seamless cloud-based system. This eliminates costly integration
efforts, enables clients to gather better constituent intelligence, and
helps them make smarter business decisions.</p>
<p>The conference included the eagerly anticipated announcement of the
prestigious "President's Club" awards, which recognize the best
applications developed for iMIS by ASI partners. The winners—judged to
be the most innovative, successful, and productive of 2012—included:</p>
<ul class="rightCT">
    <li class="rightCT"><strong>iMIS Innovation of the Year: </strong>iRenew
    Suite from
    Intuitive Business Concepts</li>
    <li class="rightCT"><strong>iMIS Technology Innovation:</strong> Suite
    of RiSE iParts
    from Association Dynamics</li>
    <li class="rightCT"><strong>iMIS New Markets Innovation:</strong>
    Custom Pass-Through
    iPart from Association Technology Solutions</li>
    <li class="rightCT"><strong>iMIS Productivity Innovation:</strong>
    Customer Service
    Alerts iPart from McGladrey</li>
    <li class="rightCT"><strong>ASI Consulting Innovation of the
    Year:</strong> Case
    Management, Bilal Jeewa</li>
</ul>
ASI also inducted the following 12 partners into its "Chairman's
Circle," which recognizes overall outstanding performance:
<ul class="rightCT">
    <li class="rightCT">501 CIO</li>
    <li class="rightCT">Ascension</li>
    <li class="rightCT">BroadPoint Technologies</li>
    <li class="rightCT">BSCI</li>
    <li class="rightCT">Bursting Silver</li>
    <li class="rightCT">CSI</li>
    <li class="rightCT">enSync</li>
    <li class="rightCT">iFINITY</li>
    <li class="rightCT">IServices</li>
    <li class="rightCT">Lane Services</li>
    <li class="rightCT">McGladrey</li>
    <li class="rightCT">Visual Antidote</li>
</ul>
The following six partners were not only inducted into the Chairman's
Circle but were also named to the "Inner Forum," which recognizes
outstanding sales performance:
<ul class="rightCT">
    <li class="rightCT">AASG</li>
    <li class="rightCT">ATS</li>
    <li class="rightCT">(C) Systems</li>
    <li class="rightCT">Get Efficient</li>
    <li class="rightCT">IBC</li>
    <li class="rightCT">ISG Solutions</li>
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