<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.MailProcessEngine.MailQueryPanel" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="EmailQueryPanel.ascx.cs" %>
<asp:panel id="QueryPanel" runat="server">
	<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
	<TABLE cellSpacing="1" cellPadding="2" width="100%" border="0">
		<TR>
			<TD class="PanelTablePrompt">
				<asp:Label id="lblQueryExplorer" runat="server"></asp:Label></TD>
			<TD class="PanelTableValue" noWrap>
				<P>
					<asp:TextBox id="txtQuery" runat="server" ReadOnly="true" CssClass="ValueMediumReadOnly"></asp:TextBox>
					<asiweb:StyledButton id="btnQueryBrowse" runat="server" /></P>
			</TD>
		</TR>
		<TR>
			<TD class="PanelTablePrompt">
				<asp:Label id="lblToEmail" runat="server"></asp:Label></TD>
			<TD class="PanelTableValue" noWrap>
				<P>
					<asp:label id="lblCurrentColumns" runat="server" CssClass="mdTitle"></asp:label></P>
				<P>
					<asp:placeholder id="PlaceholderCurrentCols" runat="server"></asp:placeholder></P>
				<P>
					<asp:label id="lblAllColumns" runat="server" CssClass="mdTitle"></asp:label></P>
				<P>
					<asp:placeholder id="PlaceholderAllCols" runat="server"></asp:placeholder></P>
			</TD>
		</TR>
	</TABLE>
</asp:panel>
