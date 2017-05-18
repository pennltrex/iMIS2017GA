<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.SegmentManagement.SetupGroupList" Codebehind="SetupGroup.ascx.cs" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>

<table width="100%">
	<tr>
		<td class="CommandBar">
		    <asiweb:StyledButton ID="btnAdd" runat="server" OnClick="btnAdd_ServerClick" />
		</td>
	</tr>
	<tr>
		<td valign="top">
		    <asiweb:lister id="ListerGroups" runat="server" LaunchedWindowSize="small" DocumentPath="$/SegmentManagement/DefaultSystem/Queries/GroupList" navigatenavmarker="SM.Group" pagesize="10" linktargetbehavior="NewWindowEachLink" allowpaging="True" launchedwindowtype="modal"></asiweb:lister>
			<asp:Image id="imgInfo" runat="server" SkinID="InfoImage" Visible="False"></asp:Image>
			<asp:Label id="lblMissingParent" runat="server" Visible="False"></asp:Label>
		</td>
	</tr>
</table>
