<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="iMIS goes mobile" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">
	<meta name="Description" content="In today&#39;s increasingly mobile world it is imperative that your website is accessible from all devices. In this post we&#39;ll go over what we did to make our website work on all devices." />

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("d6e4709a-5fa0-4b56-9521-a66cc05a5f97"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("0b832e18-5816-4202-8998-dbe3c4f32cb5"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciiMISgoesmobile_08bf68ecf6164863828a13e5a8529123 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("08bf68ec-f616-4863-828a-13e5a8529123");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciiMISgoesmobile_08bf68ecf6164863828a13e5a8529123);

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
				<CM:ContentHtml ID="ciiMISgoesmobile_08bf68ecf6164863828a13e5a8529123" runat="server" ContentKey="d6e4709a-5fa0-4b56-9521-a66cc05a5f97" ContentItemKey="08bf68ec-f616-4863-828a-13e5a8529123" Title="iMIS goes mobile" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_iMISgoesmobile" runat="server"><h1>iMIS goes mobile</h1>
<p>To effectively engage your constituents and increase revenue generation via all types of mobile devices, you must:</p>
<ul>
    <li>Create a mobile strategy that can adapt to changing technologies</li>
    <li> Leverage templates to quickly launch your website cost effectively</li>
    <li> Use Responsive Web Design to engage all users no matter what device they use</li>
    <li> Avoid options that lock you into years of expensive maintenance</li>
</ul>
<h2> Our new responsive site​</h2>
<p>We've recently undergone effort of making our website use responsive web design. That means that our website is designed to be fully accessible and perform great on all devices no matter what size and capabilities. Now you can take your association with you wherever you!</p>
<h2>We want to hear from you</h2>
<p>How are you enjoying our new redesign? What capabilities can you see going forward? We want to hear from you! Tell us about your experiences and let us know what new functionality you would like us to add going forward.<br />
<br />
</p></asp:Panel></CM:ContentHtml>
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