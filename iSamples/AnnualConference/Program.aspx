<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Program" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("8c1e4335-4536-4341-88c9-2d3ab2dd63df"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("3252109d-04bd-4439-9ec8-42c1db31dd8f"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciProgram_86d2584910f04fc099951d8056fd4c9c as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("86d25849-10f0-4fc0-9995-1d8056fd4c9c");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciProgram_86d2584910f04fc099951d8056fd4c9c);

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
				<CM:ContentHtml ID="ciProgram_86d2584910f04fc099951d8056fd4c9c" runat="server" ContentKey="8c1e4335-4536-4341-88c9-2d3ab2dd63df" ContentItemKey="86d25849-10f0-4fc0-9995-1d8056fd4c9c" Title="Program" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Program" runat="server"><strong>
<h2>Conference Program</h2>
</strong>
<p style="margin: 0in 0in 10pt; line-height: 16.6pt;"><span style="color: black; font-family: Arial,sans-serif; font-size: 10pt;">This year's program has been put together by the Education & Conference Committees to provide a quality framework to help you and your organisation become great. Each technical session will earn attendees CPD Points related to the session topic, with a maximum of 24.0 CPD points available. The points will be awarded automatically when you scan your conference ticket on leaving each session. </span></p>
<span style="font-family: Arial,sans-serif;">For details on Program Sessions, see </span><a href="<%= ((Asi.Web.UI.DisplayPageBase)Page).iMISWebsite.WebsiteBaseUrl + "/" %>iSamples/AnnualConference/Registration.aspx" style="font-family: Arial,sans-serif;">Registration</a><span style="font-family: Arial,sans-serif;">.<br />
</span><br />
<h2>Networking Opportunities</h2>
<span style="color: #000000; line-height: normal; font-family: Arial,sans-serif;">
<h3 style="font-size: 20px;">Chairman's Breakfast – Wednesday</h3>
</span>
<strong>
<span class="Apple-tab-span" style="font-family: Arial,sans-serif; white-space: pre;"> <img alt="" style="width: 120px; height: 140px;" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/Events/CairnsSailboat.png" />	</span></strong><em style="line-height: 16.6pt;"><span style="color: black; font-family: Arial,sans-serif; font-size: 10pt;"><br />
9:00 AM to 10:30 AM<br />
Flinder's Grill</span></em><em style="line-height: 16.6pt;"><span style="color: black; font-family: Arial,sans-serif; font-size: 10pt;">, Reef Hotel</span></em><em style="line-height: 16.6pt;"><span style="color: black; font-family: Arial,sans-serif; font-size: 10pt;"><br />
</span></em>
<span style="color: #000000; line-height: normal; font-family: Arial,sans-serif;">
<h3 style="font-size: 20px;">Hospitality Suite – Thursday</h3>
</span>
<p><img alt="" style="width: 113px; height: 75px;" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/UploadedImages/groupatconferencesmaller.jpg" /><em style="line-height: 16.6pt;"><em style="line-height: 16.6pt;"><span class="Apple-tab-span" style="font-family: Arial,sans-serif; white-space: pre;"> <br />
</span></em></em></p>
<p><em style="line-height: 16.6pt;"><em style="line-height: 16.6pt;"><span class="Apple-tab-span" style="font-family: Arial,sans-serif; white-space: pre;">6:00 PM to 8:00 PM</span><br />
</em></em><em style="line-height: 16.6pt;"><em style="line-height: 16.6pt;"></em></em></p>
<em>Main Bar</em><em style="line-height: 16.6pt;"><em style="line-height: 16.6pt;">
</em></em>
<p style="margin: 0in 0in 10pt; line-height: 16.6pt;"><span style="color: black; font-family: Arial,sans-serif; font-size: 10pt;">(Sponsored by Versaton)</span></p>
<span style="color: #000000; line-height: normal; font-family: Arial,sans-serif;">
<h3 style="font-size: 20px;">Gala Celebration – Friday</h3>
</span>
<em style="line-height: 16.6pt;"><span style="color: black; font-family: Arial,sans-serif; font-size: 10pt;"><img alt="" style="width: 125px;" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/UploadedImages/threemusicians.jpg" />  <br />
7:30 PM to Midnight <br />
Grand Ballroom<br />
Proceeds go to Foodbank Queensland<br />
</span></em>
<span style="color: #000000; line-height: normal; font-family: Arial,sans-serif;">
<h3 style="font-size: 20px;">Golf Tournament – Friday</h3>
</span>
<p><img alt="" style="width: 131px; height: 85px;" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/UploadedImages/aussiegolf.jpg" /><span class="Apple-tab-span" style="white-space: pre;"> 	</span><br />
<em style="line-height: 16.6pt;"><span style="color: #000000; font-family: Arial,sans-serif; font-size: 10pt;">2:00 PM to 5:00 PM</span></em></p>
<p style="margin: 0in 0in 10pt; line-height: 16.6pt;"><em>
Half Moon Bay Golf Club<em style="line-height: 16.6pt;"><span style="color: black; font-family: Arial,sans-serif; font-size: 10pt;"><br />
Proceeds go to the Wildlife Conservancy of Queensland</span></em> <br />
</em><span style="color: black; line-height: 16.6pt; font-family: Arial,sans-serif; font-size: 10pt;">(Bag and clubs rental available)</span></p></asp:Panel></CM:ContentHtml>
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