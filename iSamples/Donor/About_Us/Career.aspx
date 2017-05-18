<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Careers" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("7c79388e-f759-4c66-a2d3-6fd41a884476"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("dde2f0f6-204a-41d0-9844-eddfca21e9c8"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciCareers_9ad512c6d035477c82211359b459cb66 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("9ad512c6-d035-477c-8221-1359b459cb66");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCareers_9ad512c6d035477c82211359b459cb66);

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
				<CM:ContentHtml ID="ciCareers_9ad512c6d035477c82211359b459cb66" runat="server" ContentKey="7c79388e-f759-4c66-a2d3-6fd41a884476" ContentItemKey="9ad512c6-d035-477c-8221-1359b459cb66" Title="Careers" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Careers" runat="server"><h1>Careers at iMIS Foundation</h1>
<p>Are you interested in a rewarding career while making a difference in the world? Whether you are beginning your career or you are a seasoned professional, you can find a meaningful career here. We would be honored to have you join our team!</p>
<p>Please contact hr@imisdemo.com with the title of the desired position in the Subject line and your resume attached.</p>
<h2>Current positions</h2>
<ul>
    <li>Director of Business Development:  Creates the vision and strategies to expand the foundation's corporate involvement and sponsorship. Works closely with the Director of Programs and the Director of Marketing to realize the foundation's goals.</li>
    <li>Volunteer Coordinator: Builds effective teams to support our initiatives. Collects and maintains information on needs and volunteer skills and availability.</li>
    <li>Administrative Assistant: Creates and maintains documents for reviews, reports, meeting agendas, and event operations. Contributes to special projects.</li>
</ul>
<h2>Internships</h2>
<p>Gain experience for your career while supporting our efforts!</p>
<ul>
    <li>Digital Communications Intern: Produces videos, website pages, and social network communications to support our outreach initiatives.</li>
    <li>Biologist Intern: Works with our team biologists to research and implement restored habitats.</li>
    <li>Event Operations Intern: Support the Event Coordinator at all our fundraising events. Nighttime and weekend hours required.</li>
</ul></asp:Panel></CM:ContentHtml>
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