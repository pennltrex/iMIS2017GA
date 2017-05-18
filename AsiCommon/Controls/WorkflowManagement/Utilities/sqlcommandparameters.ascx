<%@ Register TagPrefix="wuc" TagName="SqlCommandTextPanel" Src="SqlCommandTextPanel.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.WorkflowManagement.Utilities.SqlCommandParameters" Codebehind="SqlCommandParameters.ascx.cs" %>
<P>
	<TABLE id="Table1" cellSpacing="0" cellPadding="2" border="0">
		<TR>
			<TD>
				<wuc:SqlCommandTextPanel id="TextPanel" runat="server"></wuc:SqlCommandTextPanel>
			</TD>
		</TR>
	</TABLE>
</P>
