<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Donate" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentLink" Src="~/AsiCommon/Controls/ContentManagement/displaylink.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("4187ce7f-5ca1-4ba3-922b-ebe259c1f092"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("d6b7da92-be1c-4cb8-b356-046c133a9840"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciDonate_afcb46fae6864b8580cc7c284d25bc61 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("afcb46fa-e686-4b85-80cc-7c284d25bc61");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDonate_afcb46fae6864b8580cc7c284d25bc61);

		AddChildUserControl(ContentPage2);

		childUserControl = ciGiveNowContent_c5ec137ac01f43b69487776502878e40 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("c5ec137a-c01f-43b6-9487-776502878e40");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciGiveNowContent_c5ec137ac01f43b69487776502878e40);

		childUserControl = ciMakeadonation as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("10ca66d1-ba6b-4989-9437-656b8a1c269f");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMakeadonation);

		AddChildUserControl(ContentPage3);

		childUserControl = ciThankYou_72bf2175c5384a2998a81d2e1c3223b2 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("72bf2175-c538-4a29-98a8-1d2e1c3223b2");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciThankYou_72bf2175c5384a2998a81d2e1c3223b2);

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
		<div class="col-sm-3">
						<CM:ContentPage ID="ContentPage1" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone1_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciDonate_afcb46fae6864b8580cc7c284d25bc61" runat="server" ContentKey="4187ce7f-5ca1-4ba3-922b-ebe259c1f092" ContentItemKey="afcb46fa-e686-4b85-80cc-7c284d25bc61" Title="Donate" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Donate" runat="server"><p style="text-align: center;"><img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>/images/ImageLibrary/DonationLeft.jpg" /></p></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-9">
			<div class="row">
				<div class="col-sm-9">
								<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciGiveNowContent_c5ec137ac01f43b69487776502878e40" runat="server" ContentKey="4187ce7f-5ca1-4ba3-922b-ebe259c1f092" ContentItemKey="c5ec137a-c01f-43b6-9487-776502878e40" Title="GiveNowContent" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_GiveNowContent" runat="server"><p><em>Note: This content record demonstrates a donation landing page. The <strong>Make a donation</strong> link takes you to a single page from which donors can make their donation. For information about how to tailor this content for your own needs, consult the donation iParts section in the Helpsite.</em></p>
<h2 style="text-align: left;">Emergency Relief Fund</h2>
<p style="text-align: left;">Please give whatever you can to provide critical items and services to those who need it the most.  For example:</p>
<ul>
    <li><strong>$25</strong> provides a community with 5 carriers </li>
    <li><strong>$50</strong> pays for water purification for a month </li>
    <li><strong>$100</strong> pays for an education program </li>
    <li><strong>$250</strong> buys a 500 litre rainwater harvesting tank </li>
</ul>
<p> </p></asp:Panel></CM:ContentHtml>
				<CM:ContentLink ID="ciMakeadonation" runat="server" ContentKey="4187ce7f-5ca1-4ba3-922b-ebe259c1f092" ContentItemKey="10ca66d1-ba6b-4989-9437-656b8a1c269f" Title="Make a donation" ShowTitleFlag="False" LinkName="Make a donation" LinkUrl="~/GiveNow.aspx" OpenInNewWindowFlag="False" IsInternal="False" UrlParameters="" LinkItemKey="00000000-0000-0000-0000-000000000000" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

				</div>
				<div class="col-sm-3">
								<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciThankYou_72bf2175c5384a2998a81d2e1c3223b2" runat="server" ContentKey="4187ce7f-5ca1-4ba3-922b-ebe259c1f092" ContentItemKey="72bf2175-c538-4a29-98a8-1d2e1c3223b2" Title="ThankYou" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_ThankYou" runat="server"><p style="text-align: center;"><img alt="" style="vertical-align: top;" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>/images/ImageLibrary/ThankYou.jpg" /></p></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

				</div>
			</div>
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