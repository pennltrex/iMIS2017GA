<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.ReportingServices.ReportingServicesPEDesignerTab3" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="ReportingServicesPEDesignerTab3.ascx.cs" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<asp:checkbox id="chkRuntime" runat="server"></asp:checkbox>
<asp:checkbox id="chkLogging" runat="server" Text="Enable batch logging"></asp:checkbox>

<table class="DataTable" cellSpacing="1" cellPadding="2" border="0">
	<tr>
		<td class="PanelTablePrompt">
			<asp:label id="lblOutput" runat="server"></asp:label></td>
		<td class="PanelTableValue">
			<asp:dropdownlist id="cboOutput" runat="server" AutoPostBack="True"></asp:dropdownlist>
		</td>
	</tr>
	<asp:panel id="Panel1" runat="server">
		<TR>
			<TD class="PanelTablePrompt">
				<asp:Label id="lblMargins" runat="server"></asp:Label></TD>
			<TD class="PanelTableValue">
				<TABLE cellSpacing="0" cellPadding="2" width="90%" border="0">
					<TR>
						<TD noWrap>
							<asp:Label id="lblTop" runat="server"></asp:Label>
							<asp:TextBox id="txtTop" runat="server" Width="50"></asp:TextBox>
							<asp:RangeValidator id="TopValidator" runat="server" MaximumValue="2" EnableClientScript="False" Type="Double"
								MinimumValue="0" ControlToValidate="txtTop" Display="Dynamic"></asp:RangeValidator></TD>
						<TD noWrap>
							<asp:Label id="lblBottom" runat="server"></asp:Label>
							<asp:TextBox id="txtBottom" runat="server" Width="50"></asp:TextBox>
							<asp:RangeValidator id="BottomValidator" runat="server" MaximumValue="2" EnableClientScript="False"
								Type="Double" MinimumValue="0" ControlToValidate="txtBottom" Display="Dynamic"></asp:RangeValidator></TD>
						<TD noWrap>
							<asp:Label id="lblLeft" runat="server"></asp:Label>
							<asp:TextBox id="txtLeft" runat="server" Width="50"></asp:TextBox>
							<asp:RangeValidator id="LeftValidator" runat="server" MaximumValue="2" EnableClientScript="False" Type="Double"
								MinimumValue="0" ControlToValidate="txtLeft" Display="Dynamic"></asp:RangeValidator></TD>
					</TR>
				</TABLE>
			</TD>
		</TR>
	</asp:panel>
	<tr>
		<td class="PanelTablePrompt"></td>
		<td class="PanelTableValue">
			<asp:checkbox id="chkSeparatePages" runat="server" Text="Show results on multiple pages"></asp:checkbox></td>
	</tr>
</table>
