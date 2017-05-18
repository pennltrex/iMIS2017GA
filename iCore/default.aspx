<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Desktop Home" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="QueryChartViewer" Src="~/iParts/Common/QueryChartViewer/QueryChartViewerDisplay.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("62c6bf9a-2b20-43aa-a41c-e1f6fcf1fe9b"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("f84c7298-51b5-4a7e-bfe5-641f719407bb"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciMembersByRegion as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("4ea6af8c-3fe0-441f-ac9f-4bab0a3c82b2");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciMembersByRegion);

		AddChildUserControl(ContentPage2);

		childUserControl = ciContactsByType as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("0bf4fba0-ca29-41ed-b162-de7926ece390");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciContactsByType);

		AddChildUserControl(ContentPage3);

		childUserControl = ciSupport_00f9768574c74265829fa6bd4765c858 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("00f97685-74c7-4265-829f-a6bd4765c858");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSupport_00f9768574c74265829fa6bd4765c858);

		AddChildUserControl(ContentPage4);

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
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage1" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone1_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:QueryChartViewer ID="ciMembersByRegion" runat="server" ContentKey="62c6bf9a-2b20-43aa-a41c-e1f6fcf1fe9b" ContentItemKey="4ea6af8c-3fe0-441f-ac9f-4bab0a3c82b2" Title="Members By Region" ShowTitleFlag="False" PageTitle="" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Samples/StaffHome/Members by Region" ChartTitle="Members By Region" ChartType="pie" QuerySettings="" DataColumnName="Members" LabelColumnName="Region" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="Hay" ChartWidth="400" ChartHeight="350" ChartLabelRotationAngle="30" NoDataMessage="" HideEmptyChart="False" DisplayChartLabels="True" ChartSeriesLegendPosition="bottom" EnableTooltips="True" SeriesColumnName="" SeriesColumnFormat="" EnableStackedSeries="False" DisplayForAuthorizedUsersOnly="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:QueryChartViewer ID="ciContactsByType" runat="server" ContentKey="62c6bf9a-2b20-43aa-a41c-e1f6fcf1fe9b" ContentItemKey="0bf4fba0-ca29-41ed-b162-de7926ece390" Title="ContactsByType" ShowTitleFlag="False" PageTitle="" DoNotRenderInDesignMode="False" ShowBorder="False" ChartSeriesLabel="" ChartSourceQuery="$/Samples/StaffHome/Active DB Records by Type" ChartTitle="Current Active Contacts" ChartType="barvertical" QuerySettings="" DataColumnName="Records" LabelColumnName="Customer Type" DataColumnFormat="8	###,###" LabelColumnFormat="0	" SkinName="LightBrown" ChartWidth="400" ChartHeight="350" ChartLabelRotationAngle="90" NoDataMessage="" HideEmptyChart="False" DisplayChartLabels="True" ChartSeriesLegendPosition="hidden" EnableTooltips="True" SeriesColumnName="" SeriesColumnFormat="" EnableStackedSeries="False" DisplayForAuthorizedUsersOnly="False" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
<div class="row">
    <div class="col-sm-8">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciSupport_00f9768574c74265829fa6bd4765c858" runat="server" ContentKey="62c6bf9a-2b20-43aa-a41c-e1f6fcf1fe9b" ContentItemKey="00f97685-74c7-4265-829f-a6bd4765c858" Title="Support" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Support" runat="server"><div class="StandardPanel">
<div class="PanelHead Distinguish"><span class="PanelTitle">Support</span></div>
<div class="PanelBody">
<h3><a href="http://www.advsol.com/techsupport" target="_new">Technical Support</a></h3>
Contact our award-winning Technical Support Team for help with <span class="iMIS">iMIS</span> products.
<h3><a href="http://help.imis.com/Classic/" target="_new">Documentation</a></h3>
The <span class="iMIS">iMIS</span> Help Site contains the latest <span class="iMIS">iMIS</span> documentation.
<h3><a href="http://www.niug.org" target="_new">N<span class="iMIS">i</span>UG International</a></h3>
N<span class="iMIS">i</span>UG International is the largest volunteer-run <span class="iMIS">iMIS</span> users group. Join today and get the benefits of a network support group.
<h3><a href="http://www.imiscommunity.com" target="_new"><span class="iMIS">iMIS</span> Community</a></h3>
Join <span class="iMIS">iMIS</span> Community for forums, blogs, additional documentation and support from customers, partners and ASI employees.
<h3><a href="http://www.advsol.com/training" target="_new">Training</a></h3>
Training is available for new and experienced users. Register for a course today and find out how <span class="iMIS">iMIS</span> can help you achieve great things.
</div>
</div></asp:Panel></CM:ContentHtml>
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

	</div>
	
<CM:ContentPageFooter ID="ContentPageFooter1" runat="server" NumberOfPages="1" />

    <asiweb:AsiWebPartEditorZone ID="EditorZone1" runat="server">
        <ZoneTemplate>
            <asp:PropertyGridEditorPart ID="PropertyGridEditor" runat="server" />
        </ZoneTemplate>
    </asiweb:AsiWebPartEditorZone>
    <asiweb:AsiWebPartConnectionsZone ID="ConnectionZone1" runat="server" CloseVerb-Visible="false" />
</asp:Content>