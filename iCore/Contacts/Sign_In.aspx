﻿<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Sign In" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContactSignIn" Src="~/iParts/Contact Management/ContactSignIn/ContactSignInDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("7118bf41-8789-4cd5-bca8-d6a224a6cf2a"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("6bad4bc0-db4d-4a3b-a7a8-fef6c141d973"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		AddChildUserControl(ContentPage2);

		childUserControl = ciNewContactSignInCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("003a2bee-8d0c-487a-9f90-a9059724b070");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContactSignInCommon);

		AddChildUserControl(ContentPage3);

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
        <div class="col-sm-3">
			<CM:ContentPage ID="ContentPage1" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone1_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContactSignIn ID="ciNewContactSignInCommon" runat="server" ContentKey="7118bf41-8789-4cd5-bca8-d6a224a6cf2a" ContentItemKey="003a2bee-8d0c-487a-9f90-a9059724b070" Title="New ContactSignInCommon" ShowTitleFlag="False" PartTitle="Sign In" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplaySignInFailedMessageLocal="False" SignInFailedMessageLocal="The username or password you entered is incorrect." DisplayForgotUserId="True" DisplayForgotPassword="True" DisplayCreateAccount="True" ForgotUserIdMessage="Enter the following values to verify your user identity, then click Submit. We will email your username to the email address specified in your user account." ForgotPasswordMessage="Enter the Username for your user account, then click Submit. We will email you a link to a page where you can easily create a new password." CreateAccountLink="Create a new account" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-sm-3">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
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