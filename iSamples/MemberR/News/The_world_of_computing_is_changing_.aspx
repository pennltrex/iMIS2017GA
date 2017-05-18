<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="The world of computing is changing!" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">
	<meta name="Description" content="More and more users are shifting their internet access methods from desktop to mobile. iMIS can help you keep up with this change with the new mobile-optimized design." />

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("6321856d-d6b2-456d-a461-81d94183f2fd"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("c049533b-5aa5-43de-8f4b-cccbf7d16c9b"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciTheWorldIsChanging_47833a16dc3b42daa13907bc07e1bada as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("47833a16-dc3b-42da-a139-07bc07e1bada");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciTheWorldIsChanging_47833a16dc3b42daa13907bc07e1bada);

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
				<CM:ContentHtml ID="ciTheWorldIsChanging_47833a16dc3b42daa13907bc07e1bada" runat="server" ContentKey="6321856d-d6b2-456d-a461-81d94183f2fd" ContentItemKey="47833a16-dc3b-42da-a139-07bc07e1bada" Title="The World Is Changing" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_TheWorldIsChanging" runat="server"><h1>The world of computing is changing! Are you on board?</h1>
<p>Every day more and more <a href="http://www.imiscommunity.com/how_quickly_the_computing_world_is_changing">internet usage is moving</a> from full, desktop-view access to mobile access. How well are you adjusting to the change? When creating content for your website you should always keep in mind how it will look and be accessed on mobile devices. </p>
<p>ASI is proud to offer a new iMIS look and feel specifically designed for mobile devices. With this new design your members, donors and constituents can have instant access to content, the directory, upcoming events and your organization store on-the-go.</p>
<p>For more interesting articles on iMIS mobile design visit <a href="http://www.imiscommunity.com/search/node/mobile">iMIS Community</a>.</p></asp:Panel></CM:ContentHtml>
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