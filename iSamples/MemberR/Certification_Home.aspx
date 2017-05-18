<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Certification Home" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="RelatedItems" Src="~/iparts/Common/RelatedItems/RelatedItemsDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("5bd009b4-7719-4e4c-ac72-8552854c4d79"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("93b118b3-b6a0-4a79-ba9b-c2ba46370a7e"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciTitle_776ca00219a142b9a614d9f12a576408 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("776ca002-19a1-42b9-a614-d9f12a576408");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciTitle_776ca00219a142b9a614d9f12a576408);

		AddChildUserControl(ContentPage2);

		childUserControl = ciSpotlight1_72b1c3c063eb47f9b996402842876354 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("72b1c3c0-63eb-47f9-b996-402842876354");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSpotlight1_72b1c3c063eb47f9b996402842876354);

		AddChildUserControl(ContentPage3);

		childUserControl = ciSpotlight2_7047a8de61184240a524a40180b3495a as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("7047a8de-6118-4240-a524-a40180b3495a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSpotlight2_7047a8de61184240a524a40180b3495a);

		AddChildUserControl(ContentPage4);

		childUserControl = ciInstructions_410bc4bda5b24cfc8fb287283b888a76 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("410bc4bd-a5b2-4cfc-8fb2-87283b888a76");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciInstructions_410bc4bda5b24cfc8fb287283b888a76);

		childUserControl = ciCertificationProducts as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("7f52a25f-c630-4303-976e-76e425836af7");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCertificationProducts);

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
				<CM:ContentHtml ID="ciTitle_776ca00219a142b9a614d9f12a576408" runat="server" ContentKey="5bd009b4-7719-4e4c-ac72-8552854c4d79" ContentItemKey="776ca002-19a1-42b9-a614-d9f12a576408" Title="Title" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Title" runat="server"><h1> Certification Programs</h1></asp:Panel></CM:ContentHtml>
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
				<CM:ContentHtml ID="ciSpotlight1_72b1c3c063eb47f9b996402842876354" runat="server" ContentKey="5bd009b4-7719-4e4c-ac72-8552854c4d79" ContentItemKey="72b1c3c0-63eb-47f9-b996-402842876354" Title="Spotlight1" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Spotlight1" runat="server"><div class="Spotlight ContentBlockPrimary">
<img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Member/binders.png" style="width: 87px; height: 86px;" />
<h4>Professional Industry Certification</h4>
<p>This program outlines the requirements of acquiring initial certification in our industry. Our certification programs prove to all your proficiency and dedication to our industry. <br />
Maintenance program is available after completion of the certification. <a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>Certification/Program_Enrollment/iSamples/Member/Certification_Program_Enrollment.aspx">View details...</a><br />
<br />
</p>
<div style="text-align: center;">
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>Certification/Program_Enrollment/iSamples/Member/Certification_Program_Enrollment.aspx" class="btn PrimaryButton LargeButton">Enroll Now</a>
</div>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciSpotlight2_7047a8de61184240a524a40180b3495a" runat="server" ContentKey="5bd009b4-7719-4e4c-ac72-8552854c4d79" ContentItemKey="7047a8de-6118-4240-a524-a40180b3495a" Title="Spotlight2" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Spotlight2" runat="server"><div class="Spotlight ContentBlockPrimary">
<img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Member/briefcase.png" style="width: 87px; height: 86px;" />
<h4>Practice Management Certification</h4>
<p>Completion of this program indicates you have the skills and knowledge to manage a professional practice. Complete 40 hours from the available courses. <br />
Maintenance program is available after completion of the certification.
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>Certification/Program_Enrollment/iSamples/Member/Certification_Program_Enrollment.aspx">View details...</a> <br />
<br />
</p>
<div style="text-align: center;">
<a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>Certification/Program_Enrollment/iSamples/Member/Certification_Program_Enrollment.aspx" class="btn PrimaryButton LargeButton">Enroll Now</a>
</div>
</div></asp:Panel></CM:ContentHtml>
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
				<CM:ContentHtml ID="ciInstructions_410bc4bda5b24cfc8fb287283b888a76" runat="server" ContentKey="5bd009b4-7719-4e4c-ac72-8552854c4d79" ContentItemKey="410bc4bd-a5b2-4cfc-8fb2-87283b888a76" Title="Instructions" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Instructions" runat="server"><h2>Enroll in a program</h2>
Click a program name to review the requirements for the certification you are interested
in. When you are ready to enroll, sign in to the website and select <strong>Enroll </strong>for the program you wish to pursue. You will be able to view the requirements needed and the deadline date for program completion.<br />
<br />
<h2>Complete the requirements</h2>
<span style="line-height: 1.385em;">Once enrolled, you can view your
progress towards the certification. Select an available requirement for details on how to complete it. Some requirements may not be available until prerequisites are completed. <br />
After completing a requirement, some allow you to record your completion and provide details about when and how you
completed it. </span>If the requirement requires approval, it will appear as earned after it is approved and credit will be granted. Completion of some other requirements may require association staff to record the completion.  <br />
Click <strong>Print Transcript</strong> at any time to view a printable record of all the courses and requirements you have completed. 
<br />
<br />
<h2>Complete the program</h2>
Complete all of the necessary requirements and ensure that you have the met the minimum number of units required for the program. When your progress has been approved, your certification is earned! <br />
<br />
<br /></asp:Panel></CM:ContentHtml>
				<CM:RelatedItems ID="ciCertificationProducts" runat="server" ContentKey="5bd009b4-7719-4e4c-ac72-8552854c4d79" ContentItemKey="7f52a25f-c630-4303-976e-76e425836af7" Title="Certification Products" ShowTitleFlag="False" PartTitle="You might like..." DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" NoRecordsFound="No results found" ListDescription="" MaxRecords="10" ImageDimension="85" ClickUrl="ItemDetail?iProductCode={key_Id}&amp;Category={ProductCategory}" ImagePath="" DefaultImage="/App_Themes/Austin/images/icon_product.png" DisplayOrientation="Horizontal" DisplayNameOption="Label" QueryStringParameterName="" ListSourceQuery="$/Samples/RelatedItems/Certification Products" DataColumnName="" LabelMaxLength="40" EnableHorizontalScrolling="False" HorizontalScrollWidth="0" />
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