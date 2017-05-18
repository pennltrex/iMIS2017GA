<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.Printers.PrinterList" Codebehind="PrinterList.ascx.cs" %>
<asp:Panel id="ContentPanel" runat="server" Visible="true" >
<table cellSpacing="0" cellPadding="3" width="100%" border="0">
	<tr>
		<td vAlign="top" align="left"><asp:label id="SectionTitleLabel" CssClass="mdTitle" runat="server"></asp:label></td>
	</tr>
	<tr>
		<td align="center">
			<p><asp:label id="lblCurrentPrinters" CssClass="mdTitle" runat="server"></asp:label></p>
			<p><asp:placeholder id="PlaceholderCurrentPrinters" runat="server"></asp:placeholder></p>
		</td>
	</tr>
	<tr>
		<td align="center">
		    <input id="txtUNC" type="text" runat="server" />&nbsp;<asiweb:StyledButton id="btnAdd" runat="server" onclick="btnAdd_ServerClick" />
		</td>
	</tr>
</table>
</asp:Panel>
