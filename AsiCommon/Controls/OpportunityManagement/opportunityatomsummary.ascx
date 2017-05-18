<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.OpportunityAtomSummary" Codebehind="OpportunityAtomSummary.ascx.cs" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<img height="5" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/1.gif" width="1"><br>
<table class="SummaryTable" cellspacing="0" cellpadding="4" align="center">
	<tr>
		<td class="TitleSummary" nowrap align="left" colspan="5"><asp:label id="lblOpportunity" runat="server"></asp:label>&nbsp;</td>
	</tr>
	<tr>
		<td class="PanelTablePrompt"><asp:label id="lblName" runat="server"></asp:label></td>
		<td class="PanelTableValue" colspan="4"><asp:label id="lblNameValue" runat="server"></asp:label>&nbsp;</td>
	</tr>
	<tr>
		<td class="PanelTablePrompt"><asp:label id="lblDescription" runat="server"></asp:label></td>
		<td class="PanelTableValue" colspan="4"><asp:label id="lblDescriptionValue" runat="server"></asp:label>&nbsp;</td>
	</tr>
	<tr>
		<td class="PanelTablePrompt" nowrap style="HEIGHT: 27px"><asp:label id="lblType" runat="server"></asp:label></td>
		<td class="PanelTableValue" nowrap style="HEIGHT: 27px"><asp:label id="lblTypeValue" runat="server"></asp:label>&nbsp;</td>
		<td class="SpacerCell" style="WIDTH: 13px"><!---spacer cell---> &nbsp;</td>
		<td class="PanelTablePrompt" nowrap>
			<asp:label id="lblCreatedDate" runat="server"></asp:label></td>
		<td class="PanelTableValue" nowrap>
			<asp:label id="lblCreatedDateValue" runat="server"></asp:label>&nbsp;</td>
	</tr>
	<tr>
		<td class="PanelTablePrompt" nowrap></td>
		<td class="PanelTableValue" nowrap>&nbsp;</td>
		<td class="SpacerCell" style="WIDTH: 13px; HEIGHT: 27px"><!---spacer cell--->
			&nbsp;</td>
		<td class="PanelTablePrompt" nowrap style="HEIGHT: 27px">
			<asp:label id="lblCreateByUser" runat="server"></asp:label></td>
		<td class="PanelTableValue" nowrap style="HEIGHT: 27px">
			<asp:label id="lblCreatedByUserValue" runat="server"></asp:label>&nbsp;</td>
	</tr>
	<TR>
		<TD class="PanelTablePrompt" style="HEIGHT: 27px" noWrap></TD>
		<TD class="PanelTableValue" style="HEIGHT: 27px" noWrap></TD>
		<TD class="SpacerCell" style="WIDTH: 13px; HEIGHT: 27px"></TD>
		<TD class="PanelTablePrompt" style="HEIGHT: 27px" noWrap>
			<asp:label id="lblModifiedByUser" runat="server"></asp:label></TD>
		<TD class="PanelTableValue" style="HEIGHT: 27px" noWrap>
			<asp:label id="lblModfiedByUserValue" runat="server"></asp:label></TD>
	</TR>
</table>
<div class="SpacerB"><asp:image id="Image1" runat="server" imageurl="~/AsiCommon/Images/1.gif" width="1" height="1"
		borderwidth="0"></asp:image></div>
