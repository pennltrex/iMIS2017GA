<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="Finances" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("eacd7c48-9318-418c-91a1-3e8ae40278f8"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("a9f61ffb-d6c5-44d7-9cfe-fc6ed5efbfae"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciOurFinances_47530e5d6b10423cb1ef4cfb48c4129b as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("47530e5d-6b10-423c-b1ef-4cfb48c4129b");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciOurFinances_47530e5d6b10423cb1ef4cfb48c4129b);

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
				<CM:ContentHtml ID="ciOurFinances_47530e5d6b10423cb1ef4cfb48c4129b" runat="server" ContentKey="eacd7c48-9318-418c-91a1-3e8ae40278f8" ContentItemKey="47530e5d-6b10-423c-b1ef-4cfb48c4129b" Title="OurFinances" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_OurFinances" runat="server"><h1>Our Finances
</h1>
<p>We strive to be transparent with our finances so that you know exactly how your donations are used. Our finances are audited annually and the results are submitted to international charity monitoring organizations. We are proud to be consistently on the Top Ten lists for these organizations. The following is a summary of our of the last fiscal year results. <a href="mailto:info@imisdemo.com">Contact us</a> for a complete annual report.</p>
<h2>Where does your money go?</h2>
<p><img alt="" class="FloatRight" src="<%= Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion().TrimEnd('/') + "/" %>images/SampleSites/Donor/donations-pie-chart.png" />We take your trust in us seriously and carefully allocate funds so that your donations do the maximum good for our planet. Thanks to you, <strong>last year</strong>:</p>
<ul>
    <li>
    We <span class="feature-text-inline">set aside over 2500 square miles</span> for urban wildlife habitats.
    </li>
    <li>
    We <span class="feature-text-inline">reclaimed 15 former industrial sites</span> for conversion to green spaces.
    </li>
    <li>
    We <span class="feature-text-inline">relocated 3700 animals</span> from endangered areas to safe havens.</li>
</ul>
<p><strong class="feature-text-inline">92%</strong> of your donations go directly toward programs to improve our world and the wildlife that live here.</p>
<h2 style="clear: both;">Fiscal year results</h2>
<p>The iMIS Foundation finished the fiscal year on strong financial footing, despite
the challenges of the economy. We have been fortunate to continue to
receive generous donations and have not had to scale back any of our
programs and conservation efforts.</p>
<p>
We raised $24 million in new funds, which
remained on par with the amount raised in the previous year. One-time contributions
and membership funds accounted for 54% of our budget, with the remaining
coming from ongoing contributions, estate and legacy gifts, and support
from businesses and corporate partners.
</p>
<p>
We report our results are using Generally Accepted Accounting Principles
(GAAP), which require us to record income based on the year funds are
raised, not when the gifts are designated to be used. As a result, our
year-over-year revenue can and does fluctuate. When we build our budget,
we examine funds from ongoing and legacy gifts as well as forecast
income from new campaigns. The iMIS Foundation is committed to
maintaining a balanced budget.</p></asp:Panel></CM:ContentHtml>
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