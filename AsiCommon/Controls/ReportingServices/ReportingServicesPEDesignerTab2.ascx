<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.ReportingServices.ReportingServicesPEDesignerTab2" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="ReportingServicesPEDesignerTab2.ascx.cs" %>
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
<div class="PanelField Left">
	<asp:Label id="lblTemplateExplorer" runat="server" AssociatedControlID="txtTemplateName"></asp:Label>
	<div class="PanelFieldValue">
		<asp:TextBox id="txtTemplateName" runat="server" ReadOnly="True"></asp:TextBox>
		<asiweb:StyledButton id="btnTemplateBrowse" runat="server" Text="..." ToolTip="Browse" AutoPostBack="false" OnClientClick="OpenObjectBrowser('iAllowMultiSelect=0&iRootFolder=$&iTypeFilter=FOL,RDL&iShowFolderTree=1&iShowToolbar=0&iAllowFolderSelect=0',BSABrowserCallback);" /> 
        <!-- <asiweb:StyledButton id="btnUpload" Text="*" ToolTip="Upload new Template" Visible="false" Enabled="false" runat="server" />  -->
    </div>
</div>
<asp:panel id="QueryPanel" runat="server">
	<div class="PanelField Left">
	    <asp:Label id=lblQueryExplorer runat="server" CssClass="Label"></asp:Label>
    	<div class="PanelFieldValue">
		    <asp:linkbutton id="lbtnQueryName" runat="server" cssclass="LinkButton" Enabled="false" Visible="False"></asp:linkbutton>&nbsp;
	        <asiweb:StyledButton id="btnQueryBrowse" Text="..." ToolTip="Browse" runat="server" AutoPostBack="false" OnClientClick="OpenObjectBrowser('iAllowMultiSelect=0&iRootFolder=$&iTypeFilter=FOL,IQD&iAllowFolderSelect=0&iShowFolderTree=1&iShowToolbar=0',BSABrowserCallback);" /> 
	    <!--    <asiweb:StyledButton id="btnQueryUpload" Text="*" ToolTip="Create new Query" Visible="false" Enabled="false" runat="server" />  -->
	        <asiweb:StyledButton id="btnClearQuery" Text="X" ToolTip="Delete" runat="server" />
	    </div>
	</div>
</asp:panel>
