

<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.OpportunityAtomDesigner" Codebehind="OpportunityAtomDesigner.ascx.cs" %>
<asp:PlaceHolder id="ErrorMsgPlaceHolder" runat="server"></asp:PlaceHolder>

<table class="HTabTable" cellSpacing="0" cellPadding="0" border="0">
	<tr class="HTabTR">
		<td class="HTabTD">
			<iewc:tabstrip SkinID="HorizontalTabStrip" id="SubSectionTabStrip" runat="server" AutoPostBack="True" onselectedindexchange="SubSectionTabStrip_SelectedIndexChange"></iewc:tabstrip>
		</td>
	</tr>
	<tr>
		<td class="HTabBody" vAlign="top">
			<asp:PlaceHolder id="TabPlaceHolder" runat="server"></asp:PlaceHolder>
		</td>
	</tr>
</table>
