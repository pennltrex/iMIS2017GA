<%@ Reference Control="~/asicommon/controls/shared/paramcollector/paramcontrolv2.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.ExportAtom.ExportAtomParamPanel" Codebehind="ExportAtomParamPanel.ascx.cs" %>
<table width="100%" cellpadding="2" cellspacing="1" border="0">
	<tr>
		<td class="PanelTablePrompt"><asp:Label id="lblParameters" runat="server"></asp:Label></td>
		<td class="PanelTableValue"><asp:PlaceHolder id="ParamCollectorPlaceHolder" runat="server"></asp:PlaceHolder></td>
	</tr>
</table>
