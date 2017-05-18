<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Recent Projects" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("c5fdebd1-3229-4fff-9016-a66f470e941b"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("fa3d5491-7f52-4b72-a095-a5883cf00660"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciHeading_ced50066ebe043eaa1df943019ecce04 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("ced50066-ebe0-43ea-a1df-943019ecce04");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciHeading_ced50066ebe043eaa1df943019ecce04);

		childUserControl = ciMonitoring_262b688d3c1b48cc97256bfbaebc6ef4 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("262b688d-3c1b-48cc-9725-6bfbaebc6ef4");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMonitoring_262b688d3c1b48cc97256bfbaebc6ef4);

		childUserControl = ciArcticHabitat_915335bd46a64580a9a149a7f69d0b3e as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("915335bd-46a6-4580-a9a1-49a7f69d0b3e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciArcticHabitat_915335bd46a64580a9a149a7f69d0b3e);

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
				<CM:ContentHtml ID="ciHeading_ced50066ebe043eaa1df943019ecce04" runat="server" ContentKey="c5fdebd1-3229-4fff-9016-a66f470e941b" ContentItemKey="ced50066-ebe0-43ea-a1df-943019ecce04" Title="Heading" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Heading" runat="server"><h1>Our Recent Projects</h1></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciMonitoring_262b688d3c1b48cc97256bfbaebc6ef4" runat="server" ContentKey="c5fdebd1-3229-4fff-9016-a66f470e941b" ContentItemKey="262b688d-3c1b-48cc-9725-6bfbaebc6ef4" Title="Monitoring" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Monitoring" runat="server"><h2>Habitat-changing environmental monitoring system installed</h2>
<br />
<div class="col-sm-4 hidden-xs">
<img alt="White rhinoceros" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/white-rhinoceros.jpg" />
<div class="img-copyright">
<a href="http://www.flickr.com/photos/schristia/4637967242">Photo</a> by Schristia / <a href="http://creativecommons.org/licenses/by/2.0/">CC BY 2.0</a>
</div>
</div>
<div class="col-sm-8">
<p>A partnership between the iMIS Foundation and provincial governments of the Democratic Republic of Congo has resulted in a ground-breaking environmental monitoring system. In each region, these measurements help to create an accurate picture of the relationship among agriculture, nature and human well-being. The indicators we measure include sustainable agricultural production, water availability and quality, soil health, biodiversity, carbon stocks, climate resilience, household income, nutrition, and market access.</p>
<p>Field teams monitor agricultural productivity, ecosystem health, and human well-being measures in African landscapes with near real-time data to better understand the critical ecology of local habitats. This creates an accessible, transparent information resource for wildlife advocates and government decision makers. Future grants, funded by our contributors, will facilitate similar systems in neighboring countries. </p>
</div></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciArcticHabitat_915335bd46a64580a9a149a7f69d0b3e" runat="server" ContentKey="c5fdebd1-3229-4fff-9016-a66f470e941b" ContentItemKey="915335bd-46a6-4580-a9a1-49a7f69d0b3e" Title="ArcticHabitat" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_ArcticHabitat" runat="server"><h2>Groups pool funds to save arctic habitat</h2>
<br />
<div class="col-sm-4 hidden-xs">
<img alt="Emperor penguin" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/emperor-penguin.jpg" />
<div class="img-copyright">
<a href="https://www.flickr.com/photos/cmichel67/11278910216/sizes/m/">Photo</a> by Christopher Michel / <a href="http://creativecommons.org/licenses/by/2.0/">CC BY 2.0</a>
</div>
</div>
<div class="col-sm-8">
<p>Several nature conservancy organizations, along with the governments of Canada, Denmark, and Iceland, have agreed to contribute to a historic land purchase. The targeted area above the Arctic Circle provides critical habitat for narwals, beluga whales, and polar bears. The available habitat for these animals is shrinking as polar ice caps continue to melt.</p>
<p>Special capital campaigns at each of the conservancy organizations are underway with a target of purchasing at least 800 square miles on Ellesmare Island in the Canadian territory of Nunavit. </p>
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