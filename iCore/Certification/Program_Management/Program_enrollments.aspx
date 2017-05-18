<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Program enrollments" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="DataShowcase" Src="~/iParts/Common/DataShowcase/DataShowcaseDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ProgressTracker" Src="~/iparts/Common/ProgressTracker/ProgressTrackerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryMenu" Src="~/iparts/Common/QueryMenu/QueryMenuDisplay.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("ed7573c2-1f7e-4e14-a137-110f35a18170"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("321ed4a0-92df-45c3-b6b3-4809493682c0"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciTitle as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e5bfa753-6e45-429b-8acd-e31572e4fb0d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciTitle);

		AddChildUserControl(ContentPage2);

		childUserControl = ciEarned as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("f9cdd95f-1bb8-4aeb-835d-a2a956d40416");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciEarned);

		AddChildUserControl(ContentPage3);

		childUserControl = ciEnrolled as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("740349a0-c0b5-411a-93f0-2e0af55da487");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciEnrolled);

		AddChildUserControl(ContentPage4);

		childUserControl = ciGraceperiod as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("f3700c9a-100a-45c6-9a80-de1747243c5a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciGraceperiod);

		AddChildUserControl(ContentPage5);

		childUserControl = ciExpired as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("878c148a-8c1e-4c30-9aa3-9f8752c0f1ff");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciExpired);

		AddChildUserControl(ContentPage6);

		AddChildUserControl(ContentPage7);

		AddChildUserControl(ContentPage8);

		AddChildUserControl(ContentPage9);

		AddChildUserControl(ContentPage10);

		childUserControl = ciRegisterButton_38406b841df44a9e901c1ab0c29ba686 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("38406b84-1df4-4a9e-901c-1ab0c29ba686");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRegisterButton_38406b841df44a9e901c1ab0c29ba686);

		childUserControl = ciEnrollees as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("358ef70f-e0e4-421c-b53a-737ef6f0b80a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciEnrollees);

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
				<CM:DataShowcase ID="ciTitle" runat="server" ContentKey="ed7573c2-1f7e-4e14-a137-110f35a18170" ContentItemKey="e5bfa753-6e45-429b-8acd-e31572e4fb0d" Title="Title" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" Content="&lt;h2&gt;{#program.Name}&lt;/h2&gt;" SerializedDataSources="&lt;ArrayOfDataSource xmlns=&quot;http://schemas.datacontract.org/2004/07/Asi.Web.iParts.Common.DataShowcase&quot; xmlns:i=&quot;http://www.w3.org/2001/XMLSchema-instance&quot;&gt;&lt;DataSource&gt;&lt;DataSourceId&gt;program&lt;/DataSourceId&gt;&lt;EntityTypeName&gt;CertificationProgram&lt;/EntityTypeName&gt;&lt;WhereProperty&gt;CertificationProgramId&lt;/WhereProperty&gt;&lt;WhereValue&gt;url:iUniformKey&lt;/WhereValue&gt;&lt;/DataSource&gt;&lt;/ArrayOfDataSource&gt;" HideOnError="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
<div class="row">
        <div class="col-md-3 col-sm-6">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciEarned" runat="server" ContentKey="ed7573c2-1f7e-4e14-a137-110f35a18170" ContentItemKey="f9cdd95f-1bb8-4aeb-835d-a2a956d40416" Title="Earned" ShowTitleFlag="False" PartTitle="Earned" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor2" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="of [GoalTotal] total enrollees" QueryStringParameterName="iUniformKey" ListSourceQuery="$/CertificationManagement/DefaultSystem/Queries/ProgramDashboard/Progress Tracker - Enrolled and earned" DataColumnName="CertificationProgramKey" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="Bottom" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-md-3 col-sm-6">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciEnrolled" runat="server" ContentKey="ed7573c2-1f7e-4e14-a137-110f35a18170" ContentItemKey="740349a0-c0b5-411a-93f0-2e0af55da487" Title="Enrolled" ShowTitleFlag="False" PartTitle="Enrolled, not earned" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor3" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="iUniformKey" ListSourceQuery="$/CertificationManagement/DefaultSystem/Queries/ProgramDashboard/Progress Tracker - Enrolled not earned" DataColumnName="CertificationProgramKey" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
<div class="ClearFix visible-sm"></div>
        <div class="col-md-3 col-sm-6">
			<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciGraceperiod" runat="server" ContentKey="ed7573c2-1f7e-4e14-a137-110f35a18170" ContentItemKey="f3700c9a-100a-45c6-9a80-de1747243c5a" Title="Grace period" ShowTitleFlag="False" PartTitle="Grace period" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor4" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="iUniformKey" ListSourceQuery="$/CertificationManagement/DefaultSystem/Queries/ProgramDashboard/Progress Tracker - Grace period" DataColumnName="CertificationProgramKey" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-md-3 col-sm-6">
			<CM:ContentPage ID="ContentPage5" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone5_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ProgressTracker ID="ciExpired" runat="server" ContentKey="ed7573c2-1f7e-4e14-a137-110f35a18170" ContentItemKey="878c148a-8c1e-4c30-9aa3-9f8752c0f1ff" Title="Expired" ShowTitleFlag="False" PartTitle="Expired" DoNotRenderInDesignMode="False" CssClass="ProgressTracker_Dashboard_Overview AltBgColor5" ShowBorder="True" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" ProgressDescription="" QueryStringParameterName="iUniformKey" ListSourceQuery="$/CertificationManagement/DefaultSystem/Queries/ProgramDashboard/Progress Tracker - Expired" DataColumnName="CertificationProgramKey" DisplayGoalPercent="False" GoalPercentDescription="" DisplayGoalCountTotal="True" GoalCountTotalDescription="" DisplayGoalDaysRemaining="False" GoalDaysRemainingDescription="" ProgressBarLocation="" SuccessfulMessage="" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
</div>
<div class="row">
    <div class="col-sm-9">
			<CM:ContentPage ID="ContentPage6" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone6_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-3">
			<CM:ContentPage ID="ContentPage7" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone7_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
<div class="row">
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage8" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone8_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage9" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone9_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
			<CM:ContentPage ID="ContentPage10" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone10_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciRegisterButton_38406b841df44a9e901c1ab0c29ba686" runat="server" ContentKey="ed7573c2-1f7e-4e14-a137-110f35a18170" ContentItemKey="38406b84-1df4-4a9e-901c-1ab0c29ba686" Title="Register Button" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_RegisterButton" runat="server"><a href="#" class="TextButton" id="programEnrollmentsEnrollContactLink">Enroll a Contact</a>
<script type="text/javascript">
 
    (function () {
        var o = document.getElementById("__ClientContext");
        if (o) {
            try {
                var j = JSON.parse(o.value);
                if (j && j.hasOwnProperty('websiteRoot') && j.websiteRoot && j.websiteRoot.length > 0) {
                    var key = FindURLParameter("iUniformKey") || "";
                    jQuery("#programEnrollmentsEnrollContactLink").attr('href', j.websiteRoot + "iMIS/CertificationManagement/RegisterToCertificationProgram.aspx?CertificationProgramKey=" + key);
                }
            } catch (e) { }
        }
    })();
 
</script></asp:Panel></CM:ContentHtml>
				<CM:QueryMenu ID="ciEnrollees" runat="server" ContentKey="ed7573c2-1f7e-4e14-a137-110f35a18170" ContentItemKey="358ef70f-e0e4-421c-b53a-737ef6f0b80a" Title="Enrollees" ShowTitleFlag="False" PartTitle="" DoNotRenderInDesignMode="False" CssClass="" ShowBorder="False" Collapsible="False" Collapsed="False" DisplayOnExtraSmallScreens="True" DisplayOnSmallScreens="True" DisplayOnMediumScreens="True" DisplayOnLargeScreens="True" ModuleSpecificSetting="" LicenseKeyRestriction="" EnableExport="True" MapResults="False" ListPageSize="20" PagerMode="NextPrevAndNumeric" MenuCaptionText="Select a query" UsePopup="False" DisplayForAuthorizedUsersOnly="False" SourceFolderPathControl="$/CertificationManagement/DefaultSystem/Queries/RegistrantSearch/WithinProgram" SourceKey="8497dff7-bc57-4ef4-91b9-593bfec32919" ReloadRefresh="False" EnableEmailMerge="False" AutoRun="False" />
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