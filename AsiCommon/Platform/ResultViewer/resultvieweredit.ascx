<%@ Control Language="c#" Inherits="Asi.Web.UI.ResultViewer.ResultViewerEdit" Codebehind="ResultViewerEdit.ascx.cs" %>
<TABLE id="Table1" cellSpacing="2" cellPadding="0" border="0">
	<TR>
		<TD>
			<asp:Label id="NameLabel" runat="server">Name</asp:Label></TD>
		<TD>
			<asp:TextBox id="NameTextBox" runat="server" Width="350"></asp:TextBox></TD>
	</TR>
	<TR>
		<TD>
			<asp:Label id="DescriptionLabel" runat="server">Description</asp:Label></TD>
		<TD>
			<asp:TextBox id="DescriptionTextBox" runat="server" TextMode="MultiLine" Width="350"></asp:TextBox></TD>
	</TR>
	<TR>
		<TD>
			<asp:Label id="TypeLabel" runat="server">Type</asp:Label></TD>
		<TD>
			<asp:TextBox id="TypeTextBox" runat="server" Width="350">Asi.Web.UI.ResultViewer.QueryResultGrid, Asi.Platform.Web</asp:TextBox>
			<asp:Button id="ApplyButton" runat="server" Text="Apply"></asp:Button></TD>
	</TR>
	<TR>
		<TD valign="top">
			<asp:Label id="PropertiesLabel" runat="server">Properties</asp:Label></TD>
		<TD valign="top">
			<asp:PlaceHolder id="GridPlaceholder" runat="server"></asp:PlaceHolder></TD>
		<TD></TD>
	</TR>
</TABLE>
