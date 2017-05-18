<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.ReportingServices.ReportingServicesOutputPanel" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="ReportingServicesOutputPanel.ascx.cs" %>
<table width="100%" cellpadding="2" cellspacing="1" border="0">
	<tr>
		<td class="PanelTablePrompt"><asp:label id="lblOutput" runat="server">Output Device</asp:label></td>
		<td class="PanelTableValue"><asp:dropdownlist id="cboOutput" runat="server" autopostback="True"></asp:dropdownlist></td>
	</tr>
	<asp:panel id="Panel1" runat="server">
		<tr>
			<td class="PanelTablePrompt">
				<asp:label id="lblMargins" runat="server">Margins</asp:label></td>
			<td class="PanelTableValue">
				<table cellspacing="0" cellpadding="2" width="90%" border="0">
					<tr>
						<td nowrap>
							<asp:label id="lblTop" runat="server">Top</asp:label>
							<asp:textbox id="txtTop" runat="server" cssclass="ValueNumeric"></asp:textbox>
							<asp:rangevalidator id="TopValidator" runat="server" display="Dynamic" controltovalidate="txtTop" minimumvalue="0"
								type="Double" enableclientscript="False" maximumvalue="2"></asp:rangevalidator></td>
						<td nowrap>
							<asp:label id="lblBottom" runat="server">Bottom</asp:label>
							<asp:textbox id="txtBottom" runat="server" cssclass="ValueNumeric"></asp:textbox>
							<asp:rangevalidator id="BottomValidator" runat="server" display="Dynamic" controltovalidate="txtBottom"
								minimumvalue="0" type="Double" enableclientscript="False" maximumvalue="2"></asp:rangevalidator></td>
						<td nowrap>
							<asp:label id="lblLeft" runat="server">Left</asp:label>
							<asp:textbox id="txtLeft" runat="server" cssclass="ValueNumeric"></asp:textbox>
							<asp:rangevalidator id="LeftValidator" runat="server" display="Dynamic" controltovalidate="txtLeft"
								minimumvalue="0" type="Double" enableclientscript="False" maximumvalue="2"></asp:rangevalidator></td>
					</tr>
				</table>
			</td>
		</tr>
	</asp:panel>
	<tr>
		<td class="PanelTablePrompt"></td>
		<td class="PanelTableValue">
			<asp:checkbox id="chkSeparatePages" runat="server" text="Show results on multiple pages"></asp:checkbox></td>
	</tr>
</table>
