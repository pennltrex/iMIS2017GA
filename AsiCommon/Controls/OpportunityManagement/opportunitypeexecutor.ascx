<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.OpportunityPEExecutor" Codebehind="OpportunityPEExecutor.ascx.cs" %>
<table width="100%" cellpadding="3" cellspacing="0" border="0">
	<tr>
		<td>
			<asp:Label id="SectionTitleLabel" runat="server" CssClass="mdTitle"/>
		</td>
	</tr>
	<tr>
		<td align="right">
			<asiweb:StyledButton id="btnCancel" runat="server"/>
		</td>
	</tr>
	<tr>
		<td class="ReportViewer" align="center">
			<asp:PlaceHolder id="ErrorMsgPlaceHolder" runat="server"/>
			<asp:PlaceHolder id="ExecutorPlaceHolder" runat="server"/>
		</td>
	</tr>
</table>
