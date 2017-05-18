<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.CampaignManagement.SourceCodeList1" Codebehind="SourceCodeList.ascx.cs" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

<table class="CommandBar" cellSpacing="0" cellPadding="0" width="100%">
	<tr>
		<td vAlign="center" noWrap align="left">&nbsp;</td>
		<td vAlign="center" noWrap align="right">&nbsp; 
		    <asiweb:StyledButton runat="server" id="btnAdd" Text="Add SourceCode" OnClick="btnAdd_ServerClick" /></td>
	</tr>
</table>
<table cellSpacing="0" cellPadding="0" width="100%" align="center" border="0">
	<tr>
		<td vAlign="center" align="right" nowrap>
			<table cellSpacing="0" cellPadding="0" width="100%" border="0" class="ToolBar" align="center">
				<tr>
					<td noWrap align="right">
						<asp:label id="lblAppeal" runat="server"></asp:label>
						<asp:dropdownlist id="cboAppeal" runat="server" AutoPostBack="True" onselectedindexchanged="cboAppeal_SelectedIndexChanged"></asp:dropdownlist>
						&nbsp;&nbsp;<asp:label id="lblSolicitations" runat="server"></asp:label>
						<asp:dropdownlist id="cboSolicitation" runat="server" AutoPostBack="True" onselectedindexchanged="cboSolicitation_SelectedIndexChanged"></asp:dropdownlist>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1"><asp:Image id="Image2" runat="server" ImageUrl="~/AsiCommon/Images/1.gif" Width="1" Height="1" BorderWidth="0"></asp:Image></td>
	</tr>
	<tr>
		<td vAlign="top" colspan="2">
		    <asiweb:Lister id="ListerSourceCodes" runat="server" LaunchedWindowSize="large" DocumentPath="$/CampaignManagement/DefaultSystem/Queries/SourceCodeList" navigatenavmarker="CM.SourceCode" pagesize="10" linktargetbehavior="NewWindowEachLink" allowpaging="True"></asiweb:Lister>
			<asp:Image id="imgInfo" runat="server" SkinID="InfoImage" Visible="False"></asp:Image>
			<asp:Label id="lblMissingParent" runat="server" Visible="False"></asp:Label>
		</td>
	</tr>
</table>
