<%@ Reference Control="~/asicommon/controls/rfm/rfmparamrow.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.RFM.RFMAtomRankingsManual" Codebehind="RFMAtomRankingsManual.ascx.cs" %>
<%@ Register TagPrefix="asiwc" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<table class="DataTable" cellspacing="0" cellpadding="0" width="100%" border="0">
	<tr>
		<td colspan="3" style="PADDING-LEFT: 3px; PADDING-BOTTOM: 3px; PADDING-TOP: 3px"><asp:label id="lblRankingValues" runat="server" cssclass="mdTitle"></asp:label></td>
	</tr>
	<tr class="ListHeader" style="PADDING-BOTTOM: 3px; PADDING-TOP: 3px">
		<td nowrap align="center" width="33%"><asp:label id="lblRecency" runat="server"></asp:label></td>
		<td nowrap align="center" width="33%"><asp:label id="lblFrequency" runat="server"></asp:label></td>
		<td nowrap align="center" width="33%"><asp:label id="lblMonetary" runat="server"></asp:label></td>
	</tr>
	<tr>
		<td valign="top" nowrap align="center" colspan="1" rowspan="1"><asp:placeholder id="PlaceholderRecency" runat="server"></asp:placeholder></td>
		<td valign="top" nowrap align="center" colspan="1" rowspan="1"><asp:placeholder id="PlaceholderFrequency" runat="server"></asp:placeholder></td>
		<td valign="top" nowrap align="center" colspan="1" rowspan="1"><asp:placeholder id="PlaceholderMonetary" runat="server"></asp:placeholder></td>
	</tr>
</table>
