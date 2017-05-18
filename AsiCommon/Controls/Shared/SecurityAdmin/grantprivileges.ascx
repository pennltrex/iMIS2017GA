<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SecurityAdmin.GrantPrivileges" Codebehind="GrantPrivileges.ascx.cs" %>

<asp:PlaceHolder id="phErrorMsg" runat="server"></asp:PlaceHolder>
<table id="Table1" cellSpacing="0" cellPadding="3" border="0" align="center" width="100%">
	<tr>
		<td valign="top">
			<table cellSpacing="0" cellPadding="0" border="0">
				<tr>
					<td align="left" nowrap class="mdTitle">
						<asp:Label id="lblUserPermissions" runat="server"></asp:Label></td>
					<td class="CommandBar">
						<asiweb:StyledButton runat="server" id="btnOK" OnClick="btnOK_ServerClick" />
						<asiweb:StyledButton runat="server" id="btnCancel" OnClick="btnCancel_ServerClick" /></td>
				</tr>
			</table>
			<table id="Table3" cellSpacing="1" cellPadding="2" border="0" align="center" width="100%">
				<tr>
					<td class="PanelTablePrompt">
						<asp:Label id="lblNamePrompt" runat="server"></asp:Label></td>
					<td class="PanelTableValue" nowrap>&nbsp;<asp:Label id="lblName" runat="server"></asp:Label></td>
				</tr>
				<tr>
					<td class="PanelTablePrompt">
						<asp:Label id="lblPermissions" runat="server"></asp:Label></td>
					<td class="PanelTableValue"><asp:PlaceHolder id="phCheckboxes" runat="server"></asp:PlaceHolder></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
