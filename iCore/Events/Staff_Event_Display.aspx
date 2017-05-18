<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Staff Event Display" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="EventDisplay" Src="~/iParts/Events/Events/EventDisplayDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="EventProgramDisplay" Src="~/iParts/Events/Events/EventProgramDisplayDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="CartCheckoutButtonLink" Src="~/iParts/Commerce/CartCheckoutButtonLink/CartCheckoutButtonLinkDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="AlertDisplay" Src="~/iParts/Communications/Notification/NotificationDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("200bda66-0ec0-4ff3-b9d0-d46f0f0872f6"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("0671cd48-8ac8-49a0-b00c-e880ff5751a7"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		AddChildUserControl(ContentPage2);

		childUserControl = ciEventDisplay as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("69ce97ec-4871-4c6d-8331-db823f7410b1");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciEventDisplay);

		childUserControl = ciEventProgramDisplay as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("fbb39d1f-adbd-4740-aeb3-82e7dddb83a6");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciEventProgramDisplay);

		childUserControl = ciNewCartCheckoutButtonLinkCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e3d51915-b6f0-46f4-9ffa-04a0d69e292d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewCartCheckoutButtonLinkCommon);

		AddChildUserControl(ContentPage3);

		childUserControl = ciAlerts as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("af194dfa-dfb9-4995-b1d5-523715bec459");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAlerts);

		AddChildUserControl(ContentPage4);

	}
</script>
<asp:Content ID="TemplateUserMessages" ContentPlaceHolderID="TemplateUserMessages" runat="server"></asp:Content>
<asp:Content ID="TemplateBody" ContentPlaceHolderID="TemplateBody" Runat="Server">
<script type="text/javascript">

</script>
	<asiweb:AsiWebPartManager id="WebPartManager1" runat="server">
		<StaticConnections>
			<asp:WebPartConnection ID="WebPartConnection1" ConsumerID="ciEventProgramDisplay" ConsumerConnectionPointID="AsiStringKey" ProviderID="ciEventDisplay" ProviderConnectionPointID="AsiStringKey" />
		</StaticConnections>
	</asiweb:AsiWebPartManager>
   <div>
	<div class="row">
    <div class="col-sm-12">
			<CM:ContentPage ID="ContentPage1" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone1_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
<div class="row">
    <div class="col-sm-9">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:EventDisplay ID="ciEventDisplay" runat="server" ContentKey="200bda66-0ec0-4ff3-b9d0-d46f0f0872f6" ContentItemKey="69ce97ec-4871-4c6d-8331-db823f7410b1" Title="Event Display" ShowTitleFlag="False" PageTitle="" DoNotRenderInDesignMode="False" ShowBorder="False" EventKey="" ImageWidth="200" RegistrantInfoMessage="Edit registrant information" IQAQueryPath="" IQAQueryPathEvtGuest="" IQAQueryKey="d9ba33c4-07c3-4192-92bf-be2219347c87" IQAQueryKeyEvtGuest="f5ecbbfe-0fbf-491a-b1b7-45e19c2a288f" CreateAddressPurpose="" OrganizationListQueryPath="" AddToCalendarButtonDisplayMode="ShowAfterRegistration" />
				<CM:EventProgramDisplay ID="ciEventProgramDisplay" runat="server" ContentKey="200bda66-0ec0-4ff3-b9d0-d46f0f0872f6" ContentItemKey="fbb39d1f-adbd-4740-aeb3-82e7dddb83a6" Title="Event Program Display" ShowTitleFlag="False" PageTitle="Program - [Name]" DoNotRenderInDesignMode="False" ShowBorder="False" SelectItineraryCheckBox="False" EventKey="" />
				<CM:CartCheckoutButtonLink ID="ciNewCartCheckoutButtonLinkCommon" runat="server" ContentKey="200bda66-0ec0-4ff3-b9d0-d46f0f0872f6" ContentItemKey="e3d51915-b6f0-46f4-9ffa-04a0d69e292d" Title="New CartCheckoutButtonLinkCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayMode="Current Event" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-3">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:AlertDisplay ID="ciAlerts" runat="server" ContentKey="200bda66-0ec0-4ff3-b9d0-d46f0f0872f6" ContentItemKey="af194dfa-dfb9-4995-b1d5-523715bec459" Title="Alerts" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="Alerts" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" SelectedNotificationSets="e2676137-3a90-47ef-8d4b-833307979b0f" HideWhenEmpty="True" NoAlertMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
			<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
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