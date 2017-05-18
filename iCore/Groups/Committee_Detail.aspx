<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Committee Detail" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="DataShowcase" Src="~/iParts/Common/DataShowcase/DataShowcaseDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="GroupListEditor" Src="~/iParts/Groups/GroupListEditor/GroupListEditorDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("402f1086-6a8e-4ec7-8b2c-9272087f18e7"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("c66de1c2-372c-4e05-ad78-62276d8a0b4a"); } }

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

		childUserControl = ciManagecommittee as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("f46f57f8-4256-4d8d-91aa-ce59b1e0c07e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciManagecommittee);

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
				<CM:DataShowcase ID="ciGroupDetails" runat="server" ContentKey="402f1086-6a8e-4ec7-8b2c-9272087f18e7" ContentItemKey="69ac4200-9c36-4b5a-bac2-3bf711ba92d2" Title="Group Details" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="True" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" Content="&lt;h2&gt;{#group.Name}&lt;/h2&gt;
{#group.Description}" SerializedDataSources="&lt;ArrayOfDataSource xmlns=&quot;http://schemas.datacontract.org/2004/07/Asi.Web.iParts.Common.DataShowcase&quot; xmlns:i=&quot;http://www.w3.org/2001/XMLSchema-instance&quot;&gt;&lt;DataSource&gt;&lt;DataSourceId&gt;group&lt;/DataSourceId&gt;&lt;EntityTypeName&gt;Group&lt;/EntityTypeName&gt;&lt;WhereProperty&gt;GroupId&lt;/WhereProperty&gt;&lt;WhereValue&gt;url:GroupID&lt;/WhereValue&gt;&lt;/DataSource&gt;&lt;/ArrayOfDataSource&gt;" HideOnError="False" />
				<CM:GroupListEditor ID="ciManagecommittee" runat="server" ContentKey="402f1086-6a8e-4ec7-8b2c-9272087f18e7" ContentItemKey="f46f57f8-4256-4d8d-91aa-ce59b1e0c07e" Title="Manage committee" ShowTitleFlag="False" PageTitle="" DoNotRenderInDesignMode="False" ShowBorder="False" CssClass="" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" AutoCreateGroupType="" SelectedGroupTypes="COMMITTEE" ParentType="GroupMemberships" GroupMode="GroupMemberships" UrlParameter="GroupID" OwnerType="" AllowEdit="True" AutoCreate="False" ShowInactive="False" DisplayProfileImage="True" AddMemberText="Add member" DisplayForAuthorizedUsersOnly="False" LinkMode="Both" ListEntriesExpandable="False" ShowMembershipExpirationDate="False" DisplayGroupTitle="False" />
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