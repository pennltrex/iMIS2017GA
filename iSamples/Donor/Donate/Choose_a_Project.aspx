<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Support a Project" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("dd58ffec-9821-4915-8806-2a11c4ef053e"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("1cea1051-876a-4858-9e20-265ebd438402"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciChoiceIntro_b49d1f1d5d89481bb81e751ceaae510e as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("b49d1f1d-5d89-481b-b81e-751ceaae510e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciChoiceIntro_b49d1f1d5d89481bb81e751ceaae510e);

		childUserControl = ciProjectSummary_18d4266349e8440088b63b97ac54eb9f as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("18d42663-49e8-4400-88b6-3b97ac54eb9f");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciProjectSummary_18d4266349e8440088b63b97ac54eb9f);

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
				<CM:ContentHtml ID="ciChoiceIntro_b49d1f1d5d89481bb81e751ceaae510e" runat="server" ContentKey="dd58ffec-9821-4915-8806-2a11c4ef053e" ContentItemKey="b49d1f1d-5d89-481b-b81e-751ceaae510e" Title="ChoiceIntro" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_ChoiceIntro" runat="server"><h1>It's Your Choice!</h1>
<p>Are you interested in a specific habitat or region? Do you prefer to help with a specific emergency effort? We have a variety of projects in locations around the world where your generous contribution would be of utmost importance.</p></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciProjectSummary_18d4266349e8440088b63b97ac54eb9f" runat="server" ContentKey="dd58ffec-9821-4915-8806-2a11c4ef053e" ContentItemKey="18d42663-49e8-4400-88b6-3b97ac54eb9f" Title="ProjectSummary" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_ProjectSummary" runat="server"><div class="row">
<div class="col-sm-6">
<h2>Polar regions</h2>
<p>Wildlife in the polar regions are in danger due to a variety of problems. The Arctic fox and the Pacific salmon are especially at risk. Our Polar Regions Project works to support these species through extensive monitoring networks and partnering with maritime shipping firms.</p>
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>iCore/Fundraising/Donate/Give_to_a_Cause.aspx?ItemId=POLAR" class="btn">Support the Polar Regions Project</a>
</div>
<div class="col-sm-6">
<h2>Deep-water ocean areas</h2>
<p>The vastness of our planet's oceans and the variety of species who reside there have enormous impact on our world. The iMIS Foundation partners with government and non-government organizations around the globe to establish protected areas and to monitor conditions in these areas.</p>
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>iCore/Fundraising/Donate/Give_to_a_Cause.aspx?ItemId=OCEAN" class="btn">Support the Oceans Fund</a>
</div>
</div>
<br />
<div class="row">
<div class="col-sm-6">
<h2>Marshlands and fresh water habitats</h2>
<p>The high concentration of mammals, birds, and fish in marshlands and fresh water wetlands is of special concern to the iMIS Foundation. Our capital campaign this year strives to fund a new safe haven for shorebirds who have lost their homes due to floods, pollution, or drought.</p>
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>iCore/Fundraising/Donate/Give_to_a_Cause.aspx?ItemId=MARSH" class="btn">Support the Marshland Project</a>
</div>
<div class="col-sm-6">
<h2>Desert regions</h2>
<p>Because deserts are such barren landscapes, we tend to dismiss the needs of the unique species who have adapter to the harsh conditions. Our Desert Soils Initiative is a far-reaching effort to educate the residents of these areas about water conservation, soil preservation, and sustainable agricultural practices. </p>
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>iCore/Fundraising/Donate/Give_to_a_Cause.aspx?ItemId=DSRT" class="btn">Support the Desert Soils Initiative</a>
</div>
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