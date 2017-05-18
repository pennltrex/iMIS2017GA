<%@ Reference Control="~/asicommon/controls/shared/paramcollector/paramcontrolv2.ascx" %>
<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.ReportingServices.ReportingServicesParamPanel" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="ReportingServicesParamPanel.ascx.cs" %>
<table width="100%" cellpadding="2" cellspacing="1" border="0">
	<tr>
		<td class="PanelTablePrompt PEControllerPrompt"><asp:Label id="lblParameters" runat="server"></asp:Label></td>
		<td class="PanelTableValue PEControllerValue"><asp:PlaceHolder id="ParamCollectorPlaceHolder" runat="server"></asp:PlaceHolder></td>
	</tr>
</table>
