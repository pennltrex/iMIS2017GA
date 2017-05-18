<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SecurityAdmin.UserList" Codebehind="UserList.ascx.cs" %>

<table id="Table1" cellSpacing="0" cellPadding="3" width="100%" border="0">
	<tr>
		<td class="lgTitle" nowrap><asp:Image id="imgUser" runat="server" CssClass="icon32" ImageAlign="AbsMiddle" ImageUrl="~/AsiCommon/Images/32/32_users.gif"></asp:Image>&nbsp;<asp:label id="lblHeading" runat="server"></asp:label></td>
		<td align="right"></td>
	</tr>
	<tr>
		<td colspan="2">
			<asiweb:Lister id="Lister1" runat="server" NavigateNavMarker="SecurityAdmin.UserPortfolio" 
			    DocumentPath="$/Common/Queries/SecurityAdministration/UserList" LaunchedWindowType="modal" LaunchedWindowSize="Medium" 
			    PageSize="15"></asiweb:Lister></td>
	</tr>
</table>
