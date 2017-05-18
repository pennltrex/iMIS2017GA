<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.QueryBuilder.TaskButtons" Codebehind="TaskButtons.ascx.cs" %>
<table cellspacing="0" cellpadding="0" width="100%" border="0">
	<tr>
		<td valign="center" nowrap align="left">
		</td>
		<td valign="center" nowrap align="right">
		    <asp:ImageButton runat="server" Height="18px" />
			<asiweb:StyledButton style="height:18px;" runat="server" id="btnClose" OnClick="btnClose_ServerClick" />
		</td>
	</tr>
</table>