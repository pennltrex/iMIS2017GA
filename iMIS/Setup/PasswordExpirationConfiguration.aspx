<%@ Page Language="C#" Title="Authentication" AutoEventWireup="true" CodeBehind="PasswordExpirationConfiguration.aspx.cs" Inherits="Asi.WebRoot.iMIS.Setup.PasswordExpirationConfiguration" %>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="TemplateBody">
    
    <script type="text/javascript">
        function NonAdminEnforcePasswordExpirationCheckbox_CheckedChanged() {
            var enforcePasswordExpiration = jQuery('#' + "<%= NonAdminEnforcePasswordExpirationCheckbox.ClientID%>");
            var passwordExpirationNumberOfDaysTextBox = jQuery('#' + "<%= NonAdminPasswordExpirationNumberOfDaysTextBox.ClientID%>");
            var passwordExpirationNumberOfDaysLabel = jQuery('#' + "<%= NonAdminPasswordExpirationNumberOfDaysLabel.ClientID%>");
            var passwordExpirationNumberOfDaysPanel = jQuery('#' + "<%= NonAdminPasswordExpirationNumberOfDaysPanel.ClientID%>");

            if (enforcePasswordExpiration != null)
                if (enforcePasswordExpiration.prop('checked') === true) {
                    passwordExpirationNumberOfDaysTextBox.prop("disabled", false);
                    passwordExpirationNumberOfDaysLabel.removeClass("Disabled");
                    passwordExpirationNumberOfDaysPanel.removeClass("aspNetDisabled");
                } else {
                    passwordExpirationNumberOfDaysTextBox.prop("disabled", true);
                    passwordExpirationNumberOfDaysTextBox.val("0");
                    passwordExpirationNumberOfDaysLabel.addClass("Disabled");
                    passwordExpirationNumberOfDaysPanel.addClass("aspNetDisabled");
                }
        };

        function AdminEnforcePasswordExpirationCheckbox_CheckedChanged() {
            var enforcePasswordExpiration = jQuery('#' + "<%= SysAdminEnforcePasswordExpirationCheckbox.ClientID%>");
            var passwordExpirationNumberOfDaysTextBox = jQuery('#' + "<%= AdminPasswordExpirationNumberOfDaysTextBox.ClientID%>");
            var passwordExpirationNumberOfDaysLabel = jQuery('#' + "<%= AdminPasswordExpirationNumberOfDaysLabel.ClientID%>");
            var passwordExpirationNumberOfDaysPanel = jQuery('#' + "<%= AdminPasswordExpirationNumberOfDaysPanel.ClientID%>");

            if (enforcePasswordExpiration != null)
                if (enforcePasswordExpiration.prop('checked') === true) {
                    passwordExpirationNumberOfDaysTextBox.prop("disabled", false);
                    passwordExpirationNumberOfDaysLabel.removeClass("Disabled");
                    passwordExpirationNumberOfDaysPanel.removeClass("aspNetDisabled");
                } else {
                    passwordExpirationNumberOfDaysTextBox.prop("disabled", true);
                    passwordExpirationNumberOfDaysTextBox.val("0");
                    passwordExpirationNumberOfDaysLabel.addClass("Disabled");
                    passwordExpirationNumberOfDaysPanel.addClass("aspNetDisabled");
                }
        };

        function NonAdminEnforcePasswordHistoryCountCheckbox_CheckedChanged() {
            var enforcePasswordHistoryCount = jQuery('#' + "<%= NonAdminEnforcePasswordHistoryCountCheckbox.ClientID%>");
            var enforcePasswordHistoryCountTextBox = jQuery('#' + "<%= NonAdminPasswordHistoryCountTextBox.ClientID%>");
            var enforcePasswordHistoryCountLabel = jQuery('#' + "<%= NonAdminPasswordHistoryCountLabel.ClientID%>");
            var enforcePasswordHistoryCountPanel = jQuery('#' + "<%= NonAdminPasswordHistoryCountPanel.ClientID%>");

            if (enforcePasswordHistoryCount != null)
                if (enforcePasswordHistoryCount.prop('checked') === true) {
                    enforcePasswordHistoryCountTextBox.prop("disabled", false);
                    enforcePasswordHistoryCountLabel.removeClass("Disabled");
                    enforcePasswordHistoryCountPanel.removeClass("aspNetDisabled");
                } else {
                    enforcePasswordHistoryCountTextBox.prop("disabled", true);
                    enforcePasswordHistoryCountTextBox.val("0");
                    enforcePasswordHistoryCountLabel.addClass("Disabled");
                    enforcePasswordHistoryCountPanel.addClass("aspNetDisabled");
                }
        };

        function AdminEnforcePasswordHistoryCountCheckbox_CheckedChanged() {
            var enforcePasswordHistoryCount = jQuery('#' + "<%= AdminEnforcePasswordHistoryCountCheckbox.ClientID%>");
            var enforcePasswordHistoryCountTextBox = jQuery('#' + "<%= AdminPasswordHistoryCountTextBox.ClientID%>");
            var enforcePasswordHistoryCountLabel = jQuery('#' + "<%= AdminPasswordHistoryCountLabel.ClientID%>");
            var enforcePasswordHistoryCountPanel = jQuery('#' + "<%= AdminPasswordHistoryCountPanel.ClientID%>");

            if (enforcePasswordHistoryCount != null)
                if (enforcePasswordHistoryCount.prop('checked') === true) {
                    enforcePasswordHistoryCountTextBox.prop("disabled", false);
                    enforcePasswordHistoryCountLabel.removeClass("Disabled");
                    enforcePasswordHistoryCountPanel.removeClass("aspNetDisabled");
                } else {
                    enforcePasswordHistoryCountTextBox.prop("disabled", true);
                    enforcePasswordHistoryCountTextBox.val("0");
                    enforcePasswordHistoryCountLabel.addClass("Disabled");
                    enforcePasswordHistoryCountPanel.addClass("aspNetDisabled");
                }
        };

        function AdminSessionTimeoutCheckbox_CheckedChanged() {
            var enforceSessionTimeout = jQuery('#' + "<%= AdminSessionTimeoutCheckbox.ClientID%>");
            var enforceSessionTimeoutTextBox = jQuery('#' + "<%= AdminSessionTimeoutTextBox.ClientID%>");
            var enforceSessionTimeoutLabel = jQuery('#' + "<%= AdminSessionTimeoutLabel.ClientID%>");
            var enforceSessionTimeoutPanel = jQuery('#' + "<%= AdminSessionTimeoutPanel.ClientID%>");
            var keepMeSignedInNoteAdmin = jQuery('#' + "<%= KeepMeSignedInNoteAdmin.ClientID%>");

            if (enforceSessionTimeout != null)
                if (enforceSessionTimeout.prop('checked') === true) {
                    enforceSessionTimeoutTextBox.prop("disabled", false);
                    enforceSessionTimeoutLabel.removeClass("Disabled");
                    enforceSessionTimeoutPanel.removeClass("aspNetDisabled");
                    keepMeSignedInNoteAdmin.removeClass("DisplayNone");
                } else {
                    enforceSessionTimeoutTextBox.prop("disabled", true);
                    enforceSessionTimeoutTextBox.val("0");
                    enforceSessionTimeoutLabel.addClass("Disabled");
                    enforceSessionTimeoutPanel.addClass("aspNetDisabled");
                    keepMeSignedInNoteAdmin.addClass("DisplayNone");
                }
        };

        function NonAdminSessionTimeoutCheckbox_CheckedChanged() {
            var enforceSessionTimeout = jQuery('#' + "<%= NonAdminSessionTimeoutCheckbox.ClientID%>");
            var enforceSessionTimeoutTextBox = jQuery('#' + "<%= NonAdminSessionTimeoutTextBox.ClientID%>");
            var enforceSessionTimeoutLabel = jQuery('#' + "<%= NonAdminSessionTimeoutLabel.ClientID%>");
            var enforceSessionTimeoutPanel = jQuery('#' + "<%= NonAdminSessionTimeoutPanel.ClientID%>");
            var keepMeSignedInNoteNonAdmin = jQuery('#' + "<%= KeepMeSignedInNoteNonAdmin.ClientID%>");

            if (enforceSessionTimeout != null)
                if (enforceSessionTimeout.prop('checked') === true) {
                    enforceSessionTimeoutTextBox.prop("disabled", false);
                    enforceSessionTimeoutLabel.removeClass("Disabled");
                    enforceSessionTimeoutPanel.removeClass("aspNetDisabled");
                    keepMeSignedInNoteNonAdmin.removeClass("DisplayNone");
                } else {
                    enforceSessionTimeoutTextBox.prop("disabled", true);
                    enforceSessionTimeoutTextBox.val("0");
                    enforceSessionTimeoutLabel.addClass("Disabled");
                    enforceSessionTimeoutPanel.addClass("aspNetDisabled");
                    keepMeSignedInNoteNonAdmin.addClass("DisplayNone");
                }
        };
    </script>

    <asiweb:PanelTemplateControl2 id="ObjectDefinitionTemplate" runat="server" TemplateTitle="Authentication" FieldSet="true" Collapsible="false" ShowHeader="true" translate="yes">
        <div runat="server" ID="RegistrationPanel"> 
            <div class="PanelField AutoWidth">
                <asiweb:BusinessLabel Text="Password expiration" runat="server" CssClass="h3"></asiweb:BusinessLabel>
            </div>         
            <div class="PanelField AutoWidth FloatNone">        
                <asiweb:BusinessCheckBox id="SysAdminEnforcePasswordExpirationCheckbox" runat="server" Text="Enforce password expiration for system administrators"/>
            </div>  
            <asp:Panel ID="AdminPasswordExpirationNumberOfDaysPanel" runat="server" >                          
                <div class="SubItems">      
                        <div class="PanelField Left">     
                            <div style="display: inline;"> 
                                <asiweb:StyledLabel runat="server" ID="AdminPasswordExpirationNumberOfDaysLabel" Text="Number of days before password expires" AssociatedControlID="AdminPasswordExpirationNumberOfDaysTextBox"></asiweb:StyledLabel>   
                            </div>
                            <div class="PanelFieldValue">
                                <asiweb:BusinessTextBox runat="server" ID="AdminPasswordExpirationNumberOfDaysTextBox"></asiweb:BusinessTextBox>
                                <asp:RangeValidator ID="AdminPassExpDaysValidator" ControlToValidate="AdminPasswordExpirationNumberOfDaysTextBox" Type="Integer" MinimumValue="0" MaximumValue="999999" ErrorMessage="Please enter a number between 0 and 999999." Display="Dynamic" runat="server"/>
                                <asp:RangeValidator ID="PCIAdminPassExpDaysValidator" ControlToValidate="AdminPasswordExpirationNumberOfDaysTextBox" Type="Integer" MinimumValue="1" MaximumValue="90" ErrorMessage="Must enter value between 1 and 90 to be PCI compliant." Display="Dynamic" runat="server" Enabled="False"/>
                            </div>
                            <div class="PanelField AutoWidth">                                       
                                <asiweb:BusinessLabel runat="server" ID="PasswordExpirationForSysAdminsLabel" CssClass="Info" Text="To be PCI Compliant, system administrator passwords must expire within 90 days or less."></asiweb:BusinessLabel>
                            </div> 
                        </div>
                </div>
            </asp:Panel>        
            <div class="PanelField AutoWidth FloatNone">        
                <asiweb:BusinessCheckBox id="NonAdminEnforcePasswordExpirationCheckbox" runat="server" Text="Enforce password expiration for non-administrators"/>                           
            </div>
            <asp:Panel ID="NonAdminPasswordExpirationNumberOfDaysPanel" runat="server" >                          
                <div class="SubItems">      
                        <div class="PanelField Left">     
                            <div style="display: inline;"> 
                                <asiweb:StyledLabel runat="server" ID="NonAdminPasswordExpirationNumberOfDaysLabel" Text="Number of days before password expires" AssociatedControlID="NonAdminPasswordExpirationNumberOfDaysTextBox"></asiweb:StyledLabel>   
                            </div>
                            <div class="PanelFieldValue">
                                <asiweb:BusinessTextBox runat="server" ID="NonAdminPasswordExpirationNumberOfDaysTextBox"></asiweb:BusinessTextBox>
                                <asp:RangeValidator ID="PasswordExpirationNumberOfDaysRangeValidator" ControlToValidate="NonAdminPasswordExpirationNumberOfDaysTextBox" Type="Integer" MinimumValue="0" MaximumValue="999999" ErrorMessage="Please enter a number between 0 and 999999." Display="Dynamic" runat="server"/>
                            </div>
                        </div>
                </div>
            </asp:Panel>
            
            <div class="PanelField AutoWidth">
                <asiweb:BusinessLabel Text="Password reuse" runat="server" CssClass="h3"></asiweb:BusinessLabel>
            </div>
            <div class="PanelField AutoWidth FloatNone">        
                <asiweb:BusinessCheckBox id="AdminEnforcePasswordHistoryCountCheckbox" runat="server" Text="Prevent password reuse for system administrators"/>
            </div>  
            <asp:Panel ID="AdminPasswordHistoryCountPanel" runat="server" >                          
                <div class="SubItems">      
                        <div class="PanelField Left">     
                            <div style="display: inline;"> 
                                <asiweb:StyledLabel runat="server" ID="AdminPasswordHistoryCountLabel" Text="Number of previous passwords that cannot be reused" AssociatedControlID="AdminPasswordHistoryCountTextBox"></asiweb:StyledLabel>   
                            </div>
                            <div class="PanelFieldValue">
                                <asiweb:BusinessTextBox runat="server" ID="AdminPasswordHistoryCountTextBox"></asiweb:BusinessTextBox>
                                <asp:RangeValidator ID="AdminPasswordHistoryCountRangeValidator" ControlToValidate="AdminPasswordHistoryCountTextBox" Type="Integer" MinimumValue="0" MaximumValue="999999" ErrorMessage="Please enter a number between 0 and 999999." Display="Dynamic" runat="server"/>
                                <asp:RangeValidator ID="PCIAdminPasswordHistoryCountRangeValidator" ControlToValidate="AdminPasswordHistoryCountTextBox" Type="Integer" MinimumValue="4" MaximumValue="999999" ErrorMessage="Must enter value between 4 and 999999 to be PCI compliant." Display="Dynamic" runat="server" Enabled="False"/>
                            </div>
                            <div class="PanelField AutoWidth">                                       
                                <asiweb:BusinessLabel runat="server" ID="PasswordHistoryPciNote" CssClass="Info" Text="To be PCI Compliant, system administrators must not be allowed to reuse any of the last 4 passwords."></asiweb:BusinessLabel>
                            </div> 
                        </div>
                </div>
            </asp:Panel>        
           <div class="PanelField AutoWidth FloatNone">        
                <asiweb:BusinessCheckBox id="NonAdminEnforcePasswordHistoryCountCheckbox" runat="server" Text="Prevent password reuse for non-administrators"/>                           
            </div>
            <asp:Panel ID="NonAdminPasswordHistoryCountPanel" runat="server" >                          
                <div class="SubItems">      
                        <div class="PanelField Left">     
                            <div style="display: inline;"> 
                                <asiweb:StyledLabel runat="server" ID="NonAdminPasswordHistoryCountLabel" Text="Number of previous passwords that cannot be reused" AssociatedControlID="NonAdminPasswordHistoryCountTextBox"></asiweb:StyledLabel>   
                            </div>
                            <div class="PanelFieldValue">
                                <asiweb:BusinessTextBox runat="server" ID="NonAdminPasswordHistoryCountTextBox"></asiweb:BusinessTextBox>
                                <asp:RangeValidator ID="PasswordHistoryCountRangeValidator" ControlToValidate="NonAdminPasswordHistoryCountTextBox" Type="Integer" MinimumValue="0" MaximumValue="999999" ErrorMessage="Please enter a number between 0 and 999999." Display="Dynamic" runat="server"/>
                            </div>
                        </div>
                </div>
            </asp:Panel>
            
            <div class="PanelField AutoWidth">
                <asiweb:BusinessLabel Text="Session timeout" runat="server" CssClass="h3"></asiweb:BusinessLabel>
            </div>
            <div class="PanelField AutoWidth FloatNone">        
                <asiweb:BusinessCheckBox id="AdminSessionTimeoutCheckbox" runat="server" Text="Enable session timeout for system administrators"/>
            </div>  
            <asp:Panel ID="AdminSessionTimeoutPanel" runat="server" >                          
                <div class="SubItems">      
                        <div class="PanelField Left">     
                            <div style="display: inline;"> 
                                <asiweb:StyledLabel runat="server" ID="AdminSessionTimeoutLabel" Text="Number of idle minutes before session times out" AssociatedControlID="AdminSessionTimeoutTextBox"></asiweb:StyledLabel>   
                            </div>
                            <div class="PanelFieldValue">
                                <asiweb:BusinessTextBox runat="server" ID="AdminSessionTimeoutTextBox"></asiweb:BusinessTextBox>
                                <asp:RangeValidator ID="AdminSessionTimeoutValidator" ControlToValidate="AdminSessionTimeoutTextBox" Type="Integer" MinimumValue="0" MaximumValue="999999" ErrorMessage="Please enter a number between 0 and 999999." Display="Dynamic" runat="server"/>
                                <asp:RangeValidator ID="PCIAdminSessionTimeoutValidator" ControlToValidate="AdminSessionTimeoutTextBox" Type="Integer" MinimumValue="1" MaximumValue="15" ErrorMessage="Must enter value between 1 and 15 to be PCI compliant." Display="Dynamic" runat="server" Enabled="False"/>
                            </div>
                            <div class="PanelField AutoWidth">
                                <asiweb:BusinessLabel runat="server" ID="KeepMeSignedInNoteAdmin" CssClass="Info" Text='Note: The "Keep me signed in" option will not be honored for system administrators.'></asiweb:BusinessLabel>                                
                            </div> 
                            <div class="PanelField AutoWidth">                                       
                                <asiweb:BusinessLabel runat="server" ID="SessionTimeoutPciNote" CssClass="Info" Text="To be PCI Compliant, the system administrator session timeout must be 15 minutes or less."></asiweb:BusinessLabel>
                            </div> 
                        </div>
                </div>
            </asp:Panel>  
             <div class="PanelField AutoWidth FloatNone">        
                <asiweb:BusinessCheckBox id="NonAdminSessionTimeoutCheckbox" runat="server" Text="Enable session timeout for non-administrators"/>
            </div>  
            <asp:Panel ID="NonAdminSessionTimeoutPanel" runat="server" >                          
                <div class="SubItems">      
                        <div class="PanelField Left">     
                            <div style="display: inline;"> 
                                <asiweb:StyledLabel runat="server" ID="NonAdminSessionTimeoutLabel" Text="Number of idle minutes before session times out" AssociatedControlID="NonAdminSessionTimeoutTextBox"></asiweb:StyledLabel>   
                            </div>
                            <div class="PanelFieldValue">
                                <asiweb:BusinessTextBox runat="server" ID="NonAdminSessionTimeoutTextBox"></asiweb:BusinessTextBox>
                                <asp:RangeValidator ID="NonAdminSessionTimeoutValidator" ControlToValidate="NonAdminSessionTimeoutTextBox" Type="Integer" MinimumValue="0" MaximumValue="999999" ErrorMessage="Please enter a number between 0 and 999999." Display="Dynamic" runat="server"/>
                            </div>
                            <div class="PanelField AutoWidth">
                                <asiweb:BusinessLabel runat="server" ID="KeepMeSignedInNoteNonAdmin" CssClass="Info" Text='Note: This will remove the "Keep me signed in" option from sign in for all users.'></asiweb:BusinessLabel>                                
                            </div>
                        </div>
                </div>
            </asp:Panel>
            <div id="MultiFactorDiv" runat="server" Visible="True">
                 <div class="PanelField AutoWidth">
                    <asiweb:BusinessLabel Text="Multi-factor authentication" runat="server" CssClass="h3"></asiweb:BusinessLabel>
                </div>
                 <div class="PanelField AutoWidth FloatNone">        
                    <asiweb:BusinessCheckBox id="MultifactorAuthenticaionCheckBox" runat="server" Text="Enable multi-factor authentication"/>
                </div>
                <div class="SubItems">
                    <div class="PanelField AutoWidth">                                       
                        <asiweb:BusinessLabel runat="server" ID="MultiFactorAuthenticationLabel" CssClass="Info" Text=" To be PCI Compliant, multi-factor authentication must be enabled."></asiweb:BusinessLabel>
                    </div>
                 </div>
            </div>  
        </div> 
    </asiweb:PanelTemplateControl2>
</asp:Content>