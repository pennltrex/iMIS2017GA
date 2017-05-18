<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Utilities.SqlCommandTextPanel" Codebehind="SqlCommandTextPanel.ascx.cs" %>
<TABLE id="Table1" cellSpacing="0" cellPadding="2" border="0">
	<TR>
		<TD>
			<asp:Label id="TypeLabel" runat="server">xExecution Type</asp:Label></TD>
		<TD>
			<asp:DropDownList id="TypeDropDownList" runat="server" Width="240px"></asp:DropDownList></TD>
	</TR>
	<TR>
		<TD>
			<asp:Label id="CommandLabel" runat="server">xSQL Command Text</asp:Label></TD>
		<TD>
			<asp:TextBox id="CommandTextBox" runat="server" TextMode="MultiLine" Rows="8" Width="240px"></asp:TextBox></TD>
	</TR>
</TABLE>
