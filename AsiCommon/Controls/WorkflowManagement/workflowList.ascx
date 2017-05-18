<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.WorkflowManagement.TaskList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="WorkflowList.ascx.cs" %>

<asp:placeholder id="phTaskBar" runat="server"></asp:placeholder>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

<table cellspacing="0" cellpadding="3" width="100%" border="0">
	<asp:panel id="pnlTitle" runat="server">
   		<tr>
  			<td class="lgTitle" nowrap><asp:label id="lblWorkflowMonitor" runat="server"></asp:label></td>
  		</tr>	
	</asp:panel>
	<tr>
		<td align="center">
			<asiweb:lister id="ListerWF" runat="server" EnableViewState="false" allowpaging="True" linktargetbehavior="RaiseEvent"
				pagesize="20" documentpath="$/Common/Queries/WorkflowManagement/WorkflowList"></asiweb:lister>
		</td>
	</tr>
</table>