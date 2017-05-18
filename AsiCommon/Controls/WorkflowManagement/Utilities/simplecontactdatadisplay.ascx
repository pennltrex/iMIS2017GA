<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Utilities.SimpleContactDataDisplay" Codebehind="SimpleContactDataDisplay.ascx.cs" %>
<table cellpadding="2">
	<tr>
		<td colspan="3" align="center"><h3><asp:Label id="TitleLabel" runat="server">xContact Information</asp:Label></h3>
		</td>
	</tr>
	<tr>
		<td>
			<asp:Label id="FirstNameLabel" runat="server"></asp:Label></td>
		<td>
			<asp:TextBox id="FirstNameTextBox" runat="server" ReadOnly="True"></asp:TextBox></td>
		<td></td>
	</tr>
	<tr>
		<td>
			<asp:Label id="LastNameLabel" runat="server"></asp:Label></td>
		<td><asp:TextBox id="LastNameTextBox" runat="server" ReadOnly="True"></asp:TextBox></td>
		<td></td>
	</tr>
	<tr>
		<td>
			<asp:Label id="EmailLabel" runat="server"></asp:Label></td>
		<td><asp:TextBox id="EmailTextBox" runat="server" ReadOnly="True"></asp:TextBox></td>
		<td></td>
	</tr>
</table>
