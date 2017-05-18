<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.MailProcessEngine.EmailFromEmailPanel" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="EmailFromEmailPanel.ascx.cs" %>
<table width="100%" cellpadding="2" cellspacing="1" border="0">
	<tr>
		<td class="PanelTablePrompt">
			<asp:Label id="lblFromEmail" runat="server"></asp:Label></td>
		<td class="PanelTableValue">
			<asp:TextBox id="txtFromEmail" runat="server" MaxLength="50"></asp:TextBox></td>
	</tr>
</table>
