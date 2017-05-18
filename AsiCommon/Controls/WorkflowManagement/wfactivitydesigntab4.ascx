<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.WfActivityDesignTab4" Codebehind="WfActivityDesignTab4.ascx.cs" %>
<table cellPadding="2">
	<tr>
		<td><INPUT id="IdHidden" type="hidden" name="IdHidden" runat="server"></td>
		<td align="right"><asp:button id="NewButton" runat="server" Text=""></asp:button><asp:button id="RemoveButton" runat="server" Text=""></asp:button></td>
	</tr>
	<tr>
		<td colspan="2"><asp:listbox id="AssignmentListBox" runat="server" Width="100%"></asp:listbox></td>
	</tr>
	<tr>
		<td>
			<asp:Label id="RightLabel" runat="server"></asp:Label></td>
		<td><asp:dropdownlist id="RightDropDownList" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:textbox id="RightTextBox" runat="server"></asp:textbox></td>
	</tr>
	<tr>
		<td>
			<asp:Label id="LeftLabel" runat="server"></asp:Label></td>
		<td><asp:dropdownlist id="LeftDropDownList" runat="server" AutoPostBack="True"></asp:dropdownlist><asp:textbox id="LeftTextBox" runat="server"></asp:textbox></td>
	</tr>
</table>