<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="true" Inherits="Asi.Web.UI.ContentRecordPage" Title="CIIP Certification and You" %>
<%@ Register TagPrefix="CM" TagName="ContentPage" Src="~/AsiCommon/Controls/ContentManagement/ContentPage.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentPageFooter" Src="~/AsiCommon/Controls/ContentManagement/ContentPageFooter.ascx" %>
<%@ Register TagPrefix="CM" TagName="ContentHtml" Src="~/AsiCommon/Controls/ContentManagement/DisplayHtml.ascx" %>

<asp:Content ID="TemplateHead" ContentPlaceHolderID="TemplateHead" runat="server">

    <link rel="search" type="application/opensearchdescription+xml" href="<%# Asi.Business.ContentManagement.NavigationHierarchy.GetTildeExpansion() %>/OpenSearch.aspx" title="<%# iMISWebsite != null ? iMISWebsite.Title : string.Empty %> Search" />
</asp:Content>
<script language="C#" runat="server">

	override protected bool RequireAuthenticatedUser { get { return false; } }

	override public Guid ContentRecordKey { get { return new Guid("3aee6427-f56d-45b9-8e5b-f02e9b8c57d8"); } }

	override public Guid ContentHierarchyKey { get { return new Guid("71e1d506-2b1c-4337-aabf-0d2f788f66b6"); } }

	protected override void EnsureChildUserControls()
	{
		base.EnsureChildUserControls();

		Asi.Web.UI.IUserControl childUserControl;
		Guid key;

		AddChildUserControl(ContentPage1);

		childUserControl = ciCIIPCertificationandYou_3d399800bcbc4d89a6d80d017f88988d as Asi.Web.UI.IUserControl;
		if (childUserControl != null)
			AddChildUserControl(childUserControl);
		key = new System.Guid("3d399800-bcbc-4d89-a6d8-0d017f88988d");
		if(!ContentItemKeyMap.ContainsKey(key))
			ContentItemKeyMap.Add(key, ciCIIPCertificationandYou_3d399800bcbc4d89a6d80d017f88988d);

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
				<CM:ContentHtml ID="ciCIIPCertificationandYou_3d399800bcbc4d89a6d80d017f88988d" runat="server" ContentKey="3aee6427-f56d-45b9-8e5b-f02e9b8c57d8" ContentItemKey="3d399800-bcbc-4d89-a6d8-0d017f88988d" Title="CIIP Certification and You" ShowTitleFlag="False" ShowBorder="False"><asp:Panel ID="Panel_CIIPCertificationandYou" runat="server"><h2>CIIP® Certification and You</h2>
<br />
In an increasingly regulated world, professional certification ensures that you’re ready to meet the requirements of licensing, from local to state to national to international. Learn more about IMIS International’s CIIP® certifications and find one that’s right for you. If you already have a credential, find out what you need to maintain it, or look into expanding your capabilities with additional designations. <br />
<br />
Give yourself the professional edge you need with an IMIS International certification.<br />
<br />
<strong>What are Certified IMIS International Professional (CIIP®) certifications? </strong><br />
IMIS International offers a comprehensive certification program for professionals of all education and skill levels. There are currently nine credentials available, rigorously developed, globally accredited and easily transferable across borders and industries. <br />
Regardless of where you are in your career, IMIS International has a certification for you. Demonstrate your expertise and your commitment to the profession with a globally-recognized CIIP® certification.<br />
Learn more about CIIP® certifications.<br />
<br />
<strong>Why choose a CIIP® certification? </strong><br />
IMIS International was the first organization to offer a credential specifically for professionals, and our certification program remains the global standard. Developed by professionals for professionals and representing our diverse global audience, IMIS International certifications give you the edge you need in today’s global economy.<br />
<br />
Find out more about why the CIIP® is the top choice for professionals.<br />
<br />
<strong>Which CIIP® certification is right for you? </strong><br />
For those just starting out, the CIIP-A® is the certification of choice. As you grow in your career, and expand your customer base across geographic boundaries, the local, regional, national and international certifications will help you keep your competitive edge. <br />
1.<span class="Apple-tab-span" style="white-space: pre;">	</span>Certified IMIS International Professional - Associate (CIIP-A)®<br />
2.<span class="Apple-tab-span" style="white-space: pre;">	</span>Certified IMIS International Professional - Local (CIIP-L)®<br />
3.<span class="Apple-tab-span" style="white-space: pre;">	</span>Certified IMIS International Professional - Regional (CIIP-R)®<br />
4.<span class="Apple-tab-span" style="white-space: pre;">	</span>Certified IMIS International Professional - USA (CIIP-US)®<br />
5.<span class="Apple-tab-span" style="white-space: pre;">	</span>Certified IMIS International Professional - Canada (CIIP-CA)®<br />
6.<span class="Apple-tab-span" style="white-space: pre;">	</span>Certified IMIS International Professional - UK (CIIP-UK)®<br />
7.<span class="Apple-tab-span" style="white-space: pre;">	</span>Certified IMIS International Professional - Australia (CIIP-AU)®<br />
8.<span class="Apple-tab-span" style="white-space: pre;">	</span>Certified IMIS International Professional – New Zealand (CIIP-NZ)®<br />
9.<span class="Apple-tab-span" style="white-space: pre;">	</span>Certified IMIS International Professional - Global (CIIP)®<br />
<br />
<strong>Already CIIP® certified? </strong><br />
To learn more about continuing CIIP® certification requirements, how to earn and claim continuing education points, and step-by-step instructions on how to renew your certification, watch the CCR video, or visit the Maintain Your Certification page on imisdemo.com<br />
If you’re interested in expanding your expertise and professionalism with another credential, find out which certification is right for you. <br />
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