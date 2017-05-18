<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NrdsSyncByIdDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.Nrds.NrdsSyncById" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI"%>

<asp:Panel ID="contentPanel" runat="server" Visible="true" DefaultButton="UpdateFromNar">
    
     <script type="text/javascript">
        //<![CDATA[
        function ResetMessages() {
            var syncMessage = $get("<%#SyncMessage.ClientID%>");
            if (syncMessage != null)
                syncMessage.style.display = 'none';

            var errorMessage = $get("<%#ErrorMessage.ClientID%>");
            if (errorMessage != null)
                errorMessage.style.display = 'none';
         }

         function RefreshFromNar() {
             ResetMessages();
             var refreshFromNar = $get("<%#UpdateFromNar.ClientID%>");
             if (refreshFromNar != null) {
                 refreshFromNar.value = '<%#GetTranslatedPhrase("Updating...")%>';
                 refreshFromNar.disabled = true;
             }
         }

         function RetryClick() {
             var refreshFromNar = $get("<%#UpdateFromNar.ClientID%>");
             if (refreshFromNar != null) {
                 refreshFromNar.click();
             }
             return false;
         }
         //]]>        
    </script>  
    
    <telerik:RadAjaxPanel ID="ajaxPanel1" runat="server"> 

        <asiweb:BusinessDropDownList ID="SelectIdType" runat="server" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" ShowNullItem="false"/>
        <asiweb:BusinessTextBox runat="server" ID="IdValue" RenderPanelField="true" DisplayCaption="true" PositionCaption="Left" />     
        <div class="PanelField">
            <asiweb:StyledButton ID="UpdateFromNar" runat="server" Text='<%#Asi.ResourceManager.GetPhrase("UpdateFromNar", "Update from NRDS") %>' OnClick="RefreshFromNarOnClick" visible="true" OnClientClick="RefreshFromNar()" />
        </div>
        <div style="clear:both;"></div>  
        <asiweb:StyledLabel ID="SyncMessage" runat="server" visible="false" CssClass="iMISUserMessageWarning" />
        <asiweb:StyledLabel ID="ErrorMessage" runat="server" visible="false" CssClass="Error" />
    
    </telerik:RadAjaxPanel>

</asp:Panel>