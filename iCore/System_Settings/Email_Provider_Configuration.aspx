<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Email Provider Configuration" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="EmailProviderConfiguration" Src="~/iParts/Communications/EmailProviderConfiguration/EmailProviderConfigurationDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("d6c61a93-d0f1-48b4-a8aa-9cd62bbe587d"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("60634761-a224-40d4-ba47-a599168e2a17"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciContentHtml_f5d7648a0c54441599583990ac607a59 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("f5d7648a-0c54-4415-9958-3990ac607a59");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciContentHtml_f5d7648a0c54441599583990ac607a59);

		childUserControl = ciNewEmailProviderConfigurationCommon as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("feb3abc6-b4ba-4314-9efe-33fb86292919");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewEmailProviderConfigurationCommon);

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
				<CM:ContentHtml ID="ciContentHtml_f5d7648a0c54441599583990ac607a59" runat="server" ContentKey="d6c61a93-d0f1-48b4-a8aa-9cd62bbe587d" ContentItemKey="f5d7648a-0c54-4415-9958-3990ac607a59" Title="Content Html" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_ContentHtml" runat="server"><strong><span style="font-size: 18px;">Manage advanced email marketing account</span></strong><br />
<br />
In order to use the features of the Advanced Email Marketing, you need to provide certain information about your organization, including a primary contact person. &nbsp;This information is necessary when sending a Marketing Email to comply with anti-SPAM legislation. &nbsp;The primary contact will receive important information about your usage of the feature and will be the point of contact for billing matters.</asp:Panel></CM:ContentHtml>
				<CM:EmailProviderConfiguration ID="ciNewEmailProviderConfigurationCommon" runat="server" ContentKey="d6c61a93-d0f1-48b4-a8aa-9cd62bbe587d" ContentItemKey="feb3abc6-b4ba-4314-9efe-33fb86292919" Title="New EmailProviderConfigurationCommon" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" />
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