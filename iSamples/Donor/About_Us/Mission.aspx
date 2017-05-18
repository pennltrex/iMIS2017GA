<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Mission" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("6597eb46-d638-4097-8207-59eebfe8e492"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("946a784c-eb46-45ca-9f5c-d876fa242440"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciOurMissionBodyText_400b983089184656ab9247d2ebcd95ff as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("400b9830-8918-4656-ab92-47d2ebcd95ff");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciOurMissionBodyText_400b983089184656ab9247d2ebcd95ff);

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
				<CM:ContentHtml ID="ciOurMissionBodyText_400b983089184656ab9247d2ebcd95ff" runat="server" ContentKey="6597eb46-d638-4097-8207-59eebfe8e492" ContentItemKey="400b9830-8918-4656-ab92-47d2ebcd95ff" Title="OurMissionBodyText" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_OurMissionBodyText" runat="server"><h1>Our Mission</h1>
<div class="lead NeutralShading">
Our mission is to identify, restore, and advocate for crucial wildlife habitats throughout the world.
</div>
<p>
The iMIS Foundation provides local and national leadership in environmental and wildlife conservation, supports habitat protection and repair, and guides legislative action around the world to preserve important ecological sites. We are a global organization of more than 2 million supporters, members and activists in 32 countries and territories.</p>
<p>
On a practical level, we organize local environmental action and cleanup days in communities all over the world, as well as assist state, province, and national entities with data collection and tracking of important species and their habitats. We develop and provide educational materials free of charge for schools, and lobby for environmentally-supportive legislation. There are limitless ways than you can get involved with us and become a part of our mission, but one important way is through donating your time or financial resources.
</p>
<p>
Our vision is for every person to be able to enjoy the rich ecological heritage of our planet in as unspoiled state as possible. We are independent of any government, political ideology, economic interest or religion and are funded by our membership, public donations, and the generous support of our corporate partners and sponsors.
</p>
<p>
To effectively make a difference, we target very specific areas for our efforts:</p>
<br />
<div class="col-sm-4 Center">
<img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/building-icon.png" />
<h3>Mediating the effects of urbanization</h3>
<p>As population centers grow, the resulting construction often displaces wildlife and allows predators to expand their territory. We identify these areas and advocate with local and national governments to set aside areas for native wildlife to survive.</p>
</div>
<div class="col-sm-4 Center">
<img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/industrial-icon.png" />
<h3>Reclaiming abandoned brownfields</h3>
<p>Abandoned industrial sites often encompass a large area. We solicit land donations from owner entities and use our funds to expand these areas. Our volunteers and sponsors then restore these sites to an environment conducive to native species of plants, animals, and insects.</p>
</div>
<div class="col-sm-4 Center">
<img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/globe-icon.png" />
<h3>Relocating endangered wildlife</h3>
<p>When wildlife are in danger due to human or meteorological crises, we arrange for them to be transported to safe havens. Often, the habitats we have restored are the perfect location for these displaced creatures.</p>
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