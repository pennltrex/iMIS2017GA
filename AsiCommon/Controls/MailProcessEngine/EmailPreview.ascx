<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.MailProcessEngine.EmailPreview1" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="EmailPreview.ascx.cs" %>

<asp:PlaceHolder id="ErrorMsgPlaceHolder" runat="server"></asp:PlaceHolder>
<table width="100%" cellpadding="3" cellspacing="0" border="0">
	<tr>
		<td>
			<asp:Label id="SectionTitleLabel" runat="server" CssClass="mdTitle"></asp:Label></td>
	</tr>
	<tr>
		<td align="right">
			<asiweb:StyledButton id="btnBack" runat="server" />
			<asiweb:StyledButton ID="btnRun" Runat="server" /> 
			<asiweb:StyledButton id="btnCancel" runat="server" /></td>
	</tr>
	<tr>
		<td align="center" valign="top">
			<asiweb:Lister id="lstrResults" runat="server"></asiweb:Lister></td>
	</tr>
</table>
