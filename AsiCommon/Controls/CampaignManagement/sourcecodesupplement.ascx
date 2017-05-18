<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.CampaignManagement.SourceCodeSupplement" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="SourceCodeSupplement.ascx.cs" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<table class="DataTable" cellSpacing="0" cellPadding="3" border="0">
	<tr>
		<td class="mdTitle" noWrap align="left" colSpan="2"><asp:label id="lblSelectedSupplement" runat="server"></asp:label></td>
	</tr>
	<tr>
		<td colSpan="2" align="middle" valign="top" style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px">
			<asp:placeholder id="phSelectedSupplement" runat="server"></asp:placeholder>
		</td>
	</tr>
	<tr>
		<td class="mdTitle" noWrap align="left"><asp:label id="lblAvailableSupplement" runat="server"></asp:label></td>
		<td align="right">
			<asiweb:StyledButton runat="server" id="btnAdd" />
		</td>
	</tr>
	<tr>
		<td colSpan="2" align="middle" valign="top" style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px">
			<asiweb:Lister id="ListerSupplementList" runat="server" DocumentPath="$/CampaignManagement/DefaultSystem/Queries/SupplementList" navigatenavmarker="CM.SourceCode" pagesize="20" linktargetbehavior="RaiseEvent" allowpaging="True"></asiweb:Lister>
		</td>
	</tr>
</table>
