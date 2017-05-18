<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Create Contact Person or Org" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactAccountCreator" Src="~/iParts/Contact Management/ContactAccountCreator/ContactAccountCreatorDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("3229d460-e1ed-4a09-9dc4-7638ca7f6807"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("27474b70-0867-4f20-b718-d1de7fe3b46e"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciAddcontact as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a31878de-5b6a-4682-9d15-dad7e8e77011");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAddcontact);

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
				<CM:ContactAccountCreator ID="ciAddcontact" runat="server" ContentKey="3229d460-e1ed-4a09-9dc4-7638ca7f6807" ContentItemKey="a31878de-5b6a-4682-9d15-dad7e8e77011" Title="Add contact" ShowTitleFlag="False" PartTitle="Add contact" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" HideForAuthenticatedUsers="False" AccountTypeAllowed="IndividualOrOrganization" IncludeSuffix="False" IncludePrefix="False" IncludeDesignation="False" IncludeInformalName="False" IncludeTitle="False" IncludePhone="False" IncludeMobilePhone="False" IncludeEmail="False" RequireEmailForOrganization="False" IncludeEmailForIndividual="True" RequireEmailForIndividual="True" RequireAddress2="False" IncludeAddress="False" MultipleAddressLines="False" SingleTextAddress="False" NoEmailDuplicates="True" CreateAddressPurpose="" IncludeLogOnLink="False" IncludeOptionToCreateLogon="True" RequireUserToCreateLogon="False" UseEmailAsLogon="True" UrlRedirect="~/Party.aspx" RedirectLocation="ContentOrUrl" CommitSequence="0" IncludePrimaryOrganizationSelection="True" RequirePrimaryOrganizationSelection="False" OrganizationListQueryPath="" IncludeIdAsQuerystringParameter="True" IncludeSocialMediaSignupOption="False" AssignCompanyAdministrator="True" IncludeMiddleName="True" />
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