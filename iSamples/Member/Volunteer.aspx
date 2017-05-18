<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Volunteer" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("eabb7dc2-bb2e-4600-904a-9eeb615ff485"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("28e57ec0-b026-496f-9fc9-7f486741b1ee"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciVolunteerIntro_774c97c1018f4c0aa4b4ff0b69a1c7d2 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("774c97c1-018f-4c0a-a4b4-ff0b69a1c7d2");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciVolunteerIntro_774c97c1018f4c0aa4b4ff0b69a1c7d2);

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
				<CM:ContentHtml ID="ciVolunteerIntro_774c97c1018f4c0aa4b4ff0b69a1c7d2" runat="server" ContentKey="eabb7dc2-bb2e-4600-904a-9eeb615ff485" ContentItemKey="774c97c1-018f-4c0a-a4b4-ff0b69a1c7d2" Title="VolunteerIntro" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_VolunteerIntro" runat="server"><h1>Volunteering for the iMIS Organization</h1>
<div class="col-sm-4 hidden-xs">
<img alt="Volunteer" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/volunteer_icon.png" />
</div>
<div class="col-sm-8">
<p><em>Our organization couldn't be what it is today without the generous help from people like you.</em>
</p>
<p>We work in the community and around the globe to further our mission of uniting the community around us. By volunteering with iMIS you could meet new people, grow your understanding of the industry, and even earn discounts on upcoming events. At the same time you will have a real impact on our organization and those we serve.</p>
<br />
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>iCore/Contacts/Volunteering/Volunteer_sign_up.aspx " class="TextButton PrimaryButton LargeButton">Sign up to Volunteer</a></div></asp:Panel></CM:ContentHtml>
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