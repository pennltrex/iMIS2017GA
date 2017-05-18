<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Benefits" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="SocialShare" Src="~/iParts/Social/SocialShare/SocialShareDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="DataShowcase" Src="~/iParts/Common/DataShowcase/DataShowcaseDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("91e02df0-b7c9-46eb-b6d0-a6e16a6b2db7"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("ddfdf224-a7a3-4216-9f86-465227dcd6c5"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciStudentJoinLinkScript_eb4fb4243b184b59a824db89d30d07a9 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("eb4fb424-3b18-4b59-a824-db89d30d07a9");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciStudentJoinLinkScript_eb4fb4243b184b59a824db89d30d07a9);

		childUserControl = ciNewSocialShareCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("f3e8e4a1-c92c-4373-b80c-66b3e35c7559");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewSocialShareCommon);

		AddChildUserControl(ContentPage2);

		childUserControl = ciJoinUs_92c0f7a2b4e446f7abeb0255d155f919 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("92c0f7a2-b4e4-46f7-abeb-0255d155f919");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciJoinUs_92c0f7a2b4e446f7abeb0255d155f919);

		childUserControl = ciMembershipQuote_a32e1c21c3f347c8af1c9ee0f2664e91 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a32e1c21-c3f3-47c8-af1c-9ee0f2664e91");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMembershipQuote_a32e1c21c3f347c8af1c9ee0f2664e91);

		AddChildUserControl(ContentPage3);

		childUserControl = ciGetInvolved_16b45cfc5ad74304823b39865ffe5138 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("16b45cfc-5ad7-4304-823b-39865ffe5138");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciGetInvolved_16b45cfc5ad74304823b39865ffe5138);

		AddChildUserControl(ContentPage4);

		childUserControl = ciJoinNow as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("aca8c750-fe0d-4688-a86c-bfbec0574110");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciJoinNow);

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
				<CM:ContentHtml ID="ciStudentJoinLinkScript_eb4fb4243b184b59a824db89d30d07a9" runat="server" ContentKey="91e02df0-b7c9-46eb-b6d0-a6e16a6b2db7" ContentItemKey="eb4fb424-3b18-4b59-a824-db89d30d07a9" Title="StudentJoinLinkScript" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_StudentJoinLinkScript" runat="server"></asp:Panel></CM:ContentHtml>
				<CM:SocialShare ID="ciNewSocialShareCommon" runat="server" ContentKey="91e02df0-b7c9-46eb-b6d0-a6e16a6b2db7" ContentItemKey="f3e8e4a1-c92c-4373-b80c-66b3e35c7559" Title="New SocialShareCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" BorderVisible="False" UrlToShare="" IconDimension="16" LegendText="Share this page" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
<div class="row">
    <div class="col-sm-8">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciJoinUs_92c0f7a2b4e446f7abeb0255d155f919" runat="server" ContentKey="91e02df0-b7c9-46eb-b6d0-a6e16a6b2db7" ContentItemKey="92c0f7a2-b4e4-46f7-abeb-0255d155f919" Title="Join Us" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_JoinUs" runat="server"><div class="PageTitle"><span>Benefits of membership</span></div></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciMembershipQuote_a32e1c21c3f347c8af1c9ee0f2664e91" runat="server" ContentKey="91e02df0-b7c9-46eb-b6d0-a6e16a6b2db7" ContentItemKey="a32e1c21-c3f3-47c8-af1c-9ee0f2664e91" Title="Membership Quote" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_MembershipQuote" runat="server"><div class="ContentBlockPrimary">
<div class="FloatRight">
<img src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/UploadedImages/groupatconferencesmaller.jpg" style="width: 140px;" alt="Business people chatting at a conference" />
</div>
<div class="ContentBlockRight">
<h3>Membership is valuable</h3>
<blockquote class="Quote">
<p>I've always considered my membership a great investment. It's not just the opportunities to connect and learn - or how iMIS has allowed my voice to be heard - but it's the little things too, like being in the National Membership Achievement Program. With iMIS, we can make a difference for each other.</p>
<strong> Alex Morgan, Vice President, Versaton Global</strong></blockquote>
</div>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-4">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciGetInvolved_16b45cfc5ad74304823b39865ffe5138" runat="server" ContentKey="91e02df0-b7c9-46eb-b6d0-a6e16a6b2db7" ContentItemKey="16b45cfc-5ad7-4304-823b-39865ffe5138" Title="Get Involved" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_GetInvolved" runat="server"><h2>Get involved</h2>
<div class="BlockList">
<ul>
    <li><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>iSamples/SharedContent/ContactManagement/Directory.aspx">
    <div><span>Connect</span>
    <p><em>(Members Only)</em>
    Find new career connections through the Membership Directory or in our networking functions.</p>
    </div>
    </a>
    </li>
    <li><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>Communities/CommunityList/iCore/Communities/CommunitiesList.aspx?hkey=b642be24-21b7-4dc2-a734-58e0d7a027be">
    <div><span>Communities</span>
    <p><em>(Members Only)</em>
    Stay up-to-date on technology, industry issues, and legislative actions. Connect with other members and thought leaders in the industry.</p>
    </div>
    </a>
    </li>
    <li><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>Events/Event_list/iSamples/Member/Search.aspx?InitialArea=82BAE9D2-BBF2-4341-AF96-D280EA988D1D">
    <div><span>Conferences</span>
    <p>Continue your professional development and achieve certification through conferences, regional seminars and chapter meetings--helping you make connections that benefit your career.</p>
    </div>
    </a>
    </li>
</ul>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
			<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:DataShowcase ID="ciJoinNow" runat="server" ContentKey="91e02df0-b7c9-46eb-b6d0-a6e16a6b2db7" ContentItemKey="aca8c750-fe0d-4688-a86c-bfbec0574110" Title="Join Now" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" Content="&lt;script type=&quot;text/javascript&quot;&gt;
// Use jQuery to add an onready function

jQuery(function(){

	var associate = jQuery(&quot;#AssociateMember&quot;).val();

	if (associate == &#39;&#39;){ 

		jQuery(&quot;#associateLink&quot;).attr({

			disabled: &quot;true&quot;,

			title: &quot;This link is disabled because there is no billing product named ASSOCIATE_MEMBERSHIP_FEES defined&quot;

		});								

		jQuery(&quot;#associateLink&quot;).click(function(){

			return false;

		});

		jQuery(&quot;#associateLink&quot;).css(&#39;cursor&#39;,&#39;default&#39;);

	}

	var regular = jQuery(&quot;#RegularMember&quot;).val();

	if (regular == &#39;&#39;){

		jQuery(&quot;#regularLink&quot;).attr({

			disabled: &quot;true&quot;,

			title: &quot;This link is disabled because there is no billing product named REGULAR_MEMBERSHIP_FEES defined&quot;

		});

		jQuery(&quot;#regularLink&quot;).click(function(){

			return false;

		});

		jQuery(&quot;#regularLink&quot;).css(&#39;cursor&#39;,&#39;default&#39;);	

	}

	var student = jQuery(&quot;#StudentMember&quot;).val();

	if (student  == &#39;&#39;){

		jQuery(&quot;#studentLink&quot;).attr({

			disabled: &quot;true&quot;,

			title: &quot;This link is disabled because there is no billing product named STUDENT_MEMBERSHIP_FEES defined&quot;

		});

		jQuery(&quot;#studentLink&quot;).click(function(){

			return false;

		});

		jQuery(&quot;#studentLink&quot;).css(&#39;cursor&#39;,&#39;default&#39;);	

    }
    else {

var studentRedirectLink = &#39;#&#39;;
var o = document.getElementById(&quot;__ClientContext&quot;);
if (o) {
    try {
        var j = JSON.parse(o.value);
        if (j &amp;&amp; j.hasOwnProperty(&#39;websiteRoot&#39;) &amp;&amp; j.hasOwnProperty(&#39;isAnonymous&#39;)) {
            if (j.isAnonymous !== true)
                 studentRedirectLink = j.websiteRoot + &quot;iCore/Membership/Student_Membership_Product.aspx&quot;;
            else
                studentRedirectLink = j.websiteRoot + &quot;iCore/Membership/Join_Now_Student.aspx&quot;;
        }
    } catch (e) { }
}

//		jQuery(&quot;#studentLink&quot;).attr({
//
//			href: studentRedirectLink
//
//		});               
    }

    var organization = jQuery(&quot;#OrganizationMember&quot;).val();

	if (organization == &#39;&#39;){

		jQuery(&quot;#organizationLink&quot;).attr({

			disabled: &quot;true&quot;,

			title: &quot;This link is disabled because there is no billing product named COMPANY_REGULAR_MEMBERSHIP defined&quot;

		});

		jQuery(&quot;#organizationLink&quot;).click(function(){

			return false;

		});

		jQuery(&quot;#organizationLink&quot;).css(&#39;cursor&#39;,&#39;default&#39;);	

	}
});

&lt;/script&gt;
&lt;input type=&quot;hidden&quot; id=&quot;AssociateMember&quot; value=&quot;{#1.ItemId}&quot; /&gt; &lt;input type=&quot;hidden&quot; id=&quot;RegularMember&quot; value=&quot;{#2.ItemId}&quot; /&gt; &lt;input type=&quot;hidden&quot; id=&quot;StudentMember&quot; value=&quot;{#3.ItemId}&quot; /&gt;&lt;input type=&quot;hidden&quot; id=&quot;OrganizationMember&quot; value=&quot;{#4.ItemId}&quot; /&gt;
&lt;h2&gt;Which type of membership is right for you?&lt;/h2&gt;
&lt;div class=&quot;ClearFix SpotlightRow ThreeAcross&quot;&gt;
&lt;div class=&quot;Spotlight&quot;&gt;&lt;img alt=&quot;Photo of Harry Stewart&quot; src=&quot;[~]images/SampleSites/Member/HarryStewart.png&quot; /&gt;
&lt;h4&gt;Associate Membership&lt;/h4&gt;
&lt;p&gt;Associate membership is perfect for pre-professionals and vendors. Receive discounts on events and store products as well as special networking and exhibit opportunities.&lt;br /&gt;
&lt;br /&gt;
&lt;/p&gt;
&lt;div style=&quot;text-align: center;&quot;&gt;&lt;a href=&quot;[Website]iCore/Membership/Join_Now.aspx?iProductCode=ASSOCIATE_MEMBERSHIP_FEES&amp;amp;ID={#party.PartyId}&quot; id=&quot;associateLink&quot; class=&quot;btn PrimaryButton LargeButton&quot;&gt;Join - associate&lt;/a&gt; &lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;Spotlight&quot;&gt;&lt;img alt=&quot;Photo of Judy Gray&quot; src=&quot;[~]images/SampleSites/Member/JudyGray.png&quot; /&gt;
&lt;h4&gt;Regular Membership&lt;/h4&gt;
&lt;p&gt;Members enjoy many benefits including professional networking opportunities, our monthly industry magazine, discounts on events and in the shop and up-to-date information on industry news. &lt;br /&gt;
&lt;br /&gt;
&lt;/p&gt;
&lt;div style=&quot;text-align: center;&quot;&gt;&lt;a href=&quot;[Website]iCore/Membership/Join_Now.aspx?iProductCode=REGULAR_MEMBERSHIP_FEES&amp;amp;ID={#party.PartyId}&quot; id=&quot;regularLink&quot; class=&quot;btn PrimaryButton LargeButton&quot;&gt;Join - regular&lt;/a&gt; &lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;Spotlight&quot;&gt;&lt;img alt=&quot;Photo of Larry Gordon&quot; src=&quot;[~]images/SampleSites/Member/LarryGordon.png&quot; /&gt;
&lt;h4&gt;Student Membership&lt;/h4&gt;
&lt;p&gt;Deeply-discounted student membership is offered to anyone currently attending a two- and four-year institutions offer mentoring, internships and student SIGS for pre-professionals. &lt;br /&gt;
&lt;br /&gt;
&lt;/p&gt;
&lt;div style=&quot;text-align: center;&quot;&gt;&lt;a id=&quot;studentLink&quot; href=&quot;[Website]iCore/Membership/Join_Now.aspx?iProductCode=STUDENT_MEMBERSHIP_FEES&amp;amp;ID={#party.PartyId}&quot; class=&quot;btn PrimaryButton LargeButton&quot;&gt;Join - student&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;h2&gt;Interested in organization membership?&lt;/h2&gt;
&lt;div class=&quot;ClearFix SpotlightRow ThreeAcross&quot;&gt;
&lt;div class=&quot;Spotlight&quot;&gt;
&lt;img alt=&quot;&quot; src=&quot;[~]images/Events/HappyBusinesspeople.jpg&quot; style=&quot;width: 247px; height: 165px;&quot; /&gt;&lt;/div&gt;
&lt;div class=&quot;Spotlight&quot;&gt;
&lt;p&gt;Join the largest network of organizations in the industry! Our advocacy programs give you the opportunity to raise matters of local, regional and national concern with governmental and regulatory bodies.&lt;/p&gt;
&lt;/div&gt;
&lt;div class=&quot;Spotlight&quot;&gt;
&lt;br /&gt;
&lt;div style=&quot;text-align: center;&quot;&gt;&lt;a id=&quot;organizationLink&quot; href=&quot;[Website]OrganizationJoin?ID={#party.PartyId}&quot; class=&quot;btn PrimaryButton LargeButton&quot;&gt;Join - organization&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;" SerializedDataSources="&lt;ArrayOfDataSource xmlns=&quot;http://schemas.datacontract.org/2004/07/Asi.Web.iParts.Common.DataShowcase&quot; xmlns:i=&quot;http://www.w3.org/2001/XMLSchema-instance&quot;&gt;&lt;DataSource&gt;&lt;DataSourceId&gt;1&lt;/DataSourceId&gt;&lt;EntityTypeName&gt;Item&lt;/EntityTypeName&gt;&lt;WhereProperty&gt;ItemCode&lt;/WhereProperty&gt;&lt;WhereValue&gt;ASSOCIATE_MEMBERSHIP_FEES&lt;/WhereValue&gt;&lt;/DataSource&gt;&lt;DataSource&gt;&lt;DataSourceId&gt;2&lt;/DataSourceId&gt;&lt;EntityTypeName&gt;Item&lt;/EntityTypeName&gt;&lt;WhereProperty&gt;ItemCode&lt;/WhereProperty&gt;&lt;WhereValue&gt;REGULAR_MEMBERSHIP_FEES&lt;/WhereValue&gt;&lt;/DataSource&gt;&lt;DataSource&gt;&lt;DataSourceId&gt;3&lt;/DataSourceId&gt;&lt;EntityTypeName&gt;Item&lt;/EntityTypeName&gt;&lt;WhereProperty&gt;ItemCode&lt;/WhereProperty&gt;&lt;WhereValue&gt;STUDENT_MEMBERSHIP_FEES&lt;/WhereValue&gt;&lt;/DataSource&gt;&lt;DataSource&gt;&lt;DataSourceId&gt;4&lt;/DataSourceId&gt;&lt;EntityTypeName&gt;Item&lt;/EntityTypeName&gt;&lt;WhereProperty&gt;ItemCode&lt;/WhereProperty&gt;&lt;WhereValue&gt;COMPANY_REGULAR_MEMBERSHIP&lt;/WhereValue&gt;&lt;/DataSource&gt;&lt;DataSource&gt;&lt;DataSourceId&gt;party&lt;/DataSourceId&gt;&lt;EntityTypeName&gt;Party&lt;/EntityTypeName&gt;&lt;WhereProperty&gt;PartyId&lt;/WhereProperty&gt;&lt;WhereValue&gt;@SelectedId&lt;/WhereValue&gt;&lt;/DataSource&gt;&lt;/ArrayOfDataSource&gt;" HideOnError="False" />
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