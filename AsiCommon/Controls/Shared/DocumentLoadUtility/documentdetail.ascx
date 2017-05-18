<%@ Reference Control="~/asicommon/controls/shared/documentloadutility/documentloaderportfolio.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.DocumentLoadUtility.DocumentDetail" Codebehind="DocumentDetail.ascx.cs" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<table class="DataTable" cellspacing="1" cellpadding="2" align="center">
	<tr>
		<td class="PanelTablePrompt"><asp:label id="NameLabel" runat="server"></asp:label></td>
		<td class="PanelTableValue"><asp:textbox id="nameText" runat="server" ontextchanged="nameText_TextChanged"></asp:textbox>
		</td>
	</tr>
	<tr>
		<td class="PanelTablePrompt"><asp:label id="DescriptionLabel" runat="server"></asp:label></td>
		<td class="PanelTableValue"><asp:textbox id="descriptionText" runat="server" textmode="MultiLine" ontextchanged="descriptionText_TextChanged"></asp:textbox>
		</td>
	</tr>
</table>
