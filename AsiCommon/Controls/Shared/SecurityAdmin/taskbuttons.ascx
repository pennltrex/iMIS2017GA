<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SecurityAdmin.TaskButtons" Codebehind="TaskButtons.ascx.cs" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<table cellspacing="0" cellpadding="0" width="100%">
	<tr>
		<td valign="middle" nowrap align="left">
			<asiweb:StyledButton id="btnNew" runat="server" OnClick="btnNew_Click" />
		</td>
		<td valign="middle" nowrap align="right">
			<asiweb:StyledButton id="btnClose" runat="server" OnClick="btnClose_Click" />
		</td>
	</tr>
</table>
