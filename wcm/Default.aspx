<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Home" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("414538e9-7ead-4349-84d3-d6c9717e1bf7"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("7f4b144a-bef8-4991-b17d-ffdf6f1eb8a7"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciNewContentHtml2_e986abf319a0483789063b278055c6d9 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e986abf3-19a0-4837-8906-3b278055c6d9");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml2_e986abf319a0483789063b278055c6d9);

		AddChildUserControl(ContentPage2);

		childUserControl = ciNewContentHtml3_fc4a452b60d14702b725d1b0f27197c2 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("fc4a452b-60d1-4702-b725-d1b0f27197c2");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml3_fc4a452b60d14702b725d1b0f27197c2);

		AddChildUserControl(ContentPage3);

		childUserControl = ciNewContentHtml4_1ca9cb5724224ce2b7ce96b5058a7c28 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("1ca9cb57-2422-4ce2-b7ce-96b5058a7c28");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml4_1ca9cb5724224ce2b7ce96b5058a7c28);

		AddChildUserControl(ContentPage4);

		childUserControl = ciNewContentHtml5_9daa08379e5f43b49d76e3e8c20ff96d as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9daa0837-9e5f-43b4-9d76-e3e8c20ff96d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml5_9daa08379e5f43b49d76e3e8c20ff96d);

		AddChildUserControl(ContentPage5);

		childUserControl = ciNewContentHtml6_52c03c5393624dbb914e52c429cfc79e as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("52c03c53-9362-4dbb-914e-52c429cfc79e");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml6_52c03c5393624dbb914e52c429cfc79e);

		AddChildUserControl(ContentPage6);

		childUserControl = ciNewContentHtml7_30bd98c818be4d3fac955e65fbc51ad3 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("30bd98c8-18be-4d3f-ac95-5e65fbc51ad3");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml7_30bd98c818be4d3fac955e65fbc51ad3);

		AddChildUserControl(ContentPage7);

		childUserControl = ciNewContentHtml8_5531a9617e604ca0a354977ae4f6c297 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("5531a961-7e60-4ca0-a354-977ae4f6c297");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml8_5531a9617e604ca0a354977ae4f6c297);

		AddChildUserControl(ContentPage8);

		childUserControl = ciNewContentHtml9_3335eb78346242ba99a5a7c73d69316a as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("3335eb78-3462-42ba-99a5-a7c73d69316a");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciNewContentHtml9_3335eb78346242ba99a5a7c73d69316a);

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
        <div class="col-sm-6 col-md-3">
			<CM:ContentPage ID="ContentPage1" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone1_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciNewContentHtml2_e986abf319a0483789063b278055c6d9" runat="server" ContentKey="414538e9-7ead-4349-84d3-d6c9717e1bf7" ContentItemKey="e986abf3-19a0-4837-8906-3b278055c6d9" Title="New ContentHtml_2" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml2" runat="server"><img alt="" src="/images/Stock%20Photos/01-cat-wants-to-tell-you-laptop.jpg" />
<div class="boxes">
<h1>Cats sitting on keyboards</h1>
<h2>Cats will be cats</h2>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-sm-6 col-md-3">
			<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciNewContentHtml3_fc4a452b60d14702b725d1b0f27197c2" runat="server" ContentKey="414538e9-7ead-4349-84d3-d6c9717e1bf7" ContentItemKey="fc4a452b-60d1-4702-b725-d1b0f27197c2" Title="New ContentHtml_3" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml3" runat="server"><img alt="" src="/images/Stock%20Photos/15-cat-wants-to-tell-you-attention.jpg" />
<div class="boxes">
<h1>Cats rolling over</h1>
<h2>Lazy cats</h2>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-sm-6 col-md-3">
			<CM:ContentPage ID="ContentPage3" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone3_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciNewContentHtml4_1ca9cb5724224ce2b7ce96b5058a7c28" runat="server" ContentKey="414538e9-7ead-4349-84d3-d6c9717e1bf7" ContentItemKey="1ca9cb57-2422-4ce2-b7ce-96b5058a7c28" Title="New ContentHtml_4" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml4" runat="server"><img alt="" src="/images/Stock%20Photos/101438745-cat-conjunctivitis-causes.jpg" />
<div class="boxes">
<h1>Crazy Cats</h1>
<h2>With their crazy eyes</h2>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-sm-6 col-md-3">
			<CM:ContentPage ID="ContentPage4" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone4_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciNewContentHtml5_9daa08379e5f43b49d76e3e8c20ff96d" runat="server" ContentKey="414538e9-7ead-4349-84d3-d6c9717e1bf7" ContentItemKey="9daa0837-9e5f-43b4-9d76-e3e8c20ff96d" Title="New ContentHtml_5" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml5" runat="server"><img alt="" src="/images/Stock%20Photos/Cats101-Top30CatBreeds.jpg" />
<div class="boxes">
<h1>Angry Cats</h1>
<h2>This cat has had enough</h2>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
</div>
    <div class="row">
        <div class="col-sm-4">
			<CM:ContentPage ID="ContentPage5" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone5_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciNewContentHtml6_52c03c5393624dbb914e52c429cfc79e" runat="server" ContentKey="414538e9-7ead-4349-84d3-d6c9717e1bf7" ContentItemKey="52c03c53-9362-4dbb-914e-52c429cfc79e" Title="New ContentHtml_6" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml6" runat="server"><div style="background-image:url(/images/Stock%20Photos/left%20pug.jpg);height:200px;" class="boxes boxes-background">
<h1>Pupper</h1>
<h2>These ones show images that scale a different way</h2>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-sm-4">
			<CM:ContentPage ID="ContentPage6" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone6_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciNewContentHtml7_30bd98c818be4d3fac955e65fbc51ad3" runat="server" ContentKey="414538e9-7ead-4349-84d3-d6c9717e1bf7" ContentItemKey="30bd98c8-18be-4d3f-ac95-5e65fbc51ad3" Title="New ContentHtml_7" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml7" runat="server"><div class="boxes boxes-background" style="background-image:url(/images/Stock%20Photos/Pup1.jpg);height:200px;">
<h1>Doggo</h1>
<h2>These ones show images that scale a different way</h2>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
        <div class="col-sm-4">
			<CM:ContentPage ID="ContentPage7" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone7_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciNewContentHtml8_5531a9617e604ca0a354977ae4f6c297" runat="server" ContentKey="414538e9-7ead-4349-84d3-d6c9717e1bf7" ContentItemKey="5531a961-7e60-4ca0-a354-977ae4f6c297" Title="New ContentHtml_8" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml8" runat="server"><div style="background-image:url(/images/Stock%20Photos/rightpug.jpg);height:200px;" class="boxes boxes-background">
<h1>Pupper</h1>
<h2>If there's a lot more text, it gets bigger and shows more of the text. If not, it's smaller.</h2>
</div></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>
        </div>
    </div>
<div class="row">
    <div class="col-sm-12">
			<CM:ContentPage ID="ContentPage8" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone8_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciNewContentHtml9_3335eb78346242ba99a5a7c73d69316a" runat="server" ContentKey="414538e9-7ead-4349-84d3-d6c9717e1bf7" ContentItemKey="3335eb78-3462-42ba-99a5-a7c73d69316a" Title="New ContentHtml_9" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_NewContentHtml9" runat="server"><div style="background-color:#36424a;height:200px;">&nbsp;</div></asp:Panel></CM:ContentHtml>
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