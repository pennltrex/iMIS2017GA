<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Early Career" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentTaggedList" Src="~/AsiCommon/Controls/ContentManagement/DisplayTaggedList.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("4463dcf2-a446-42d6-ac39-819a2e3b9a2c"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("15dfb424-c3f5-4079-9cee-ecb031a74ae5"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewContentHtml_4747e78c9db14a388bd6377790a750ce as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("4747e78c-9db1-4a38-8bd6-377790a750ce");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml_4747e78c9db14a388bd6377790a750ce);

		AddChildUserControl(ContentPage2);

		childUserControl = ciNewContentHtml2_2aec3327e298498ea104838260f2c5b1 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("2aec3327-e298-498e-a104-838260f2c5b1");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml2_2aec3327e298498ea104838260f2c5b1);

		AddChildUserControl(ContentPage3);

		childUserControl = ciNewContentHtml3_e35547c3669140b3a1319fd8ddec5e2e as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e35547c3-6691-40b3-a131-9fd8ddec5e2e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml3_e35547c3669140b3a1319fd8ddec5e2e);

		AddChildUserControl(ContentPage4);

		childUserControl = ciNewContentHtml4_2db502ada5bc4f0cb495f0b271c55fbb as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("2db502ad-a5bc-4f0c-b495-f0b271c55fbb");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml4_2db502ada5bc4f0cb495f0b271c55fbb);

		AddChildUserControl(ContentPage5);

		childUserControl = ciNewContentHtml5_0d69553761914df996945a9228e28e8f as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("0d695537-6191-4df9-9694-5a9228e28e8f");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml5_0d69553761914df996945a9228e28e8f);

		childUserControl = ciNewContentTaggedList as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("7da716a1-a058-43d3-b0d7-f7a7f02b5295");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentTaggedList);

		AddChildUserControl(ContentPage6);

		childUserControl = ciNewContentHtml6_54f44c37a7bd418b83a4094265d29342 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("54f44c37-a7bd-418b-83a4-094265d29342");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml6_54f44c37a7bd418b83a4094265d29342);

		childUserControl = ciNewContentTaggedList1 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("7e092b9e-6af5-42f5-a12c-1721f11da73d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentTaggedList1);

		AddChildUserControl(ContentPage7);

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
				<CM:ContentHtml ID="ciNewContentHtml_4747e78c9db14a388bd6377790a750ce" runat="server" ContentKey="4463dcf2-a446-42d6-ac39-819a2e3b9a2c" ContentItemKey="4747e78c-9db1-4a38-8bd6-377790a750ce" Title="New ContentHtml" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml" runat="server"><h1 class="dark-blue">Early Career Sections</h1></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
    <div class="row">
        <div class="col-md-4">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciNewContentHtml2_2aec3327e298498ea104838260f2c5b1" runat="server" ContentKey="4463dcf2-a446-42d6-ac39-819a2e3b9a2c" ContentItemKey="2aec3327-e298-498e-a104-838260f2c5b1" Title="New ContentHtml_2" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml2" runat="server"><div class="boxes"><img alt="" src="/images/Stock%20Photos/ostrich.jpg" />
<h1>Young Career Section</h1>
<h2>For physician members of the WSMA who are either under 40 years of age or within the first ten years of professional practice</h2>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-md-4">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciNewContentHtml3_e35547c3669140b3a1319fd8ddec5e2e" runat="server" ContentKey="4463dcf2-a446-42d6-ac39-819a2e3b9a2c" ContentItemKey="e35547c3-6691-40b3-a131-9fd8ddec5e2e" Title="New ContentHtml_3" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml3" runat="server"><div class="boxes"><img alt="" src="/images/Stock%20Photos/kiwi.jpeg" />
<h1>Residents and Fellows</h1>
<h2>offers tools, networking opportunities and professional development resources to help you grow as a physician and navigate the changing landscape of health care.</h2>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-md-4">
			<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciNewContentHtml4_2db502ada5bc4f0cb495f0b271c55fbb" runat="server" ContentKey="4463dcf2-a446-42d6-ac39-819a2e3b9a2c" ContentItemKey="2db502ad-a5bc-4f0c-b495-f0b271c55fbb" Title="New ContentHtml_4" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml4" runat="server"><div class="boxes"><img alt="" src="/images/Stock%20Photos/parrot.jpg" />
<h1>About our Medical Student Section</h1>
<h2>The purpose of the Medical Student Section is to introduce these future physicians to the programs, benefits, services and policy-making structure of the WSMA and to help provide programs and services that will assist students as they prepare for a career in medicine.</h2>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
    </div>
<div class="row">
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage5" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone5_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciNewContentHtml5_0d69553761914df996945a9228e28e8f" runat="server" ContentKey="4463dcf2-a446-42d6-ac39-819a2e3b9a2c" ContentItemKey="0d695537-6191-4df9-9694-5a9228e28e8f" Title="New ContentHtml_5" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml5" runat="server"><div class="boxes">
<h1>Early Career News</h1>
</div></asp:Panel></CM:ContentHtml>
				<CM:ContentTaggedList ID="ciNewContentTaggedList" runat="server" ContentKey="4463dcf2-a446-42d6-ac39-819a2e3b9a2c" ContentItemKey="7da716a1-a058-43d3-b0d7-f7a7f02b5295" Title="New ContentTaggedList" ShowTitleFlag="False" ListFormatKey="b0261208-6b29-4334-acf4-9a76a48b0e88" ShowTitleNoContentFlag="False" ListTitle="" FilterByPropertyName="" DateRangeType="REL" RelNumDaysBefore="0" RelNumDaysAfter="0" FixedStartDate="1/1/0001 12:00:00 AM" FixedEndDate="1/1/0001 12:00:00 AM" SortByPropertyName="" MaxNumResults="5" ViewAllMessage="View all" ViewAllCssClass="" IncludeSocialSharingIcons="False" TagMatchType="ANY" SortType="ASC" SelectedTags="ec401384-08e9-4c44-8f63-5041282c288e" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
    <div class="col-sm-6">
			<CM:ContentPage ID="ContentPage6" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone6_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciNewContentHtml6_54f44c37a7bd418b83a4094265d29342" runat="server" ContentKey="4463dcf2-a446-42d6-ac39-819a2e3b9a2c" ContentItemKey="54f44c37-a7bd-418b-83a4-094265d29342" Title="New ContentHtml_6" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml6" runat="server"><div class="boxes">
<h1>Upcoming Events</h1>
</div></asp:Panel></CM:ContentHtml>
				<CM:ContentTaggedList ID="ciNewContentTaggedList1" runat="server" ContentKey="4463dcf2-a446-42d6-ac39-819a2e3b9a2c" ContentItemKey="7e092b9e-6af5-42f5-a12c-1721f11da73d" Title="New ContentTaggedList_1" ShowTitleFlag="False" ListFormatKey="455a50b3-2cb5-4db6-8eb0-b484cb72647b" ShowTitleNoContentFlag="False" ListTitle="" FilterByPropertyName="" DateRangeType="REL" RelNumDaysBefore="0" RelNumDaysAfter="0" FixedStartDate="1/1/0001 12:00:00 AM" FixedEndDate="1/1/0001 12:00:00 AM" SortByPropertyName="" MaxNumResults="5" ViewAllMessage="View all" ViewAllCssClass="" IncludeSocialSharingIcons="False" TagMatchType="ANY" SortType="ASC" SelectedTags="2d95a695-8178-4d46-9955-c22cded4e43d,646b1f7e-8dcb-47c8-989e-5494cc0750f8,9d6c1f4c-598b-42e0-8ab4-0b0517966677" />
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
    </div>
</div>
<div class="row">
    <div class="col-sm-12">
			<CM:ContentPage ID="ContentPage7" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone7_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
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