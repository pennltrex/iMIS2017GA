<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Sponsors" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("2828e2a6-e3d8-4738-9261-d176ee9ead57"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("a89680b1-8896-43b3-9fd6-49a7606d41d1"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		AddChildUserControl(ContentPage2);

		childUserControl = ciSponsors_c0bb50f29343417084ed2c08da15f1ce as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("c0bb50f2-9343-4170-84ed-2c08da15f1ce");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSponsors_c0bb50f29343417084ed2c08da15f1ce);

		AddChildUserControl(ContentPage3);

		childUserControl = ciSponsorship_bac2842a69434a8781d2f26e8a52f412 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("bac2842a-6943-4a87-81d2-f26e8a52f412");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSponsorship_bac2842a69434a8781d2f26e8a52f412);

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
				<CM:ContentHtml ID="ciSponsors_c0bb50f29343417084ed2c08da15f1ce" runat="server" ContentKey="2828e2a6-e3d8-4738-9261-d176ee9ead57" ContentItemKey="c0bb50f2-9343-4170-84ed-2c08da15f1ce" Title="Sponsors" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Sponsors" runat="server"><h1>Our Conference Sponsors</h1>
<p>Our generous sponsors make the conference happen!</p>
<h2>Platinum Sponsor</h2>
<div class="row">
<div class="col-xs-3">
<img alt="Versaton" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/UploadedImages/versaton.png" style="width: 154px;" />
</div>
<div class="col-xs-9">
Versaton is the global leader in true visioning services for the public and private sectors. With branches around the world, the Versaton team can help your organization achieve exceptional results.
</div>
</div>
<h2>Gold Sponsor</h2>
<div class="row">
<div class="col-xs-3">
<img alt="Opus, Inc." style="width: 121px;" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/UploadedImages/opus.png" />
</div>
<div class="col-xs-9">
Opus, Inc. provides testing and certification services to all professions and trades. We can provide the curriculum and instructors your organization needs to ensure employee competency.
</div>
</div>
<h2>Silver Sponsors</h2>
<p><img alt="" style="width: 144px;" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/UploadedImages/imisfoundation_flower.png" /></p>
<p><img alt="" style="width: 126px;" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/UploadedImages/VersatonMedical.png" /><span style="font-family: 'Times New Roman'; font-size: 18px;">M</span><span style="font-family: 'Times New Roman'; font-size: 18px;">edical</span></p></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
		</div>
		<div class="col-sm-4">
						<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciSponsorship_bac2842a69434a8781d2f26e8a52f412" runat="server" ContentKey="2828e2a6-e3d8-4738-9261-d176ee9ead57" ContentItemKey="bac2842a-6943-4a87-81d2-f26e8a52f412" Title="Sponsorship" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Sponsorship" runat="server"><div class="CalloutArea1">
<h2>Become a Sponsor</h2>
<p>Would you like to sponsor a regional meeting or next year's annual conference?
For details please contact: <br />
<strong>sponsorinfo@imisdemo.com</strong></p>
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