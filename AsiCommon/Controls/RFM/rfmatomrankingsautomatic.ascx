<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.RFM.RFMAtomRankingsAutomatic" Codebehind="RFMAtomRankingsAutomatic.ascx.cs" %>
<%@ Register TagPrefix="asiwc" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>


<table cellspacing="1" cellpadding="3" width="100%" border="0" align="center">
	<tr><td colspan="3"><asp:label id="lblNumberOf" runat="server" cssclass="mdTitle"></asp:label></td></tr>
	<tr>
		<td align="center" valign="middle" nowrap><asp:label id="lblRecency" runat="server"></asp:label>
			<asp:textbox id="txtRecency" runat="server" cssclass="InputNumeric" ontextchanged="StatusChanged"></asp:textbox></td>
		<td align="center" valign="middle" nowrap><asp:label id="lblFrequency" runat="server"></asp:label>
			<asp:textbox id="txtFrequency" runat="server" cssclass="InputNumeric" ontextchanged="StatusChanged"></asp:textbox></td>
		<td align="center" valign="middle" nowrap><asp:label id="lblMonetary" runat="server"></asp:label>
			<asp:textbox id="txtMonetary" runat="server" cssclass="InputNumeric" ontextchanged="StatusChanged"></asp:textbox></td>
	</tr>
</table>
