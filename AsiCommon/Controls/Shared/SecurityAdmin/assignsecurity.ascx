<%@ Reference Control="~/asicommon/controls/shared/securityadmin/aclbuilder.ascx" %>
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SecurityAdmin.AssignSecurity" Codebehind="AssignSecurity.ascx.cs" %>
<asp:placeholder id="PlaceHolder2" runat="server"></asp:placeholder>
<div class="SpacerA"><asp:image id="Image1" runat="server" Width="1" BorderWidth="0" Height="1" ImageUrl="~/AsiCommon/Images/1.gif"></asp:image></div>
<TABLE id="Table1" cellSpacing="0" cellPadding="3" width="100%" border="0">
	<tr>
		<td class="PanelTablePrompt"><asp:label id="lblAccess" runat="server">lblAccess</asp:label></td>
		<td style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 1px; PADDING-TOP: 0px">
			<table cellSpacing="0" cellPadding="3" width="100%" border="0">
				<TR>
					<TD class="PanelTableValue"><asp:radiobutton id="radioShare" runat="server" AutoPostBack="True" GroupName="Mode" oncheckedchanged="RadioChecked"></asp:radiobutton></TD>
				</TR>
				<TR>
					<TD class="PanelTableValue"><asp:radiobutton id="radioPrivate" runat="server" AutoPostBack="True" GroupName="Mode" oncheckedchanged="RadioChecked"></asp:radiobutton></TD>
				</TR>
				<TR>
					<TD class="PanelTableValue"><asp:radiobutton id="radioAdvanced" runat="server" AutoPostBack="True" GroupName="Mode" oncheckedchanged="RadioChecked"></asp:radiobutton></TD>
				</TR>
			</table>
		</td>
	</tr>
	<TR>
		<TD class="PanelTablePrompt" vAlign="center"><asp:label id="lblAccessMode" runat="server"></asp:label></TD>
		<TD class="PanelTableValue" vAlign="center"><asp:dropdownlist id="DropDownList1" runat="server" AutoPostBack="True" cssclass="SelectStandard" onselectedindexchanged="DropDownList1_SelectedIndexChanged"></asp:dropdownlist></TD>
	</TR>
	<TR>
		<TD vAlign="center">&nbsp;</TD>
		<TD vAlign="top" style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 1px; PADDING-TOP: 0px"><asp:placeholder id="PlaceHolder1" runat="server"></asp:placeholder></TD>
	</TR>
</TABLE>
