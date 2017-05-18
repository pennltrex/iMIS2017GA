<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Workplace Giving" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("bbe09bbb-190d-447a-b586-2a5edeff5a83"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("ae6efb62-87c4-4274-a465-90244cfe7e10"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciWorkplaceGivingIntro_847ee865b67f423d84ebb52cb9167c35 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("847ee865-b67f-423d-84eb-b52cb9167c35");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciWorkplaceGivingIntro_847ee865b67f423d84ebb52cb9167c35);

		AddChildUserControl(ContentPage2);

		childUserControl = ciNewContentHtml_dc49f9ba2f5a4c56ba119e60fc4d7e61 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("dc49f9ba-2f5a-4c56-ba11-9e60fc4d7e61");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml_dc49f9ba2f5a4c56ba119e60fc4d7e61);

		AddChildUserControl(ContentPage3);

		childUserControl = ciForcompanies_05f4388b3e7d464aafe1b6adf5c7f856 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("05f4388b-3e7d-464a-afe1-b6adf5c7f856");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciForcompanies_05f4388b3e7d464aafe1b6adf5c7f856);

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
				<CM:ContentHtml ID="ciWorkplaceGivingIntro_847ee865b67f423d84ebb52cb9167c35" runat="server" ContentKey="bbe09bbb-190d-447a-b586-2a5edeff5a83" ContentItemKey="847ee865-b67f-423d-84eb-b52cb9167c35" Title="WorkplaceGivingIntro" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_WorkplaceGivingIntro" runat="server"><h1>Increase Your Impact</h1></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
	</div>
	<div class="row">
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciNewContentHtml_dc49f9ba2f5a4c56ba119e60fc4d7e61" runat="server" ContentKey="bbe09bbb-190d-447a-b586-2a5edeff5a83" ContentItemKey="dc49f9ba-2f5a-4c56-ba11-9e60fc4d7e61" Title="New ContentHtml" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml" runat="server"><h2>For donors</h2>
<p>Take advantage of your employer's matching gift program to maximize your donation's impact. Many employers sponsor matching gift programs and will match any charitable contributions made by their employees.</p>
<p><a href="http://www.hepdata.com/solutions/e-match-donor-link/" target="_blank">Does my employer match gifts?</a></p>
<p>You can donate here or anywhere on our website. After your donation is complete, you will see a page with a link to search for your employer's program. If your employer offers a matching gift, please select them from the list
and follow the procedure in the information and guidelines provided.</p>
<a class="TextButton PrimaryButton" href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>GiveNow">Donate Now</a></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciForcompanies_05f4388b3e7d464aafe1b6adf5c7f856" runat="server" ContentKey="bbe09bbb-190d-447a-b586-2a5edeff5a83" ContentItemKey="05f4388b-3e7d-464a-afe1-b6adf5c7f856" Title="Forcompanies" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Forcompanies" runat="server"><h2>For companies</h2>
<p>Is your company interested in participating in matching gifts for the iMIS Foundation? Or are you interested in sponsoring a fundraising event? Any little bit helps, and your participation will help us achieve our objectives around the world. </p>
<p>Contact <a href="mailto:">corporategiving@imisdemo.com</a> for more information.</p></asp:Panel></CM:ContentHtml>
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