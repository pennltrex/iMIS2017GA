<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.CampaignManagement.MemberExportPEDesignerSources" AutoEventWireup="true" Codebehind="MemberExportPEDesignerSources.ascx.cs" %>
<asp:placeholder id="ErrorMsgPlaceHolder" runat="server"></asp:placeholder>
<script language="javascript"><!--
	<asp:PlaceHolder id="JavaScriptPlaceholder" runat="server"></asp:PlaceHolder>
    function BSABrowserCallback(window)
    {
	    if (!window.result)
	        return;
		document.getElementById(SelectedKeysID).value = window.result;
		submitForm(document.getElementById(SelectedKeysID));
    }

	//-->
</script>
<input type="hidden" id="SelectedKeys" runat="server" onserverchange="AddObjects"/>
<table class="DataTable" cellSpacing="1" cellPadding="2" border="0">
	<tr>
		<td class="PanelTablePrompt">
			<asp:Label id="lblBOExplorer" runat="server"></asp:Label></td>
		<td class="PanelTableValue" nowrap>
			<asp:TextBox id="txtDriverBO" runat="server" ReadOnly="True" CssClass="ValueMedium"></asp:TextBox>
			<asiweb:StyledButton runat="server" id="btnBOBrowse" Text="..." AutoPostBack="false" OnClientClick="OpenObjectBrowser('ShowHierarchyTree=false&ShowContainers=false&ShowSummary=false&AllowMultiSelect=false&AllowUpwardNavigation=false&DocumentPath=$/Common/Business%20Objects&TypeFilter=FOL,BUS',BSABrowserCallback);" /> 
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
		    <asp:linkbutton id="lbtnQueryName" runat="server" cssclass="LinkButton" Visible="False"></asp:linkbutton>&nbsp;
			<asiweb:StyledButton id="btnQueryBrowse" Text="..." runat="server" AutoPostBack="false" OnClientClick="OpenObjectBrowser('ShowHierarchyTree=false&ShowSummary=false&AllowMultiSelect=false&AllowUpwardNavigation=false&DocumentPath=$/Common/Shared Documents&TypeFilter=IQD,FOL',BSABrowserCallback);" /> 
			<asiweb:StyledButton id="btnQueryUpload" Text="*" runat="server" OnClick="btnQueryUpload_ServerClick" /> 
			<asiweb:StyledButton id="btnClearQuery" Text="X" runat="server" OnClick="btnClearQuery_ServerClick" />
		</TD>
	</TR>
</table>
