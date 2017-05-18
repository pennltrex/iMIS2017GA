<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Our Impact" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("3d9a1c46-f562-425e-a976-a21ab098cc0a"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("ce48174b-995e-4d3c-8c15-650a8f67a8c9"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciJumbotron_c8aae39bad47437ba50302bf507be2cf as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("c8aae39b-ad47-437b-a503-02bf507be2cf");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciJumbotron_c8aae39bad47437ba50302bf507be2cf);

		childUserControl = ciCampusInitiative_1949aa58afda445fa3e04f0cfb0fa7df as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("1949aa58-afda-445f-a3e0-4f0cfb0fa7df");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCampusInitiative_1949aa58afda445fa3e04f0cfb0fa7df);

		AddChildUserControl(ContentPage2);

		childUserControl = ciCarbondioxide_e9819d072d434fda83a27e34170b412c as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e9819d07-2d43-4fda-83a2-7e34170b412c");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCarbondioxide_e9819d072d434fda83a27e34170b412c);

		AddChildUserControl(ContentPage3);

		childUserControl = ciLightBulbs_a199e4a8063d4f85bae857190535ad59 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a199e4a8-063d-4f85-bae8-57190535ad59");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciLightBulbs_a199e4a8063d4f85bae857190535ad59);

		AddChildUserControl(ContentPage4);

		childUserControl = ciSolarEnergy_1df4e8e30e00403ebcc8776246556e66 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("1df4e8e3-0e00-403e-bcc8-776246556e66");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSolarEnergy_1df4e8e30e00403ebcc8776246556e66);

		AddChildUserControl(ContentPage5);

		childUserControl = ciCameronSimpsonQuote_5ea32c02203549fd82fc84a405b6f44d as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("5ea32c02-2035-49fd-82fc-84a405b6f44d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCameronSimpsonQuote_5ea32c02203549fd82fc84a405b6f44d);

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
				<CM:ContentHtml ID="ciJumbotron_c8aae39bad47437ba50302bf507be2cf" runat="server" ContentKey="3d9a1c46-f562-425e-a976-a21ab098cc0a" ContentItemKey="c8aae39b-ad47-437b-a503-02bf507be2cf" Title="Jumbotron" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Jumbotron" runat="server"><div class="jumbotron interior bg-img-poplar-trees AlignLeft">
<div class="jumbotron-content">
<p class="jumbotron-text">
<span>127 campuses have saved</span>
<span>19,862,833 kilograms</span>
<span>of carbon</span>
<span>helping to limit</span>
<span>shifting weather patterns</span>
</p>
<div class="img-copyright">
<a href="https://www.flickr.com/photos/dickdotcom/5030942010/sizes/l/">Photo</a> by Richard Leeming / <a href="http://creativecommons.org/licenses/by/2.0/">CC BY 2.0</a>
</div>
</div>
</div></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciCampusInitiative_1949aa58afda445fa3e04f0cfb0fa7df" runat="server" ContentKey="3d9a1c46-f562-425e-a976-a21ab098cc0a" ContentItemKey="1949aa58-afda-445f-a3e0-4f0cfb0fa7df" Title="CampusInitiative" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_CampusInitiative" runat="server"><h1>Our Impact</h1>
<p>Our network of environmental sustainability initiatives at campuses world wide has had a major impact on our planet. Last year's campus imitative was a huge success, resulting in the reduction of over 19 million kilograms of carbon. With your help we will continue this work at campuses around the world.</p></asp:Panel></CM:ContentHtml>
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
				<CM:ContentHtml ID="ciCarbondioxide_e9819d072d434fda83a27e34170b412c" runat="server" ContentKey="3d9a1c46-f562-425e-a976-a21ab098cc0a" ContentItemKey="e9819d07-2d43-4fda-83a2-7e34170b412c" Title="Carbon dioxide" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Carbondioxide" runat="server"><div class="Center">
<img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/tree-icon.png" />
<h3>593 tonnes of CO2 reduced</h3>
<p>A college in Alberta worked with farmers in Costa Rica to plant enough fast growing trees to compensate for the 593 tonnes of carbon dioxide emitted annually by the campus's college center over the next 30 years.</p>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-sm-4">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciLightBulbs_a199e4a8063d4f85bae857190535ad59" runat="server" ContentKey="3d9a1c46-f562-425e-a976-a21ab098cc0a" ContentItemKey="a199e4a8-063d-4f85-bae8-57190535ad59" Title="LightBulbs" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_LightBulbs" runat="server"><div class="Center">
<img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/bulb-icon.png" />
<h3>3218 light bulbs replaced</h3>
<p>A light bulb exchange program at the International School of Singapore allows students to exchange inefficient light bulbs for energy efficient bulbs. The old bulbs are then decorated and sold as art to fund the program.</p>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-sm-4">
			<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciSolarEnergy_1df4e8e30e00403ebcc8776246556e66" runat="server" ContentKey="3d9a1c46-f562-425e-a976-a21ab098cc0a" ContentItemKey="1df4e8e3-0e00-403e-bcc8-776246556e66" Title="SolarEnergy" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_SolarEnergy" runat="server"><div class="Center">
<img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/electricity-icon.png" />
<h3>Solar energy for boilers</h3>
<p>At our partner campus in Adelaide, solar panels were fitted to a residence hall to offset the power required by a boiler plant that was installed that same year. Savings from the combined reduction is approximately what one residence hall would use in an academic year.</p>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
    </div>
<div class="row">
    <div class="col-sm-12">
			<CM:ContentPage ID="ContentPage5" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone5_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciCameronSimpsonQuote_5ea32c02203549fd82fc84a405b6f44d" runat="server" ContentKey="3d9a1c46-f562-425e-a976-a21ab098cc0a" ContentItemKey="5ea32c02-2035-49fd-82fc-84a405b6f44d" Title="Cameron Simpson Quote" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_CameronSimpsonQuote" runat="server"><blockquote class="Quote"><img alt="Cameron Simpson" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/CameronSimpson.jpg" class="hidden-xs" style="width: 250px; float: right; margin-left: 1em; margin-bottom: 1em;" />I heard of the iMIS Foundation Campus Initiative when I became Vice-Provost at Central Highlands University. We partnered with the foundation to make our campus as green as we could. Within one year, we powered 27% of our energy needs with wind and solar sources. In addition, simple conservation efforts and a comprehensive campus recycling programme resulted in a 128-tonne reduction of the carbon dioxide we emit. We could not have made these dramatic improvements without funding and direction from the iMIS Foundation!
<site>Cameron Simpson</site></blockquote></asp:Panel></CM:ContentHtml>
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