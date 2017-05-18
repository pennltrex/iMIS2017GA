<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.MailProcessEngine.EmailPEDesignerTab1" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="EmailPEDesignerTab1.ascx.cs" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<table class="DataTable" cellSpacing="0" cellPadding="3" border="0">
	<tr>
		<td class="PanelTablePrompt"><asp:label id="lblName" runat="server"></asp:label></td>
		<td class="PanelTableValue"><asp:textbox id="txtName" runat="server" AutoPostBack="false" MaxLength="50" Rows="3"></asp:textbox></td>
	</tr>
	<tr>
		<td class="PanelTablePrompt"><asp:label id="lblDescription" runat="server"></asp:label></td>
		<td class="PanelTableValue"><asp:textbox id="txtDescription" runat="server" MaxLength="250" TextMode="MultiLine"></asp:textbox></td>
	<tr>
		<td class="PanelTablePrompt"></td>
		<td class="PanelTableValue">
			<p><asp:checkbox id="chkPreview" runat="server"></asp:checkbox></p>
			<p><asp:Label id="lblRequiredField" runat="server"></asp:Label></p>
		</td>
	</tr>
</table>
