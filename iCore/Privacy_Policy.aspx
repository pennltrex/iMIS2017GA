<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Privacy Policy" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("e1af531e-9524-4b73-bd47-d4c9855a33c8"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("5914dddc-3751-495a-bd04-d8db2c50feaf"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciPrivacyPolicy_131cbdad86684e9482e9b43350407895 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("131cbdad-8668-4e94-82e9-b43350407895");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciPrivacyPolicy_131cbdad86684e9482e9b43350407895);

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
				<CM:ContentHtml ID="ciPrivacyPolicy_131cbdad86684e9482e9b43350407895" runat="server" ContentKey="e1af531e-9524-4b73-bd47-d4c9855a33c8" ContentItemKey="131cbdad-8668-4e94-82e9-b43350407895" Title="Privacy Policy" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_PrivacyPolicy" runat="server"><h1>Cookies on our Web Site</h1>
<p style="text-align: left;"><span style="font-family: Arial; font-size: 13px;">This site, like many other sites, uses small files called cookies to help customize your experience. Find out more about cookies and how you can control them</span></p>
<h2><a name="what" target="blank"></a>Quick description of cookies</h2>
<p style="text-align: left;"><span style="font-family: Arial; font-size: 13px;">'Cookies' are small text files that are stored by the browser (e.g. Internet Explorer, Firefox, Chrome or Safari) or by a mobile phone (e.g. Android or iPhone) on your computer or mobile device. They allow websites to store such things as user preferences. You can think of cookies as providing a "memory" for the website, enabling it to recognize a user and respond appropriately.</span></p>
<h2><a name="how" target="blank"></a>Cookies and their use</h2>
<p style="text-align: left;"><span style="font-family: Arial; font-size: 13px;">There are different types of cookies based on their use:</span></p>
<ul style="list-style-type: disc;">
    <li style="text-align: left;"><span style="font-family: Arial; font-size: 13px;">Some cookies we use to remember your preferences for tools found on our web sites, so you don't have to reenter them each time you switch a page or each time you visit. They will remember your user login, the language you prefer and other things such as what video streaming speeds you use.</span></li>
    <li style="text-align: left;"><span style="font-family: Arial; font-size: 13px;">Some are created and used by web analytics software (such as Google Analytics) to track how many individual unique users we have, and how often they visit the site. Unless you are signed in to the site, these cookies cannot be used to identify you personally. If you are logged in, the login process links you to your stored membership record that includes your username and email address.</span></li>
    <li style="text-align: left;"><span style="font-family: Arial; font-size: 13px;">Some cookies are used by geo-targeting software which tries to identify what country you are in based on the information supplied by your browser when it requests a web page. This cookie is completely anonymous, and is only used to help target content - such as whether you see our UK or another home page - and advertising.</span></li>
    <li style="text-align: left;"><span style="font-family: Arial; font-size: 13px;"><a name="site" target="blank"></a><a name="analytics" target="blank"></a><a name="geotarget" target="blank"></a><a name="registration" target="blank"></a>When you register with us, we generate cookies that signal whether you are signed in or not. We use these cookies to determine which account you are signed in with, and if you should get access to a service. It also allows us to associate any comments you post with your Advertising cookies</span></li>
    <li style="text-align: left;"><span style="font-family: Arial; font-size: 13px;">Some cookies are used for directing advertisements. They allow us to know whether or not you've seen an advertisement or a type of advertisement, and how long it is since you've seen it. They are used to help target advertising so that you see more relevant advertising. These cookies are anonymous - they store information about the content you are browsing, but not about who you are. Those cookies of this type that are generated by third party advertisers have their own privacy policies, and we have no access to read or write these cookies. These third party advertising cookies may be used by those third parties to anonymously target advertising to you on other websites, based on your visit to our sites.</span></li>
    <li style="text-align: left;"><span style="font-family: Arial; font-size: 13px;"><a name="advertising" target="blank"></a><a name="third-party-ads" target="blank"></a><a name="other-third-party" target="blank"></a>On some of our pages, third parties may also set their own anonymous cookies, for the purposes of tracking the use of their application, or tailoring the application for you. Because of how cookies work, we cannot access these cookies, nor can the third parties access the data in cookies used by us. As an example, when you share an article using a social media sharing button on our sites, the social network that has created the button will record that you have done this.</span></li>
</ul>
<h2><a name="off" target="blank"></a>Turning off cookies</h2>
<p style="text-align: left;"><span style="font-family: Arial; font-size: 13px;">Most browsers and phones have a way to stop accepting classes of cookies, or to stop it accepting cookies from a particular website. For example, using cookies is needed in order to use our shopping cart, so you would not be able to buy things through our web site if you turned off our cookies.</span></p>
<p style="text-align: left;"><span style="font-family: Arial; font-size: 13px;">Help in turning off cookies can be found in your browser or mobile phone help files or at <a href="http://www.usa.gov/optout-instructions.shtml" target="blank">this web site</a>.</span></p>
<p style="text-align: left;"><span style="font-family: Arial; font-size: 13px;"><a name="ad-cookies-off" target="blank"></a>If you are concerned about third party cookies generated by advertisers from Europe, you can turn some of these off by going to the <a href="http://www.youronlinechoices.com/" target="blank">Your Online Choices site</a>. </span></p>
<h2><a name="links" target="blank"></a>More information</h2>
<p style="text-align: left;"><span style="font-family: Arial; font-size: 13px;">If you still have questions, please contact us.</span></p>
<br /></asp:Panel></CM:ContentHtml>
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