<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.CampaignManagement.MemberExportPEDesignerSummary" Codebehind="MemberExportPEDesignerSummary.ascx.cs" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<table class="DataTable" cellSpacing="1" cellPadding="2" border="0">
	<tr>
		<td class="PanelTablePrompt"><asp:label id="lblName" runat="server"></asp:label></td>
		<td class="PanelTableValue">
			<table cellSpacing="0" cellPadding="0" width="100%" border="0">
				<tr>
					<td><asp:textbox id="txtName" runat="server"  AutoPostBack="false"  MaxLength="50" ontextchanged="StatusChanged"></asp:textbox></td>
					<td align="left"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="PanelTablePrompt"><asp:label id="lblDescription" runat="server"></asp:label></td>
		<td class="PanelTableValue"><asp:textbox id="txtDescription" runat="server" MaxLength="250" TextMode="MultiLine" ontextchanged="StatusChanged"></asp:textbox></td>
	<tr>
		<td class="PanelTablePrompt"></td>
		<td class="PanelTableValue"><asp:checkbox id="chkPreview" runat="server" oncheckedchanged="StatusChanged"></asp:checkbox></td>
	</tr>
</table>
