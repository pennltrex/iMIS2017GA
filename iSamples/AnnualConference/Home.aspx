<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Home" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("439b99b7-9656-4249-97fe-15e6939194f7"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("77dbba0e-634e-4853-9024-5e63de8507ad"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		AddChildUserControl(ContentPage2);

		childUserControl = ciRegisternow_b7bfb2fd749d4d9d86dbcd093ecd4f84 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("b7bfb2fd-749d-4d9d-86db-cd093ecd4f84");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRegisternow_b7bfb2fd749d4d9d86dbcd093ecd4f84);

		AddChildUserControl(ContentPage3);

		childUserControl = ciExploretheschedule_b887c9d610b74637bdcceeeadd4b2564 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("b887c9d6-10b7-4637-bdcc-eeeadd4b2564");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciExploretheschedule_b887c9d610b74637bdcceeeadd4b2564);

		AddChildUserControl(ContentPage4);

		childUserControl = ciAccommodations1_f37ecde9a5ec4ab98a1d8a2a277ee19a as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("f37ecde9-a5ec-4ab9-8a1d-8a2a277ee19a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAccommodations1_f37ecde9a5ec4ab98a1d8a2a277ee19a);

		AddChildUserControl(ContentPage5);

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
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
    <div class="row">
        <div class="col-sm-4">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciRegisternow_b7bfb2fd749d4d9d86dbcd093ecd4f84" runat="server" ContentKey="439b99b7-9656-4249-97fe-15e6939194f7" ContentItemKey="b7bfb2fd-749d-4d9d-86db-cd093ecd4f84" Title="Register now" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Registernow" runat="server"><div class="CalloutArea1 Center">
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>iSamples/AnnualConference/Registration.aspx" class="link-image">
<img src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/AsiCommon/" %>Images/BSA/icon_customerservice.png" alt="Register now" />
</a>
<br />
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>iSamples/AnnualConference/Registration.aspx" class="FeatureActionLink">Register now</a>
<p>Register soon to reserve your spot!</p>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-sm-4">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciExploretheschedule_b887c9d610b74637bdcceeeadd4b2564" runat="server" ContentKey="439b99b7-9656-4249-97fe-15e6939194f7" ContentItemKey="b887c9d6-10b7-4637-bdcc-eeeadd4b2564" Title="Explore the schedule" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Exploretheschedule" runat="server"><div class="CalloutArea1 Center">
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>iSamples/AnnualConference/Event_Details.aspx" class="link-image">
<img src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/AsiCommon/" %>Images/BSA/icon_clipboard.png" alt="Explore the schedule" />
</a>
<br />
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>iSamples/AnnualConference/Event_Details.aspx" class="FeatureActionLink">Explore the schedule</a>
<p>Find out more about the sessions</p>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-sm-4">
			<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciAccommodations1_f37ecde9a5ec4ab98a1d8a2a277ee19a" runat="server" ContentKey="439b99b7-9656-4249-97fe-15e6939194f7" ContentItemKey="f37ecde9-a5ec-4ab9-8a1d-8a2a277ee19a" Title="Accommodations_1" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Accommodations1" runat="server"><div class="CalloutArea1 Center">
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>iSamples/AnnualConference/Event_Details.aspx?Event_Tabs=3#Event_Tabs" class="link-image">
<img src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/AsiCommon/" %>Images/BSA/icon_org.png" alt="Accommodations" />
</a>
<br />
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>iSamples/AnnualConference/Event_Details.aspx?Event_Tabs=3#Event_Tabs" class="FeatureActionLink">Accommodations</a>
<p>Get the code for your reduced room rate.</p>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
    </div>
<div class="row">
    <div class="col-sm-12">
			<CM:ContentPage ID="ContentPage5" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone5_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
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