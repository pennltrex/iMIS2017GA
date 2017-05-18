<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Donate" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("66a01180-063a-4846-b7f0-a77647c7820e"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("71dbba06-5fc0-44ac-8605-5758326a7270"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciDonateHeaderImage_324f4d0fd1864b299d2b7e5945507d8e as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("324f4d0f-d186-4b29-9d2b-7e5945507d8e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDonateHeaderImage_324f4d0fd1864b299d2b7e5945507d8e);

		childUserControl = ciWaystoGive_6874db5a65ee465bb8fb32e7c306bd1b as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6874db5a-65ee-465b-b8fb-32e7c306bd1b");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciWaystoGive_6874db5a65ee465bb8fb32e7c306bd1b);

		AddChildUserControl(ContentPage2);

		childUserControl = ciOneTimeGift_f4f240523cc543d08b7d7478cbb3fb55 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("f4f24052-3cc5-43d0-8b7d-7478cbb3fb55");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciOneTimeGift_f4f240523cc543d08b7d7478cbb3fb55);

		childUserControl = ciSupportProject_fd9f6e22eb474356b0cc745b3972e36c as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("fd9f6e22-eb47-4356-b0cc-745b3972e36c");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSupportProject_fd9f6e22eb474356b0cc745b3972e36c);

		AddChildUserControl(ContentPage3);

		childUserControl = ciShopWithUs_1f8463718c1f40d18dadd82d515e531f as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("1f846371-8c1f-40d1-8dad-d82d515e531f");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciShopWithUs_1f8463718c1f40d18dadd82d515e531f);

		childUserControl = ciWorkplace_f8c821f55df94b79b6d863863799bb84 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("f8c821f5-5df9-4b79-b6d8-63863799bb84");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciWorkplace_f8c821f55df94b79b6d863863799bb84);

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
				<CM:ContentHtml ID="ciDonateHeaderImage_324f4d0fd1864b299d2b7e5945507d8e" runat="server" ContentKey="66a01180-063a-4846-b7f0-a77647c7820e" ContentItemKey="324f4d0f-d186-4b29-9d2b-7e5945507d8e" Title="Donate Header Image" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_DonateHeaderImage" runat="server"><div class="jumbotron interior bg-img-elephant-with-mountains AlignRight">
<div class="jumbotron-content">
<p class="jumbotron-text">
<span>Help us respond to </span>
<span>urgent conservation </span>
<span>issues around the </span>
<span>world</span>
</p>
<div class="ActionButton">
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>GiveNow" class="TextButton PrimaryButton MediumButton">Donate Now</a>
</div>
<div class="img-copyright">
<a href="https://www.flickr.com/photos/dariengs/8153421697/sizes/c/">Photo</a> by Darien Graham-Smith / <a href="http://creativecommons.org/licenses/by/2.0/">CC BY 2.0</a>
</div>
</div>
</div></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciWaystoGive_6874db5a65ee465bb8fb32e7c306bd1b" runat="server" ContentKey="66a01180-063a-4846-b7f0-a77647c7820e" ContentItemKey="6874db5a-65ee-465b-b8fb-32e7c306bd1b" Title="WaystoGive" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_WaystoGive" runat="server"><h1>Ways to Give</h1></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciOneTimeGift_f4f240523cc543d08b7d7478cbb3fb55" runat="server" ContentKey="66a01180-063a-4846-b7f0-a77647c7820e" ContentItemKey="f4f24052-3cc5-43d0-8b7d-7478cbb3fb55" Title="OneTimeGift" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_OneTimeGift" runat="server"><h2 class="header-link"><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>Donate_/Donate_now/iCore/Fundraising/Donate_Now.aspx">Make a one-time <span class="NoWrap">gift »</span></a></h2>
<p>At any given time, iMIS Foundation volunteers are hard at work, restoring habitats and maintaining wilderness areas that native wildlife call home.  Every donation helps!</p></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciSupportProject_fd9f6e22eb474356b0cc745b3972e36c" runat="server" ContentKey="66a01180-063a-4846-b7f0-a77647c7820e" ContentItemKey="fd9f6e22-eb47-4356-b0cc-745b3972e36c" Title="SupportProject" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_SupportProject" runat="server"><h2 class="header-link"><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>Donate_/Support_a_project/iSamples/Donor/Donate/Choose_a_project.aspx">Support a <span class="NoWrap">project »</span></a></h2>
<p>The iMIS Foundation is working on many different types of projects; some are habitat-oriented while others are focused on the animals the habitat supports. Take a moment and browse through our projects. Any donations made towards a specific project will be restricted for its use only.</p></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciShopWithUs_1f8463718c1f40d18dadd82d515e531f" runat="server" ContentKey="66a01180-063a-4846-b7f0-a77647c7820e" ContentItemKey="1f846371-8c1f-40d1-8dad-d82d515e531f" Title="ShopWithUs" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_ShopWithUs" runat="server"><h2 class="header-link"><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>Donate_/Shop_with_us/iCore/Store/StoreLayouts/Store_Home.aspx">Shop with <span class="NoWrap">us »</span></a></h2>
<p>Help support the iMIS Foundation while shopping. We offer a variety of items that make the perfect treat for yourself or a gift for a loved one. All profits support our initiatives.</p></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciWorkplace_f8c821f55df94b79b6d863863799bb84" runat="server" ContentKey="66a01180-063a-4846-b7f0-a77647c7820e" ContentItemKey="f8c821f5-5df9-4b79-b6d8-63863799bb84" Title="Workplace" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Workplace" runat="server"><h2 class="header-link"><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>Donate_/Workplace_giving/iSamples/Donor/Donate/Workplace_Giving.aspx">Workplace <span class="NoWrap">giving »</span></a></h2>
<p>Double your gift by taking advantage of your employer's matching gift program.</p></asp:Panel></CM:ContentHtml>
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