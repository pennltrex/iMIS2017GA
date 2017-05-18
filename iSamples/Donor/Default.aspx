<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Home" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("fca85baa-6966-4761-b791-9aa2b216c4fd"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("e363c5cc-9742-4995-8b4e-4f9ba486ce62"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciAbout_07481e599cbf4310a70031c219cfb72a as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("07481e59-9cbf-4310-a700-31c219cfb72a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAbout_07481e599cbf4310a70031c219cfb72a);

		childUserControl = ciWhyiF_e3f61bcb358d48feae076ff46469920c as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e3f61bcb-358d-48fe-ae07-6ff46469920c");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciWhyiF_e3f61bcb358d48feae076ff46469920c);

		childUserControl = ciHowtohelp_828a2083418741698202b4f58ec56c9c as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("828a2083-4187-4169-8202-b4f58ec56c9c");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciHowtohelp_828a2083418741698202b4f58ec56c9c);

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
				<CM:ContentHtml ID="ciAbout_07481e599cbf4310a70031c219cfb72a" runat="server" ContentKey="fca85baa-6966-4761-b791-9aa2b216c4fd" ContentItemKey="07481e59-9cbf-4310-a700-31c219cfb72a" Title="About" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_About" runat="server"><p style="text-align: center;" class="lead">We are the leading conservation organization working around the world to protect ecologically-important lands and waters and the wildlife that lives there. We address the most pressing conservation threats at the largest scale. Thanks to the support of our more than 1 million members and donors, we’ve built a tremendous record of success since our founding.</p></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciWhyiF_e3f61bcb358d48feae076ff46469920c" runat="server" ContentKey="fca85baa-6966-4761-b791-9aa2b216c4fd" ContentItemKey="e3f61bcb-358d-48fe-ae07-6ff46469920c" Title="Why iF" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_WhyiF" runat="server"><h2 class="feature-header" style="text-align: center;">Why support iF?</h2>
<div class="SpotlightRow ThreeAcross">
<div class="Spotlight">
<div class="ImageWrapper"><img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/award-icon.png" /></div>
<p>
For two years running, we have been ranked as the number one wildlife conservation charity by the National Charity Review</p>
</div>
<div class="Spotlight">
<div class="ImageWrapper"><img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/people-icon.png" /></div>
<p>
We have over 1 million supporters, with members, and activists working in 32 countries and territories</p>
</div>
<div class="Spotlight">
<div class="ImageWrapper"><img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/globe-icon.png" /></div>
<p>
We have an active legislative advocacy program dedicated to preserving wildlife and ecological sites around the world</p>
</div>
</div></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciHowtohelp_828a2083418741698202b4f58ec56c9c" runat="server" ContentKey="fca85baa-6966-4761-b791-9aa2b216c4fd" ContentItemKey="828a2083-4187-4169-8202-b4f58ec56c9c" Title="How to help" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Howtohelp" runat="server"><h2 class="feature-header" style="text-align: center;">How can I help?</h2>
<div class="row">
<div class="col-sm-6">
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>Get_Involved_/Volunteer/iSamples/Donor/Get_Involved_/Volunteer.aspx" class="feature-link-with-image feature-link-1">
<div class="feature-link-wrapper bg-img-red-panda">
<div class="feature-link-text">
<h3>Volunteer for iF</h3>
<p>Find a volunteer opportunity near <span class="NoWrap">you »</span></p>
</div>
</div>
</a>
</div>
<div class="col-sm-6">
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>Get_Involved_/Be_a_fundraiser/iSamples/Donor/Get_Involved_/Be_a_fundraiser.aspx " class="feature-link-with-image feature-link-2">
<div class="feature-link-wrapper bg-img-tiger-swimming">
<div class="feature-link-text">
<h3>Fundraise for iF</h3>
<p>Find out how you can help to raise money for the causes you care <span class="NoWrap">about »</span></p>
</div>
</div>
</a>
</div>
</div></asp:Panel></CM:ContentHtml>
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