<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.RFM.RFMAtomResults" Codebehind="RFMAtomResults.ascx.cs" %>

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<table class="CommandBar" cellspacing="0" cellpadding="0" border="0">
	<tr>
		<td valign="TOP" nowrap align="left">
			<asiweb:StyledButton id="btnPurge" runat="server" OnClick="btnPurge_ServerClick" />
			<asiweb:StyledButton id="btnCreateQuery" runat="server" OnClick="btnCreateQuery_ServerClick" />
		</td>
	</tr>
</table>
<table cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td nowrap>
			<asiweb:Lister id="ListerRFMResultList" runat="server" allowpaging="True" linktargetbehavior="NewWindowEachLink"
				pagesize="20" navigatenavmarker="RFM.PEConfigurator" documentpath="$/RFMAnalysis/DefaultSystem/Queries/RFMList"></asiweb:Lister>
		</td>
	</tr>
</table>
