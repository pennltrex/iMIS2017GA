<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Leadership" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="SocialShare" Src="~/iParts/Social/SocialShare/SocialShareDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("5db78df9-f671-4796-b818-0d7442de2efd"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("6bd22d10-f0ec-46f4-a242-086b57e23cba"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewSocialShareCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("51975f10-4514-47a4-a7c9-ca6fdb256315");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewSocialShareCommon);

		childUserControl = ciNewContentHtml_296d8b8b63454028b3935d77c54c31cf as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("296d8b8b-6345-4028-b393-5d77c54c31cf");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml_296d8b8b63454028b3935d77c54c31cf);

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
				<CM:SocialShare ID="ciNewSocialShareCommon" runat="server" ContentKey="5db78df9-f671-4796-b818-0d7442de2efd" ContentItemKey="51975f10-4514-47a4-a7c9-ca6fdb256315" Title="New SocialShareCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" BorderVisible="False" UrlToShare="" IconDimension="16" LegendText="Share this page" />
				<CM:ContentHtml ID="ciNewContentHtml_296d8b8b63454028b3935d77c54c31cf" runat="server" ContentKey="5db78df9-f671-4796-b818-0d7442de2efd" ContentItemKey="296d8b8b-6345-4028-b393-5d77c54c31cf" Title="New ContentHtml" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml" runat="server"><h1>Our Board of Directors</h1>
<strong>Carly Kowalski, executive director</strong><br />
<div style="clear: both;">
<br />
<img src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/member/CarlyKowalski.jpg" alt="Carly Kowalski" style="padding: 8px; float: left; max-width: 100px;" />
Carly is the executive director of the iMIS Association, after having served as CEO of Geo, International for the past fifteen years.
She earned a BS in chemical engineering from Rice University and an MBA from Yale, where she currently serves on the Business School
Alumni Board. Carly is on the faculty of the engineering department at the University of Virginia and is married to Ray, a professor of
mechanical engineering. They enjoy travel and spending time with their son, Michael, and his wife Jillian. Carly's many years of
industry and academic experience along with her warmth and enthusiasm help drive the success of our association!<br />
</div>
<div style="clear: both;">
<strong>David Ivey, treasurer</strong><br />
<br />
<img src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Member/DavidIvey.jpg" alt="David Ivey" style="padding: 8px; float: right; max-width: 100px;" />
Born in Christchurch, New Zealand, David is a CPA, principal of Hardin Consultants and the association's treasurer. David studied
finance and international relations at the University of Auckland and then spent several years working in the field before founding
Hardin Consultants with Robert Hardin in London. Today, Hardin Consultants is one of the United Kingdom's premier consulting and financial
services firms. David serves on the association's Finance Committee and is an accomplished cellist. He and his wife,
Marian, enjoy spending time at their cottage in the Lake District and watching their son Sean's rugby games.<br />
<br />
</div>
<div style="clear: both;">
<strong>Peter Bachman, chair</strong><br />
<br />
<img src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Member/PeterBachman.jpg" alt="Peter Bachman" style="padding: 8px; float: left; max-width: 100px;" />
Peter is the president of American Business Services, a leading consulting firm in our industry. He is a graduate of Texas A&M University, and
has a special interest in the field of continuing education. A popular seminar speaker, he is also the chair of the association's education committee
and enjoys meeting members from around the world. His commitment to educational excellence insures that our association's continuing education
program is one of the best in the world! Peter is a lifelong fan of the Texas Aggies football team, and especially enjoys watching games with his
son James.
<br />
</div>
<br />
<div style="clear: both;">
<strong>James Devon</strong>,<strong> vice chair</strong><br />
<br />
<img src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Member/JamesDevon.jpg" alt="James Devon" style="padding: 8px; float: right; max-width: 100px;" />
After graduating from Georgetown University, James began his career in accounting with Charles Schwab and then Texaco. He is now an assistant vice
president of finance at Opus, Inc. His areas of expertise include international finance, accounting, auditing and management. At Georgetown,
James was active in the Student Accounting Society, the Undergraduate Business Society and Zeta Beta Tau fraternity. He and his partner,
Jeff, are the parents of Abigail and Aidan.
<br />
</div>
<br />
<div style="clear: both;">
<strong>Sandra Hodgkins</strong>,<strong> secretary</strong><br />
<br />
<img src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Member/SandraHodgkins.jpg" alt="Sandra Hodgkins" style="padding: 8px; float: left; max-width: 120px;" />
Sandra has a PhD in business administration from York University. She is interested in how customers and firms make product decisions and how new
technology influences this behavior. She teaches product marketing
and research methods in the graduate business program at the University of Toronto. The recipient of a 2004 Canada Trust Excellence in Teaching Award,
Sandra finds teaching and promoting learning to be the most rewarding aspect of her career, and she is a founding member of the association's education
committee. She enjoys painting and traveling with her husband, Mark.
<br />
</div>
<br />
<div style="clear: both;">
<strong>Dominique Barclay, legal counsel</strong><br />
<br />
<img src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Member/Dominique_Barclay.jpg" alt="Dominique Barclay" style="padding: 8px; float: right; max-width: 100px;" />
Dominique is an attorney licensed to practice law in Canada and the United States, and is Vice President Legal of Versaton Canada. A
native of Saguenay, Quebec, she has a masters in business administration and finance from McGill University and a JD from the University of
Toronto. Dominique is especially interested in issues affecting the industry on an international level and in promoting networking relationships
among industry professionals around the world. She and her husband, Peter, are the parents of Emilie and Daniel, and also serve on the board of
the Montreal Children's Hospital as well as the iMIS Foundation's Legislative Action Committee.<br />
<br />
</div>
<div style="clear: both;">
<strong>Brian Murphy, director </strong><br />
<br />
<img src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Member/BrianMurphy.jpg" alt="Brian Murphy" style="padding: 8px; float: left; max-width: 100px;" />
Brian is the iMIS Association's system administrator and a 20 year veteran of the technology industry. He has a keen interest in
emerging technology trends in our industry (he configured the association's first web server in 1991!) and is a Microsoft Certified
Network Engineer. An avid fisherman in his spare time, he also enjoys membership in the Rotary and spending time with his sons Patrick and Kevin.<br />
<br />
</div>
<div style="clear: both;">
<strong>Julia Gillis, director</strong><br />
<br />
<img src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/JuliaGillis.jpg" alt="Julia Gillis" style="padding: 8px; float: right; max-width: 100px;" />
Julia is the iMIS Foundation’s co-founder and executive director, and a director of the iMIS Association board. She earned a BS in biology from Wake Forest, an MS in biology from Notre Dame, and an MBA from Northwestern University. She joined the faculty of the University of Chicago in 1988, where her research focused on the migratory patterns of mountain lions in North and South America. This work, along with a lifelong love of nature, led to her long-standing interest in preserving wildlife and the world’s important ecological habitats. After retiring from the University of Chicago in 2010, she has focused her time solely on directing the environmental conservation efforts of the iMIS Foundation, together with her husband Rob and their daughter Shannon, who is a research biologist at the Scripps Institute..<br />
</div></asp:Panel></CM:ContentHtml>
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