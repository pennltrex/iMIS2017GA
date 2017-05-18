<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LogonPasswordDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.ChangeLogonPassword.LogonPasswordDisplay" %>
<%@ Import Namespace="Asi.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" namespace="Telerik.Web.UI" assembly="Telerik.Web.UI" %>

<asp:Panel runat="server" ID="ContentPanel"  CssClass="StandardPanel" BorderStyle="None" >
    <asp:UpdatePanel runat="server" ID="LogOnPasswordPanel" UpdateMode="Conditional" ChildrenAsTriggers="False">
        <ContentTemplate>
             <%--DefaultButton="SubmitButton"--%>
            <asp:Panel runat="server" ID="MainPanel" CssClass="StandardPanel" BorderStyle="None" BackColor="Transparent" translate="yes">
                <div class="PanelField">
                    <asiweb:BusinessLabel id="LabelLogon" runat="server" Visible="false" />       
                    <asiweb:BusinessLabel id="LabelUserId" runat="server" Visible="false" translate="no" />       
                </div>
                <asiweb:BusinessLabel id="error" runat="server" Visible="false" CssClass="warning" />
                <asiweb:StyledHyperlink runat="server" ID="updatePasswordUser"/>
            </asp:Panel>
            <asp:Panel ID="contentPanelReset" runat="server" Visible="false" translate="yes">   
                <div id="securityMessageDiv" runat="server" class="AddPaddingVertical">
                    <asiweb:BusinessLabel id="changeSecurityMessageLabel" runat="server" Visible="false" />
                </div>       
                <div id="currentLogonDiv" runat="server" class="PanelField">
                    <asiweb:BusinessLabel id="currentLogonCaption" runat="server" AssociatedControlID="currentLogon" />
                    <div class="PanelFieldValue">
                        <asiweb:BusinessLabel id="currentLogon" runat="server" />
                    </div>
                </div> 
                <div id="currentPasswordDiv" runat="server" class="PanelField">
                    <asiweb:BusinessLabel id="currentPasswordCaption" runat="server" CssClass="Required" AssociatedControlID="currentPassword" />
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox id="currentPassword" runat="server" TextMode="Password" ValidationGroup="LogonPasswordDisplayValidation" onkeypress="enterKeyPress(event);" autocomplete="off"/>
                        <asiweb:AsiRequiredFieldValidator id="currentPasswordValidator" CssClass="Important" runat="server" ValidationGroup="LogonPasswordDisplayValidation" Display="Dynamic" ErrorMessage="required" ControlToValidate="currentPassword" />                             
                    </div>
                </div>            
                <asp:Panel ID="editLogonPanel" runat="server" Enabled="false" Visible="false">
                    <div id="newUsernameDiv" class="PanelField">
                        <asiweb:BusinessLabel id="newLogonCaption" runat="server" AssociatedControlID="newLogon" />
                        <div class="PanelFieldValue">
                            <asiweb:BusinessTextBox id="newLogon" runat="server" autocomplete="off"/>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="editPasswordPanel" runat="server" Enabled="false" Visible="false">
                    <div id="newPasswordDiv" class="PanelField">
                         <asiweb:BusinessLabel id="newPasswordCaption" runat="server" AssociatedControlID="newPassword" />
                         <div class="PanelFieldValue">
                             <asiweb:BusinessTextBox id="newPassword" runat="server" TextMode="Password" ValidationGroup="LogonPasswordDisplayValidation" autocomplete="off"/>                     
                         </div>
                    </div>
                    <div id="confirmNewPasswordDiv" class="PanelField Section">
                        <asiweb:BusinessLabel id="confirmNewPasswordCaption" runat="server" AssociatedControlID="confirmNewPassword" />
                        <div class="PanelFieldValue">
                            <asiweb:BusinessTextBox id="confirmNewPassword" runat="server" TextMode="Password" autocomplete="off" />                                
                            <asp:CompareValidator ID="passwordsMatchValidator" runat="server" EnableClientScript="true" ControlToValidate="confirmNewPassword" Display="Dynamic" ControlToCompare="newPassword" Type="String" Operator="Equal" CssClass="Important" ErrorMessage="Passwords must match"></asp:CompareValidator>                                          
                            <div style="clear: both;"></div>  
                        </div>
                    </div>
                    <asp:Label runat="server" ID="PasswordMessage" Visible="false" CssClass="Info" />
                </asp:Panel>                
                <div style="clear: both;"></div>
           </asp:Panel>   
   
        </ContentTemplate>    
    </asp:UpdatePanel>
</asp:Panel>
<script type="text/javascript">
    //<![CDATA[
    function enterKeyPress(e) {
        // look for window.event in case event isn't passed in 
        if (typeof e == 'undefined' && window.event) { e = window.event; }
        if (e != null && e.keyCode == 13) {
            jQuery('#<%#((MasterPageBase)Page.Master).ButtonBar.GetButton(CommandButtonType.Save).ClientID%>').click();
        }
    }        
//]]>
</script>