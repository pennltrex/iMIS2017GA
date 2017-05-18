<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Profile" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactMiniProfile" Src="~/iParts/Contact Management/ContactMiniProfile/ContactMiniProfileDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return true; } }

	override public Guid ContentRecordKey { get { return new Guid("7e207dcd-e714-4e1e-8882-a047e26ccf58"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("75a611fa-5bcf-46f9-81d8-2f5f8bce71ad"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciProfile as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("6e741a7f-ac5d-44b1-a841-f36df3fa0065");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciProfile);

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
				<CM:ContactMiniProfile ID="ciProfile" runat="server" ContentKey="7e207dcd-e714-4e1e-8882-a047e26ccf58" ContentItemKey="6e741a7f-ac5d-44b1-a841-f36df3fa0065" Title="Profile" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" MaxFileSize="1024" FileTypes=".GIF,.JPG,.PNG,.BMP" MaxImageWidth="200" EnableEdit="False" DisplayForAuthorizedUsersOnly="False" DisplayContactName="True" DisplayContactTitle="True" DisplayInstitute="True" AddressToDisplay="Preferred Mailing" ChangeContactStatus="False" CustomerIdHeading="" CustomerBillingHeading="" CustomerJoinHeading="" CustomerTypeHeading="" CustomerStatusHeading="Status" MobilePhoneHeading="" CustomerPaidThruHeading="" DisplayCustomerId="False" DisplayBillingCat="False" DisplayCustomerJoinDate="False" DisplayCustomerType="False" DisplayCustomerStatus="False" DisplayPaidThru="False" DisplayContactPicture="True" EditContactName="False" IncludePrimaryOrganizationSelection="False" RequirePrimaryOrganizationSelection="False" OrganizationListQueryPath="" DisplayMobilePhone="False" />
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