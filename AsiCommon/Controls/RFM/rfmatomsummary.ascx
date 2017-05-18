<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.RFM.RFMAtomSummary" Codebehind="RFMAtomSummary.ascx.cs" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder><img height="5" src="<%= Asi.Web.Utilities.GetTildeExpansion() %>/AsiCommon/Images/1.gif" width="1"><br>
<table class="SummaryTable" cellspacing="0" cellpadding="4" align="center">
	<tr>
		<td class="TitleSummary" nowrap align="left" colspan="5"><asp:label id="lblRFM" runat="server"></asp:label>&nbsp;</td>
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
		<td class="PanelTablePrompt" nowrap><asp:label id="lblQueryNamePopulation" runat="server"></asp:label></td>
		<td class="PanelTableValue"><asp:label id="lblQueryPopulationNameValue" runat="server"></asp:label>&nbsp;</td>
		<td class="SpacerCell"><!---spacer cell---> &nbsp;</td>
		<td class="PanelTablePrompt" nowrap><asp:label id="lblCreatedDate" runat="server"></asp:label></td>
		<td class="PanelTableValue" nowrap><asp:label id="lblCreatedDateValue" runat="server"></asp:label>&nbsp;</td>
	</tr>
	<tr>
		<td class="PanelTablePrompt" nowrap><asp:label id="lblQueryNameTransaction" runat="server"></asp:label></td>
		<td class="PanelTableValue"><asp:label id="lblQueryTransactionNameValue" runat="server"></asp:label>&nbsp;&nbsp;</td>
		<td class="SpacerCell"><!---spacer cell---> &nbsp;</td>
		<td class="PanelTablePrompt" nowrap><asp:label id="lblCreateByUser" runat="server"></asp:label></td>
		<td class="PanelTableValue" nowrap><asp:label id="lblCreatedByUserValue" runat="server"></asp:label>&nbsp;</td>
	</tr>
	<tr>
		<td class="PanelTablePrompt" nowrap></td>
		<td class="PanelTableValue" nowrap></td>
		<td class="SpacerCell"><!---spacer cell---> &nbsp;</td>
		<td class="PanelTablePrompt" nowrap><asp:label id="lblModifiedDate" runat="server"></asp:label></td>
		<td class="PanelTableValue" nowrap><asp:label id="lblModifiedDateValue" runat="server"></asp:label>&nbsp;</td>
	</tr>
	<tr>
		<td class="PanelTablePrompt" nowrap></td>
		<td class="PanelTableValue" nowrap></td>
		<td class="SpacerCell"><!---spacer cell---> &nbsp;</td>
		<td class="PanelTablePrompt" nowrap><asp:label id="lblModifiedByUser" runat="server"></asp:label></td>
		<td class="PanelTableValue" nowrap><asp:label id="lblModfiedByUserValue" runat="server"></asp:label>&nbsp;</td>
	</tr>
	<tr>
		<td class="PanelTablePrompt" nowrap></td>
		<td class="PanelTableValue" nowrap></td>
		<td class="SpacerCell"><!---spacer cell---> &nbsp;</td>
		<td class="PanelTablePrompt" nowrap><asp:label id="lblLastRunDate" runat="server"></asp:label></td>
		<td class="PanelTableValue" nowrap><asp:label id="lblLastRunDateValue" runat="server"></asp:label>&nbsp;</td>
	</tr>
	<tr>
		<td valign="middle" nowrap align="left" colspan="5"><asp:image id="imgBulletTrue" runat="server" borderwidth="0" imageurl="~/AsiCommon/Images/icon_bullettrue.gif"
				imagealign="AbsMiddle" visible="False"></asp:image>
			<asp:image id="imgBulletFalse" runat="server" borderwidth="0" imageurl="~/AsiCommon/Images/icon_bulletfalse.gif"
				imagealign="AbsMiddle" visible="False"></asp:image>
			<asp:label id="lblListCreated" runat="server" cssclass="StatusProcess"></asp:label>&nbsp;</td>
	</tr>
</table>
