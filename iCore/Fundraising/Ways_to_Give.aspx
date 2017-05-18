<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Ways to Give" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="SocialShare" Src="~/iParts/Social/SocialShare/SocialShareDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("ed50dd0b-3a6c-49e8-96f1-76e59a4cf54e"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("e2f057dc-bf28-4961-9401-7824cd667cc9"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewSocialShareCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("f1aae3eb-6153-411e-ad74-1411efcd1d2b");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewSocialShareCommon);

		AddChildUserControl(ContentPage2);

		childUserControl = ciWaystoGiveImage_9df7e198cb9d43e89db3b33abcebc648 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9df7e198-cb9d-43e8-9db3-b33abcebc648");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciWaystoGiveImage_9df7e198cb9d43e89db3b33abcebc648);

		AddChildUserControl(ContentPage3);

		childUserControl = ciWaystoGiveOptions_e19879fc47ff4c869348b1f5a8747489 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e19879fc-47ff-4c86-9348-b1f5a8747489");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciWaystoGiveOptions_e19879fc47ff4c869348b1f5a8747489);

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
				<CM:SocialShare ID="ciNewSocialShareCommon" runat="server" ContentKey="ed50dd0b-3a6c-49e8-96f1-76e59a4cf54e" ContentItemKey="f1aae3eb-6153-411e-ad74-1411efcd1d2b" Title="New SocialShareCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" BorderVisible="False" UrlToShare="" IconDimension="24" LegendText="Share this page" />
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
				<CM:ContentHtml ID="ciWaystoGiveImage_9df7e198cb9d43e89db3b33abcebc648" runat="server" ContentKey="ed50dd0b-3a6c-49e8-96f1-76e59a4cf54e" ContentItemKey="9df7e198-cb9d-43e8-9db3-b33abcebc648" Title="WaystoGiveImage" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_WaystoGiveImage" runat="server"><img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/ImageLibrary/Pelican.jpg" />
<p> </p></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
		</div>
		<div class="col-sm-8">
						<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciWaystoGiveOptions_e19879fc47ff4c869348b1f5a8747489" runat="server" ContentKey="ed50dd0b-3a6c-49e8-96f1-76e59a4cf54e" ContentItemKey="e19879fc-47ff-4c86-9348-b1f5a8747489" Title="WaystoGiveOptions" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_WaystoGiveOptions" runat="server"><h2>Support Our Organization</h2>
<p>Your support of our work puts you at the center of critical conservation projects underway around the globe and close to home.</p>
<blockquote>
<h3><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>iCore/Fundraising/GiveNow.aspx">Make a one-time Donation</a></h3>
<p>Use your payment card or Paypal account to make a donation today.</p>
<h3><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>iCore/Fundraising/GiveNowTribute.aspx">Give a Tribute Donation</a></h3>
<p>Want to make a donation in memory of a loved one? Visit our tribute page to commemorate a special occasion.</p>
<h3><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>iCore/ContentManagement/Search.aspx?InitialArea=5A219272-F056-480A-84D3-D3EDA8365A99&InitialText=imis">Shop our Catalog</a></h3>
<p>Show the conservationists in your family how much you love them.  Our catalog offers a wide range of gift items for everyone.</p>
<h3><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>iCore/ContentManagement/Search.aspx?InitialArea=82BAE9D2-BBF2-4341-AF96-D280EA988D1D">Attend a Special Event</a></h3>
<p>We regularly host events to bring together our community.  Take a look at what's coming up and join us at one of our events.</p>
<h3>Corporate Giving</h3>
<p>We offer extensive opportunities for companies to work with us. </p>
<h3>Personal Fundraising</h3>
<p>A personal nature fund is a great way to have fun while motivating your family and friends to support the places, animals and people you care about.</p>
<h3>Employer Giving</h3>
<p>You maximize the impact your donation has on critical efforts when you sign up for workplace giving or take advantage of employer matching gift programs.</p>
</blockquote></asp:Panel></CM:ContentHtml>
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