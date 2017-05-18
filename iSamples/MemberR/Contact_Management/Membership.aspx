<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Membership" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="DataShowcase" Src="~/iParts/Common/DataShowcase/DataShowcaseDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("8b9c10d5-1171-4e61-ac75-47cbe6735248"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("6365194a-c27f-4312-9051-681fe137114d"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciJoinNow_edbd88d8b9d44bdb84e0943cab1916bc as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("edbd88d8-b9d4-4bdb-84e0-943cab1916bc");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciJoinNow_edbd88d8b9d44bdb84e0943cab1916bc);

		childUserControl = ciJoinNow1 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("aca8c750-fe0d-4688-a86c-bfbec0574110");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciJoinNow1);

		childUserControl = ciStudentJoinJavascript_9340681ca58f4b92b23b0caa600d399e as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9340681c-a58f-4b92-b23b-0caa600d399e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciStudentJoinJavascript_9340681ca58f4b92b23b0caa600d399e);

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
				<CM:ContentHtml ID="ciJoinNow_edbd88d8b9d44bdb84e0943cab1916bc" runat="server" ContentKey="8b9c10d5-1171-4e61-ac75-47cbe6735248" ContentItemKey="edbd88d8-b9d4-4bdb-84e0-943cab1916bc" Title="Join Now" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_JoinNow" runat="server"><h1>Join Us Today!</h1>
<div class="ContentBlockPrimary">
<div class="FloatRight">
<img src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/UploadedImages/groupatconferencesmaller.jpg" style="width: 140px;" alt="Business people chatting at a conference" />
</div>
<div class="ContentBlockRight">
<blockquote class="Quote">
<p>I've always considered my membership a great investment. It's not just the opportunities to connect and learn - or how iMIS has allowed my voice to be heard - but it's the little things too, like being in the National Membership Achievement Program. With iMIS, we can make a difference for each other.</p>
<strong> Alex Morgan, Vice President, Versaton Global</strong></blockquote>
</div>
</div></asp:Panel></CM:ContentHtml>
				<CM:DataShowcase ID="ciJoinNow1" runat="server" ContentKey="8b9c10d5-1171-4e61-ac75-47cbe6735248" ContentItemKey="aca8c750-fe0d-4688-a86c-bfbec0574110" Title="Join Now_1" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" Content="&lt;script type=&quot;text/javascript&quot;&gt;
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
&lt;input id=&quot;AssociateMember&quot; type=&quot;hidden&quot; value=&quot;{#1.ItemId}&quot; /&gt; &lt;input id=&quot;RegularMember&quot; type=&quot;hidden&quot; value=&quot;{#2.ItemId}&quot; /&gt; &lt;input id=&quot;StudentMember&quot; type=&quot;hidden&quot; value=&quot;{#3.ItemId}&quot; /&gt;&lt;input id=&quot;OrganizationMember&quot; type=&quot;hidden&quot; value=&quot;{#4.ItemId}&quot; /&gt;
&lt;h2&gt;Which type of membership is right for you?&lt;/h2&gt;
&lt;div class=&quot;ClearFix SpotlightRow ThreeAcross&quot;&gt;
&lt;div class=&quot;Spotlight&quot;&gt;&lt;img alt=&quot;Photo of Harry Stewart&quot; src=&quot;[~]images/SampleSites/Member/HarryStewart.png&quot; /&gt;
&lt;h4&gt;Associate Membership&lt;/h4&gt;
&lt;p&gt;Associate membership is perfect for pre-professionals and vendors. Receive discounts on events and store products as well as special networking and exhibit opportunities.&lt;br /&gt;
&lt;br /&gt;
&lt;/p&gt;
&lt;div style=&quot;text-align: center;&quot;&gt;&lt;a href=&quot;[Website]iCore/Membership/Join_Now.aspx?iProductCode=ASSOCIATE_MEMBERSHIP_FEES&amp;amp;ID={#party.PartyId}&quot; id=&quot;associateLink&quot; class=&quot;btn PrimaryButton MediumButton&quot;&gt;Join - associate&lt;/a&gt; &lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;Spotlight&quot;&gt;&lt;img alt=&quot;Photo of Judy Gray&quot; src=&quot;[~]images/SampleSites/Member/JudyGray.png&quot; /&gt;
&lt;h4&gt;Regular Membership&lt;/h4&gt;
&lt;p&gt;Members enjoy many benefits including professional networking opportunities, our monthly industry magazine, discounts on events and in the shop and up-to-date information on industry news. &lt;br /&gt;
&lt;br /&gt;
&lt;/p&gt;
&lt;div style=&quot;text-align: center;&quot;&gt;&lt;a href=&quot;[Website]iCore/Membership/Join_Now.aspx?iProductCode=REGULAR_MEMBERSHIP_FEES&amp;amp;ID={#party.PartyId}&quot; id=&quot;regularLink&quot; class=&quot;btn PrimaryButton MediumButton&quot;&gt;Join - regular&lt;/a&gt; &lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;Spotlight&quot;&gt;&lt;img alt=&quot;Photo of Larry Gordon&quot; src=&quot;[~]images/SampleSites/Member/LarryGordon.png&quot; /&gt;
&lt;h4&gt;Student Membership&lt;/h4&gt;
&lt;p&gt;Deeply-discounted student membership is offered to anyone currently attending a two- and four-year institutions offer mentoring, internships and student SIGS for pre-professionals. &lt;br /&gt;
&lt;br /&gt;
&lt;/p&gt;
&lt;div style=&quot;text-align: center;&quot;&gt;&lt;a id=&quot;studentLink&quot; href=&quot;[Website]iCore/Membership/Join_Now.aspx?iProductCode=STUDENT_MEMBERSHIP_FEES&amp;amp;ID={#party.PartyId}&quot; class=&quot;btn PrimaryButton MediumButton&quot;&gt;Join - student&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;h2&gt;Interested in organization membership?&lt;/h2&gt;
&lt;div class=&quot;ClearFix SpotlightRow ThreeAcross&quot;&gt;
&lt;div class=&quot;col-sm-4&quot;&gt;
&lt;img alt=&quot;&quot; src=&quot;[~]images/Events/HappyBusinesspeople.jpg&quot; style=&quot;width: 247px; height: 165px;&quot; /&gt;&lt;/div&gt;
&lt;div class=&quot;col-sm-4&quot;&gt;
&lt;p&gt;Join the largest network of organizations in the industry! Our advocacy programs give you the opportunity to raise matters of local, regional and national concern with governmental and regulatory bodies.&lt;/p&gt;
&lt;/div&gt;
&lt;div class=&quot;col-sm-4&quot;&gt;
&lt;br /&gt;
&lt;div style=&quot;text-align: center;&quot;&gt;&lt;a id=&quot;organizationLink&quot; href=&quot;[Website]OrganizationJoin?ID={#party.PartyId}&quot; class=&quot;btn PrimaryButton MediumButton&quot;&gt;Join - organization&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;" SerializedDataSources="&lt;ArrayOfDataSource xmlns=&quot;http://schemas.datacontract.org/2004/07/Asi.Web.iParts.Common.DataShowcase&quot; xmlns:i=&quot;http://www.w3.org/2001/XMLSchema-instance&quot;&gt;&lt;DataSource&gt;&lt;DataSourceId&gt;1&lt;/DataSourceId&gt;&lt;EntityTypeName&gt;Item&lt;/EntityTypeName&gt;&lt;WhereProperty&gt;ItemCode&lt;/WhereProperty&gt;&lt;WhereValue&gt;ASSOCIATE_MEMBERSHIP_FEES&lt;/WhereValue&gt;&lt;/DataSource&gt;&lt;DataSource&gt;&lt;DataSourceId&gt;2&lt;/DataSourceId&gt;&lt;EntityTypeName&gt;Item&lt;/EntityTypeName&gt;&lt;WhereProperty&gt;ItemCode&lt;/WhereProperty&gt;&lt;WhereValue&gt;REGULAR_MEMBERSHIP_FEES&lt;/WhereValue&gt;&lt;/DataSource&gt;&lt;DataSource&gt;&lt;DataSourceId&gt;3&lt;/DataSourceId&gt;&lt;EntityTypeName&gt;Item&lt;/EntityTypeName&gt;&lt;WhereProperty&gt;ItemCode&lt;/WhereProperty&gt;&lt;WhereValue&gt;STUDENT_MEMBERSHIP_FEES&lt;/WhereValue&gt;&lt;/DataSource&gt;&lt;DataSource&gt;&lt;DataSourceId&gt;4&lt;/DataSourceId&gt;&lt;EntityTypeName&gt;Item&lt;/EntityTypeName&gt;&lt;WhereProperty&gt;ItemCode&lt;/WhereProperty&gt;&lt;WhereValue&gt;COMPANY_REGULAR_MEMBERSHIP&lt;/WhereValue&gt;&lt;/DataSource&gt;&lt;DataSource&gt;&lt;DataSourceId&gt;party&lt;/DataSourceId&gt;&lt;EntityTypeName&gt;Party&lt;/EntityTypeName&gt;&lt;WhereProperty&gt;PartyId&lt;/WhereProperty&gt;&lt;WhereValue&gt;@SelectedId&lt;/WhereValue&gt;&lt;/DataSource&gt;&lt;/ArrayOfDataSource&gt;" HideOnError="False" />
				<CM:ContentHtml ID="ciStudentJoinJavascript_9340681ca58f4b92b23b0caa600d399e" runat="server" ContentKey="8b9c10d5-1171-4e61-ac75-47cbe6735248" ContentItemKey="9340681c-a58f-4b92-b23b-0caa600d399e" Title="StudentJoinJavascript" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_StudentJoinJavascript" runat="server"></asp:Panel></CM:ContentHtml>
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