<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Staff Sign In" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactSignIn" Src="~/iParts/Contact Management/ContactSignIn/ContactSignInDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("21160ad6-13cb-4919-a4ec-e9f2dc4aed24"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("388dbabf-72da-44a5-856d-4299c2dc6e07"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewContentHtml_f9bd2f7f149d43a5a7d2c550143956b8 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("f9bd2f7f-149d-43a5-a7d2-c550143956b8");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml_f9bd2f7f149d43a5a7d2c550143956b8);

		childUserControl = ciPusher1_c0e2b24d144b49bfb8e9da6ed6076e4d as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("c0e2b24d-144b-49bf-b8e9-da6ed6076e4d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciPusher1_c0e2b24d144b49bfb8e9da6ed6076e4d);

		AddChildUserControl(ContentPage2);

		childUserControl = ciPusher2_5a02f96713d943a98b2a16af7ac987e7 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("5a02f967-13d9-43a9-8b2a-16af7ac987e7");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciPusher2_5a02f96713d943a98b2a16af7ac987e7);

		AddChildUserControl(ContentPage3);

		childUserControl = ciSigninLogo_393292868b994b56a97b8236b417b8b5 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("39329286-8b99-4b56-a97b-8236b417b8b5");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSigninLogo_393292868b994b56a97b8236b417b8b5);

		childUserControl = ciSignIn as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("003a2bee-8d0c-487a-9f90-a9059724b070");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSignIn);

		AddChildUserControl(ContentPage4);

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
				<CM:ContentHtml ID="ciNewContentHtml_f9bd2f7f149d43a5a7d2c550143956b8" runat="server" ContentKey="21160ad6-13cb-4919-a4ec-e9f2dc4aed24" ContentItemKey="f9bd2f7f-149d-43a5-a7d2-c550143956b8" Title="New ContentHtml" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml" runat="server"><script type="text/javascript">
 
    (function () {
        var o = document.getElementById("__ClientContext");
        if (o) {
            try {
                var j = JSON.parse(o.value);
                if (j && j.hasOwnProperty('websiteRoot') && j.hasOwnProperty('isAnonymous')) {
                    if (j.isAnonymous !== true && j.websiteRoot && j.websiteRoot.length > 0)
                        window.location = j.websiteRoot;
                }
            } catch (e) { }
        }
    })();
 
</script>
<script type="text/javascript">
    document.documentElement.className += ' page-sign-in';
</script></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciPusher1_c0e2b24d144b49bfb8e9da6ed6076e4d" runat="server" ContentKey="21160ad6-13cb-4919-a4ec-e9f2dc4aed24" ContentItemKey="c0e2b24d-144b-49bf-b8e9-da6ed6076e4d" Title="Pusher1" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Pusher1" runat="server"><div class="SignInPusher"> </div></asp:Panel></CM:ContentHtml>
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
				<CM:ContentHtml ID="ciPusher2_5a02f96713d943a98b2a16af7ac987e7" runat="server" ContentKey="21160ad6-13cb-4919-a4ec-e9f2dc4aed24" ContentItemKey="5a02f967-13d9-43a9-8b2a-16af7ac987e7" Title="Pusher2" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Pusher2" runat="server"></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-sm-4">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciSigninLogo_393292868b994b56a97b8236b417b8b5" runat="server" ContentKey="21160ad6-13cb-4919-a4ec-e9f2dc4aed24" ContentItemKey="39329286-8b99-4b56-a97b-8236b417b8b5" Title="Signin_Logo" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_SigninLogo" runat="server"><p style="text-align: center;"><img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/ImageLibrary/StaffSignInLogo.png" /></p></asp:Panel></CM:ContentHtml>
				<CM:ContactSignIn ID="ciSignIn" runat="server" ContentKey="21160ad6-13cb-4919-a4ec-e9f2dc4aed24" ContentItemKey="003a2bee-8d0c-487a-9f90-a9059724b070" Title="Sign In" ShowTitleFlag="False" PartTitle="Sign In" DoNotRenderInDesignMode="False" CssClass="SignInPage" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplaySignInFailedMessageLocal="False" SignInFailedMessageLocal="The username or password you entered is incorrect." DisplayForgotUserId="True" DisplayForgotPassword="True" DisplayCreateAccount="False" ForgotUserIdMessage="Enter the following values to verify your user identity, then click Submit. We will email your username to the email address specified in your user account." ForgotPasswordMessage="Enter the Username for your user account, then click Submit. We will email you a link to a page where you can easily create a new password." CreateAccountLink="Create a new account" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-sm-4">
			<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
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