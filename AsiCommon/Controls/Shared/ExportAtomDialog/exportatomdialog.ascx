<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.Utility.ExportAtomDialog" Codebehind="ExportAtomDialog.ascx.cs" %>

<div id="DownloadBlock">
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
    <table cellspacing="0" cellpadding="3" width="100%" border="0">
	    <tr class="DocumentExplorerToolBar">
		    <td valign="middle" width="37%" nowrap class="DocumentExplorerToolBar"><asp:label id="lblExport" runat="server" cssclass="mdTitle"></asp:label></td>
		    <td valign="middle" width="30%" align="right" nowrap class="DocumentExplorerToolBar">
		        <asiweb:StyledButton id="btnGo" runat="server" OnClick="btnGo_ServerClick" OnClientClick="document.getElementById('DownloadBlock').style.display='none';document.getElementById('AfterDownload').style.display='block';" />
		    </td>
	    </tr>
    </table>
    <asp:PlaceHolder ID="OptionsPlaceholder" runat="server" />
</div>
<div id="AfterDownload" style="display:none;">
    <asp:Label ID="AfterDownloadMessage" runat="server" /><br /><br />
    <input type="button" onclick="window.close();" value="Close Window" />
</div>
