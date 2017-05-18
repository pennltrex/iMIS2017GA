<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Speakers" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("24d59784-5921-4668-96ed-db096b223012"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("81f19836-ac58-44a8-ba9b-46e7970c5303"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciSpeakers_7f0d4c66337042c8892a2648e437ee4d as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("7f0d4c66-3370-42c8-892a-2648e437ee4d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSpeakers_7f0d4c66337042c8892a2648e437ee4d);

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
				<CM:ContentHtml ID="ciSpeakers_7f0d4c66337042c8892a2648e437ee4d" runat="server" ContentKey="24d59784-5921-4668-96ed-db096b223012" ContentItemKey="7f0d4c66-3370-42c8-892a-2648e437ee4d" Title="Speakers" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Speakers" runat="server"><h2>Our Speaker Lineup</h2>
<br />
We are very excited that we have been able to engage the services of some of the best international and local speakers to motivate, educate and entertain for our general sessions and optional workshops. <br />
Our speaker's include:<br />
<img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/UploadedImages/MichaelDenham.jpg" style="width: 166px; height: 201px;" /><br />
<strong>Michael Denham</strong> is an author, journalist, marketing consultant, and frequent speaker about social media marketing.
<br />
Topic: <em>Cultivating Visibility: How to amplify the human digital channel
</em> 	<br />
<img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/UploadedImages/JadeBarston.jpg" style="width: 213px; height: 324px;" /><br />
<strong>
Jade Barston</strong> is an online marketing strategist and author of several books on marketing, most notably <em>The New Rules of Marketing and PR</em>. His books have sold over
250,000 copies in more than 25 languages.
<br />
Topic: <em>The New Rules of Marketing and PR: Thought leadership Through Web Content</em>.
 	<br />
<br />
<img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/UploadedImages/LeeBonner.jpg" style="width: 247px; height: 246px;" /><br />
<strong>Leland Bonner</strong> is a business consultant, author, and lecturer on the subject of company sustainability and growth.
<br />
Topic: <em>Great by Choice: Why do some companies thrive in uncertainty and others do not?
</em> 	<br />
<br />
<img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/UploadedImages/AnneMonroe.jpg" style="width: 166px; height: 201px;" /><br />
A recognized expert in the fields of trust, influence and persuasion,<strong> Anne Young Monroe</strong> gives people the skills and the self-confidence that lead to outstanding
performance. Based on thorough behavioral science research, Anne's presentations contain useful tools and techniques she originally developed for
Harvard and MIT.
<br />
Topic: <em>Increasing Innovation: Getting people into the innovation mindset</em></asp:Panel></CM:ContentHtml>
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