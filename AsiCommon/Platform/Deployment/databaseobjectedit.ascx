<%@ Control Language="c#" Inherits="Asi.Web.UI.Deployment.DatabaseObjectEdit" Codebehind="DatabaseObjectEdit.ascx.cs" %>
<TABLE id="Table1" cellSpacing="0" cellPadding="0" width="100%" bgColor="white" border="0">
	<TR>
		<TD class="DataEntryHeader">
			<asp:Label id="TitleLabel" runat="server"></asp:Label></TD>
	</TR>
	<TR>
		<TD background="./Images/Templates/DataEntryBar.gif">
			<IMG height="10" alt="" src="./Images/Templates/spacer.gif" width="1" border="0"></TD>
	</TR>
	<TR>
		<TD>
			<TABLE id="Table2" cellSpacing="0" cellPadding="0" width="100%" bgColor="white" border="0">
				<TR>
					<TD class="PanelTablePrompt" noWrap>
						<asp:Label id="NameLabel" runat="server"></asp:Label></TD>
					<TD bgColor="#ece9d8">
						<asp:TextBox id="NameTextBox" runat="server" MaxLength="100"></asp:TextBox></TD>
				</TR>
				<TR>
					<TD class="PanelTablePrompt" noWrap>
						<asp:Label id="DescriptionLabel" runat="server"></asp:Label></TD>
					<TD bgColor="#ece9d8">
						<asp:TextBox id="DescriptionTextBox" runat="server" MaxLength="250" TextMode="MultiLine" Rows="2"></asp:TextBox></TD>
				</TR>
				<TR>
					<TD class="PanelTablePrompt" noWrap>
						<asp:Label id="IncludeDataLabel" runat="server"></asp:Label></TD>
					<TD bgColor="#ece9d8">
						<asp:CheckBox id="IncludeDataCheckBox" runat="server"></asp:CheckBox></TD>
				</TR>
				<TR>
					<TD class="PanelTablePrompt" noWrap>
						<asp:Label id="SelectionScriptLabel" runat="server"></asp:Label></TD>
					<TD bgColor="#ece9d8">
						<asp:TextBox id="SelectionScriptTextBox" runat="server" MaxLength="32000" TextMode="MultiLine"
							Rows="4" Width="400px" Height="200px"></asp:TextBox></TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
</TABLE>
