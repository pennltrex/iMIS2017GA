


<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.WorkflowManager.Workflow" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="Workflow.ascx.cs" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<table cellspacing="0" cellpadding="3" width="100%" border="0">
	<tr>
		<td valign="top">
			<table class="CommandBar" cellspacing="0" cellpadding="0" width="100%">
				<tr>
					<td valign="middle" nowrap align="left">&nbsp;</td>
					<td valign="middle" nowrap align="right">
					    <asiweb:StyledButton id="btnDelete" runat="server" /> 
					    <asiweb:StyledButton id="btnRequeue" runat="server" />
					</td>
				</tr>
			</table>
			<table cellspacing="0" cellpadding="0" width="100%">
				<tr class="HTabRow">
					<td colspan="2"><iewc:tabstrip id="SubTabStrip" runat="server" SkinID="HorizontalTabStrip"
							autopostback="True" width="100%">
							<iewc:tab text="xWorkflow"></iewc:tab>
							<iewc:tabseparator defaultstyle="width:100%;"></iewc:tabseparator>
						</iewc:tabstrip></td>
				</tr>
				<tr>
					<td class="HTabBody" valign="top" colspan="2"><asp:placeholder id="SubPlaceHolder" runat="server"></asp:placeholder></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
