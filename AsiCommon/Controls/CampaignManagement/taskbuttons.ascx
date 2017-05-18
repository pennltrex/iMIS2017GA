<%@ Register TagPrefix="asiwc" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.CampaignManagement.TaskButtons" Codebehind="TaskButtons.ascx.cs" %>
<asp:PlaceHolder id="ErrorMsgPlaceHolder" runat="server"></asp:PlaceHolder>
<table cellspacing="0" cellpadding="0" width="100%" border="0">
	<tr>
		<td valign="middle" nowrap align="left">
			<asiweb:StyledButton runat="server" id="btnNew" Text="New Campaign" style="WIDTH: 122px" OnClick="btnNew_ServerClick" />
		</td>
		<td valign="middle" nowrap align="right">
			<asiweb:StyledButton runat="server" id="btnClose" OnClick="btnClose_ServerClick" />
		</td>
	</tr>
</table>
