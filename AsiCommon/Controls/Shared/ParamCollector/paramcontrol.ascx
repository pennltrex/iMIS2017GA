<%@ Reference Control="~/asicommon/controls/shared/paramcollector/paramcollectorcontrol.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.ParamCollector.ParamControl" Codebehind="ParamControl.ascx.cs" %>
<table cellSpacing="0" cellPadding="3" width="100%" border="0">
	<tr>
		<td align="left" vAlign="top">
			<asp:Label id="SectionTitleLabel" runat="server" CssClass="mdTitle"></asp:Label>
		</td>
	</tr>
	<tr>
		<td align="right">
		    <asiweb:StyledButton id="btnOk" runat="server" OnClick="btnOk_ServerClick" />
		    <asiweb:StyledButton id="btnCancel" runat="server" OnClick="btnCancel_ServerClick" /></td>
	</tr>
</table>
