<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Home Page Full Width Area" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="Slideshow" Src="~/iparts/Common/Slideshow/SlideshowDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("224afe2c-947f-40e0-82df-0f62c1dfc9f3"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("88eb987a-f0bb-406a-8d91-db5bf5f9d06b"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciHomeSlideshow as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("178167d0-a614-4a0c-a8c3-4719e618f049");
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
				<CM:Slideshow ID="ciHomeSlideshow" runat="server" ContentKey="224afe2c-947f-40e0-82df-0f62c1dfc9f3" ContentItemKey="178167d0-a614-4a0c-a8c3-4719e618f049" Title="Home Slideshow" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="carousel2" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" SliderHeight="500" AutoRotate="False" SecondsPerSlide="5" SliderTabbedDialogSettings="Marshlands
~/images/samplesites/donor/roseate-terns.jpg
&lt;h1&gt;Marshlands in need of help&lt;/h1&gt;
&lt;p&gt;​Marshlands and their inhabitants around the world are in danger from pollution and deforestation. Help us in our effort to restore these important wetlands.&lt;/p&gt;
&lt;div style=&quot;text-align: right;&quot;&gt;&lt;a href=&quot;[website]iCore/Fundraising/Donate/Give_to_a_Cause.aspx?ItemId=MARSH&quot; class=&quot;TextButton PrimaryButton MediumButton&quot;&gt;Donate Now&lt;/a&gt;&lt;/div&gt;
&lt;div class=&quot;img-copyright&quot;&gt;&lt;a href=&quot;https://www.flickr.com/photos/usfwssoutheast/5840543516&quot;&gt;Photo&lt;/a&gt; by USFWS/Southeast / &lt;a href=&quot;http://creativecommons.org/licenses/by/2.0/&quot;&gt;CC BY 2.0&lt;/a&gt;&lt;/div&gt;

Our Mission
~/images/samplesites/donor/highland-cow.jpg
&lt;h1&gt;&lt;span&gt;Our mission is to conserve habitats&lt;/span&gt;&lt;/h1&gt;
&lt;p&gt;Join us as we work to make the world a better place for wildlife now and into the future.&lt;/p&gt;
&lt;div class=&quot;ActionButton&quot; style=&quot;text-align: right;&quot;&gt;
&lt;a href=&quot;[website]iSamples/Donor/About_Us/Mission.aspx&quot; class=&quot;btn PrimaryButton MediumButton&quot;&gt;Learn More&lt;/a&gt;
&lt;/div&gt;

Volunteer
~/images/samplesites/donor/mountain-climb.jpg
&lt;h1&gt;Upcoming volunteer opportunities&lt;/h1&gt;
&lt;p&gt;We&#39;re always looking for volunteers to hand out water at races, clean local ponds and other exciting opportunities.&lt;/p&gt;
&lt;div style=&quot;text-align: right;&quot;&gt;&lt;a href=&quot;[website]iSamples/Donor/Get_Involved_/Volunteer.aspx&quot; class=&quot;TextButton PrimaryButton MediumButton&quot;&gt;Learn More&lt;/a&gt;&lt;/div&gt;

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