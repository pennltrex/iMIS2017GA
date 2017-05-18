<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Utilities.SimpleContactDataUpdate" Codebehind="SimpleContactDataUpdate.ascx.cs" %>
<table cellpadding="2">
	<tr>
		<td colspan="3" align="center"><h3><asp:Label id="TitleLabel" runat="server">xContact Information</asp:Label></h3>
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label id="FirstNameLabel" runat="server"></asp:Label></td>
		<td>
			<asp:TextBox id="FirstNameTextBox" runat="server"></asp:TextBox></td>
		<td>
			<asp:RequiredFieldValidator id="FirstNameRFV" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="FirstNameTextBox"></asp:RequiredFieldValidator></td>
	</tr>
	<tr>
		<td>
			<asp:Label id="LastNameLabel" runat="server"></asp:Label></td>
		<td><asp:TextBox id="LastNameTextBox" runat="server"></asp:TextBox></td>
		<td>
			<asp:RequiredFieldValidator id="LastNameRFV" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="LastNameTextBox"></asp:RequiredFieldValidator></td>
	</tr>
	<tr>
		<td>
			<asp:Label id="EmailLabel" runat="server"></asp:Label></td>
		<td><asp:TextBox id="EmailTextBox" runat="server"></asp:TextBox></td>
		<td>
			<asp:RequiredFieldValidator id="EmailRFV" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="EmailTextBox"></asp:RequiredFieldValidator>
			<asp:RegularExpressionValidator id="EmailREV" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="EmailTextBox"
				ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator></td>
	</tr>
</table>
