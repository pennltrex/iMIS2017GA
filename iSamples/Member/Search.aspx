<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Search" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="SocialShare" Src="~/iParts/Social/SocialShare/SocialShareDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="CommonSearch" Src="~/iParts/Common/Search/SearchDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">
	<meta name="Description" content="The default search page for the iMIS application and its content." />

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("d0b42e03-6af0-473a-bc4c-903f7608b021"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("6ffb4404-a4ee-4630-9e96-cfd4abcc37f0"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewSocialShareCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("68003bbf-619d-47a3-8415-835bce039466");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewSocialShareCommon);

		AddChildUserControl(ContentPage2);

		childUserControl = ciSearchresults as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("4ff9bbda-62fa-4aa3-b896-9b8ec7f94a31");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSearchresults);

		AddChildUserControl(ContentPage3);

		childUserControl = ciThankyou_a1e8dcb086b84f19bc4aa9d4abe756b5 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a1e8dcb0-86b8-4f19-bc4a-a9d4abe756b5");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciThankyou_a1e8dcb086b84f19bc4aa9d4abe756b5);

		childUserControl = ciMemberBenefits_c4ad807ac6b242a6a6cce1b6357adbee as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("c4ad807a-c6b2-42a6-a6cc-e1b6357adbee");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMemberBenefits_c4ad807ac6b242a6a6cce1b6357adbee);

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
				<CM:SocialShare ID="ciNewSocialShareCommon" runat="server" ContentKey="d0b42e03-6af0-473a-bc4c-903f7608b021" ContentItemKey="68003bbf-619d-47a3-8415-835bce039466" Title="New SocialShareCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" BorderVisible="False" UrlToShare="" IconDimension="16" LegendText="Share this page" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
		</div>
	</div>
	<div class="row">
		<div class="col-sm-8">
						<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:CommonSearch ID="ciSearchresults" runat="server" ContentKey="d0b42e03-6af0-473a-bc4c-903f7608b021" ContentItemKey="4ff9bbda-62fa-4aa3-b896-9b8ec7f94a31" Title="Search results" ShowTitleFlag="False" PartTitle="Search results" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayTextBox="True" DisplayInactiveResultsCheckBox="True" InitialDisplay="True" InitialText="" InitialLogic="And" SearchLabel="Search" DisplayAreaOptions="True" Options="All,Community,Content,Event,Organization,People,Post,Product" InitialArea="All" ErrorMsg="There was a problem running your search. Please try again." ExceedResultsMsg="Your search criteria returned over {0} records. To see more results, please modify your query to add more criteria." MaxResults="1000" NoResultMsg="No search results match your specified criteria. Please try again with fewer or different criteria." PageSize="25" Sort="Rank" Tags="" PagerMode="NextPrevAndNumeric" PagerDisplay="Both" AddContentItem="00000000-0000-0000-0000-000000000000" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    
		</div>
		<div class="col-sm-4">
						<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciThankyou_a1e8dcb086b84f19bc4aa9d4abe756b5" runat="server" ContentKey="d0b42e03-6af0-473a-bc4c-903f7608b021" ContentItemKey="a1e8dcb0-86b8-4f19-bc4a-a9d4abe756b5" Title="Thank you" ShowTitleFlag="False" ShowBorder="True"><asp:Panel ID="Panel_Thankyou" runat="server"><div style="text-align: center;"><img alt="Thank you" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/UploadedImages/thank-you.png" style="width: 130px; height: 121px;" /></div>
<h3>You are the key to the future!</h3>
Did you know that our organization sponsors scholarships for students in the industry? A portion of your membership fees, event registrations, and product purchases goes to our scholarship fund. But, the majority of the income is from donations from members like you. Thank you for helping ensure the future of our profession.</asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciMemberBenefits_c4ad807ac6b242a6a6cce1b6357adbee" runat="server" ContentKey="d0b42e03-6af0-473a-bc4c-903f7608b021" ContentItemKey="c4ad807a-c6b2-42a6-a6cc-e1b6357adbee" Title="Member Benefits" ShowTitleFlag="False" ShowBorder="True"><asp:Panel ID="Panel_MemberBenefits" runat="server"><h3>Member Benefits</h3>
<p>We have membership categories for students, education providers, vendors, and other partners. We are the organization for anyone associated with the industry!</p>
<ul>
    <li>Health insurance</li>
    <li>Life insurance</li>
    <li>Discounts on training and products</li>
    <li>Discounts on conference and trade show registrations</li>
</ul></asp:Panel></CM:ContentHtml>
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