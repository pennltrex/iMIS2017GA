<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.GenericList" Codebehind="GenericList.ascx.cs" %>

<asp:Label id="lblErrorMessage" runat="server" Visible="False"></asp:Label>

<table cellSpacing="0" cellPadding="5" width="100%" border="0">
	<tr>
		<td>
			<table cellSpacing="0" cellPadding="0" width="99%" border="0">
				<tr>
					<td>
						<table cellSpacing="0" cellPadding="0" border="0">
							<tr>
								<td class="PanelTitle" noWrap><asp:label id="lblHeading" runat="server"></asp:label></td>
								<td class="PanelSeperator" width="99%">
								<td vAlign="middle"><asp:Image height="1" ImageUrl="~/AsiCommon/Images/HI/panel_3dots.gif">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="right"><asiweb:StyledButton id="btnNew" runat="server" />
					</td>
				</tr>
				<tr>
					<td><asiweb:Lister id="Lister1" runat="server" LinkTargetBehavior="SameWindow" LaunchedWindowSize="Small"
							LaunchedWindowType="standard" showexportbutton="False"
							ListerTableBorder="0"></asiweb:Lister></td>
				</tr>
			</table>
		</td>
	</tr>
</table>

