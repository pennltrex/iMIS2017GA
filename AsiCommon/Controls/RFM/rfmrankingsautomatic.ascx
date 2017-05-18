<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.RFM.RFMRankingsAutomatic" Codebehind="RFMRankingsAutomatic.ascx.cs" %>
<%@ Register TagPrefix="asiwc" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

<table class="Grid" cellspacing="1" cellpadding="3" width="75%" border="0" align="left">
	<tr><td colspan="3"><asp:label id="lblNumberOf" runat="server" cssclass="mdTitle"></asp:label></td></tr>
	<tr>
		<td align="center" valign="middle" class="PanelTablePrompt">
            <asiweb:BusinessTextBox ID="txtRecency" runat="server" RenderPanelField="true" DisplayCaption="true" positioncaption="Top" class="InputNumeric" OnTextChanged="StatusChanged" />
		<td align="center" valign="middle" class="PanelTablePrompt">
			<asiweb:BusinessTextBox ID="txtFrequency" runat="server" RenderPanelField="true" DisplayCaption="true" positioncaption="Top" class="InputNumeric" OnTextChanged="StatusChanged" />
		<td align="center" valign="middle" class="PanelTablePrompt">
			<asiweb:BusinessTextBox ID="txtMonetary" runat="server" RenderPanelField="true" DisplayCaption="true" positioncaption="Top" class="InputNumeric" OnTextChanged="StatusChanged" />
	</tr>
</table>
