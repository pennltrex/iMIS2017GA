<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.ReportingServices.ReportingServicesParamCollector" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="ReportingServicesParamCollector.ascx.cs" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<table cellSpacing="0" cellPadding="3" width="100%" border="0">
	<tr>
		<td><asp:label id="SectionTitleLabel" runat="server" CssClass="mdTitle"></asp:label></td>
	</tr>
	<tr>
		<td class="CommandBar">
		    <asiweb:StyledButton id="btnPreview" runat="server" />
		    <asiweb:StyledButton id="btnRun" runat="server" />
		    <asiweb:StyledButton id="btnCancel" runat="server" />
		</td>
	</tr>
	<tr>
		<td>
			<asp:PlaceHolder id="controlPlaceHolder" runat="server"></asp:PlaceHolder></td>
	</tr>
</table>
