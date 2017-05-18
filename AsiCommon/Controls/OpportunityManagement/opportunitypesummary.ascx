<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.OpportunityPESummary" Codebehind="OpportunityPESummary.ascx.cs" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

<table class="SummaryTable" cellspacing="0" cellpadding="4">
	<tr>
		<td class="TitleSummary" nowrap align="left" colspan="4"><asp:label id="lblOpportunity" runat="server"/>&nbsp;</td>
	</tr>
	<tr>
		<td class="PanelTablePrompt"><asp:label id="lblName" runat="server"/></td>
		<td class="PanelTableValue" colspan="3"><asp:label id="lblNameValue" runat="server"/>&nbsp;</td>
	</tr>
	<tr>
		<td class="PanelTablePrompt"><asp:label id="lblDescription" runat="server"/></td>
		<td class="PanelTableValue" colspan="3"><asp:label id="lblDescriptionValue" runat="server"/>&nbsp;</td>
	</tr>
	<tr>
		<td class="PanelTablePrompt"><asp:label id="lblType" runat="server"/></td>
		<td class="PanelTableValue" colspan="3"><asp:label id="lblTypeValue" runat="server"/>&nbsp;</td>
	</tr>
	<tr>
		<td class="PanelTablePrompt"><asp:label id="lblCreatedDate" runat="server"/></td>
		<td class="PanelTableValue"><asp:label id="lblCreatedDateValue" runat="server"/>&nbsp;</td>
		<td class="PanelTablePrompt"><asp:label id="lblCreateByUser" runat="server"/></td>
		<td class="PanelTableValue" align="left"><asp:label id="lblCreatedByUserValue" runat="server"/>&nbsp;</td>
	</tr>
	<tr>
		<td class="PanelTablePrompt" nowrap><asp:label id="lblModifiedOn" runat="server"/></td>
		<td class="PanelTableValue" nowrap><asp:label id="lblModifiedOnValue" runat="server"/></td>
		<td class="PanelTablePrompt"><asp:label id="lblModifiedByUser" runat="server"/></td>
		<td class="PanelTableValue" align="left"><asp:label id="lblModfiedByUserValue" runat="server"/></td>
	</tr>
</table>
