<%@ Register TagPrefix="asiwc" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.RFM.RFMAtomDefinition" Codebehind="RFMAtomDefinition.ascx.cs" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<table class="DataTable" cellspacing="0" cellpadding="3" border="0">
	<tr>
		<td class="PanelTablePrompt formFieldRequired"><asp:label id="lblRFMName" runat="server"></asp:label></td>
		<td class="PanelTableValue"><asp:textbox id="txtRFMName" runat="server"></asp:textbox></td>
	</tr>
	<tr>
		<td class="PanelTablePrompt">
			<asp:label id="lblDescription" runat="server"></asp:label></td>
		<td class="PanelTableValue"><asp:textbox id="txtDescription" runat="server" textmode="MultiLine"></asp:textbox></td>
	</tr>
	<tr>
		<td class="PanelTablePrompt formFieldRequired"><asp:label id="lblPopulationQuery" runat="server"></asp:label></td>
		<td class="PanelTableValue">
		    <asp:linkbutton id="lbtnPopulationQueryName" runat="server" cssclass="LinkButton" visible="False" onclick="lbtnPopulationQueryName_Click"></asp:linkbutton>&nbsp;
		    <asiweb:StyledButton ID="btnGetQueryPopulation" runat="server" OnClick="btnGetQueryPopulation_ServerClick" />
		    <asiweb:StyledButton ID="btnCreateQueryPopulation" runat="server" OnClick="btnCreateQueryPopulation_ServerClick" />
		    <asiweb:StyledButton ID="btnClearQueryPopulation" runat="server" OnClick="btnClearQueryPopulation_ServerClick" />
		</td>
	</tr>
	<tr>
		<td class="PanelTablePrompt formFieldRequired"><asp:label id="lblTransactionQuery" runat="server"></asp:label></td>
		<td class="PanelTableValue">
		    <asp:linkbutton id="lbtnTransactionQueryName" runat="server" cssclass="LinkButton" visible="False" onclick="lbtnTransactionQueryName_Click"></asp:linkbutton>&nbsp;
		    <asiweb:StyledButton id="btnGetQueryTransaction" runat="server" onclick="btnGetQueryTransaction_ServerClick" /> 
		    <asiweb:StyledButton id="btnCreateQueryTransaction" runat="server" onclick="btnCreateQueryTransaction_ServerClick" />
		    <asiweb:StyledButton id="btnClearQueryTransaction" runat="server" onclick="btnClearQueryTransaction_ServerClick" />
		</td>
	</tr>
</table>
