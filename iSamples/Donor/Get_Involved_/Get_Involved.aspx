<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Get Involved" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("1345ee7c-9234-4c5e-82d8-f9671ad624ab"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("92026504-4982-4a5a-8d4d-ad0fef3044ec"); } }

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

		childUserControl = ciGetInvolved_e48da3a3dba04d77a57a8b5693a3b638 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e48da3a3-dba0-4d77-a57a-8b5693a3b638");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciGetInvolved_e48da3a3dba04d77a57a8b5693a3b638);

		AddChildUserControl(ContentPage2);

		childUserControl = ciTakeAction_5e37c2edc94749568f1881abc7696406 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("5e37c2ed-c947-4956-8f18-81abc7696406");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciTakeAction_5e37c2edc94749568f1881abc7696406);

		childUserControl = ciVolunteer_973d729c29584bb9a6c14a94cf5ac86f as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("973d729c-2958-4bb9-a6c1-4a94cf5ac86f");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciVolunteer_973d729c29584bb9a6c14a94cf5ac86f);

		AddChildUserControl(ContentPage3);

		childUserControl = ciShareyourstory_37ad78ca71a34d5a8c1b5f75f9892d8a as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("37ad78ca-71a3-4d5a-8c1b-5f75f9892d8a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciShareyourstory_37ad78ca71a34d5a8c1b5f75f9892d8a);

		childUserControl = ciAttendEvent_2b4b57dc43ea4fc2bdbad4753113589e as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("2b4b57dc-43ea-4fc2-bdba-d4753113589e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAttendEvent_2b4b57dc43ea4fc2bdbad4753113589e);

		childUserControl = ciGiveaGift_5f311584a21a4986b4f431cb733c16a9 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("5f311584-a21a-4986-b4f4-31cb733c16a9");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciGiveaGift_5f311584a21a4986b4f431cb733c16a9);

		childUserControl = ciOtherwaystohelp_931149597e9c4e41bcf034e86654195d as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("93114959-7e9c-4e41-bcf0-34e86654195d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciOtherwaystohelp_931149597e9c4e41bcf034e86654195d);

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
				<CM:ContentHtml ID="ciJumbotron_31c534199c2743099d1584e4d0483f2c" runat="server" ContentKey="1345ee7c-9234-4c5e-82d8-f9671ad624ab" ContentItemKey="31c53419-9c27-4309-9d15-84e4d0483f2c" Title="Jumbotron" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Jumbotron" runat="server"><div class="jumbotron interior bg-img-wildlife-refuge AlignLeft">
<div class="jumbotron-content">
<p class="jumbotron-text">
<span>Find out how you can</span>
<span>become a partner</span>
<span>in our mission to save</span>
<span>wildlife and wild places</span>
</p>
<div class="img-copyright">
<a href="https://www.flickr.com/photos/usfwsmtnprairie/12911212184/sizes/l">Photo</a> by USFWS Mountain Prairie / <a href="http://creativecommons.org/licenses/by/2.0/">CC BY 2.0</a>
</div>
</div>
</div></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciGetInvolved_e48da3a3dba04d77a57a8b5693a3b638" runat="server" ContentKey="1345ee7c-9234-4c5e-82d8-f9671ad624ab" ContentItemKey="e48da3a3-dba0-4d77-a57a-8b5693a3b638" Title="Get Involved" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_GetInvolved" runat="server"><h1>Get Involved</h1>
<p>Become a part of the iMIS Foundation through volunteering, participating in legislative outreach, and getting involved in your local community.</p></asp:Panel></CM:ContentHtml>
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
				<CM:ContentHtml ID="ciTakeAction_5e37c2edc94749568f1881abc7696406" runat="server" ContentKey="1345ee7c-9234-4c5e-82d8-f9671ad624ab" ContentItemKey="5e37c2ed-c947-4956-8f18-81abc7696406" Title="TakeAction" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_TakeAction" runat="server"><h2 class="header-link"><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>Get_Involved_/Be_a_fundraiser/iSamples/Donor/Get_Involved_/Be_a_fundraiser.aspx">Be a <span class="NoWrap">fundraiser »</span></a></h2>
<p>Want to help us raise funds to help preserve the environment in your region, or around the world? Is your area of interest preserving the Arctic tundra? Building wetland habitats in overdeveloped areas? Advocating for wildlife conservation? Find out how you, your friends, and your family can all make a difference together.</p></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciVolunteer_973d729c29584bb9a6c14a94cf5ac86f" runat="server" ContentKey="1345ee7c-9234-4c5e-82d8-f9671ad624ab" ContentItemKey="973d729c-2958-4bb9-a6c1-4a94cf5ac86f" Title="Volunteer" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Volunteer" runat="server"><h2 class="header-link"><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>Get_Involved_/Volunteer/iSamples/Donor/Get_Involved_/Volunteer.aspx"><span class="NoWrap">Volunteer »</span></a></h2>
<p>There are several ways for you to jump in and help out in person. Our conservation days focus on whatever is of concern in your local area, whether that’s picking up trash, keeping established trails in good repair, helping cut back invasive, non-native species, planting a butterfly garden, or something different entirely. Chances are your community has a branch of the iMIS Foundation, and the projects and possibilities are endless!</p></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciShareyourstory_37ad78ca71a34d5a8c1b5f75f9892d8a" runat="server" ContentKey="1345ee7c-9234-4c5e-82d8-f9671ad624ab" ContentItemKey="37ad78ca-71a3-4d5a-8c1b-5f75f9892d8a" Title="Share your story" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Shareyourstory" runat="server"><h2 class="header-link"><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>Get_Involved_/Share_your_story/iSamples/Donor/Get_Involved_/Share_your_story.aspx">Share your <span class="NoWrap">story »</span></a></h2>
<p>Read about how the iMIS Foundation has impacted others and share your own story.</p></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciAttendEvent_2b4b57dc43ea4fc2bdbad4753113589e" runat="server" ContentKey="1345ee7c-9234-4c5e-82d8-f9671ad624ab" ContentItemKey="2b4b57dc-43ea-4fc2-bdba-d4753113589e" Title="AttendEvent" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_AttendEvent" runat="server"><h2 class="header-link"><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>Get_Involved_/Attend_an_event/iCore/Events/Events_List.aspx ">Attend an <span class="NoWrap">event »</span></a></h2>
<p>Have fun while supporting a great cause! Whether you prefer a walk in the park or a black-tie gala, the proceeds from our fundraising events support a major portion of our operating expenses. Check out the offerings and RSVP today.</p></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciGiveaGift_5f311584a21a4986b4f431cb733c16a9" runat="server" ContentKey="1345ee7c-9234-4c5e-82d8-f9671ad624ab" ContentItemKey="5f311584-a21a-4986-b4f4-31cb733c16a9" Title="Give a Gift" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_GiveaGift" runat="server"><h2 class="header-link"><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>Get_Involved_/Give_a_gift/iCore/Fundraising/Donate_Now.aspx">Give a <span class="NoWrap">gift »</span></a></h2>
<p>Every donation you give helps us to get feet on the ground and make a difference. </p></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciOtherwaystohelp_931149597e9c4e41bcf034e86654195d" runat="server" ContentKey="1345ee7c-9234-4c5e-82d8-f9671ad624ab" ContentItemKey="93114959-7e9c-4e41-bcf0-34e86654195d" Title="Other ways to help" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Otherwaystohelp" runat="server"><h2 class="header-link"><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>Get_Involved_/Other_ways_to_help/iSamples/Donor/Get_Involved_/Other_ways_to_help.aspx">Other ways to <span class="NoWrap">help »</span></a></h2>
<p>We have 23 field offices, an educational working group, and opportunities to become a partner in our organizational efforts. Find out how you can lend a hand and get involved.</p></asp:Panel></CM:ContentHtml>
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