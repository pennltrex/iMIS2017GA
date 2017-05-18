<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.CampaignManagement.MemberExportAtomDesignerSources" Codebehind="MemberExportAtomDesignerSources.ascx.cs" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<table class="DataTable" cellSpacing="1" cellPadding="2" border="0">
	<tr>
		<td class="PanelTablePrompt">
			<asp:Label id="lblBOExplorer" runat="server"></asp:Label></td>
		<td class="PanelTableValue" nowrap>
			<asp:TextBox id="txtDriverBO" runat="server" ReadOnly="True" CssClass="ValueMedium"></asp:TextBox>
			<asiweb:StyledButton runat="server" id="btnBOBrowse" Text="..." OnClick="btnBOBrowse_ServerClick" /> 
			<asiweb:StyledButton runat="server" id="btnClearBO" Text="X" OnClick="btnClearBO_ServerClick" />
		</td>
	</tr>
	<tr>
		<td class="PanelTablePrompt">
			<asp:Label id="lblFormat" runat="server"></asp:Label></td>
		<td class="PanelTableValue" nowrap>
			<asp:DropDownList id="cboFormat" runat="server" Width="156px" cssclass="SelectStandard" onselectedindexchanged="cboFormat_SelectedIndexChanged"></asp:DropDownList>
		</td>
	</tr>
	<TR>
		<TD class="PanelTablePrompt">
			<asp:Label id="lblQueryExplorer" runat="server"></asp:Label></TD>
		<TD class="PanelTableValue">
			<asp:TextBox id="txtQuery" runat="server" ReadOnly="True"></asp:TextBox>
			<asiweb:StyledButton id="btnQueryBrowse" Text="..." runat="server" OnClick="btnQueryBrowse_ServerClick" /> 
			<asiweb:StyledButton id="btnQueryUpload" Text="*" runat="server" OnClick="btnQueryUpload_ServerClick" /> 
			<asiweb:StyledButton id="btnClearQuery" Text="X" runat="server" OnClick="btnClearQuery_ServerClick" />
		</TD>
	</TR>
</table>
