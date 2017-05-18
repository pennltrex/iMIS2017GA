<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Thank you" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="PanelEditor" Src="~/iparts/Common/PanelEditor/PanelEditorDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("b55101f2-ebf4-41bc-8ecc-00a2d4d51a70"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("80906094-1cb4-4e01-8855-e7b19f40d649"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewContentHtml2_e52f9ee72bc44c6b9d3b305633a366f9 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e52f9ee7-2bc4-4c6b-9d3b-305633a366f9");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml2_e52f9ee72bc44c6b9d3b305633a366f9);

		AddChildUserControl(ContentPage2);

		childUserControl = ciVolunteerthankyou_03939f44ad8443b2bfbe1b5614cfc616 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("03939f44-ad84-43b2-bfbe-1b5614cfc616");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciVolunteerthankyou_03939f44ad8443b2bfbe1b5614cfc616);

		childUserControl = ciVolunteerinformation as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("1eecd66c-dfd7-4e20-b194-89f09fcbb443");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciVolunteerinformation);

		childUserControl = ciVolunteeravailability as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("71baec8e-2603-49cd-837a-764caadbc35d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciVolunteeravailability);

		childUserControl = ciVolunteerskillsandinterests as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("fc848ffb-d5bd-4928-8957-f796aed76de6");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciVolunteerskillsandinterests);

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
    <div class="col-sm-4">
			<CM:ContentPage ID="ContentPage1" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone1_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciNewContentHtml2_e52f9ee72bc44c6b9d3b305633a366f9" runat="server" ContentKey="b55101f2-ebf4-41bc-8ecc-00a2d4d51a70" ContentItemKey="e52f9ee7-2bc4-4c6b-9d3b-305633a366f9" Title="New ContentHtml_2" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml2" runat="server"><div class="bg-img-tiger-tall banner-tall">&nbsp;</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-8">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciVolunteerthankyou_03939f44ad8443b2bfbe1b5614cfc616" runat="server" ContentKey="b55101f2-ebf4-41bc-8ecc-00a2d4d51a70" ContentItemKey="03939f44-ad84-43b2-bfbe-1b5614cfc616" Title="Volunteer thank you" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Volunteerthankyou" runat="server"><h1>Thank you for signing up!</h1>
<p class="lead">We will contact you as soon as we have an opportunity that matches your preferences. In the meantime, please visit <a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>party.aspx">your profile</a> to add additional information or check out our <a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>iCore/Events/Events_List.aspx">upcoming events</a>.</p>
<br />
<p class="AltBgColor1"><em>Our mission is to identify, restore, and advocate for crucial wildlife habitats throughout the world.</em></p></asp:Panel></CM:ContentHtml>
				<CM:PanelEditor ID="ciVolunteerinformation" runat="server" ContentKey="b55101f2-ebf4-41bc-8ecc-00a2d4d51a70" ContentItemKey="1eecd66c-dfd7-4e20-b194-89f09fcbb443" Title="Volunteer information" ShowTitleFlag="False" PartTitle="Confirm your information" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PanelDefinitionId="296166f4-aeb5-42cf-9816-a87f2682d768" AllowEdit="True" DefaultEditMode="False" CommitSequence="0" AllowDelete="False" AllowAdd="True" EditWindowWidth="600" EditWindowHeight="400" DisplayForAuthorizedUsersOnly="True" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" HidePanelWhenEmpty="False" ScrollingCellsEnabled="False" />
				<CM:PanelEditor ID="ciVolunteeravailability" runat="server" ContentKey="b55101f2-ebf4-41bc-8ecc-00a2d4d51a70" ContentItemKey="71baec8e-2603-49cd-837a-764caadbc35d" Title="Volunteer availability" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PanelDefinitionId="d3d3ceb1-be0f-4804-a399-e0ab416e8c02" AllowEdit="True" DefaultEditMode="False" CommitSequence="0" AllowDelete="True" AllowAdd="True" EditWindowWidth="600" EditWindowHeight="400" DisplayForAuthorizedUsersOnly="True" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" HidePanelWhenEmpty="False" ScrollingCellsEnabled="False" />
				<CM:PanelEditor ID="ciVolunteerskillsandinterests" runat="server" ContentKey="b55101f2-ebf4-41bc-8ecc-00a2d4d51a70" ContentItemKey="fc848ffb-d5bd-4928-8957-f796aed76de6" Title="Volunteer skills and interests" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" PanelDefinitionId="c086ad78-2c17-45b4-becf-d1e2be67910f" AllowEdit="True" DefaultEditMode="False" CommitSequence="0" AllowDelete="True" AllowAdd="True" EditWindowWidth="800" EditWindowHeight="600" DisplayForAuthorizedUsersOnly="True" ScrollingGridEnabled="False" ScrollingGridWidth="500" ScrollingGridHeight="300" HidePanelWhenEmpty="False" ScrollingCellsEnabled="False" />
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