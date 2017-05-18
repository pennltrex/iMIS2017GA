<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="How to Make Sure Your Business Strategy Drives Your Technology Investments" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">
	<meta name="Description" content="With real-world case studies, priceless self-assessment tools, and keen insights, this book will help not-for-profits avoid common but devastating mistakes and ensure their business/fundraising strategies align with their technology investments to he" />
	<meta name="Keywords" content="news,Mobile,News" />

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("5ea5672d-53e3-4c54-9806-fbbd3bb704e8"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("3a3bc25f-d11f-4f2b-bc2c-b6c8d2120283"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciSixthNiUGConference_08bf68ecf6164863828a13e5a8529123 as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("08bf68ec-f616-4863-828a-13e5a8529123");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciSixthNiUGConference_08bf68ecf6164863828a13e5a8529123);

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
				<CM:ContentHtml ID="ciSixthNiUGConference_08bf68ecf6164863828a13e5a8529123" runat="server" ContentKey="5ea5672d-53e3-4c54-9806-fbbd3bb704e8" ContentItemKey="08bf68ec-f616-4863-828a-13e5a8529123" Title="Sixth NiUG Conference" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_SixthNiUGConference" runat="server"><table width="100%" cellpadding="0" cellspacing="0" style="color: #444444; font-family: OpenSans, Arial, sans-serif; font-size: 14px; line-height: 23.1000003814697px;">
    <tbody>
        <tr>
            <td valign="top" colspan="2">
            <h1 style="font-size: 32px; border: none; text-rendering: optimizeLegibility; line-height: 1; margin-bottom: 0.385rem; color: #00a9e0; font-family: OpenSans, Arial, sans-serif;">The Not-for-Profit CEO's Guide to Improving Organizational Performance</h1>
            <p style="margin-bottom: 1.5em; font-size: 16px;"><strong>How to Make Sure Your Business Strategy Drives Your Technology Investments</strong></p>
            </td>
        </tr>
        <tr>
            <td valign="top" style="padding-right: 15px; width: 610px;">
            <p style="margin-bottom: 1.5em; font-size: 16px;">In working with more than 4,000 association and not-for-profit clients over the past 20+ years, ASI Chairman & CEO Bob Alves and President & CTO Don Robertson knew they had invaluable best-practice knowledge to share with fundraising executives.<br />
             </p>
            <p style="margin-top: -1.5em; margin-bottom: 1.5em; font-size: 16px;">With real-world case studies, priceless self-assessment tools, and keen insights, this book will help not-for-profits avoid common but devastating mistakes and ensure their business/fundraising strategies align with their technology investments to help them achieve continuous performance improvement.<br />
            <br />
            Get your copy now!</p>
            </td>
        </tr>
    </tbody>
</table>
<h1></h1></asp:Panel></CM:ContentHtml>
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