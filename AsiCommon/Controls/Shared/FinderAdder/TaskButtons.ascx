<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.FinderAdder.TaskButtons" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="TaskButtons.ascx.cs" %>
<asp:PlaceHolder id="ErrorMsgPlaceHolder" runat="server"></asp:PlaceHolder>
<table cellspacing="0" cellpadding="0" width="100%">
	<tr>
		<td valign="middle" nowrap align="left">
			<asiweb:StyledButton id="btnNew" runat="server" />
		</td>
		<td valign="middle" nowrap align="right">
			<asiweb:StyledButton id="btnClose" runat="server" />
			<asiweb:StyledButton id="btnHelp" runat="server" />
		</td>
	</tr>
</table>
