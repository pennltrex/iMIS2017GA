<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.MessageBox" Codebehind="MessageBox.ascx.cs" %>

<table cellpadding="5" cellspacing="0" width="100%" border="0">
	<tr>
		<td class="StandardPanel">
			<asp:Label id="messageLabel" runat="server" Width="712px"></asp:Label>
			<asp:Button id="button1" runat="server" Text="Button1" onclick="Button1Click"></asp:Button>
			<asp:Button id="button2" runat="server" Text="Button2" onclick="Button2Click"></asp:Button>
			<asp:Button id="button3" runat="server" Text="Button3" onclick="Button3Click"></asp:Button></td>
	</tr>
</table>
