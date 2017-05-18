<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Be a Fundraiser" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("40f03ce4-6155-49bf-be1c-3974a9eaf9d2"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("f3719382-10cd-47f7-bc2b-43c60689d133"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciIntrocontent_a09f88c65cfc4ee9887effd6b6bf3bbf as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a09f88c6-5cfc-4ee9-887e-ffd6b6bf3bbf");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciIntrocontent_a09f88c65cfc4ee9887effd6b6bf3bbf);

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
				<CM:ContentHtml ID="ciIntrocontent_a09f88c65cfc4ee9887effd6b6bf3bbf" runat="server" ContentKey="40f03ce4-6155-49bf-be1c-3974a9eaf9d2" ContentItemKey="a09f88c6-5cfc-4ee9-887e-ffd6b6bf3bbf" Title="Intro content" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Introcontent" runat="server"><h1>Be a Fundraiser</h1>
<div class="row">
<div class="col-sm-8">
<p>Join our team! Want to help us raise funds to help preserve the environment in your region, or around the world? Is your area of interest preserving the Arctic tundra? Building wetland habitats in overdeveloped areas? Advocating for wildlife conservation?</p>
<p>By taking an active role in our cause, you can spread awareness, share your passion, and raise funds that help restore the planet's threatened habitats. Taking action is easy. Just contact us at <a href="mailto:fundraisers@imisdemo.com">fundraisers@imisdemo.com</a> and we will help you get started.</p>
</div>
<div class="col-sm-4 hidden-xs">
<img alt="Picture of people making it to the finish line" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/finish-line.jpg" />
<div class="img-copyright">
<a href="https://www.flickr.com/photos/usnavy/5600584959">Photo</a> by Official U.S. Navy Imagery / <a href="http://creativecommons.org/licenses/by/2.0/">CC BY 2.0</a>
</div>
</div>
</div>
<p>Here are some fun ideas for how you can get together with your friends and family and help make a difference:</p>
<ul>
    <li>
    Set up a local fundraising event
    </li>
    <li>Set up a local fundraising event
    </li>
    <li>Organize a walk with friends and find local sponsors
    </li>
    <li>Arrange a local kickball tournament with an entry fee
    </li>
    <li>Host a yard sale with donated goods from friends and family
    </li>
    <li>Organize a sweets sale at work or at a community event
    </li>
    <li> Offer to give public service announcements at a local school, club, or company
    </li>
    <li>Find out if your employer would match donations
    </li>
</ul>
<p>Or come up with your own creative fundraising idea! We'd love to feature your project on our website to help inspire others. Your ideas might also plant the seeds for a new program for the foundation!
</p></asp:Panel></CM:ContentHtml>
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