<%@ Register TagPrefix="asiwc" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.WorkflowManager.TaskButtons" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="TaskButtons.ascx.cs" %>
<table class="TaskTableWithin" cellspacing="0" cellpadding="3" width="100%">
	<tr class="TaskBarWithin">
		<td valign="middle" nowrap align="right">
			<asiwc:helpbutton runat="server" id="btnHelp" cssclass="ButtonHelp" imageurl="~/AsiCommon/Images/3x3.gif"></asiwc:helpbutton>
		</td>
	</tr>
</table>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
