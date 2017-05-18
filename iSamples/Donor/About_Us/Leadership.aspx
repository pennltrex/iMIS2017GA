<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Leadership" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("2c26d472-ccbf-4ea0-be6e-1b9534649af7"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("9e20a624-1ff7-4cd8-9622-7af46675f9d0"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciOurLeadershiptext_75970063ba654d61a78fddc654726c78 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("75970063-ba65-4d61-a78f-ddc654726c78");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciOurLeadershiptext_75970063ba654d61a78fddc654726c78);

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
				<CM:ContentHtml ID="ciOurLeadershiptext_75970063ba654d61a78fddc654726c78" runat="server" ContentKey="2c26d472-ccbf-4ea0-be6e-1b9534649af7" ContentItemKey="75970063-ba65-4d61-a78f-ddc654726c78" Title="Our Leadership text" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_OurLeadershiptext" runat="server"><h1><strong>Our Leadership</strong></h1>
<h2>Julia Gillis, executive director
</h2>
<div style="clear: both;">
<img src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/JuliaGillis.jpg" style="float: left; padding: 8px;" alt="Julia Gillis" /> Julia is the iMIS Foundation’s co-founder and executive director. She earned a BS in biology from Wake Forest, an MS in biology from Notre Dame, and an MBA from Northwestern University. She joined the faculty of the University of Chicago in 1988, where her research focused on the migratory patterns of mountain lions in North and South America. This work, along with a lifelong love of nature, led to her long-standing interest in preserving wildlife and the world’s important ecological habitats. After retiring from the University of Chicago in 2010, she has focused her time solely on directing the environmental conservation efforts of the iMIS Foundation, together with her husband Rob and their daughter Shannon, who is a research biologist at the Scripps Institute.
</div>
<br />
<div style="clear: both;">
<h2>Wesley Patterson, vice president of educational programs</h2>
<img src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/WesleyPatterson.jpg" style="float: right; padding: 8px;" alt="Wesley Patterson" />
Wes leads the iMIS Foundation's efforts in conservation education on a global level. A high school biology teacher for 12 years, Wes has a bachelor's degree in biology and botany from the University of Sydney and a master's in public policy from Yale. He leads our educational working group and travels extensively to iMIS Foundation chapters in support of establishing quality preservation education programs at a local level everywhere we have a presence. His enthusiasm and energy for instilling an appreciation for nature in everyone he meets is infectious! He and his wife Annie enjoy spending time with their daughters, Kate and Sarah, especially on their family sailboat.</div>
<br />
<div style="clear: both;">
<h2>Carolyn Henderson, program director
</h2>
<img src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/CarolynHenderson.jpg" style="float: left; padding: 8px;" alt="Carolyn Henderson" />Carolyn is the iMIS Foundation’s program director. She is responsible for providing overall vision, strategy and leadership for current and new program development. A native of Columbus, Ohio, Carolyn has a BS in biology from Spelman College and a masters in environmental engineering from Purdue University. Prior to joining the iMIS Foundation in 2007, Jane worked for the Southwest Environmental Protection Agency for fifteen years, where she developed and supported programs which responded to environmental disasters and accidents in the Gulf Coast region, including helping coordinate the environmental impact remediation conducted in response to Hurricane Katrina. Today, her extensive management and policy experience drives success for the iMIS Foundation’s programs around the world.  She and her husband, Denver, enjoy hiking and camping with their twin sons.
</div>
<br />
<div style="clear: both;">
<h2>Emily Boutin, development director</h2>
<img src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/EmilYBoutin.jpg" style="float: right; padding: 8px;" alt="Emily Boutin" />Emily has a B.Sc. in zoology from Simon Fraser University and a masters in public policy from the University of British Columbia. She began her career as an animal shelter manager, eventually becoming director of the Vancouver Animal Control Shelter before joining the British Columbia SPCA to focus on development. In 2001, she became development director of the iMIS Foundation, where she brings a keen understanding of successful development practices and an enthusiasm for the Foundation’s mission that insures we have one of the consistently highest donor retention rates of any environmentally-focused charity. In her free time, she and her husband Stephen are avid Canucks fans and enjoy cheering at their daughter Nicole's soccer games.</div>
<br />
<div style="clear: both;">
<h2>Jasmine Singh, major gifts manager</h2>
<img src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/JasmineSingh.jpg" style="float: left; padding: 8px; max-width: 160px;" alt="Jasmine Singh" />Jasmine develops and manages the major gifts program for the iMIS Foundation. She implements and manages our comprehensive major gifts plan on an international level, plans cultivation events and assists chapters with event management, and develops and maintains strong relationships with our major philanthropists and donors. Born in Birmingham, England, Jasmine studied sociology and public policy at Aston University and then earned an MBA from Brown. Jasmine's warmth and passion for our mission helps insure the success of the Foundation by maintaining close ties with our supporters. She and her partner, Judith, are avid scuba divers and especially enjoy visiting iMIS Foundation chapter members in Australia, and love catching Aston Villa games whenever they are back home in the UK.</div></asp:Panel></CM:ContentHtml>
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