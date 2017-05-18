<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Event registration" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="DataShowcase" Src="~/iParts/Common/DataShowcase/DataShowcaseDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="SummaryDisplay" Src="~/iparts/Common/SummaryDisplay/SummaryDisplayDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="BigButtonPanel" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/DisplayBigButtonPanel.ascx" %>
<%@ Register TagPrefix="CM" TagName="AlertDisplay" Src="~/iParts/Communications/Notification/NotificationDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryMenu" Src="~/iparts/Common/QueryMenu/QueryMenuDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("048d2749-0490-4c3a-b62b-a7bd67fd68e2"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("3ea94ecb-d1ac-465b-8d76-11bd5dd9d2ed"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciPagetitle as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("614724df-ca08-480e-a01e-814341b53bdd");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciPagetitle);

		AddChildUserControl(ContentPage2);

		childUserControl = ciRegistrationoption as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("2f2ccbae-c1ac-4a09-9365-47b2f85def95");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRegistrationoption);

		childUserControl = ciRegistrationdetails as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("f99e908a-34bc-424f-8c22-34044fe024a6");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRegistrationdetails);

		childUserControl = ciActionbuttons as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("1cc3ab5f-b57b-4c1b-96ef-4181f8f39113");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciActionbuttons);

		childUserControl = ciAlerts as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("2e67949c-d42f-4e51-9bc2-1008a49cd866");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAlerts);

		AddChildUserControl(ContentPage3);

		childUserControl = ciBadgeinformation as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("f391b7d5-3970-478d-bdce-e06839ac4b4c");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciBadgeinformation);

		AddChildUserControl(ContentPage4);

		childUserControl = ciProgramitemregistrations as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("3b036dfd-3208-4892-9f45-12c6b9336df3");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciProgramitemregistrations);

		childUserControl = ciQuestionresponses as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("668cf20d-0cd2-457c-a5b0-ea2ead565d14");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciQuestionresponses);

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
				<CM:DataShowcase ID="ciPagetitle" runat="server" ContentKey="048d2749-0490-4c3a-b62b-a7bd67fd68e2" ContentItemKey="614724df-ca08-480e-a01e-814341b53bdd" Title="Page title" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="iPartChain FirstPart PanelNoPadding" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" Content="&lt;h2 class=&quot;AddPadding&quot;&gt;{#event.Name} registration for {#party.Name}&lt;/h2&gt;
&lt;div class=&quot;AddPaddingHorizontal&quot;&gt;
&lt;div class=&quot;PanelField pull-left&quot; id=&quot;DSEventDatePanelField&quot; style=&quot;width:auto; margin-right: 2em;&quot;&gt;&lt;span class=&quot;Label&quot;&gt;Event date&lt;/span&gt;
&lt;div class=&quot;PanelFieldValue&quot;&gt;&lt;span id=&quot;DSEventStartDate&quot;&gt;{#event.StartDateTime format=&quot;d&quot;}&lt;/span&gt;&lt;span id=&quot;DSEnDash&quot;&gt; – &lt;/span&gt;&lt;span id=&quot;DSEventEndDate&quot;&gt;{#event.EndDateTime format=&quot;d&quot;}&lt;/span&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;div class=&quot;PanelField pull-left&quot; id=&quot;DSEventLink&quot; style=&quot;width:auto; clear: none;&quot;&gt;
&lt;div class=&quot;PanelFieldValue&quot;&gt;&lt;a href=&quot;[website]Event.aspx?EventKey={#event.EventId}&quot;&gt;View event&lt;/a&gt;&lt;/div&gt;
&lt;/div&gt;
&lt;/div&gt;
&lt;script&gt;
        var startDateSpan = jQuery(&quot;#DSEventStartDate&quot;);
        var endDateSpan = jQuery(&quot;#DSEventEndDate&quot;);
        var enDashSpan = jQuery(&quot;#DSEnDash&quot;);
        var enDatePanelField = jQuery(&quot;#DSEventDatePanelField&quot;);
        if (startDateSpan.text() == endDateSpan.text()) // if the dates are equal only show it once
        {
            endDateSpan.css(&quot;display&quot;,&quot;none&quot;);
            enDashSpan.css(&quot;display&quot;,&quot;none&quot;);
        }
        if (startDateSpan.is(&quot;:empty&quot;) || endDateSpan.is(&quot;:empty&quot;)) // if there is no start or end date don&#39;t show the dash or label
            enDashSpan.css(&quot;display&quot;, &quot;none&quot;);
        if (startDateSpan.is(&quot;:empty&quot;) &amp;&amp; endDateSpan.is(&quot;:empty&quot;)) // if there is no date at all don&#39;t display the label
            enDatePanelField.css(&quot;display&quot;, &quot;none&quot;);
    &lt;/script&gt;" SerializedDataSources="&lt;ArrayOfDataSource xmlns=&quot;http://schemas.datacontract.org/2004/07/Asi.Web.iParts.Common.DataShowcase&quot; xmlns:i=&quot;http://www.w3.org/2001/XMLSchema-instance&quot;&gt;&lt;DataSource&gt;&lt;DataSourceId&gt;event&lt;/DataSourceId&gt;&lt;EntityTypeName&gt;Event&lt;/EntityTypeName&gt;&lt;WhereProperty&gt;EventID&lt;/WhereProperty&gt;&lt;WhereValue&gt;url:EventKey&lt;/WhereValue&gt;&lt;/DataSource&gt;&lt;DataSource&gt;&lt;DataSourceId&gt;party&lt;/DataSourceId&gt;&lt;EntityTypeName&gt;Party&lt;/EntityTypeName&gt;&lt;WhereProperty&gt;PartyId&lt;/WhereProperty&gt;&lt;WhereValue&gt;@SelectedId&lt;/WhereValue&gt;&lt;/DataSource&gt;&lt;/ArrayOfDataSource&gt;" HideOnError="True" />
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
				<CM:SummaryDisplay ID="ciRegistrationoption" runat="server" ContentKey="048d2749-0490-4c3a-b62b-a7bd67fd68e2" ContentItemKey="2f2ccbae-c1ac-4a09-9365-47b2f85def95" Title="Registration option" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="iPartChain MiddlePart" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayForAuthorizedUsersOnly="True" HideWhenNoData="True" HideFieldsWithNoData="True" IQAQueryPath="$/EventManagement/DefaultSystem/Queries/Registration details/Registration Option" IQAQueryKey="3f3ea0ac-610e-4fc0-97a7-e768695176a3" />
				<CM:SummaryDisplay ID="ciRegistrationdetails" runat="server" ContentKey="048d2749-0490-4c3a-b62b-a7bd67fd68e2" ContentItemKey="f99e908a-34bc-424f-8c22-34044fe024a6" Title="Registration details" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="iPartChain MiddlePart" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayForAuthorizedUsersOnly="True" HideWhenNoData="False" HideFieldsWithNoData="True" IQAQueryPath="$/EventManagement/DefaultSystem/Queries/Registration details/Registration Details" IQAQueryKey="d5ba5a76-32e7-4bb2-833f-9e883e649766" />
				<CM:BigButtonPanel ID="ciActionbuttons" runat="server" ContentKey="048d2749-0490-4c3a-b62b-a7bd67fd68e2" ContentItemKey="1cc3ab5f-b57b-4c1b-96ef-4181f8f39113" Title="Action buttons" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ImageUrl="" NavigationIdentifier="" ChildLevelsToDisplay="0" ExistingLegacyBorder="ExistingLegacyBorder" ActionMode="Actions" UsePopup="False" AltText="" IncludeParentLevelItem="False" DisplayForAuthorizedUsersOnly="True" Links="&quot;~/Event.aspx[EventKey=@url:EventKey](obo)|Edit registration&quot;,&quot;~/Party.aspx[ID=@SelectedID]|View account page&quot;" />
				<CM:AlertDisplay ID="ciAlerts" runat="server" ContentKey="048d2749-0490-4c3a-b62b-a7bd67fd68e2" ContentItemKey="2e67949c-d42f-4e51-9bc2-1008a49cd866" Title="Alerts" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="UnstyledListWrapper iPartChain LastPart" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" SelectedNotificationSets="6b659541-5dde-4960-a062-912f8df9dd58" HideWhenEmpty="True" NoAlertMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:SummaryDisplay ID="ciBadgeinformation" runat="server" ContentKey="048d2749-0490-4c3a-b62b-a7bd67fd68e2" ContentItemKey="f391b7d5-3970-478d-bdce-e06839ac4b4c" Title="Badge information" ShowTitleFlag="False" PartTitle="Badge information" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" DisplayForAuthorizedUsersOnly="True" HideWhenNoData="False" HideFieldsWithNoData="True" IQAQueryPath="$/EventManagement/DefaultSystem/Queries/Registration details/Badge Information" IQAQueryKey="abaad5f9-fbb9-4d3d-8f41-94d6b2bd3b28" />
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
				<CM:QueryMenu ID="ciProgramitemregistrations" runat="server" ContentKey="048d2749-0490-4c3a-b62b-a7bd67fd68e2" ContentItemKey="3b036dfd-3208-4892-9f45-12c6b9336df3" Title="Program item registrations" ShowTitleFlag="False" PartTitle="Program item registrations" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="True" MapResults="False" ListPageSize="20" PagerMode="NextPrevAndNumeric" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="$/EventManagement/DefaultSystem/Queries/Registration details/Program Item Registrations" SourceKey="e84534c7-9ed2-4191-9718-8caa8e6e9482" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="True" />
				<CM:QueryMenu ID="ciQuestionresponses" runat="server" ContentKey="048d2749-0490-4c3a-b62b-a7bd67fd68e2" ContentItemKey="668cf20d-0cd2-457c-a5b0-ea2ead565d14" Title="Question responses" ShowTitleFlag="False" PartTitle="Question responses" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="True" MapResults="False" ListPageSize="20" PagerMode="NextPrevAndNumeric" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="True" SourceFolderPathControl="$/EventManagement/DefaultSystem/Queries/Registration details/Question Responses" SourceKey="88c7e757-e6db-454d-a1a9-804672c2bd9f" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="True" />
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