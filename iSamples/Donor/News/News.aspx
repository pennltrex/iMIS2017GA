<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="News" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("c2ffaaa0-553f-464e-b3cc-6de306183542"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("46cc4e5c-444e-4a8f-a003-14a386961f45"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciJumbotron_ced50066ebe043eaa1df943019ecce04 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("ced50066-ebe0-43ea-a1df-943019ecce04");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciJumbotron_ced50066ebe043eaa1df943019ecce04);

		childUserControl = ciHeading_262b688d3c1b48cc97256bfbaebc6ef4 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("262b688d-3c1b-48cc-9725-6bfbaebc6ef4");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciHeading_262b688d3c1b48cc97256bfbaebc6ef4);

		AddChildUserControl(ContentPage2);

		childUserControl = ciRecentProjects_915335bd46a64580a9a149a7f69d0b3e as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("915335bd-46a6-4580-a9a1-49a7f69d0b3e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRecentProjects_915335bd46a64580a9a149a7f69d0b3e);

		AddChildUserControl(ContentPage3);

		childUserControl = ciBlog_cef6616ae94b4508aebfdd397d20b187 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("cef6616a-e94b-4508-aebf-dd397d20b187");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciBlog_cef6616ae94b4508aebfdd397d20b187);

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
				<CM:ContentHtml ID="ciJumbotron_ced50066ebe043eaa1df943019ecce04" runat="server" ContentKey="c2ffaaa0-553f-464e-b3cc-6de306183542" ContentItemKey="ced50066-ebe0-43ea-a1df-943019ecce04" Title="Jumbotron" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Jumbotron" runat="server"><div class="jumbotron interior bg-img-swamp AlignRight">
<div class="jumbotron-content">
<p class="jumbotron-text">
<span>By raising awareness</span>
<span>we can stop</span>
<span>habitat destruction</span>
<span>and save wildlife</span>
</p>
<div class="img-copyright">
<a href="https://www.flickr.com/photos/usfwsnortheast/4578425529/sizes/l">Photo</a> by Rebecca Wynn/USFWS / <a href="http://creativecommons.org/licenses/by/2.0/">CC BY 2.0</a>
</div>
</div>
</div></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciHeading_262b688d3c1b48cc97256bfbaebc6ef4" runat="server" ContentKey="c2ffaaa0-553f-464e-b3cc-6de306183542" ContentItemKey="262b688d-3c1b-48cc-9725-6bfbaebc6ef4" Title="Heading" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Heading" runat="server"><h1>News from iF</h1>
<p>We're working around the clock to help make the world a better place. Keep up with all the latest news from the field as we work to save wildlife and improve our planet.</p></asp:Panel></CM:ContentHtml>
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
				<CM:ContentHtml ID="ciRecentProjects_915335bd46a64580a9a149a7f69d0b3e" runat="server" ContentKey="c2ffaaa0-553f-464e-b3cc-6de306183542" ContentItemKey="915335bd-46a6-4580-a9a1-49a7f69d0b3e" Title="Recent Projects" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_RecentProjects" runat="server"><h2 class="header-link"><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>News/Recent_projects/iSamples/Donor/News/RecentProjects.aspx">Recent <span class="NoWrap">Projects »</span></a></h2>
<p>Our projects are only possible thanks to donations of your time and money. Learn about recently-completed projects from our community.</p></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciBlog_cef6616ae94b4508aebfdd397d20b187" runat="server" ContentKey="c2ffaaa0-553f-464e-b3cc-6de306183542" ContentItemKey="cef6616a-e94b-4508-aebf-dd397d20b187" Title="Blog" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Blog" runat="server"><h2 class="header-link"><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>News/Blog/iSamples/Donor/News/Blog.aspx"><span class="NoWrap">Blog »</span></a></h2>
<p>Become part of our community of concerned citizens. On our blog, we share news of advocacy campaigns, emergency relief efforts, and volunteer opportunities. Stay up-to-date and give us your input.</p></asp:Panel></CM:ContentHtml>
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