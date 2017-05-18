
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SecurityAdmin.AccessAreaList" Codebehind="AccessAreaList.ascx.cs" %>
<table class="CommandBar" cellSpacing="0" cellPadding="0" width="100%">
	<tr>
		<td vAlign="center" noWrap align="left">&nbsp;</td>
		<td vAlign="center" noWrap align="right">
		    <asiweb:StyledButton id="btnNew" Text='<%# Asi.ResourceManager.GetPhrase("AddAccessList","Add Access List") %>' AutoPostBack="false" OnClientClick="NewWindow(gWebRoot + 'AsiNavigator.aspx?iNavMarker=SecurityAdmin.AccessAreaPortfolio','NewAccessArea','medium','standard');" runat="server" /></td>
	</tr>
</table>
<table id="Table1" cellSpacing="0" cellPadding="3" width="100%" border="0">
	<tr>
		<td class="lgTitle" nowrap><asp:Image id="imgAcessList" runat="server" CssClass="icon32" ImageAlign="AbsMiddle" ImageUrl="~/AsiCommon/Images/32/32_access_lists.gif"></asp:Image>&nbsp;<asp:label id="lblHeading" runat="server"></asp:label></td>
		<td align="right"></td>
	</tr>
	<tr>
		<td colSpan="2"><asiweb:Lister id="Lister1" runat="server" NavigateNavMarker="SecurityAdmin.AccessAreaPortfolio" LaunchedWindowSize="Medium" PageSize="15"></asiweb:Lister></td>
	</tr>
</table>
