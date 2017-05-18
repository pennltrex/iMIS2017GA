<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactSignInConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactSignIn.ContactSignInConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asiweb:paneltemplatecontrol id="ContainerPanel" runat="server" fieldset="true" showheader="false" borderstyle="None">
<div>
    <asiweb:SmartControl ID="DisplaySignInFailedMessageLocal" runat="server" BoundPropertyName="DisplaySignInFailedMessageLocal" DisplayCaption="true" OnClientClick="EnableDisableFields()"
    PositionCaption="Right" DataSaveUponStateChange="false" CssClass="AutoWidth" />
        <div class="SubItems">
        <asiweb:SmartControl ID="SignInFailedMessageLocal" runat="server" BoundPropertyName="SignInFailedMessageLocal" DisplayCaption="true" DataSaveUponStateChange="false" TextBoxHeight="5em" />    
        </div>
    <asiweb:SmartControl ID="DisplayForgotPassword" runat="server" BoundPropertyName="DisplayForgotPassword" DisplayCaption="true" OnClientClick="EnableDisableFields()"
    PositionCaption="Right" DataSaveUponStateChange="false" CssClass="AutoWidth" />
        <div class="SubItems">
             <asiweb:SmartControl ID="ForgotPasswordMessage" runat="server" BoundPropertyName="ForgotPasswordMessage" DisplayCaption="true" DataSaveUponStateChange="false" TextBoxHeight="5em" />    
        </div>
    <asiweb:SmartControl ID="DisplayForgotUserId" runat="server" BoundPropertyName="DisplayForgotUserId" DisplayCaption="true" OnClientClick="EnableDisableFields()" 
    PositionCaption="Right" DataSaveUponStateChange="false" CssClass="AutoWidth" />
        <div class="SubItems">
            <asiweb:SmartControl ID="ForgotUserIdMessage" runat="server" BoundPropertyName="ForgotUserIdMessage" DisplayCaption="true" DataSaveUponStateChange="false" TextBoxHeight="5em" />    
        </div>  
    <asiweb:SmartControl ID="DisplayCreateAccount" runat="server" BoundPropertyName="DisplayCreateAccount" DisplayCaption="true" OnClientClick="EnableDisableFields()" 
    PositionCaption="Right" DataSaveUponStateChange="false" CssClass="AutoWidth" />   
        <div class="SubItems">
            <asiweb:SmartControl ID="CreateAccountLink" runat="server" BoundPropertyName="CreateAccountLink" DisplayCaption="true" DataSaveUponStateChange="false" /> 
        </div>        
</div>
</asiweb:paneltemplatecontrol>
 
<script type="text/javascript">
    //<![CDATA[
    EnableDisableFields();

    function EnableDisableFields() {
        var displaySignInFailedMessageLocal = $get("<%#DisplaySignInFailedMessageLocal.ClientID%>_CheckBoxSet");
        var signInFailedMessageLocal = $get("<%#SignInFailedMessageLocal.ClientID%>_Caption");
        var signInFailedMessageLocalField = $get("<%#SignInFailedMessageLocal.ClientID%>_TextArea");
        var signInFailedMessageLocalFieldValidator = $get("<%#SignInFailedMessageLocal.ClientID%>_RequiredFieldValidator");
        var signInFailedMessageLocalErrorMessage = $get("<%#SignInFailedMessageLocal.ClientID%>_ErrorMessage");
        var displayForgotPassword = $get("<%#DisplayForgotPassword.ClientID%>_CheckBoxSet");
        var displayForgotUsername = $get("<%#DisplayForgotUserId.ClientID%>_CheckBoxSet");
        var displayCreateAccount = $get("<%#DisplayCreateAccount.ClientID%>_CheckBoxSet");
        var pwdResetMessage = $get("<%#ForgotPasswordMessage.ClientID%>_Caption");
        var pwdResetMessageField = $get("<%#ForgotPasswordMessage.ClientID%>_TextArea");
        var userNameMessage = $get("<%#ForgotUserIdMessage.ClientID%>_Caption");
        var userNameMessageField = $get("<%#ForgotUserIdMessage.ClientID%>_TextArea");
        var createAccountLink = $get("<%#CreateAccountLink.ClientID%>_Caption");
        var createAccountLinkField = $get("<%#CreateAccountLink.ClientID%>_TextField");
        var createAccountLinkFieldValidator = $get("<%#CreateAccountLink.ClientID%>_RequiredFieldValidator");
        var createAccountLinkFieldErrorMessage = $get("<%#CreateAccountLink.ClientID%>_ErrorMessage");

        if (displaySignInFailedMessageLocal.checked) {
            signInFailedMessageLocal.disabled = false;
            signInFailedMessageLocal.setAttribute("class", "Required");
            signInFailedMessageLocalField.disabled = false;
            signInFailedMessageLocalFieldValidator.enabled = true;
            signInFailedMessageLocalFieldValidator.removeAttribute("disabled");
        }
        else {
            signInFailedMessageLocal.disabled = true;
            signInFailedMessageLocal.setAttribute("class", "");
            signInFailedMessageLocalField.disabled = true;
            signInFailedMessageLocalFieldValidator.enabled = false;
            signInFailedMessageLocalFieldValidator.style.display = 'none';
            signInFailedMessageLocalFieldValidator.disabled = true;
            signInFailedMessageLocalErrorMessage.style.display = 'none';
        }

        if (displayForgotPassword.checked) {
            pwdResetMessage.disabled = false;
            pwdResetMessageField.disabled = false;
        }
        else {
            pwdResetMessage.disabled = true;
            pwdResetMessageField.disabled = true;
        }
        
        if (displayForgotUsername.checked) {
            userNameMessage.disabled = false;
            userNameMessageField.disabled = false;
        }
        else {
            userNameMessage.disabled = true;
            userNameMessageField.disabled = true;
        }

        if (displayCreateAccount.checked) {
            createAccountLink.removeAttribute("disabled");
            createAccountLink.setAttribute("class", "Required");
            createAccountLinkField.removeAttribute("disabled");
            createAccountLinkFieldValidator.enabled = true;
            createAccountLinkFieldValidator.removeAttribute("disabled");
        } 
        else {
            createAccountLink.disabled = true;
            createAccountLink.setAttribute("class", "");
            createAccountLinkField.disabled = true;
            createAccountLinkFieldValidator.enabled = false;
            createAccountLinkFieldValidator.style.display = 'none';
            createAccountLinkFieldValidator.disabled = true;
            createAccountLinkFieldErrorMessage.style.display = 'none';
        }
    }
//]]>
</script>