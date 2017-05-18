<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Other Ways to Help" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("9d82009b-e5b7-48ba-9a0f-0a2e56eab913"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("b6c2b235-520c-488e-be1d-74a5266df54c"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciIntrocontent_a08c1ea0ba964a56a5506f0eb9981844 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a08c1ea0-ba96-4a56-a550-6f0eb9981844");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciIntrocontent_a08c1ea0ba964a56a5506f0eb9981844);

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
				<CM:ContentHtml ID="ciIntrocontent_a08c1ea0ba964a56a5506f0eb9981844" runat="server" ContentKey="9d82009b-e5b7-48ba-9a0f-0a2e56eab913" ContentItemKey="a08c1ea0-ba96-4a56-a550-6f0eb9981844" Title="Intro content" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Introcontent" runat="server"><h1>Other Ways to Help</h1>
<p>There are many ways you can help in our efforts to identify, restore, and advocate for crucial wildlife habitats throughout the world.</p>
<h2>Impact your community</h2>
<p>With 23 field offices worldwide, chances are we are taking action to preserve the environment in your region. Most major cities have a chapter of our conservation club. These clubs host lectures, learning lunches, and other special events that showcase their projects. Our Community Days focus on local area concerns such as picking up trash, keeping established trails in good repair, helping cut back invasive non-native species, and planting a butterfly garden. Contact us to find an office near you!</p>
<h2>Educate</h2>
<p>The iMIS Foundation’s Educational Working Group meets at the National Conference each year and sets the next year's focus for areas of conservation and preservation education. We develop classroom curriculum, pamphlets, interactive guides, and other teaching materials focusing on the year’s theme. This year, the focus is on wetlands preservation.</p>
<p>Contact us if you're interested in joining the group, teaching classes, or making presentations to groups and schools in your community using our educational materials. Help promote a passion for preserving our natural world and have a great time doing it!</p>
<h2>Become a partner</h2>
<p>We offer a variety of partnership opportunities designed to engage employees, build customer loyalty, and have a positive and lasting impact on the environment and your local community. Creating a partnership with the iMIS Foundation complements your company's core values and empowers your employees to be active philanthropic participants. Contact Emily Boutin if you are interested in becoming a corporate partner!</p></asp:Panel></CM:ContentHtml>
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