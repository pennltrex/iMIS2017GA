<%@ Reference Control="~/asicommon/controls/shared/securityadmin/aclbuilder.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SecurityAdmin.AccessAreaEdit" Codebehind="AccessAreaEdit.ascx.cs" %>
<asp:PlaceHolder id="PlaceHolder2" runat="server"></asp:PlaceHolder>
<table id="Table1" cellSpacing="1" cellPadding="2" border="0" width="100%">
	<tr>
		<td class="PanelTablePrompt">
			<asp:Label id="lblName" runat="server"></asp:Label></td>
		<td class="PanelTableValue">
			<asp:TextBox id="txtName" runat="server" ontextchanged="txtName_TextChanged"></asp:TextBox></td>
	</tr>
	<tr>
		<td class="PanelTablePrompt">
			<asp:Label id="lblDescription" runat="server"></asp:Label></td>
		<td class="PanelTableValue">
			<asp:TextBox id="txtDescription" runat="server" ontextchanged="txtDescription_TextChanged"></asp:TextBox></td>
	</tr>
	<tr>
		<td vAlign="top" align="middle" colSpan="2" style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px">
			<asp:PlaceHolder id="PlaceHolder1" runat="server"></asp:PlaceHolder></td>
	</tr>
</table>
