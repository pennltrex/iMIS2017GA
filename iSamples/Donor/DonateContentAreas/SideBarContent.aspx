<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Side Bar Content" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("6395373f-4d69-4454-af01-1c116d254418"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("82f9ccc5-31d4-4a7e-954d-aad070605cd4"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciPercentageStatement_f438fff73e2f4dfb8c91a6413477153b as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("f438fff7-3e2f-4dfb-8c91-a6413477153b");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciPercentageStatement_f438fff73e2f4dfb8c91a6413477153b);

		childUserControl = ciTrustStatement_6e92028f2a724ab192a2f84e161c5862 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6e92028f-2a72-4ab1-92a2-f84e161c5862");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciTrustStatement_6e92028f2a724ab192a2f84e161c5862);

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
				<CM:ContentHtml ID="ciPercentageStatement_f438fff73e2f4dfb8c91a6413477153b" runat="server" ContentKey="6395373f-4d69-4454-af01-1c116d254418" ContentItemKey="f438fff7-3e2f-4dfb-8c91-a6413477153b" Title="Percentage Statement" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_PercentageStatement" runat="server"><p class="lead"><strong class="feature-text-inline">92%</strong> of the donations we receive go towards essential conservation projects</p>
<div style="text-align: center; margin-bottom: 1em;"><img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/donations-pie-chart.png" style="width: 120px;" /></div></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciTrustStatement_6e92028f2a724ab192a2f84e161c5862" runat="server" ContentKey="6395373f-4d69-4454-af01-1c116d254418" ContentItemKey="6e92028f-2a72-4ab1-92a2-f84e161c5862" Title="Trust Statement" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_TrustStatement" runat="server"><p class="AltBgColor1">We take your trust in us seriously and carefully allocate funds so that your donations do the maximum good for our planet.</p></asp:Panel></CM:ContentHtml>
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