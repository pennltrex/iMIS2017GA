<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.WordMergeEngine.WordMergePEDesignerTab1" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="WordMergePEDesignerTab1.ascx.cs" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<table class="DataTable" cellspacing="1" cellpadding="2" border="0">
	<tr>
		<td class="PanelTablePrompt"><%#Asi.ResourceManager.GetWord("Name")%></td>
		<td class="PanelTableValue">
			<table cellspacing="0" cellpadding="0" width="100%" border="0">
				<tr>
					<td><asp:textbox id="txtName"   runat="server" maxlength="50" Text="<%#mEngine.Document.Name%>"></asp:textbox></td>
					<td align="left"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="PanelTablePrompt"><%#Asi.ResourceManager.GetWord("Description")%></td>
		<td class="PanelTableValue"><asp:textbox id="txtDescription" runat="server" maxlength="250" textmode="MultiLine" Text="<%#mEngine.Document.Description%>"></asp:textbox></td></tr>
</table>
