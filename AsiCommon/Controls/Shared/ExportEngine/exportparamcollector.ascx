<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.ExportEngine.ExportParamCollector" Codebehind="ExportParamCollector.ascx.cs" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<table cellSpacing="0" cellPadding="3" width="100%" border="0">
	<tr>
		<td><asp:label id="SectionTitleLabel" runat="server" CssClass="mdTitle"></asp:label></td>
	</tr>
	<tr>
		<td align="right">
		    <asiweb:StyledButton id="btnRun" runat="server" OnClick="btnRun_ServerClick" />
		    <asiweb:StyledButton id="btnCancel" runat="server" OnClick="btnCancel_ServerClick" /></td>
	</tr>
	<tr>
		<td>
			<asp:PlaceHolder id="controlPlaceHolder" runat="server"></asp:PlaceHolder></td>
	</tr>
</table>
