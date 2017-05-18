<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Event Questions" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="DataShowcase" Src="~/iParts/Common/DataShowcase/DataShowcaseDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("25d9b822-1f53-47e1-a97c-93d660c7e8fd"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("7232d6bd-0436-4ec3-9e52-9a9d2b035d3e"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciReportiframe as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("88941cde-6c6c-4265-ac04-bd859f6d10bb");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciReportiframe);

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
				<CM:DataShowcase ID="ciReportiframe" runat="server" ContentKey="25d9b822-1f53-47e1-a97c-93d660c7e8fd" ContentItemKey="88941cde-6c6c-4265-ac04-bd859f6d10bb" Title="Report iframe" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" Content="&lt;iframe src=&quot;[~]iCore/Staff_Dashboards/Specific_Event/Event_Questions_Report.aspx?EventKey={#event.EventId}&quot; width=&quot;800&quot; height=&quot;800&quot; style=&quot;border: none;&quot;&gt;&lt;/iframe&gt;" SerializedDataSources="&lt;ArrayOfDataSource xmlns=&quot;http://schemas.datacontract.org/2004/07/Asi.Web.iParts.Common.DataShowcase&quot; xmlns:i=&quot;http://www.w3.org/2001/XMLSchema-instance&quot;&gt;&lt;DataSource&gt;&lt;DataSourceId&gt;event&lt;/DataSourceId&gt;&lt;EntityTypeName&gt;Event&lt;/EntityTypeName&gt;&lt;WhereProperty&gt;EventId&lt;/WhereProperty&gt;&lt;WhereValue&gt;url:EventKey&lt;/WhereValue&gt;&lt;/DataSource&gt;&lt;/ArrayOfDataSource&gt;" HideOnError="False" />
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