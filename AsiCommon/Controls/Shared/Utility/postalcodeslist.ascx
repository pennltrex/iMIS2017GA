
<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.PostalCodesList" Codebehind="PostalCodesList.ascx.cs" %>
<table cellpadding="5" cellspacing="0" width="100%" border="0">
	<tr>
		<td class="StandardPanel">
			<table cellpadding="0" cellspacing="0" border="0" width="99%">
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td class="PanelTitle" nowrap>
									<asp:label id="lblHeading" runat="server"></asp:label></td>
								<td class="StandardPanelSeperator" width="99%">
								<td valign="middle"><asp:Image ImageUrl="~/AsiCommon/Images/HI/login_3dots.gif">
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td align="right">
						<asiweb:StyledButton runat="server" id="btnNew" value="btnNew" name="btnNew" />
					</td>
				</tr>
				<tr>
					<td>
						<asiweb:Lister id="Lister1" runat="server" NavigateNavMarker="Setup.PostalCodeEdit" CssClass="PanelTableFull"
							CssClassHeader="PanelTableHeader" CssClassodd="PanelTableData" CssClasseven="PanelTableData"
							CssClassnorecords="ListResultsEmpty" ListerTableBorder="0" CssClassListStats="" CssClassFilterTable=""
							showexportbutton="False" DocumentPath="$/Common/Queries/Utility/PostalCodesList" LaunchedWindowType="standard"
							LaunchedWindowSize="Small" PageSize="20" LinkTargetBehavior="SameWindow"></asiweb:Lister>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
