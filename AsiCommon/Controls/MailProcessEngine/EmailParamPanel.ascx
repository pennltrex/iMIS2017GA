<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.MailProcessEngine.MailParamPanel" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="EmailParamPanel.ascx.cs" %>
<%@ Reference Control="~/asicommon/controls/shared/paramcollector/paramcontrolv2.ascx" %>
<table width="100%" cellpadding="2" cellspacing="1" border="0">
	<tr>
		<td class="PanelTablePrompt"><asp:Label id="lblParameters" runat="server"></asp:Label></td>
		<td class="PanelTableValue"><asp:PlaceHolder id="ParamCollectorPlaceHolder" runat="server"></asp:PlaceHolder></td>
	</tr>
</table>
