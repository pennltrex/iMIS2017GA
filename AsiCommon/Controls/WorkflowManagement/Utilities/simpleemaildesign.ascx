<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Utilities.SimpleEmailDesign" Codebehind="SimpleEmailDesign.ascx.cs" %>
<table cellpadding="2">
	<tr>
		<td colspan="3" align="center"><h3><asp:Label id="TitleLabel" runat="server">Simple Email</asp:Label></h3>
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label id="FromLabel" runat="server"></asp:Label></td>
		<td>
			<asp:TextBox id="FromTextBox" runat="server"></asp:TextBox></td>
		<td>
			<asp:RequiredFieldValidator id="FromRFV" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="FromTextBox"></asp:RequiredFieldValidator></td>
	</tr>
	<tr>
		<td>
			<asp:Label id="ToLabel" runat="server"></asp:Label></td>
		<td><asp:TextBox id="ToTextBox" runat="server"></asp:TextBox></td>
		<td>
			<asp:RequiredFieldValidator id="ToRFV" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="ToTextBox"></asp:RequiredFieldValidator></td>
	</tr>
	<tr>
		<td>
			<asp:Label id="SubjectLabel" runat="server"></asp:Label></td>
		<td><asp:TextBox id="SubjectTextBox" runat="server"></asp:TextBox></td>
		<td></td>
	</tr>
	<tr>
		<td>
			<asp:Label id="BodyLabel" runat="server"></asp:Label></td>
		<td>
			<asp:TextBox id="BodyTextBox" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox></td>
		<td></td>
	</tr>
</table>
