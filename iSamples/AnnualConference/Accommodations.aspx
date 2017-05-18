<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Accommodations" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("cf55cfbd-1f05-4657-8e0e-5e27dd6c07be"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("17801c35-a462-4d43-a958-9722f5580fd2"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciAccomodations_af8912c6f611420eb36ef43d66342743 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("af8912c6-f611-420e-b36e-f43d66342743");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciAccomodations_af8912c6f611420eb36ef43d66342743);

		AddChildUserControl(ContentPage2);

		childUserControl = ciRoomoptions_82fd57db033141d8b1f550c554e443f9 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("82fd57db-0331-41d8-b1f5-50c554e443f9");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciRoomoptions_82fd57db033141d8b1f550c554e443f9);

		childUserControl = ciBookingOptions_e41d84d188c94f41a1dfcdd9a886beee as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("e41d84d1-88c9-4f41-a1df-cdd9a886beee");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciBookingOptions_e41d84d188c94f41a1dfcdd9a886beee);

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
				<CM:ContentHtml ID="ciAccomodations_af8912c6f611420eb36ef43d66342743" runat="server" ContentKey="cf55cfbd-1f05-4657-8e0e-5e27dd6c07be" ContentItemKey="af8912c6-f611-420e-b36e-f43d66342743" Title="Accomodations" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Accomodations" runat="server"><h2>As you requested...</h2>
<br />
Feedback from last year confirmed that conference attendees want to stay at the conference site. Because you let us know, we have negotiated special conference attendee packages with the Reef Hotel Cairns. Not only will you enjoy great discount rates, but we've negotiated a 60% reduced rate if you wish to stay for additional nights! <br />
<br />
<img alt="" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/UploadedImages/CairnsHotel.png" style="width: 164px; height: 134px;" /><br /></asp:Panel></CM:ContentHtml>
					</ZoneTemplate>
				</asp:WebPartZone>
			</CM:ContentPage>

		</div>
		<div class="col-sm-6">
						<CM:ContentPage ID="ContentPage2" runat="server" PageNumber="1">
				<asp:WebPartZone ID="WebPartZone2_Page1" runat="server" PartChromeType="None" WebPartVerbRenderMode="TitleBar" CssClass="WebPartZone ">
					<ZoneTemplate>
				<CM:ContentHtml ID="ciRoomoptions_82fd57db033141d8b1f550c554e443f9" runat="server" ContentKey="cf55cfbd-1f05-4657-8e0e-5e27dd6c07be" ContentItemKey="82fd57db-0331-41d8-b1f5-50c554e443f9" Title="Room options" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_Roomoptions" runat="server"><h3>Room options</h3>
<p>We have reserved special rates on two room types for our conference attendees.</p>
<div class="row">
<div class="col-md-6">
<h5>Executive Suite</h5>
<ul>
    <li>Sitting area with sofa and 2 chairs</li>
    <li>2 large HD televisions</li>
    <li>Kitchenette with appliances</li>
    <li>Luxury bedding</li>
    <li>Free Internet access</li>
</ul>
</div>
<div class="col-md-6">
<h5>Deluxe Standard</h5>
<ul>
    <li>1 king bed or 2 double beds</li>
    <li>1 large HD television</li>
    <li>Minibar</li>
    <li>Luxury bedding</li>
    <li>Reduced rate for Internet access</li>
</ul>
</div>
</div></asp:Panel></CM:ContentHtml>
				<CM:ContentHtml ID="ciBookingOptions_e41d84d188c94f41a1dfcdd9a886beee" runat="server" ContentKey="cf55cfbd-1f05-4657-8e0e-5e27dd6c07be" ContentItemKey="e41d84d1-88c9-4f41-a1df-cdd9a886beee" Title="Booking Options" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_BookingOptions" runat="server"><h3>Reserve your room now!</h3>
Reserve your room on <span style="text-decoration: underline;">www.imisdemo.com</span> and enter the ANNCONF code at checkout to get the negotiated rates. We have reserved the entire hotel for attendees, but must begin to release blocks of rooms 90 days before the start of the conference. Reserve your room as soon as possible..</asp:Panel></CM:ContentHtml>
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