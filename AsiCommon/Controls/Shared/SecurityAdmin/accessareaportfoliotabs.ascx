<%@ Reference Control="~/asicommon/controls/shared/securityadmin/accessareaedit.ascx" %>

<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SecurityAdmin.AccessAreaPortfolioTabs" Codebehind="AccessAreaPortfolioTabs.ascx.cs" %>
<asp:PlaceHolder id="PlaceHolder1" runat="server"></asp:PlaceHolder>
<table class="CommandBar" cellSpacing="0" cellPadding="0" border="0">
	<tr>
		<td vAlign="center" noWrap align="left" class="mdTitle">
			<asp:Label id="lblAccessList" runat="server"></asp:Label></td>
		<td vAlign="center" noWrap align="right">
			<asiweb:StyledButton runat="server" id="btnSave" OnClick="btnSave_ServerClick" />
			<asiweb:StyledButton runat="server" id="btnCancel" OnClick="btnCancel_ServerClick" /></td>
	</tr>
</table>
<table cellpadding="0" cellspacing="0" class="HTabTable" border="0">
	<tr class="HTabTR">
		<td class="HTabTD">
			<iewc:tabstrip SkinID="HorizontalTabStrip" id="HTabStrip1" runat="server" AutoPostBack="True" onselectedindexchange="HTabStrip1_SelectedIndexChange">
				<iewc:Tab Text="xDefinition"></iewc:Tab>
				<iewc:tabseparator defaultstyle="width:100%;"></iewc:tabseparator>
			</iewc:tabstrip></td>
	</tr>
	<tr>
		<td class="HTabBody" vAlign="top"><asp:placeholder id="SubSectionPlaceHolder" runat="server"></asp:placeholder></td>
	</tr>
</table>
