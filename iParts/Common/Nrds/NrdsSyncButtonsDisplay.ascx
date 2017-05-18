<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NrdsSyncButtonsDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.Nrds.NrdsSyncButtonsDisplay" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI"%>

<asp:Panel ID="contentPanel" runat="server" Visible="true">  
    <script type="text/javascript">
    //<![CDATA[
    function ResetMessages()
    {           
        var syncMessage = $get("<%#SyncMessage.ClientID%>");
        if (syncMessage != null)
            syncMessage.style.display = 'none';

        var errorMessage = $get("<%#ErrorMessage.ClientID%>");
        if (errorMessage != null)
            errorMessage.style.display = 'none';
    }

    function UpdateFromNar() {
        ResetMessages();        
        var refreshFromNar = $get("<%#RefreshFromNar.ClientID%>");
        if (refreshFromNar != null) {
            refreshFromNar.value = '<%#GetTranslatedPhrase("Updating...")%>';
            refreshFromNar.disabled = true;
        }
        var sendToNar = $get("<%#SendToNar.ClientID%>");
        if (sendToNar != null) {
            sendToNar.disabled = true;
        }
    }

    function SendToNar() {
        ResetMessages();
        var sendToNar = $get("<%#SendToNar.ClientID%>");
        if (sendToNar != null) {
            sendToNar.value = '<%#GetTranslatedPhrase("Sending...")%>';
            sendToNar.disabled = true;
        }
        var refreshFromNar = $get("<%#RefreshFromNar.ClientID%>");
        if (refreshFromNar != null) {
            refreshFromNar.disabled = true;
        }
    }
    //]]>        
    </script>
   
    <telerik:RadAjaxPanel ID="ajaxPanel1" runat="server">
           
        <asp:Button runat="server" id="refreshTrigger" style="display:none" Text="" OnClick="RefreshTriggerClick"></asp:Button>
        <asiweb:StyledButton ID="SendToNar" runat="server" Text='<%#Asi.ResourceManager.GetPhrase("SendToNar", "Send to NRDS") %>' OnClick="SendToNarOnClick" enabled="False" AutoPostBack="True" OnClientClick="SendToNar()" />
        <asiweb:StyledButton ID="RefreshFromNar" runat="server" Text='<%#Asi.ResourceManager.GetPhrase("RefreshFromNar", "Update from NRDS") %>' OnClick="RefreshFromNarOnClick" enabled="False" AutoPostBack="True" OnClientClick="UpdateFromNar()" />                       
        <div style="clear:both;"></div>     
        <asiweb:StyledLabel ID="WarningMessage" runat="server" visible="false" CssClass="iMISUserMessageWarning" />
        <asiweb:StyledLabel ID="SyncMessage" runat="server" visible="false" CssClass="iMISUserMessageWarning" />
        <asiweb:StyledLabel ID="ErrorMessage" runat="server" visible="false" CssClass="Error" />    
    
    </telerik:RadAjaxPanel>

</asp:Panel>