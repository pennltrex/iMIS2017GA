<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.Utility.ExportDialog" Codebehind="ExportDialog.ascx.cs" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<table cellspacing="0" cellpadding="3" width="100%" border="0">
	<tr class="DocumentExplorerToolBar">
		<td valign="middle" width="37%" nowrap class="DocumentExplorerToolBar"><asp:label id="lblExport" runat="server" cssclass="mdTitle"></asp:label></td>
		<td valign="middle" width="30%" align="right" nowrap class="DocumentExplorerToolBar">
		    <asiweb:StyledButton id="btnGo" runat="server" OnClick="btnGo_ServerClick" />
		</td>
	</tr>
</table>
