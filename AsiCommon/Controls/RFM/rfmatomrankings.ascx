<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.RFM.RFMAtomRankings" Codebehind="RFMAtomRankings.ascx.cs" %>
<%@ Register TagPrefix="asiwc" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<table class="DataTable" cellspacing="1" cellpadding="3" width="100%" border="0">
	<tr>
		<td class="PanelTablePrompt"><asp:label id="lblRanges" runat="server"></asp:label></td>
		<td class="PanelTableValue" nowrap>
			<asp:radiobuttonlist id="rblRange" runat="server" autopostback="True" repeatdirection="Horizontal" onselectedindexchanged="StatusChanged"></asp:radiobuttonlist></td>
	</tr>
</table>
<asp:placeholder id="SubPlaceHolder" runat="server"></asp:placeholder>