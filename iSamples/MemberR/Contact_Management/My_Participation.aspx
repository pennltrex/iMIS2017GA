<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="My Participation" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactMiniProfile" Src="~/iParts/Contact Management/ContactMiniProfile/ContactMiniProfileDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("68bbaa09-837d-4c6d-9865-c199d2477229"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("0f8eeec7-8e77-41c1-b348-4a5ed75a79f8"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewContactMiniProfileCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("d3a10dbc-c7e2-4db9-b96a-8bdc618be39f");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContactMiniProfileCommon);

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
				<CM:ContactMiniProfile ID="ciNewContactMiniProfileCommon" runat="server" ContentKey="68bbaa09-837d-4c6d-9865-c199d2477229" ContentItemKey="d3a10dbc-c7e2-4db9-b96a-8bdc618be39f" Title="New ContactMiniProfileCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" MaxFileSize="1024" FileTypes=".GIF,.JPG,.PNG,.BMP" MaxImageWidth="200" EnableEdit="False" DisplayForAuthorizedUsersOnly="True" DisplayContactName="True" DisplayContactTitle="True" DisplayInstitute="True" AddressToDisplay="Preferred Billing" ChangeContactStatus="False" CustomerIdHeading="ID" CustomerBillingHeading="Billing category" CustomerJoinHeading="Join date" CustomerTypeHeading="Type" CustomerStatusHeading="Status" MobilePhoneHeading="" CustomerPaidThruHeading="Paid through" DisplayCustomerId="False" DisplayBillingCat="False" DisplayCustomerJoinDate="False" DisplayCustomerType="False" DisplayCustomerStatus="False" DisplayPaidThru="False" DisplayContactPicture="True" EditContactName="False" IncludePrimaryOrganizationSelection="False" RequirePrimaryOrganizationSelection="False" OrganizationListQueryPath="" DisplayMobilePhone="False" />
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