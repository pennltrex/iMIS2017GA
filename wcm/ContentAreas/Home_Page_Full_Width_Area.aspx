<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Home Page Full Width Area" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="Slideshow" Src="~/iparts/Common/Slideshow/SlideshowDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("a73e225d-6c5e-43a7-bf36-0a5af2073866"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("df21e5cf-e0b3-47fd-b621-541306d5a307"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciHomeSlideshow as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("a597bb00-a3c9-4e95-beec-41e1fd04938b");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciHomeSlideshow);

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
				<CM:Slideshow ID="ciHomeSlideshow" runat="server" ContentKey="a73e225d-6c5e-43a7-bf36-0a5af2073866" ContentItemKey="a597bb00-a3c9-4e95-beec-41e1fd04938b" Title="Home Slideshow" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" SliderHeight="400" AutoRotate="False" SecondsPerSlide="5" SliderTabbedDialogSettings="Annual Conference
~/images/samplesites/member/citylandscape1.jpg
&lt;h1&gt;Annual Conference&lt;/h1&gt;
&lt;p&gt;This year&#39;s Annual Conference is approaching fast! Register today!&lt;/p&gt;
~/event.aspx?EventKey=ANNCONF
Book Sale
~/images/samplesites/member/book.jpg
&lt;h1&gt;Book Sale&lt;/h1&gt;
&lt;p&gt;Use promo code &lt;strong&gt;BookSavings&lt;/strong&gt; at checkout for 5% off all publications.&lt;/p&gt;
~/Store
Member Spotlight
~/images/samplesites/member/jump.jpg
&lt;h1&gt;Member Spotlight&lt;/h1&gt;
&lt;p&gt;Meet Liam Duffield &amp;ndash; Versaton Australia&#39;s IT Team Leader by day, adventurer by night.&lt;/p&gt;
~/party.aspx?ID=19166
We&#39;re Mobile
~/images/samplesites/member/mobile2.jpg
&lt;h1&gt;We&#39;re Mobile&lt;/h1&gt;
&lt;p&gt;Take your association with you on the go using our mobile-friendly website.&lt;/p&gt;
d6e4709a-5fa0-4b56-9521-a66cc05a5f97
" />
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