<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Corporate Partnerships" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("cac0d90a-d33a-4f1d-9ac5-86af4ce2ecb8"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("473b075b-517c-4cb4-b849-bf93e366fe92"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciOurpartnerstext_f768a91998b24974a20e0ad769df7cb0 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("f768a919-98b2-4974-a20e-0ad769df7cb0");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciOurpartnerstext_f768a91998b24974a20e0ad769df7cb0);

		AddChildUserControl(ContentPage2);

		childUserControl = ciVersaton_3d7f304dd15f46929913d7ba87984eac as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("3d7f304d-d15f-4692-9913-d7ba87984eac");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciVersaton_3d7f304dd15f46929913d7ba87984eac);

		AddChildUserControl(ContentPage3);

		childUserControl = ciOpus_421df6bec23642299bb2817cacf80164 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("421df6be-c236-4229-9bb2-817cacf80164");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciOpus_421df6bec23642299bb2817cacf80164);

		AddChildUserControl(ContentPage4);

		childUserControl = ciGeo_aa4a5d09a7a44e69aa7cc48955667f54 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("aa4a5d09-a7a4-4e69-aa7c-c48955667f54");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciGeo_aa4a5d09a7a44e69aa7cc48955667f54);

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
				<CM:ContentHtml ID="ciOurpartnerstext_f768a91998b24974a20e0ad769df7cb0" runat="server" ContentKey="cac0d90a-d33a-4f1d-9ac5-86af4ce2ecb8" ContentItemKey="f768a919-98b2-4974-a20e-0ad769df7cb0" Title="Our partners text" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Ourpartnerstext" runat="server"><h1>Our partners help make the world a better place </h1>
<div style="clear: both;">
<br />
<img alt="Corporate volunteers in a park" style="float: right; padding: 8px;" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/companyvolunteers.jpg" />
The iMIS Foundation's corporate partners demonstrate their commitment to preserving the world's ecological heritage through their generous support of our mission and programs. Our partners contribution's comprise over 25% of our annual operating budget and they donate even more through gifts of services and employee time. We are so grateful for their support! <br />
<br />
We offer a variety of partnership
opportunities designed to engage employees, build customer loyalty, and have a positive and lasting
positive impact on the environment and your local community. Creating a partnership with the iMIS Foundation complement's companies' core values and lets them be active philanthropic participants. Contact Emily Boutin if you are interested in becoming a corporate partner!<br />
<p>
<br />
Some iMIS Foundation programs that your corporation can be a part of include:
</p>
<ul>
    <li>Leadership training</li>
    <li>First-aid training</li>
    <li>Disaster response training</li>
    <li>Scouting</li>
    <li>Sports and athletic programs to raise funds and awareness for the environment </li>
    <li>Volunteer service</li>
    <li>Communities-in-schools programs for environmental education</li>
    <li>Special community projects such as tree-planting campaigns, trash clean up, and beach beautification days</li>
</ul>
</div></asp:Panel></CM:ContentHtml>
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
				<CM:ContentHtml ID="ciVersaton_3d7f304dd15f46929913d7ba87984eac" runat="server" ContentKey="cac0d90a-d33a-4f1d-9ac5-86af4ce2ecb8" ContentItemKey="3d7f304d-d15f-4692-9913-d7ba87984eac" Title="Versaton" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Versaton" runat="server"><h2> Versaton </h2>
<img alt="Versaton logo" style="max-width: 100%;" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/versaton.png" /><br />
<br />
Versaton was founded in 1991 by Sanjay Gupta and Michael Harris. Today Versaton's high quality medical supplies and equipment is used in hospitals across the world, making surgery safer and easier for the entire medical team. Versaton generously contributes to our education fund and matches employee contributions, while Versaton employees themselves donate thousands of hours to our hands-on projects as part of their quarterly Community Cares volunteer days.<br /></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-4">
						<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciOpus_421df6bec23642299bb2817cacf80164" runat="server" ContentKey="cac0d90a-d33a-4f1d-9ac5-86af4ce2ecb8" ContentItemKey="421df6be-c236-4229-9bb2-817cacf80164" Title="Opus" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Opus" runat="server"><h2>Opus, Incorporated</h2>
<img alt="Opus logo" style="max-width: 100%;" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/opus.png" />
<br />
Opus, Inc. is a premier financial software and services company. Founded by Eden Rochefort in 2001, Opus has been a partner of the iMIS Foundation from the very start.  Ms. Rochefort and her husband, Jim, were charter members of our Washington, D.C. chapter! Opus' generous in-kind donations of accounting software and services help us track our financial campaigns around the world and contribute to our success. Opus is also a major donor to our legislative action campaign.</asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-4">
						<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciGeo_aa4a5d09a7a44e69aa7cc48955667f54" runat="server" ContentKey="cac0d90a-d33a-4f1d-9ac5-86af4ce2ecb8" ContentItemKey="aa4a5d09-a7a4-4e69-aa7c-c48955667f54" Title="Geo" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Geo" runat="server"><h2>Geo International</h2>
<br />
<img alt="Geo International logo" style="max-width: 100%;" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/geo_international.png" /><br />
Geo, International has been a successful petroleum engineering firm for the past sixty years. Their international presence has helped the iMIS Foundation engage in habitat preservation around the world, with generous donations of funds as well as meeting spaces and others resources for disaster and emergency response.</asp:Panel></CM:ContentHtml>
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