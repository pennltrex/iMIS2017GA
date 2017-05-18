<%@ Page language="c#" Inherits="ibosample.SignUp" Codebehind="SignUp.aspx.cs" %>
<%@ Register TagPrefix="uc1" TagName="Header" Src="Header.ascx" %>

<asp:Content id="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">

<asiweb:PanelTemplateControl ID="ContactFinderPanel" runat="server">

	    <asiweb:TemplateTitle ID="TemplateTitle1" runat="server">
	        <asp:Label id="FindContactTitle" runat="server">Sign Up</asp:Label>
	    </asiweb:TemplateTitle>
	    
			<uc1:Header id="Header" runat="server"></uc1:Header>
			<asp:Label id="Msg" runat="server" ForeColor="red"></asp:Label>
			<table cellSpacing="2" cellPadding="0" border="0">

				<tr>
					<td class="PanelTablePrompt"><asp:label id="FirstNameLabel" runat="server">First Name:</asp:label></td>
					<td class="PanelTableValue"><asp:textbox id="FirstName" runat="server" ontextchanged="DataChanged" Columns="25" MaxLength="20"></asp:textbox></td>
				</tr>
				<tr>
					<td class="PanelTablePrompt"><asp:label id="LastNameLabel" runat="server">Last Name:</asp:label></td>
					<td class="PanelTableValue"><asp:textbox id="LastName" runat="server" ontextchanged="DataChanged" Columns="25" MaxLength="30"></asp:textbox></td>
				</tr>
				<tr>
					<td class="PanelTablePrompt"><asp:label id="EmailAddressLabel" runat="server">E-mail Address:</asp:label></td>
					<td class="PanelTableValue"><asp:textbox id="EmailAddress" runat="server" ontextchanged="DataChanged" Columns="40" MaxLength="100"></asp:textbox></td>
				</tr>
				<tr>
					<td class="PanelTablePrompt"><asp:label id="WebLoginLabel" runat="server">New Login ID:</asp:label></td>
					<td class="PanelTableValue"><asp:textbox id="WebLogin" runat="server" Columns="30" MaxLength="60" ontextchanged="DataChanged"></asp:textbox></td>
				</tr>
				<tr>
					<td class="PanelTablePrompt"><asp:label id="PasswordLabel" runat="server">Please choose a password:</asp:label></td>
					<td class="PanelTableValue"><input class="DataEntry" id="Password" type="password" size="25" maxLength="50" name="Password"
							runat="server" onserverchange="DataChanged">
					</td>
				</tr>
				<tr>
					<td class="PanelTablePrompt"><asp:label id="ConfirmPasswordLabel" runat="server">Retype Password:</asp:label></td>
					<td class="PanelTableValue"><input class="DataEntry" id="ConfirmPassword" type="password" size="25" maxLength="50"
							name="ConfirmPassword" runat="server" onserverchange="DataChanged"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<asiweb:StyledButton id="SaveButton" runat="server" Text="Sign Up" />&nbsp;&nbsp;
						<asiweb:StyledButton id="ReturnButton" runat="server" AutoPostBack="false" OnClientClick="window.location='Default.aspx';" Text="Return" /></td>
				</tr>
			</table>
</asiweb:PanelTemplateControl>
</asp:Content>
