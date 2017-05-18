<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.MailProcessEngine.EmailSubjectPanel" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="EmailSubjectPanel.ascx.cs" %>
<table width="100%" cellpadding="2" cellspacing="1" border="0">
	<tr>
		<td class="PanelTablePrompt">
			<asp:Label id="lblSubject" runat="server"></asp:Label></td>
		<td class="PanelTableValue">
			<asp:TextBox id="txtSubject" runat="server" MaxLength="50"></asp:TextBox></td>
	</tr>
</table>
