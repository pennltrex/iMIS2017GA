<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Social Networking Images" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("8ef716f5-87a5-4ec7-a816-f05a47a8445d"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("8d411dcd-e702-4e91-8eb1-002cd194a2d8"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciSocialNetworking_3681253baff9498a96d16a17398617c9 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("3681253b-aff9-498a-96d1-6a17398617c9");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSocialNetworking_3681253baff9498a96d16a17398617c9);

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
				<CM:ContentHtml ID="ciSocialNetworking_3681253baff9498a96d16a17398617c9" runat="server" ContentKey="8ef716f5-87a5-4ec7-a816-f05a47a8445d" ContentItemKey="3681253b-aff9-498a-96d1-6a17398617c9" Title="Social Networking" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_SocialNetworking" runat="server"><strong>Connect with us on</strong><br />
<a href="http://www.facebook.com/advsol" title="Visit our Facebook page" target="_blank">
<img class="SocialSprite LargeButtons FacebookIcon" style="border-width: 0px;" alt="Facebook icon" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/App_Themes/" + Page.Theme + "/" %>/images/pixel.png" /></a>
<a href="http://twitter.com/#!/advsol" title="Visit our Twitter page" target="_blank">
<img class="SocialSprite LargeButtons TwitterIcon" style="border-width: 0px;" alt="Twitter icon" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/App_Themes/" + Page.Theme + "/" %>/images/pixel.png" /></a>
<a href="http://www.linkedin.com/company/advanced-solutions-international-inc." title="Visit our LinkedIn page" target="_blank">
<img class="SocialSprite LargeButtons LinkedInIcon" style="border-width: 0px;" alt="LinkedIn icon" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/App_Themes/" + Page.Theme + "/" %>/images/pixel.png" /></a>
<a href="http://www.youtube.com/user/asicommunity" title="Visit our YouTube channel" target="_blank">
<img class="SocialSprite LargeButtons YouTubeIcon" style="border-width: 0px;" alt="YouTube icon" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/App_Themes/" + Page.Theme + "/" %>/images/pixel.png" /></a>
<a href="https://plus.google.com/u/0/107863455837883513021/posts" title="Visit our Google+ page" target="_blank">
<img class="SocialSprite LargeButtons GPlusIcon" style="border-width: 0px;" alt="Google+ icon" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/App_Themes/" + Page.Theme + "/" %>/images/pixel.png" /></a></asp:Panel></CM:ContentHtml>
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