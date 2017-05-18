<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Don’t get Caught off guard by new Regulations" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("06d49b37-c0e1-42ef-9d53-1cc5ab008aec"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("031fdb68-7a6e-4925-a7d3-1f02ea55ba33"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciDontgetCaughtoffguardbynewRegulations_aa1bb777cbde4e74835fa1f63496a831 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("aa1bb777-cbde-4e74-835f-a1f63496a831");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciDontgetCaughtoffguardbynewRegulations_aa1bb777cbde4e74835fa1f63496a831);

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
				<CM:ContentHtml ID="ciDontgetCaughtoffguardbynewRegulations_aa1bb777cbde4e74835fa1f63496a831" runat="server" ContentKey="06d49b37-c0e1-42ef-9d53-1cc5ab008aec" ContentItemKey="aa1bb777-cbde-4e74-835f-a1f63496a831" Title="Don’t get Caught off guard by new Regulations" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_DontgetCaughtoffguardbynewRegulations" runat="server"><h2>Don’t get Caught off guard by new Regulations</h2>
<br />
The new regulations for our industry go into effect in six months and will impact how you conduct business. To make sure that you, as a member, are aware of their implications we have created a series of webinars to explain the new regulations and how to prepare for them. You cannot afford to miss this information as non-compliance with these regulations will prove costly.<br />
<br />
This new webinar series is a simple, quick, and effective way to ensure your compliance with the regulations.  They are designed to get straight to the point and walk you through the steps you must take to prepare, eliminating the need for you to wade through the regulations themselves.  <br />
<br />
The series of webinars include these short 15 minute topics:<br />
<ul>
    <li>Understanding the new Regulations</li>
    <li>Enacting Procedures to Comply</li>
    <li>Compliance Resources</li>
    <li>Providing Proof of Compliance</li>
</ul>
These webinars are provided as a service to our members and are available in our Regulation Forum.<br />
<div><br />
</div></asp:Panel></CM:ContentHtml>
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