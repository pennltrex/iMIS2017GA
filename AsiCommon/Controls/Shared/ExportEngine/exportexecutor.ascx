<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.ExportEngine.ExportExecutor" Codebehind="ExportExecutor.ascx.cs" %>
<asp:PlaceHolder id="ErrorMsgPlaceHolder" runat="server"></asp:PlaceHolder>
<TABLE id="Table1" cellSpacing="0" cellPadding="3" width="100%" border="0">
	<TR>
		<TD>
			<asp:Label id="SectionTitleLabel" runat="server" CssClass="mdTitle"></asp:Label></TD>
	</TR>
	<TR>
		<TD align="right">
			<asiweb:StyledButton id="btnParams" runat="server" OnClick="btnParams_Click" />
			<asiweb:StyledButton id="btnCancel" runat="server" OnClick="btnCancel_Click" /></TD>
		</TD></TR>
	<TR>
		<TD class="ReportViewer" align="middle">
			<asp:PlaceHolder id="ExecutorPlaceHolder" runat="server"></asp:PlaceHolder></TD>
	</TR>
</TABLE>
