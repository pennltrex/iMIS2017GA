<%@ Control Language="C#" Inherits="AsiCommon_Controls_ContentManagement_ContentManagerConsole" Codebehind="ContentManagerConsole.ascx.cs" %>

<div class="ConsolePanel" style="width:99%;">
    <div>
        <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" Width="45%">
            <asiweb:PanelTemplateControl id="NavigationDesignerPanel" runat="server" TemplateTitle="Site Designer" BorderStyle="Solid">
	            <table cellspacing="0" cellpadding="0" width="100%" border="0">
		            <tr>
			            <td width="90">
			                <asp:Image ID="Image1" runat="server" height="77" ImageUrl="~/AsiCommon/Images/BSA/con_sitemanage.png" width="88" ImageAlign="middle" />
			            </td>
			            <td style="font-size: 100%">
			                <asiweb:BusinessHyperLink ID="NDLink" runat="server" NavigateNavigationCode="CM.Sitemaps" NavigateSystemLink="true" />
				            <br />
				            <asiweb:BusinessHyperLink ID="WebsitesLink" runat="server" NavigateNavigationCode="CM.Websites" NavigateSystemLink="true" />
				            <br />
				            <asiweb:BusinessHyperLink ID="UrlManagerLink" runat="server" NavigateNavigationCode="CM.URLs" NavigateSystemLink="true" />
				            <br />
			            </td>
		            </tr>
	            </table>
            </asiweb:PanelTemplateControl>
            <asiweb:PanelTemplateControl id="ContentDesignerPanel" runat="server" TemplateTitle="Content Designer" BorderStyle="Solid">
	            <table cellspacing="0" cellpadding="0" width="100%" border="0">
		            <tr>
			            <td width="90">
			                <asp:Image ID="Image2" runat="server" height="77" ImageUrl="~/AsiCommon/Images/BSA/con_contentmanage.png" width="88" ImageAlign="middle" />
			            </td>
			            <td style="FONT-SIZE: 100%">
			                <asiweb:BusinessHyperLink ID="CDLink1" runat="server" NavigateNavigationCode="CM.Content" NavigateSystemLink="true" />
				            <br />
				            <asiweb:BusinessHyperLink ID="TLLink1" runat="server" NavigateNavigationCode="CM.Tasks" NavigateSystemLink="true" />
				            <br />
				            <asiweb:BusinessHyperLink ID="LayoutLink" runat="server" NavigateNavigationCode="CM.Layouts" NavigateSystemLink="true" />
				            <br />
				            <asiweb:BusinessHyperLink ID="ImageLink" runat="server" NavigateNavigationCode="CM.Images" NavigateSystemLink="true" Visible="false" />
				            <br />
			            </td>
		            </tr>
	            </table>
            </asiweb:PanelTemplateControl>
        </asiweb:PanelTemplateColumn>
        <asiweb:PanelTemplateColumn ID="PanelTemplateColumn2" runat="server" Width="45%">
            <asiweb:PanelTemplateControl id="TaggingPanel" runat="server" TemplateTitle="Tagging" BorderStyle="Solid">
	            <table cellspacing="0" cellpadding="0" width="100%" border="0">
		            <tr>
			            <td width="90">
			                <asp:Image ID="Image3" runat="server" height="77" ImageUrl="~/AsiCommon/Images/BSA/con_tagging.png" width="88" ImageAlign="middle" />
			            </td>
			            <td style="font-size: 100%">
			                <asiweb:BusinessHyperLink ID="TagDefnLink" runat="server" NavigateNavigationCode="CM.Tags" NavigateSystemLink="true" />
				            <br />
				            <asiweb:BusinessHyperLink ID="TagListFormatsLink" runat="server" NavigateNavigationCode="CM.TaggedListFormats" NavigateSystemLink="true" />
				            <br />
			            </td>
		            </tr>
	            </table>
            </asiweb:PanelTemplateControl>
            <asiweb:PanelTemplateControl id="TGPanel" runat="server" TemplateTitle="Reports" BorderStyle="Solid">
	            <table cellspacing="0" cellpadding="0" width="100%" border="0">
		            <tr>
			            <td width="90">
			                <asp:Image ID="Image4" runat="server" height="77" ImageUrl="~/AsiCommon/Images/BSA/reports.png" width="78" ImageAlign="middle" />
			            </td>
			            <td style="FONT-SIZE: 100%">
			                <asiweb:BusinessHyperLink ID="TGLink" runat="server" NavigateNavigationCode="CM.Reports" NavigateSystemLink="true" />
				            <br />
			            </td>
		            </tr>
	            </table>
            </asiweb:PanelTemplateControl>
        </asiweb:PanelTemplateColumn>
    </div>

    <asiweb:PanelTemplateColumn runat="server" Width="100%" style="margin-top: 2px;">
        <asiweb:PanelTemplateControl id="SystemMaintenancePanel" runat="server" TemplateTitle="System Maintenance" Width="90%">
            <table cellspacing="0" cellpadding="0" width="100%" border="0">
	            <tr>
		            <td width="90">
		                <asp:Image ID="Image5" runat="server" height="77" ImageUrl="~/AsiCommon/Images/BSA/con_systemmain.png" width="88" ImageAlign="middle" />
		            </td>
		            <td style="FONT-SIZE: 100%">
		                <asiweb:BusinessHyperLink ID="PublishingServersLink" runat="server" NavigateNavigationCode="CM.PublishServers" NavigateSystemLink="true" />
			            <br />
			            <asiweb:BusinessHyperLink ID="UDFLink" runat="server" NavigateNavigationCode="CM.UDFields" NavigateSystemLink="true" />
			            <br />
		            </td>
		            <td style="FONT-SIZE: 100%">
		                <asiweb:BusinessHyperLink ID="ContentTypeLink" runat="server" NavigateNavigationCode="CM.ContentTypes" NavigateSystemLink="true" />
			            <br />
			            <asiweb:BusinessHyperLink ID="SecurityLink" runat="server" NavigateNavigationCode="CM.ContentAuthorityGroups" NavigateSystemLink="true" />
			            <br />
		            </td>
	            </tr>
            </table>
        </asiweb:PanelTemplateControl>
    </asiweb:PanelTemplateColumn>
</div>
