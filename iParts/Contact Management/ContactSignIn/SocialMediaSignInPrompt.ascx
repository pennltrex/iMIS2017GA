<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SocialMediaSignInPrompt.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactSignIn.SocialMediaSignInPrompt" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
        
<div class="Section">
    <asiweb:BusinessLabel id="SocialMediaPromptLabel" runat="server" Visible="True" />
</div>
<div style="clear:both;"></div>
<div class="row">   					
    <div class="col-md-7">                       
        <div class="Section">
            <asiweb:StyledRadioButton ID="existingAccountRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right"     
            Caption='<%# ResourceManager.GetPhrase("ExistingAccount", "Choose an existing account")%>' RenderPanelField="true"
            AutoPostBack="False" GroupName="PromptCollection" Checked="true" />
        </div>            
        <telerik:RadAjaxPanel ID="SocialActionPanel" runat="server" LoadingPanelID="loadingPanel" EnableAJAX="False">
            <div id="linkDiv" runat="server" class="SignIn">
                <div class="PanelField">
                    <asp:Label ID="linkUserNameLabel" Text='<%#ResourceManager.GetWord("Username") %>' runat="server" AssociatedControlID="linkUserName" />                   
                    <asp:TextBox ID="linkUserName" runat="server"/>  
                    <asp:requiredfieldvalidator Display="Dynamic" CssClass="Error" id="linkUserNameRequired" runat="server" ControlToValidate="linkUserName" Text='<%#ResourceManager.GetWord("Required") %>' ></asp:requiredfieldvalidator>                                  
                </div>
                <div class="PanelField">
                    <asp:Label ID="linkPasswordLabel" runat="server" Text='<%#ResourceManager.GetWord("Password") %>' AssociatedControlID="linkPassword" />
                    <input type="password" ID="linkPassword" runat="server" onkeypress="socialMediaEnterKeyPress(event);" /> 
                    <asp:requiredfieldvalidator Display="Dynamic" CssClass="Error" id="linkPasswordRequired" runat="server" ControlToValidate="linkPassword" Text='<%#ResourceManager.GetWord("Required") %>' ></asp:requiredfieldvalidator>                        
                </div>
                <div id="linkForgotPasswordUserDiv" runat="server">
                    <span runat="server" ID="linkForgotPasswordUser"></span>   		   
                </div>                             
            </div>                   
        </telerik:RadAjaxPanel>	                       
        <div style="clear:both;"></div>	
        <div class="LineThruContainer" id="linkLineThruContainerDiv">
            <div class="LineThruBlock">
                <strong class="LineThru"><asp:Label ID="Label1" runat="server" translate="yes" Text="or"/></strong>   
            </div>
        </div>
        <div class="Section">
            <asiweb:StyledRadioButton ID="createAccountRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right" 
                Caption='<%# ResourceManager.GetPhrase("CreateAccount", "Create a new account")%>' RenderPanelField="true"
                AutoPostBack="False" GroupName="PromptCollection" Checked="False"/> 
        </div>                                      	
    </div>
    <div class="col-md-5" style="margin-top:3.5em">
        <asp:Image runat="server" ID="ImageProfilePhoto"/>	            
        <br/><asp:CheckBox ID="CheckBoxUseProfilePhoto" runat="server" Text="Use profile photo?" TextAlign="Right" /> 
    </div>	
</div>

<div style="clear:both;"></div>
<div id="linkCommandButtons" runat="server" Visible="True" class="CommandBar">
    <asp:Button ID="ContinueLinkButton" runat="server" OnClientClick='socialMediaDisableAndPost();' OnClick="SubmitClick" causesvalidation="true" CssClass="TextButton Center SignInButton PrimaryButton" />
    <asp:Button ID="CancelLinkButton" runat="server" OnClick="ResetCancel_Click" causesvalidation="false" CssClass="TextButton" />           
</div>

<script type="text/javascript">
    //<![CDATA[      
    function socialMediaEnterKeyPress(e) {
        // look for window.event in case event isn't passed in 
        if (typeof e == 'undefined' && window.event) { e = window.event; }
        if (e != null && e.keyCode == 13) {
            jQuery('#<%#ContinueLinkButton.ClientID%>').click();
        }
    }
    function socialMediaDisableAndPost() {
        var username = document.getElementById('<%#linkUserName.ClientID%>');
        var password = document.getElementById('<%#linkPassword.ClientID%>');
        var isPageValid = Page_IsValid;
        if (isPageValid && username != null && username.value.length > 0 && password.value.length > 0) {
            <%#Page.ClientScript.GetPostBackEventReference(ContinueLinkButton, "") %>;
            document.getElementById('<%#ContinueLinkButton.ClientID%>').disabled = "disabled";
            document.getElementById('<%#ContinueLinkButton.ClientID%>').value = '<%# GetTranslatedPhrase(ResourceManager.GetPhrase("SigningIn", "Signing In...")) %>';
        }
    }

    function radioButton_Clicked(type) {
        var usernameValidator;
        var passwordValidator;
        //disable validators if user has chosen to create a new account
        if (type == 'create') {
            usernameValidator = document.getElementById('<%#linkUserNameRequired.ClientID%>');
            passwordValidator = document.getElementById('<%#linkPasswordRequired.ClientID%>');
            if (usernameValidator != 'undefined')
                usernameValidator.enabled = false;
            if (passwordValidator != 'undefined')
                passwordValidator.enabled = false;
        }
        else {
            usernameValidator = document.getElementById('<%#linkUserNameRequired.ClientID%>');
            passwordValidator = document.getElementById('<%#linkPasswordRequired.ClientID%>');
            if (usernameValidator != 'undefined')
                usernameValidator.enabled = true;
            if (passwordValidator != 'undefined')
                passwordValidator.enabled = true;
        }
    }
    //]]>
</script>