<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Two out of three customers prefer accessing a mobile website than a mobile application" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">
	<meta name="Description" content="Most users want a mobile experience without the barrier of a mobile app. When a user has to download an app in order to browse or complete a transaction, this is considered an unnecessary barrier." />
	<meta name="Keywords" content="Mobile,News" />

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("16028a1f-84a4-4824-a95f-1edf0cee2911"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("cd8c7e27-8a31-433f-be12-dc8f7dc2ddf6"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciMobilewebsiteorapp_47833a16dc3b42daa13907bc07e1bada as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("47833a16-dc3b-42da-a139-07bc07e1bada");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMobilewebsiteorapp_47833a16dc3b42daa13907bc07e1bada);

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
				<CM:ContentHtml ID="ciMobilewebsiteorapp_47833a16dc3b42daa13907bc07e1bada" runat="server" ContentKey="16028a1f-84a4-4824-a95f-1edf0cee2911" ContentItemKey="47833a16-dc3b-42da-a139-07bc07e1bada" Title="Mobile website or app?" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Mobilewebsiteorapp" runat="server"><h2>Two out of three customers prefer accessing a mobile website over a mobile application.</h2>
<p><span style="line-height: 25.2000007629395px; font-family: 'Helvetica Neue', Helvetica, Arial, Tahoma, Geneva, sans-serif; color: #555555;">Most users want a mobile experience without the barrier of a mobile app. When a user has to download an app in order to browse or complete a transaction, this is considered an unnecessary barrier.<br />
</span><br />
Every day more and more internet usage is moving from full, desktop-view access to mobile access. How well are you adjusting to the change? When creating content for your website you should always keep in mind how it will look and be accessed on mobile devices.<br />
<br />
The key to this is Responsive Web Design. By designing one website that looks good on all devices, your development and maintenance costs are greatly reduced. <br />
<br />
We will present a keynote session at the Leadership Summit that addresses the principles and implementation of Responsive Web Design. This is one of the many valuable sessions you will enjoy at the conference!</p></asp:Panel></CM:ContentHtml>
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