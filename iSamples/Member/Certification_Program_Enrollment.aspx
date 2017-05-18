<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Certification Program Enrollment" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactSignIn" Src="~/iParts/Contact Management/ContactSignIn/ContactSignInDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentWebUserControl_CertificationPrograms" Src="~/AsiCommon/Controls/CertificationManagement/CertificationProgramHistory.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="RelatedItems" Src="~/iparts/Common/RelatedItems/RelatedItemsDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("d39178cd-484b-410d-8849-b15191d8fdc3"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("32edd918-5d86-4c08-99c4-aeec551314f7"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciSignIn as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("46cd3d34-1d46-4398-898e-f545f4a617d8");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSignIn);

		childUserControl = ciCertificationPrograms as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("d050c548-54bc-4a0d-a0bb-e93afd60b388");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCertificationPrograms);

		childUserControl = ciNewContentHtml_e1ddc377e91347a59c91ce14fca8c82d as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e1ddc377-e913-47a5-9c91-ce14fca8c82d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml_e1ddc377e91347a59c91ce14fca8c82d);

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
				<CM:ContactSignIn ID="ciSignIn" runat="server" ContentKey="d39178cd-484b-410d-8849-b15191d8fdc3" ContentItemKey="46cd3d34-1d46-4398-898e-f545f4a617d8" Title="Sign In" ShowTitleFlag="False" PartTitle="Sign in to enroll" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplaySignInFailedMessageLocal="False" SignInFailedMessageLocal="The username or password you entered is incorrect." DisplayForgotUserId="True" DisplayForgotPassword="True" DisplayCreateAccount="True" ForgotUserIdMessage="Enter the email associated with your account, then click Submit. We will email your username to the email address specified." ForgotPasswordMessage="Enter the Username for your user account, then click Submit. We will email you a link to a page where you can easily create a new password." CreateAccountLink="Create a new account" />
				<asp:Panel ID="ste_container_CertificationPrograms" runat="server" style="position: relative; min-height: 20px; zoom: 1 !important; padding: 0px; margin: 0px;"><CM:ContentWebUserControl_CertificationPrograms ID="ciCertificationPrograms" runat="server" ShowBorder="False" UseParentAtomObject="False" UseKeyFromURL="False" CommitSequence="0" /><asiweb:SurfToEditButtonPanel ID="ste_ciCertificationPrograms" runat="server" ContentKey="d39178cd-484b-410d-8849-b15191d8fdc3" ContentItemKey="d050c548-54bc-4a0d-a0bb-e93afd60b388" /></asp:Panel>
				<CM:ContentHtml ID="ciNewContentHtml_e1ddc377e91347a59c91ce14fca8c82d" runat="server" ContentKey="d39178cd-484b-410d-8849-b15191d8fdc3" ContentItemKey="e1ddc377-e913-47a5-9c91-ce14fca8c82d" Title="New ContentHtml" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml" runat="server"><div class="ContentBlockPrimary">
<h2>FAQ</h2>
<h5>How do I view requirements for a program?</h5>
Select a program name to view the requirements, the units required, and the time allowed to complete.<br />
<br />
<h5>Why can't I select some requirements to view more details?</h5>
Some programs are set up so that requirements should be completed in order. You will be able to select future requirements when the currently available ones have been completed.<br />
<br />
<h5>How do I indicate I completed a requirement?</h5>
Some requirements allow you to select "Record Completion" for the requirement, or for the specific offering that you completed, to enter your completion details. Other requirements may require that association staff record your completion. <br />
<br />
<h5>How do I complete a program?</h5>
<span style="line-height: 19.375px;">Complete of all the necessary requirements, including obtaining approval if needed, and make sure that you have earned the minimum number of units. <br />
If the program requires approval, it will appear as Earned after your completion has been approved.</span>
</div></asp:Panel></CM:ContentHtml>
				<CM:RelatedItems ID="ciCertificationProducts" runat="server" ContentKey="d39178cd-484b-410d-8849-b15191d8fdc3" ContentItemKey="7f52a25f-c630-4303-976e-76e425836af7" Title="Certification Products" ShowTitleFlag="False" PartTitle="You might like..." DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" NoRecordsFound="No results found" ListDescription="" MaxRecords="10" ImageDimension="85" ClickUrl="ItemDetail?iProductCode={key_Id}&amp;Category={ProductCategory}" ImagePath="" DefaultImage="/App_Themes/Austin/images/icon_product.png" DisplayOrientation="Horizontal" DisplayNameOption="Label" QueryStringParameterName="" ListSourceQuery="$/Samples/RelatedItems/Certification Products" DataColumnName="" LabelMaxLength="40" EnableHorizontalScrolling="False" HorizontalScrollWidth="0" />
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