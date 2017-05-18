<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.OpportunityAtomExecutor" Codebehind="OpportunityAtomExecutor.ascx.cs" %>
<asp:PlaceHolder id="ErrorMsgPlaceHolder" runat="server"></asp:PlaceHolder>
<table width="100%" cellpadding="3" cellspacing="0" border="0">
	<tr>
		<td align="right">&nbsp; 
		    <asiweb:StyledButton id="btnCancel" runat="server" OnClick="btnCancel_ServerClick" />
		</td>
	</tr>
</table>
