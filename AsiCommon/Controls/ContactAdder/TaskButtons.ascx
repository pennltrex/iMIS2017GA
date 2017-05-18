<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.ContactAdder.TaskButtons" Codebehind="TaskButtons.ascx.cs" %>
<asp:PlaceHolder id="ErrorMsgPlaceHolder" runat="server"></asp:PlaceHolder>
<table cellspacing="0" cellpadding="0" width="100%">
	<tr>
		<td valign="middle" align="left" style="white-space:nowrap;">
			<asiweb:StyledButton id="btnNew" value="btnNew" runat="server" class="ButtonNew"/>
		</td>
		<td valign="middle"  style="white-space:nowrap;" align="right">&nbsp; <asiweb:StyledButton id="btnClose" value="btnClose" runat="server" class="ButtonClose"/>
			<asiweb:StyledButton id="btnHelp" value="btnHelp" runat="server" class="ButtonHelp"/>
		</td>
	</tr>
</table>
