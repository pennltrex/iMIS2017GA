<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactSignInDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactSignIn.ContactSignInDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="authProviders" TagName="OpenAuthProviders" Src="../../../AsiCommon/Controls/Shared/ExternalAuthorizationProviders/AuthorizationProviders.ascx" %>
<%@ Register TagPrefix="smp" TagName="SocialMediaPrompt" Src="SocialMediaSignInPrompt.ascx" %>

    <asp:UpdatePanel runat="server" ID="SignInRefreshPanel" UpdateMode="Conditional" ChildrenAsTriggers="False">
    
    <ContentTemplate>
    
        <asp:Panel runat="server" ID="SignInPanel">
    
            <asp:Panel ID="contentPanel" runat="server" Visible="true" CssClass="StandardPanel" BorderStyle="None" BackColor="Transparent" DefaultButton="SubmitButton">
        
                <authProviders:OpenAuthProviders runat="server" ID="OpenAuthorizationLogin" IsSignIn="True"/>
       
                <telerik:RadAjaxPanel ID="ActionPanel" runat="server" LoadingPanelID="loadingPanel" EnableAJAX="False">            
           
                    <asiweb:BusinessLabel id="confirmationMessage" runat="server" Visible="false" translate="yes" />
            
                    <div style="clear: both;"></div>

                    <div id="signInDiv" runat="server">
                        <div class="PanelField"> 
                            <asp:Label ID="signInUserNameLabel" translate="yes" Text='<%#ResourceManager.GetWord("Username") %>' runat="server" AssociatedControlID="signInUserName" />                                      
                            <asp:TextBox ID="signInUserName" runat="server" autocomplete="off" />  
                            <asp:requiredfieldvalidator Display="Dynamic" CssClass="Error" id="UserNameRequired" runat="server" ControlToValidate="signInUserName" Text='<%#ResourceManager.GetWord("Required") %>' ></asp:requiredfieldvalidator>                                          
                        </div>
                        <div class="PanelField">
                            <asp:Label ID="signInPasswordLabel" runat="server" translate="yes" Text='<%#ResourceManager.GetWord("Password") %>' AssociatedControlID="signInPassword" />                    
                            <input type="password" ID="signInPassword" runat="server" onkeypress="enterKeyPress(event);" autocomplete="off" /> 
                            <asp:requiredfieldvalidator Display="Dynamic" CssClass="Error" id="PasswordRequired" runat="server" ControlToValidate="signInPassword" Text='<%#ResourceManager.GetWord("Required") %>' ></asp:requiredfieldvalidator>                   
                        </div>
                        <div ID="MultiFactorAuthDiv" runat="server" Visible="False" translate="yes">
                            <asp:PlaceHolder runat="server" ID="MultiFactorFieldsPh"></asp:PlaceHolder>
                            <asp:LinkButton runat="server" ID="SetupMultiFactorLink" OnClick="SetupMultiFactorLink_OnClick"/> 
                        </div>
                        <div id="RememberMeDiv" class="PanelField AutoWidth FloatNone" runat="server" Visible="<%# ShowRememberMe() %>">
                            <asp:CheckBox translate="yes" ID="RememberMe" runat="server" Text='<%#ResourceManager.GetPhrase("KeepMeSignedIn","Keep me signed in") %>' />
                        </div>
                    </div>  
                                    
                    <div id="requestPasswordDiv" runat="server" Visible="false" translate="yes" >           
                        <asiweb:StyledLabel CssClass="SectionLabel" ID="passwordRequestHeader" runat="server" />              
                        <div class="PanelField">
                            <asiweb:BusinessLabel id="requestPasswordInstructions" runat="server" Visible="True" />
                        </div>
                        <div style="clear: both; padding-bottom: 1em;"></div>
                        <div class="PanelField">
                            <asiweb:BusinessLabel CssClass="Required" ID="passwordUserNameLabel" runat="server" AssociatedControlID="passwordUserName" />
                            <div class="PanelFieldValue">
                                <asiweb:BusinessTextBox runat="server" ID="passwordUserName" autocomplete="off"/>
                                <asp:RequiredFieldValidator ID="passwordUserNameRequiredValidator" runat="server" EnableClientScript="true" Display="Dynamic" 
                                ControlToValidate="passwordUserName" CssClass="Important" ErrorMessage="Required" />
                            </div>		  
                        </div>                  
                    </div> 
                    <div id="requestUserNameDiv" runat="server" Visible="false"  translate="yes" >              
                        <asiweb:StyledLabel translate="yes" CssClass="SectionLabel" ID="userRequestHeader" runat="server" />                
                        <div class="PanelField">
                            <asiweb:BusinessLabel id="requestUserNameInstructions" runat="server" Visible="True" />
                        </div>
                        <div style="clear: both; padding-bottom: 1em;"></div>
                        <div class="PanelField">
                            <asiweb:BusinessLabel CssClass="Required" ID="passwordEmailLabel" runat="server" AssociatedControlID="passwordEmail" />
                            <div class="PanelFieldValue">
                                <asiweb:BusinessTextBox runat="server" ID="passwordEmail" autocomplete="off" /> 
                                <asp:RequiredFieldValidator id="passwordEmailValidator" CssClass="Important" Runat="server" EnableClientScript="true" Display="Dynamic"
                                    ErrorMessage="Required" ControlToValidate="passwordEmail" ></asp:RequiredFieldValidator>	
                                <asp:RegularExpressionValidator id="passwordEmailRegexValidator" CssClass="Important" Runat="server" EnableClientScript="true" Display="Dynamic"
                                    ErrorMessage="Invalid email format" ControlToValidate="passwordEmail" ValidationExpression="^[\w\.-]+@[\w-]+\.[\w\.-]+$"></asp:RegularExpressionValidator>
                            </div>
                        </div>            
                    </div>
                        
                 </telerik:RadAjaxPanel>

            </asp:Panel>
     
            <asp:Panel ID="contentPanelReset" runat="server" Visible="false" translate="yes">
                <div id="resetPassword">
                    <div>
                        <asiweb:StyledLabel ID="PasswordInstructionsLiteral" runat="server" />
                        <asiweb:StyledLabel ID="errorResetPassword" runat="server" />
                    </div>
                    <div style="clear: both; padding-bottom: 1em;"></div>
                    <div class="PanelField">
                        <asiweb:BusinessLabel CssClass="Required" ID="newPasswordLabel" runat="server" AssociatedControlID="newPassword" />
                        <div class="PanelFieldValue">
                            <asiweb:BusinessTextBox runat="server" ID="newPassword" TextMode="Password" autocomplete="off" />
                            <asp:RequiredFieldValidator id="newPasswordValidator" CssClass="Important" Runat="server" EnableClientScript="True" Display="Dynamic"
                                ErrorMessage="Required" ControlToValidate="newPassword" ></asp:RequiredFieldValidator>        
                        </div>
                    </div>
                    <div class="PanelField">
                        <asiweb:BusinessLabel CssClass="Required" ID="confirmPasswordLabel" runat="server" AssociatedControlID="confirmPassword" />
                        <div class="PanelFieldValue">
                            <asiweb:BusinessTextBox runat="server" ID="confirmPassword" TextMode="Password" autocomplete="off" /> 
                            <asp:RequiredFieldValidator id="confirmPasswordValidator" CssClass="Important" Runat="server" EnableClientScript="True" Display="Dynamic"
                                ErrorMessage="Required" ControlToValidate="confirmPassword" ></asp:RequiredFieldValidator>       
                        </div>
                    </div>
                    <asp:CompareValidator ID="PasswordsMatchValidator" runat="server" EnableClientScript="True" Display="Dynamic" ControlToValidate="confirmPassword" 
                        ControlToCompare="newPassword" Type="String" CssClass="Important" ErrorMessage="Passwords must match."></asp:CompareValidator>        
                    <div style="clear:both;"></div>
                    <asp:Label runat="server" ID="PasswordMessage" CssClass="Info"/>          
                </div>    
            </asp:Panel>

            <asiweb:RecaptchaControl ID="Recaptcha1" runat="server" Enabled="false" />
                        
            <div style="clear:both;padding-bottom:.3em;"></div>

            <div id="commandButtons" runat="server" translate="yes" Visible="false">            
                <asp:Button ID="SubmitButton" runat="server" OnClientClick='disableAndPost();' OnClick="SubmitClick" causesvalidation="true" CssClass="TextButton PrimaryButton" />
                <asp:Button ID="ResetCancelButton" runat="server" OnClick="ResetCancel_Click" causesvalidation="false" CssClass="TextButton" />           
            </div>

            <asp:Panel ID="LinkPanel" runat="server" Visible="true" translate="yes">
        
                <div class="CenterText" id="forgotPasswordUserLinkDiv" runat="server">
                    <div style="clear:both;padding-bottom:.5em;"></div>  
                    <span runat="server" ID="forgotPasswordUser"></span>     
                </div> 
           
                <div class="CenterText" id="accountLinkDiv" runat="server" >
                    <div style="clear:both;padding-bottom:.5em;"></div>  
                    <a ID="accountLink" runat="server" />
                    <span runat="server" ID="accountLinkReadOnly" Visible="False"></span> 
                </div>
            
            </asp:Panel>

            <div style="clear: both;"></div>

        </asp:Panel>
        <asp:Panel ID="SocialMediaPromptPanel" runat="server" Visible="false" translate="yes" >
            <smp:SocialMediaPrompt runat="server" ID="SocialMediaPrompt" />
        </asp:Panel> 
    </ContentTemplate> 
       
</asp:UpdatePanel> 

        <script type="text/javascript">
            
            jQuery(function () { OnLoad(); });

            function OnLoad() {
                var signInUserNameField = document.getElementById('<%#signInUserName.ClientID%>');
                var passwordUserNameField = document.getElementById('<%#passwordUserName.ClientID%>');
                if (signInUserNameField) {
                    document.getElementById('<%#signInUserName.ClientID%>').setAttribute("autocorrect", "off");
                    document.getElementById('<%#signInUserName.ClientID%>').setAttribute("autocapitalize", "off");
                }
                if (passwordUserNameField) {
                    document.getElementById('<%#passwordUserName.ClientID%>').setAttribute("autocorrect", "off");
                    document.getElementById('<%#passwordUserName.ClientID%>').setAttribute("autocapitalize", "off");
                }
            }


//<![CDATA[      
            function enterKeyPress(e) {
                // look for window.event in case event isn't passed in 
                if (typeof e == 'undefined' && window.event) { e = window.event; }
                if (e != null && e.keyCode == 13) {
                    document.getElementById('<%#SubmitButton.ClientID%>').click();
                }
            }   
            function disableAndPost() {
                var username = document.getElementById('<%#signInUserName.ClientID%>');
                var password = document.getElementById('<%#signInPassword.ClientID%>');
                var isPageValid = Page_IsValid;
                if (isPageValid && username != null && username.value.length > 0 && password.value.length > 0) {
                    <%#Page.ClientScript.GetPostBackEventReference(SubmitButton, "") %>;
                    document.getElementById('<%#SubmitButton.ClientID%>').disabled = "disabled";
                    document.getElementById('<%#SubmitButton.ClientID%>').value = '<%# GetTranslatedPhrase(ResourceManager.GetPhrase("SigningIn", "Signing In...")) %>';
                }
            }
            //]]>
        </script>
