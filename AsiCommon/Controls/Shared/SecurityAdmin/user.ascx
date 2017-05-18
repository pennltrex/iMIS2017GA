<%@ Reference Control="~/asicommon/controls/shared/securityadmin/userroles.ascx" %>
<%@ Reference Control="~/asicommon/controls/shared/securityadmin/useredit.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SecurityAdmin.UserPortfolio" AutoEventWireup="true" Codebehind="User.ascx.cs" %>


<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<div class="SpacerA"><asp:Image height="1" ID="Image1" ImageUrl="~/AsiCommon/Images/1.gif" width="1" runat="server" /></div>
<table class="CommandBar" cellspacing="0" cellpadding="0">
	<tr>
		<td valign="middle" nowrap align="left"><asp:label id="lblTitle" cssclass="mdTitle" runat="server"></asp:label></td>
		<td valign="middle" nowrap align="right">
			<asiweb:StyledButton runat="server" id="btnSave" onclick="btnSave_ServerClick" CommandButtonType="Save" />
			<asiweb:StyledButton runat="server" id="btnCancel" onclick="btnCancel_ServerClick" CommandButtonType="Cancel" />
		</td>
	</tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
	<tr>
		<td valign="top" nowrap colspan="2">
			<div class="SpacerB"><asp:Image height="1" ID="Image2" ImageUrl="~/AsiCommon/Images/1.gif" width="8" runat="server"/></div>
		</td>
	</tr>
	<tr class="HTabTR">
		<td colspan="2">
			<iewc:tabstrip id="SubTabStrip" runat="server" SkinID="HorizontalTabStrip"
				autopostback="True" width="100%" onselectedindexchange="SubTabStrip_SelectedIndexChange">
				<iewc:tab text="xDefinition"></iewc:tab>
				<iewc:tabseparator></iewc:tabseparator>
				<iewc:tab text="xMemberOf"></iewc:tab>
				<iewc:tabseparator defaultstyle="width:100%;"></iewc:tabseparator>
			</iewc:tabstrip></td>
	</tr>
	<tr>
		<td class="HTabBody" valign="top" colspan="2"><asp:placeholder id="SubPlaceHolder" runat="server"></asp:placeholder></td>
	</tr>
</table>
