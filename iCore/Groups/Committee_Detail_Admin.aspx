<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Committee Detail Administration" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="DataShowcase" Src="~/iParts/Common/DataShowcase/DataShowcaseDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_CommitteeDetailAdminControl" Src="~/AsiCommon/Controls/CommitteeManagement/CommitteeDetailAdmin.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("5aa2d488-3d14-43a2-9fa0-1df31b471153"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("35f4e17d-a181-4fbd-b6aa-8e6270f2425d"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciGroupDetails as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("69ac4200-9c36-4b5a-bac2-3bf711ba92d2");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciGroupDetails);

		childUserControl = ciCommitteeDetailAdminControl as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("0f92daae-6950-4c3b-a058-a0883838d37a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCommitteeDetailAdminControl);

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
				<CM:DataShowcase ID="ciGroupDetails" runat="server" ContentKey="5aa2d488-3d14-43a2-9fa0-1df31b471153" ContentItemKey="69ac4200-9c36-4b5a-bac2-3bf711ba92d2" Title="Group Details" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="True" CssClass="iPartChain FirstPart PanelNoPadding" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" Content="&lt;h2 class=&quot;AddPadding&quot;&gt;{#group.Name}&lt;/h2&gt;
&lt;div class=&quot;AddPaddingHorizontal&quot;&gt;
{#group.Description}
&lt;div style=&quot;text-align: right;&quot;&gt;
&lt;a class=&quot;btn&quot; href=&quot;JavaScript:NewWindow(&#39;[Website]iCore/Groups/Committee_roster.aspx?Committee={#group.GroupId}&#39;, &#39;Report&#39;, &#39;current&#39;, &#39;nonmodal&#39;, false);&quot;&gt;Print roster&lt;/a&gt;
&lt;/div&gt;
&lt;/div&gt;" SerializedDataSources="&lt;ArrayOfDataSource xmlns=&quot;http://schemas.datacontract.org/2004/07/Asi.Web.iParts.Common.DataShowcase&quot; xmlns:i=&quot;http://www.w3.org/2001/XMLSchema-instance&quot;&gt;&lt;DataSource&gt;&lt;DataSourceId&gt;group&lt;/DataSourceId&gt;&lt;EntityTypeName&gt;Group&lt;/EntityTypeName&gt;&lt;WhereProperty&gt;GroupId&lt;/WhereProperty&gt;&lt;WhereValue&gt;url:GroupID&lt;/WhereValue&gt;&lt;/DataSource&gt;&lt;/ArrayOfDataSource&gt;" HideOnError="False" />
				<asp:Panel ID="ste_container_CommitteeDetailAdminControl" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_CommitteeDetailAdminControl ID="ciCommitteeDetailAdminControl" runat="server" ShowBorder="False" CssClass="iPartChain LastPart" UseParentAtomObject="False" UseKeyFromURL="False" CommitSequence="0" /><asiweb:SurfToEditButtonPanel ID="ste_ciCommitteeDetailAdminControl" runat="server" ContentKey="5aa2d488-3d14-43a2-9fa0-1df31b471153" ContentItemKey="0f92daae-6950-4c3b-a058-a0883838d37a" /></asp:Panel>
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