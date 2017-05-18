<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.ReportingServices.ReportingServicesNamePanel" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="ReportingServicesNamePanel.ascx.cs" %>
<table width="100%" cellpadding="2" cellspacing="1" border="0">
	<tr>
		<td class="PanelTablePrompt PEControllerPrompt">
			<asp:Label id="lblName" runat="server">Name</asp:Label></td>
		<td class="PanelTableValue PEControllerValue">
			<asp:TextBox id="txtName" runat="server" MaxLength="50"></asp:TextBox></td>
	</tr>
</table>