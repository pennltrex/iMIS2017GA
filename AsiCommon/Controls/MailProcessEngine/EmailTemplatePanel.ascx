<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.MailProcessEngine.EmailTemplatePanel" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="EmailTemplatePanel.ascx.cs" %>
<table cellSpacing="1" cellPadding="2" width="100%" border="0">
	<tr>
		<td class="PanelTablePrompt"><asp:label id="lblTemplate" runat="server"></asp:label></td>
		<td class="PanelTableValue">
		    <asp:textbox id="txtTemplate" runat="server" Height="152px" Width="379px" MaxLength="50" TextMode="MultiLine"></asp:textbox>
		    <asiweb:StyledButton id="btnTemplateBrowse" Text="..." runat="server" />
		    <asiweb:StyledButton id="btnUpload" runat="server" /></td>
	</tr>
</table>
