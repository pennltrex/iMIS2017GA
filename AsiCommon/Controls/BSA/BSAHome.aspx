<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Inherits="AsiCommon_Controls_BSA_BSAHome" Codebehind="BSAHome.aspx.cs" %>
<%@ Register TagPrefix="asicm" Namespace="Asi.Web.UI.Common.ContentManagement" Assembly="Asi.WebRoot" %>

<asp:Content id="MainContent" ContentPlaceHolderID="TemplateBody" runat="server">
    <asp:Panel ID="BSAHomePanel" runat="server" CssClass="ConsolePanel">
        <asiweb:PanelTemplateColumn ID="Column1" runat="server" Width="46%">
	        <asiweb:paneltemplatecontrol id="IQAPanel" runat="server" TemplateTitle="Intelligent Query Architect" RoundedCorners="false">
			    <table cellspacing="0" cellpadding="0" width="100%" border="0">
				    <tr>
					    <td width="90">
					        <asp:Image runat="server" ImageUrl="~/AsiCommon/Images/BSA/query.png" Height="77" Width="88" ImageAlign="middle" />
					    </td>
					    <td style="font-size: 100%">
					        <asiweb:BusinessHyperLink ID="IQALink" runat="server" NavigateNavigationCode="ISA.Queries" NavigateSystemLink="true" />
						    <br />
						    <asiweb:BusinessHyperLink Visible="false" ID="IQANewLink" runat="server" NavigateNavigationCode="ISA.NewQuery" NavigateSystemLink="true" />
						    <br />
					    </td>
				    </tr>
			    </table>
		    </asiweb:paneltemplatecontrol>
            <asiweb:paneltemplatecontrol id="BOAPanel" runat="server" TemplateTitle="Business Object Designer">
			    <table cellspacing="0" cellpadding="0" width="100%" border="0">
				    <tr>
					    <td width="90">
					        <asp:Image runat="server" ImageUrl="~/asicommon/images/bsa/businessobject.png" height="77" width="88" ImageAlign="middle" />
					    </td>
					    <td style="font-size: 100%">
    					    <asiweb:BusinessHyperLink ID="BODLink" runat="server" NavigateNavigationCode="ISA.BusinessObjects" NavigateSystemLink="true" />
    					    <br />
    					    <asiweb:BusinessHyperLink Visible="false" ID="BODNewLink" runat="server" NavigateNavigationCode="ISA.NewBusinessObject" NavigateSystemLink="true" />
    					    <br />
			            </td>
				    </tr>
			    </table>
		    </asiweb:paneltemplatecontrol>
            <asiweb:paneltemplatecontrol id="NavigationDesignerPanel" runat="server" TemplateTitle="Site Designer">
				<table cellspacing="0" cellpadding="0" width="100%" border="0">
					<tr>
						<td width="90">
						    <asp:Image runat="server" height="77" ImageUrl="~/AsiCommon/Images/BSA/con_sitemanage.png" width="88" ImageAlign="middle" />
						</td>
						<td style="font-size: 100%">
						    <asiweb:BusinessHyperLink ID="NDLink" runat="server" NavigateNavigationCode="ISA.Sitemaps" NavigateSystemLink="true" Text="Manage sitemaps" />
							<br />
							<asiweb:BusinessHyperLink Visible="false" ID="NDNewLink" runat="server" NavigateNavigationCode="ISA.NewSitemap" NavigateSystemLink="true" />
							<%--<br />--%>
				            <asiweb:BusinessHyperLink ID="WebsitesLink" runat="server" NavigateNavigationCode="ISA.Websites" NavigateSystemLink="true" Text="Manage websites" />
				            <br />
				            <asiweb:BusinessHyperLink ID="UrlManagerLink" runat="server" NavigateNavigationCode="ISA.URLs" NavigateSystemLink="true" Text="Manage shortcuts" />
				            <br />
						</td>
					</tr>
				</table>
			</asiweb:paneltemplatecontrol>
            <asiweb:paneltemplatecontrol id="WizardsPanel" runat="server" TemplateTitle="Wizards">
				<table cellspacing="0" cellpadding="0" width="100%" border="0">
					<tr>
						<td width="90">
						    <asp:Image runat="server" height="77" ImageUrl="~/AsiCommon/Images/BSA/wizard.png" width="88" ImageAlign="middle" />
						</td>
						<td style="FONT-SIZE: 100%" disabled="true">
						    <asiweb:BusinessHyperLink ID="WizardsCustomDataLink" runat="server" NavigateNavigationCode="ISA.Wizards.CustomData" NavigateSystemLink="true" Visible="false" />
						    Create custom data screen
							<br />
							<asiweb:BusinessHyperLink ID="WizardsExportDataLink" runat="server" NavigateNavigationCode="ISA.Wizards.DataExport" NavigateSystemLink="true" Visible="false" />
							Create data export
							<br />
							<asiweb:BusinessHyperLink ID="WizardsImportDataLink" runat="server" NavigateNavigationCode="ISA.Wizards.DataImport" NavigateSystemLink="true" Visible="false" />
							Import data
							<br />
						</td>
					</tr>
				</table>
			</asiweb:paneltemplatecontrol>
            <%--<asiweb:paneltemplatecontrol id="ContentDesignerPanel" runat="server" TemplateTitle="Content Designer" Visible="false">
				<table cellspacing="0" cellpadding="0" width="100%" border="0">
					<tr>
						<td width="90">
						    <asp:Image runat="server" height="77" ImageUrl="~/AsiCommon/Images/BSA/.jpg" width="88" ImageAlign="middle" />
						</td>
						<td style="FONT-SIZE: 100%">
						    <asiweb:BusinessHyperLink ID="CDLink" runat="server" NavigateNavigationCode="ISA.Content" NavigateSystemLink="true" />
							<br />
							<asiweb:BusinessHyperLink ID="TLLink" runat="server" NavigateNavigationCode="ISA.Tasks" NavigateSystemLink="true" />
							<br />
							<asiweb:BusinessHyperLink ID="LayoutLink" runat="server" NavigateNavigationCode="ISA.Layouts" NavigateSystemLink="true" />
							<br />
						</td>
					</tr>
				</table>
			</asiweb:paneltemplatecontrol>--%>
        </asiweb:PanelTemplateColumn>
        <asiweb:PanelTemplateColumn ID="Column2" runat="server" Width="46%">
		    <asiweb:paneltemplatecontrol id="ScreenDesignerPanel" runat="server" TemplateTitle="Screen Designer">
			    <table cellspacing="0" cellpadding="0" width="100%" border="0">
				    <tr>
					    <td width="90">
					        <asp:Image runat="server" Height="77" ImageUrl="~/AsiCommon/Images/BSA/screendesigner.png" Width="88" ImageAlign="middle" />
					    </td>
					    <td style="FONT-SIZE: 100%">
					        <asiweb:BusinessHyperLink ID="SDLink" runat="server" NavigateNavigationCode="ISA.Screens" NavigateSystemLink="true" Text="Manage screens" />
						    <br />
						    <asiweb:BusinessHyperLink ID="SDNewLink" runat="server" NavigateNavigationCode="ISA.NewScreen" NavigateSystemLink="true" Text="Create screen" />
						    <br />
					    </td>
				    </tr>
			    </table>
		    </asiweb:paneltemplatecontrol>
 		    <asiweb:paneltemplatecontrol id="WorkflowPanel" runat="server" TemplateTitle="Workflow Designer">
			    <table cellspacing="0" cellpadding="0" width="100%" border="0">
				    <tr>
					    <td width="90">
					        <asp:Image runat="server" height="77" ImageUrl="~/AsiCommon/Images/BSA/workflowdesign.png" width="88" ImageAlign="middle" border="0" />
					    </td>
					    <td style="FONT-SIZE: 100%">
					        <asiweb:BusinessHyperLink ID="WFLink" runat="server" NavigateNavigationCode="ISA.Workflows" NavigateSystemLink="true" />
						    <br />
						    <asiweb:BusinessHyperLink ID="WFNewLink" runat="server" NavigateNavigationCode="ISA.NewWorkflow" NavigateSystemLink="true" Visible="false" />
						    <%--<br />--%>
						    <asiweb:BusinessHyperLink ID="WFMonitorProcessesLink" runat="server" NavigateNavigationCode="ISA.WorkflowProcesses" NavigateSystemLink="true" />
						    <br />
						    <asiweb:BusinessHyperLink ID="WFWorkItemConsoleLink" runat="server" NavigateNavigationCode="ISA.WorkflowConsole" NavigateSystemLink="true" />
					    </td>
				    </tr>
			    </table>
		    </asiweb:paneltemplatecontrol>
            <asiweb:paneltemplatecontrol id="ReportsPanel" runat="server" TemplateTitle="Reports">
				<table cellspacing="0" cellpadding="0" width="100%" border="0">
					<tr>
						<td width="90">
						    <asp:Image runat="server" height="77" ImageUrl="~/AsiCommon/Images/BSA/reports.png" width="88" ImageAlign="middle" />
					    </td>
					    <td style="FONT-SIZE: 100%">
					        <asiweb:BusinessHyperLink ID="ReportsRunLink" runat="server" NavigateNavigationCode="ISA.Reports" NavigateSystemLink="true" Text="Run" />
							<br />
							<asiweb:BusinessHyperLink ID="ReportsManageLink" runat="server" NavigateNavigationCode="ISA.Reports" NavigateSystemLink="true" Text="Manage" />
							<br />
							<asiweb:BusinessHyperLink ID="ReportsLogLink" runat="server" NavigateNavigationCode="ISA.Reports" NavigateSystemLink="true" Text="Log" />
							<br />
						</td>
					</tr>
				</table>
			</asiweb:paneltemplatecontrol>
            <asiweb:paneltemplatecontrol id="ToolsPanel" runat="server" TemplateTitle="Utilities">
				<table cellspacing="0" cellpadding="0" width="100%" border="0">
					<tr>
						<td width="90">
						    <asp:Image runat="server" height="77" ImageUrl="~/AsiCommon/Images/BSA/utilities.png" width="88" ImageAlign="middle" />
						</td>
						<td style="FONT-SIZE: 100%">
						    <asiweb:BusinessHyperLink ID="UtilitiesDocumentSystemLink" runat="server" NavigateNavigationCode="ISA.DocumentSystem" NavigateSystemLink="true" />
							<br />
							<asp:HyperLink runat="server" id="UtilitiesUpdateIMISLink" NavigateUrl='http://www.imis.com/ProductReleases' Target="_blank">Update iMIS</asp:HyperLink>
							<br />
							<asiweb:BusinessHyperLink ID="UtilitiesModifyTablesLink" runat="server" NavigateNavigationCode="ISA.UDTables" NavigateSystemLink="true" />
							<br />
						</td>
					</tr>
				</table>
			</asiweb:paneltemplatecontrol>
       </asiweb:PanelTemplateColumn>
    </asp:Panel>
</asp:Content>
