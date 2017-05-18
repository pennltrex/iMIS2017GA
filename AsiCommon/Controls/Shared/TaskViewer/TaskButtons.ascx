<%@ Control Language="c#" AutoEventWireup="false" Codebehind="TaskButtons.ascx.cs" Inherits="Asi.Web.UI.Common.Tasks.TaskButtons" TargetSchema="http://schemas.microsoft.com/intellisense/ie5"%>
<%@ Register TagPrefix="asiwc" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<table class="TaskTableWithin" cellspacing="0" cellpadding="3" width="100%">
	<tr class="TaskBarWithin">
		<td valign="middle" nowrap align="right">
			<asiwc:helpbutton runat="server" id="btnHelp" cssclass="ButtonHelp" imageurl="~/AsiCommon/Images/3x3.gif"></asiwc:helpbutton>
		</td>
	</tr>
</table>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
