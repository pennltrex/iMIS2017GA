<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.OpportunityManagement.OpportunityPEDefinition" Codebehind="OpportunityPEDefinition.ascx.cs" %>
<%@ Register TagPrefix="asiwc" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<input type="hidden" id="SourceCodeFinder_SelectedKey" runat="server" />

<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<table class="DataTable" cellspacing="0" cellpadding="3" border="0">
	<tr>
		<td class="PanelTablePrompt"><asp:label id="lblOpportunityName" runat="server" CssClass="Required"></asp:label></td>
		<td class="PanelTableValue"><asp:textbox id="txtOpportunityName" runat="server"></asp:textbox></td>
	</tr>
	<tr>
        <td class="PanelTablePrompt"><asp:label id="lblDescription" runat="server"/></td>
		<td class="PanelTableValue"><asp:textbox id="txtDescription" runat="server" textmode="MultiLine"/></td>
	</tr>
	<tr>
		<td class="PanelTablePrompt"><asp:label id="lblType" runat="server" CssClass="Required"/></td>
		<td class="PanelTableValue"><asp:dropdownlist id="cboType" runat="server" cssclass="SelectStandard" onselectedindexchanged="cboType_SelectedIndexChanged"/></td>
	</tr>
	<tr>
		<td class="PanelTablePrompt"><asp:label id="lblQueryExplorer" runat="server"/></td>
		<td class="PanelTableValue">
			<div style="float:right;width:5em;">
		        <asiweb:StyledButton id="btnQueryBrowse" Text="..." AutoPostBack="false" OnClientClick="OpenObjectBrowser('iRootFolder=$/Common/Shared Documents&DocumentPath=$/Common/Shared Documents&iTypeFilter=FOL,IQD', BSABrowserCallback, true);" runat="server" /> 
			    <asiweb:StyledButton id="btnClearQuery" Text="X" runat="server" />
			</div>
			<asp:linkbutton id="lbtnQueryName" runat="server" cssclass="LinkButton" ></asp:linkbutton>&nbsp;
		</td>
    </tr>
	<tr id="trSourceCode" runat="server">
		<td class="PanelTablePrompt"><asp:label id="lblSourceCodeExplorer" runat="server"/></td>
		<td class="PanelTableValue">
			<div style="float:right;width:5em;">
		        <asiweb:StyledButton id="btnSourceCodeBrowse" Text="..." AutoPostBack="false" OnClientClick="OpenFinderAdder(SourceCodeFinderCallback, true, null, '$/CampaignManagement/DefaultSystem/Queries/SourceCodeList', null, null, null);" runat="server" /> 
			    <asiweb:StyledButton id="btnSourceCodeClear" Text="X" runat="server" />
			</div>
			<asp:label id="lblSourceCodeName" runat="server"/>
		</td>
	</tr>
</table>
