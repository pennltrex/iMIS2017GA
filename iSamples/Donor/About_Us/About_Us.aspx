<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="About Us" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("64194971-43e8-4701-8ccd-35b3313b134f"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("40f478d6-6800-4c91-86c8-2985cd8ca2b3"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciJumbotron_31c534199c2743099d1584e4d0483f2c as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("31c53419-9c27-4309-9d15-84e4d0483f2c");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciJumbotron_31c534199c2743099d1584e4d0483f2c);

		childUserControl = ciAboutUs_0ee29c7b5fe545879a3403865018f1f6 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("0ee29c7b-5fe5-4587-9a34-03865018f1f6");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAboutUs_0ee29c7b5fe545879a3403865018f1f6);

		AddChildUserControl(ContentPage2);

		childUserControl = ciOurMission_09e00845e90c4f299571790b9c938698 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("09e00845-e90c-4f29-9571-790b9c938698");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciOurMission_09e00845e90c4f299571790b9c938698);

		childUserControl = ciOurLeadership_fa45faf6dac7423fb1e20fe13127d5d4 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("fa45faf6-dac7-423f-b1e2-0fe13127d5d4");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciOurLeadership_fa45faf6dac7423fb1e20fe13127d5d4);

		AddChildUserControl(ContentPage3);

		childUserControl = ciOurFinances_57280c2ef6ef4ef0811e8cac036cb947 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("57280c2e-f6ef-4ef0-811e-8cac036cb947");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciOurFinances_57280c2ef6ef4ef0811e8cac036cb947);

		childUserControl = ciNewContentHtml_7b35a6373c264934ac38a963026fd08d as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("7b35a637-3c26-4934-ac38-a963026fd08d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml_7b35a6373c264934ac38a963026fd08d);

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
				<CM:ContentHtml ID="ciJumbotron_31c534199c2743099d1584e4d0483f2c" runat="server" ContentKey="64194971-43e8-4701-8ccd-35b3313b134f" ContentItemKey="31c53419-9c27-4309-9d15-84e4d0483f2c" Title="Jumbotron" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Jumbotron" runat="server"><div class="jumbotron interior bg-img-volunteer-canoes AlignLeft">
<div class="jumbotron-content">
<p class="jumbotron-text">
<span>Our mission is to identify,</span>
<span>restore and advocate for</span>
<span>crucial wildlife habitats</span>
<span>throughout the world</span>
</p>
<div class="img-copyright">
<a href="https://www.flickr.com/photos/usfwsnortheast/7557325462">Photo</a> by Mike Goehle/USFWS / <a href="http://creativecommons.org/licenses/by/2.0/">CC BY 2.0</a>
</div>
</div>
</div></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciAboutUs_0ee29c7b5fe545879a3403865018f1f6" runat="server" ContentKey="64194971-43e8-4701-8ccd-35b3313b134f" ContentItemKey="0ee29c7b-5fe5-4587-9a34-03865018f1f6" Title="About Us" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_AboutUs" runat="server"><h1>About Us</h1>
<p>Our vision is for every person to be able to enjoy the rich ecological heritage of our planet in as unspoiled state as possible. We are independent of any government, political ideology, economic interest, or religion. We are funded by our membership, public donations, and the generous support of our corporate partners and sponsors.</p></asp:Panel></CM:ContentHtml>
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
				<CM:ContentHtml ID="ciOurMission_09e00845e90c4f299571790b9c938698" runat="server" ContentKey="64194971-43e8-4701-8ccd-35b3313b134f" ContentItemKey="09e00845-e90c-4f29-9571-790b9c938698" Title="Our Mission" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_OurMission" runat="server"><h2 class="header-link"><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>About_Us/Our_mission/iSamples/Donor/About_Us/Mission.aspx">Our Mission »</a></h2>
<p>To effectively make a difference, we target very specific areas for our efforts. We focus on mediating the effects of urbanization, reclaiming brownfields, and relocating endangered wildlife.</p></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciOurLeadership_fa45faf6dac7423fb1e20fe13127d5d4" runat="server" ContentKey="64194971-43e8-4701-8ccd-35b3313b134f" ContentItemKey="fa45faf6-dac7-423f-b1e2-0fe13127d5d4" Title="Our Leadership" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_OurLeadership" runat="server"><h2 class="header-link"><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>About_Us/Our_leadership/iSamples/Donor/About_Us/Leadership.aspx">Our Leadership »</a></h2>
<p>The iMIS Foundation was established in 1992 by Julia and Rob Gillis, Chicago entrepreneurs and philanthropists, who wanted to create a hands-on way to get involved in worldwide environmental and wildlife conservation efforts. </p></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciOurFinances_57280c2ef6ef4ef0811e8cac036cb947" runat="server" ContentKey="64194971-43e8-4701-8ccd-35b3313b134f" ContentItemKey="57280c2e-f6ef-4ef0-811e-8cac036cb947" Title="Our Finances" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_OurFinances" runat="server"><h2 class="header-link"><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>About_Us/Our_finances/iSamples/Donor/About_Us/Finances.aspx">Our Finances »</a></h2>
<p>We strive to be transparent with our finances so that you know exactly how your donations are used. Our finances are audited annually and the results are submitted to international charity monitoring organizations. We are proud to be consistently on the Top Ten lists for these organizations.</p></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciNewContentHtml_7b35a6373c264934ac38a963026fd08d" runat="server" ContentKey="64194971-43e8-4701-8ccd-35b3313b134f" ContentItemKey="7b35a637-3c26-4934-ac38-a963026fd08d" Title="New ContentHtml" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml" runat="server"><h2 class="header-link"><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>About_Us/Careers/iSamples/Donor/About_Us/Career.aspx">Careers »</a></h2>
<p>Are you interested in a rewarding career while making a difference in the world? Whether you are beginning your career or you are a seasoned professional, you can find a meaningful career here. We would be honored to have you join our team!</p></asp:Panel></CM:ContentHtml>
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