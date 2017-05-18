<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.CampaignManagement.MemberExportPreview" Codebehind="MemberExportPreview.ascx.cs" %>

<asp:PlaceHolder id="ErrorMsgPlaceHolder" runat="server"></asp:PlaceHolder>
<table width="100%" cellpadding="3" cellspacing="0" border="0">
	<tr>
		<td>
			<asp:Label id="SectionTitleLabel" runat="server" CssClass="mdTitle"></asp:Label></td>
	</tr>
	<tr>
		<td align="right">
            <asiweb:StyledButton id="btnRun" runat="server" OnClick="btnRun_ServerClick" />
            <asiweb:StyledButton id="btnCancel" runat="server" OnClick="btnCancel_ServerClick" />
		</td>
	</tr>
	<tr>
		<td align="center" valign="top">
			<asiweb:Lister id="lstrResults" runat="server"></asiweb:Lister>
		</td>
	</tr>
</table>
