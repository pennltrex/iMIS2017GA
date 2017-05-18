<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.ParamCollector.Migrated_ParamCollectorControl" Codebehind="ParamCollectorControl.ascx.cs" %>
<table cellSpacing="1" cellPadding="2" border="0" class="ParamTable">
	<tr>
		<asp:Panel id="pnlPrompt" runat="server" Visible="True">
			<TD class="PromptParam" vAlign="middle" noWrap align="right">
				<asp:label id="lblPrompt" runat="server"></asp:label></TD>
		</asp:Panel>
		<td vAlign="middle" align="center" nowrap>
			<asp:label id="lblComparator" runat="server"></asp:label></td>
		<td vAlign="middle" align="left" nowrap>
			<asp:textbox id="txtValue" runat="server" cssclass="InputShort" ontextchanged="StatusChanged"></asp:textbox><asp:dropdownlist id="cboTrueFalse" runat="server" Width="75" Visible="False" cssclass="SelectStandard" onselectedindexchanged="StatusChanged"></asp:dropdownlist><asp:listbox id="lbLookup" runat="server" Width="161" Visible="False" Height="25" SelectionMode="Multiple" onselectedindexchanged="StatusChanged"></asp:listbox></td>
		<asp:Panel id="pnlAnd" runat="server" Visible="False">
			<TD vAlign="middle" noWrap align="right">
				<asp:label id="lblAnd" Visible="False" runat="server">AND</asp:label></TD>
		</asp:Panel>
		<asp:Panel id="pnlAddlValue" runat="server" Visible="False">
			<TD vAlign="middle" noWrap align="left">
				<asp:textbox id="txtAddlValue" Visible="False" Runat="server" cssclass="InputShort" ontextchanged="StatusChanged"></asp:textbox>
				<asp:listbox id="lbAddlLookup" Visible="False" runat="server" Width="144" SelectionMode="Multiple"
					Height="45" onselectedindexchanged="StatusChanged"></asp:listbox></TD>
		</asp:Panel>
	</tr>
</table>
