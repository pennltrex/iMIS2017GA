<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Social activities" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("db546da9-9ac7-48ad-bb1a-a158d82f648c"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("c3fdd8ef-4627-4f54-86e0-81381a7797f2"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciSocialactivities_15a64fbfcfb44eacb54e8965376d9d75 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("15a64fbf-cfb4-4eac-b54e-8965376d9d75");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSocialactivities_15a64fbfcfb44eacb54e8965376d9d75);

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
				<CM:ContentHtml ID="ciSocialactivities_15a64fbfcfb44eacb54e8965376d9d75" runat="server" ContentKey="db546da9-9ac7-48ad-bb1a-a158d82f648c" ContentItemKey="15a64fbf-cfb4-4eac-b54e-8965376d9d75" Title="Social activities" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Socialactivities" runat="server"><h2>Social activities</h2>
<h4>Chairman's Breakfast – Wednesday</h4>
<br />
Pre-conference breakfast 9:00 am - 10:30 am<br />
Flinder’s Restaurant <br />
<br />
<h4>Hospitality Suite – Thursday</h4>
<br />
Welcome Drinks 6:00pm – 8:00pm <br />
Main Bar (Cost: Free event, kindly sponsored by Versaton)<br />
<br />
<h4>Gala Celebration – Friday</h4>
<br />
Conference Dinner 7:30pm – midnight<br />
Grand Ballroom
<br />
Proceeds to Foodbank Queensland<br />
<br />
<h4>Golf Tournament – Friday</h4>
<br />
Golf Tournament 2:00pm – 5:00pm <br />
Half Moon Bay Golf Club</asp:Panel></CM:ContentHtml>
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