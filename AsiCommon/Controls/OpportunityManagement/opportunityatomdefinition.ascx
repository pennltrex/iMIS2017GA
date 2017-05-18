<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.OpportunityAtomDefinition" Codebehind="OpportunityAtomDefinition.ascx.cs" %>
<%@ Register TagPrefix="asiwc" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<table class="DataTable" width="100%" cellspacing="1" cellpadding="2" border="0">
	<tr>
		<td class="PanelTablePrompt"><asp:label id="lblOpportunityName" runat="server"></asp:label>*</td>
		<td class="ValueColspan" colspan="3"><asp:textbox id="txtOpportunityName" runat="server"></asp:textbox></td>
	</tr>
	<tr>
    <TD class="PanelTablePrompt" ?>
<asp:label id=lblDescription runat="server"></asp:label></TD>
		<td class="ValueColspan" colSpan=3><asp:textbox id="txtDescription" runat="server" textmode="MultiLine"></asp:textbox></td>
	</tr>
	<tr>
		<td class="PanelTablePrompt"><asp:label id="lblType" runat="server"></asp:label>*</td>
		<TD class="ValueColspan">
			<asp:dropdownlist id=cboType runat="server" cssclass="SelectStandard" onselectedindexchanged="cboType_SelectedIndexChanged"></asp:dropdownlist></TD>
		<td class="ValueColspan" colspan="2"></td></TD>
	</tr>
</table>
