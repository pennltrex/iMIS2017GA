<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Utilities.SqlCommandDesign" Codebehind="SqlCommandDesign.ascx.cs" %>
<%@ Register TagPrefix="wuc" TagName="SqlCommandTextPanel" Src="SqlCommandTextPanel.ascx" %>
<P>
	<TABLE id="Table1" cellSpacing="0" cellPadding="2" border="0">
		<TR>
			<TD>
				<wuc:SqlCommandTextPanel id="TextPanel" runat="server"></wuc:SqlCommandTextPanel>
			</TD>
		</TR>
		<TR>
			<TD>
				<asp:CheckBox id="RuntimeCheckBox" runat="server" Text="xAllow User to Modify at Runtime"></asp:CheckBox></TD>
		</TR>
	</TABLE>
</P>
