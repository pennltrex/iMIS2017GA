<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.PackageManagement.TaskButtons" Codebehind="TaskButtons.ascx.cs" %>
<%@ Register TagPrefix="asiwc" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<asp:PlaceHolder id="ErrorMsgPlaceHolder" runat="server"></asp:PlaceHolder>
<table cellspacing="0" cellpadding="0" width="100%">
	<tr>
		<td valign="middle" nowrap align="right">
			<asiweb:StyledButton ID="btnNew" Text="New Insert" runat="server" />
			<asiweb:StyledButton ID="btnClose" Text="Close"   Visible=False runat="server" />
		</td>
	</tr>
</table>
