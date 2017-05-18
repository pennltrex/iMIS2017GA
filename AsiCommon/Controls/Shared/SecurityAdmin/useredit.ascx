<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SecurityAdmin.UserEdit" AutoEventWireup="true" Codebehind="UserEdit.ascx.cs" %>

<asp:placeholder id="PlaceHolder1" runat="server"></asp:placeholder>
<table class="DataTable" cellspacing="1" cellpadding="2" border="0">
	<tr>
		<td class="PanelTablePrompt"><asp:label id="lblUserId" runat="server"></asp:label></td>
		<td class="PanelTableValue">
            <asp:Label ID="lblUserIdText" runat="server"></asp:Label></td>
	</tr>
	<tr>
		<td class="PanelTablePrompt" nowrap><asp:label id="lblPassword" runat="server"></asp:label>
			<asp:label id="lblReq1" runat="server">*</asp:label></td>
		<td class="PanelTableValue" nowrap><asp:textbox id="txtPassword" runat="server" textmode="Password" ontextchanged="txtPassword_TextChanged"></asp:textbox><br>
			<asp:label id="lblPasswordMessage" runat="server" visible="False"></asp:label></td>
	</tr>
	<tr>
		<td class="PanelTablePrompt" nowrap><asp:label id="lblConfirmPassword" runat="server"></asp:label>
			<asp:label id="lblReq2" runat="server">*</asp:label></td>
		<td class="PanelTableValue"><asp:textbox id="txtConfirmPassword" runat="server" textmode="Password"></asp:textbox></td>
	</tr>
	<tr>
		<td class="PanelTablePrompt"><asiweb:BusinessLabel id="lblExpires" runat="server"></asiweb:BusinessLabel>*</td>
		<td class="PanelTableValue" nowrap><asiweb:SmartControl id="scExpDate" runat="server"></asiweb:SmartControl></td>
	</tr>
	<tr>
		<td class="PanelTablePrompt"><asp:label id="lblDisabled" runat="server"></asp:label></td>
		<td class="PanelTableValue"><asp:checkbox id="ckDisabled" runat="server" oncheckedchanged="ckDisabled_CheckedChanged"></asp:checkbox></td>
	</tr>
</table>
&nbsp;
