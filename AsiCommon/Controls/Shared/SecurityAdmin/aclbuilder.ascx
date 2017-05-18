
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SecurityAdmin.ACLBuilder" Codebehind="ACLBuilder.ascx.cs" %>
<asp:placeholder id="phErrorMessage" runat="server"></asp:placeholder>
<table id="Table1" cellSpacing="0" cellPadding="3" border="0" width="100%">
	<tr>
		<td Class="mdTitle">
			<asp:Label id="lblSelected" runat="server"></asp:Label></td>
	</tr>
	<tr>
		<td vAlign="top"><asp:placeholder id="phAccessItems" runat="server"></asp:placeholder></td>
	</tr>
	<tr>
		<td>
			<div class="HLine"><asp:Image id="imgSpacer" runat="server" ImageUrl="~/AsiCommon/Images/1.gif"></asp:Image></div>
		</td>
	</tr>
	<tr>
		<td Class="mdTitle">
			<asp:Label id="lblAvailable" runat="server"></asp:Label></td>
	</tr>
	<tr>
		<td vAlign="top" style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px">
			<asiweb:Lister id="lstrAvailable" runat="server" LinkTargetBehavior="RaiseEvent" PageSize="20" DocumentPath="$/Common/Queries/SecurityAdministration/AccessGranteeList"></asiweb:Lister></td>
	</tr>
</table>
