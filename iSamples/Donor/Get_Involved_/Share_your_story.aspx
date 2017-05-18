<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Share Your Story" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentBlock" Src="~/iParts/Common/ContentBlock/ContentBlockDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("93f86099-5366-4f3e-a80f-740d59356723"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("c5b368a2-1018-4acc-9405-5dc013a0cbe0"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciHeading_c51d4cb6ebe84549bf1e755a04603e0b as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("c51d4cb6-ebe8-4549-bf1e-755a04603e0b");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciHeading_c51d4cb6ebe84549bf1e755a04603e0b);

		childUserControl = ciHaleyPalmerQuote_eb53502ab68d4e68adbf1d444d6f3806 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("eb53502a-b68d-4e68-adbf-1d444d6f3806");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciHaleyPalmerQuote_eb53502ab68d4e68adbf1d444d6f3806);

		childUserControl = ciComments as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("38521123-0182-4500-a82b-ffa677b8b1c2");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciComments);

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
				<CM:ContentHtml ID="ciHeading_c51d4cb6ebe84549bf1e755a04603e0b" runat="server" ContentKey="93f86099-5366-4f3e-a80f-740d59356723" ContentItemKey="c51d4cb6-ebe8-4549-bf1e-755a04603e0b" Title="Heading" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Heading" runat="server"><h1>iF Success Stories</h1></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciHaleyPalmerQuote_eb53502ab68d4e68adbf1d444d6f3806" runat="server" ContentKey="93f86099-5366-4f3e-a80f-740d59356723" ContentItemKey="eb53502a-b68d-4e68-adbf-1d444d6f3806" Title="Haley Palmer Quote" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_HaleyPalmerQuote" runat="server"><blockquote class="Quote QuoteStyle2"><img alt="Haley Palmer" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/HaleyPalmer.jpg" class="hidden-xs" style="float: right; width: 100px; margin-left: 1em; margin-bottom: 1em;" />When my family business was dissolved, we had a large parcel of land with concrete and weeds. The iMIS Foundation worked closely with us to re-zone the area as a wildlife habitat. Their experts designed a songbird habitat that incorporated native vegetation. Our group of volunteers transformed this former eyesore into a beautiful park that has become the center of the community and is filled with beautiful songs every day.
<site>Haley Palmer</site></blockquote></asp:Panel></CM:ContentHtml>
				<CM:ContentBlock ID="ciComments" runat="server" ContentKey="93f86099-5366-4f3e-a80f-740d59356723" ContentItemKey="38521123-0182-4500-a82b-ffa677b8b1c2" Title="Comments" ShowTitleFlag="False" PageTitle="" DoNotRenderInDesignMode="False" ShowBorder="False" SelectedTags="bf69c1ce-1369-4b39-958b-e9ead9437cb6,0184e688-3c17-4dfb-beb3-d930896ac553" AllowReplies="True" AllowHtml="True" AllowAttachments="True" ItemDefaultHtml="" DisplayMode="Expanded" MaxDisplayItems="0" AllowChildPosts="False" IncludeSocialSharingIcons="False" PostSortType="CreatedDateDescending" DisplayPostDateAndAuthor="True" />
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