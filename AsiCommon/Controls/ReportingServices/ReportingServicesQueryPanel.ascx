<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.ReportingServices.ReportingServicesQueryPanel" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="ReportingServicesQueryPanel.ascx.cs" %>
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
<asp:panel id="QueryPanel" runat="server">
<asp:placeholder id=ErrorMsgPlaceHolder runat="server"></asp:placeholder>
<TABLE cellSpacing=1 cellPadding=2 width="100%" border=0>
	<TR>
		<TD class="PanelTablePrompt PEControllerPrompt"><asp:Label id="lblQueryExplorer" runat="server"></asp:Label></TD>
		<TD class="PanelTableValue PEControllerValue"><asp:TextBox id="txtQuery" runat="server" ReadOnly="true" CssClass="ValueMediumReadOnly"></asp:TextBox>
		<asiweb:StyledButton id="btnQueryBrowse" runat="server" AutoPostBack="false" OnClientClick="OpenObjectBrowser('iAllowMultiSelect=0&iRootFolder=$&iTypeFilter=FOL,IQD&iShowFolderTree=0&iShowToolbar=0',BSABrowserCallback);" />
		</TD>
	</TR>
</TABLE>
</asp:panel>
