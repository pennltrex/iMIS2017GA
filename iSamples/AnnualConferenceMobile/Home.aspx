<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Home" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="SocialShare" Src="~/iParts/Social/SocialShare/SocialShareDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("15a9a0d2-8c28-425f-8c9d-3abbd660982d"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("0b196fee-cbee-4aad-92bf-6def327b6ec9"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewSocialShareCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("8b47a533-c25a-4407-8bd6-5563d0475a04");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewSocialShareCommon);

		childUserControl = ciAnnualconference_ff4b170851164ce0aef48b3dd423848e as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("ff4b1708-5116-4ce0-aef4-8b3dd423848e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAnnualconference_ff4b170851164ce0aef48b3dd423848e);

		childUserControl = ciTwitterfeed_d8fd8905a37d4ca9ab51c1e29841561f as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("d8fd8905-a37d-4ca9-ab51-c1e29841561f");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciTwitterfeed_d8fd8905a37d4ca9ab51c1e29841561f);

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
				<CM:SocialShare ID="ciNewSocialShareCommon" runat="server" ContentKey="15a9a0d2-8c28-425f-8c9d-3abbd660982d" ContentItemKey="8b47a533-c25a-4407-8bd6-5563d0475a04" Title="New SocialShareCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" BorderVisible="False" UrlToShare="" IconDimension="24" LegendText="Share this page:" />
				<CM:ContentHtml ID="ciAnnualconference_ff4b170851164ce0aef48b3dd423848e" runat="server" ContentKey="15a9a0d2-8c28-425f-8c9d-3abbd660982d" ContentItemKey="ff4b1708-5116-4ce0-aef4-8b3dd423848e" Title="Annual conference" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Annualconference" runat="server"><h1>Annual Conference</h1>
<strong>Cairns, Queensland, Australia</strong><br />
<br /></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciTwitterfeed_d8fd8905a37d4ca9ab51c1e29841561f" runat="server" ContentKey="15a9a0d2-8c28-425f-8c9d-3abbd660982d" ContentItemKey="d8fd8905-a37d-4ca9-ab51-c1e29841561f" Title="Twitter feed" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Twitterfeed" runat="server"><a class="twitter-timeline" href="https://twitter.com/advsol" data-widget-id="395579553290014720">Tweets by @advsol</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script></asp:Panel></CM:ContentHtml>
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