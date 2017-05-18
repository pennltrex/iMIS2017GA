<%@ Control Language="c#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.WordMergeEngine.WordMergePEDesignerTab2" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="WordMergePEDesignerTab2.ascx.cs" %>
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
<table class="DataTable" cellspacing="1" cellpadding="2" border="0" >
    <tr>
        <td class="PanelTablePrompt" nowrap><asp:label id="MergeQueryLabel" runat="server"></asp:label></td>
        <td class="PanelTableValue">
            <table cellspacing="0" cellpadding="1" width="100%" border="0">
                <tr>
                    <td class="PanelTableValue" valign="middle" nowrap>
                        <asp:linkbutton id="lbtnMergeQueryName" runat="server" cssclass="LinkButton"></asp:linkbutton>&nbsp;</td>
                    <td valign="middle" nowrap align="left" width="100">
                        <asiweb:StyledButton id="ChooseQueryButton" runat="server" AutoPostBack="false" OnClientClick="OpenObjectBrowser('iAllowMultiSelect=0&iRootFolder=$/Common/Shared Documents&iTypeFilter=FOL,IQD&iShowFolderTree=0&iShowToolbar=0',BSABrowserCallback);" /> 
                        <asiweb:StyledButton id="btnClearQuery" runat="server" Enabled="false" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="PanelTablePrompt" nowrap><asp:label id="TemplateDocumentLabel" runat="server"></asp:label></td>
        <td class="PanelTableValue">
            <table cellspacing="0" cellpadding="1" width="100%" border="0">
                <tr>
                    <td class="PanelTableValue" valign="middle"><asp:label id="TemplateDocumentNameLabel" runat="server"></asp:label>&nbsp;</td>
                    <td valign="middle" nowrap align="left" width="100">
                    <asiweb:StyledButton id="ChooseTemplateButton" Text="ChooseTemplateButton" AutoPostBack="false" OnClientClick="OpenObjectBrowser('iAllowMultiSelect=0&iRootFolder=$&iTypeFilter=FOL,TXT,WLT,RTF&iShowFolderTree=0&iShowToolbar=0',BSABrowserCallback);" runat="server" /> 
                    <asiweb:StyledButton id="btnLoadTemplate" runat="server" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="PanelTablePrompt">
            <asp:label id="lblMergeDetails" runat="server"></asp:label></td>
        <td class="PanelTableValue">
            <OBJECT id="EditMergeWinControl" width="300" 
            classid="<%=Asi.Web.Utilities.GetDocumentBaseUri() %>DownloadBin/Asi.Windows.Controls.WordMerge.dll#Asi.Windows.Controls.WordMerge.WordMergeEditor" 
            standby="Loading the Word Merge control, please wait ..." viewastext >
                <PARAM NAME="AppPrincipalState" VALUE="<%= Asi.Security.AppPrincipal.SerializeAppPrincipal() %>">
                <PARAM NAME="ProcessEngineString" VALUE="<% = this.SerializePE() %>">
                <PARAM NAME="HostCookies" VALUE="<%= this.SerializeCookies() %>">
                <PARAM NAME="HostDomain" VALUE="<%= this.HostDomain() %>">
                <param name="WebApplicationPath" value="<%= Asi.Web.Utilities.GetDocumentBaseUri() %>">
                <PARAM NAME="SessionVariableName" VALUE="<% = this.SessionKey%>.ProcessEngine">
                <PARAM NAME="SessionSyncUrl" VALUE="<%= Asi.Web.Utilities.GetDocumentBaseUri() %>AsiCommon/Controls/WordMergeEngine/SyncListener.aspx">
                The Word Merge Editor was unable to load.  Please check the client's installed version of the .Net Framework (should be Framework version 1.1).
            </OBJECT>
        </td>
    </tr>
</table>
