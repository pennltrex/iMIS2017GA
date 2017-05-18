<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Utilities.SimpleApprovalDesign" Codebehind="SimpleApprovalDesign.ascx.cs" %>
<table cellpadding="2">
	<tr>
		<td>
			<asp:Label id="MessageLabel" runat="server"></asp:Label></td>
		<td>
			<asp:TextBox id="MessageTextBox" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox></td>
	</tr>
	<tr>
		<td>
			<asp:Label id="MarkupLabel" runat="server"></asp:Label></td>
		<td>
			<asp:TextBox id="MarkupTextBox" runat="server" Rows="4" TextMode="MultiLine"></asp:TextBox></td>
	</tr>
</table>
