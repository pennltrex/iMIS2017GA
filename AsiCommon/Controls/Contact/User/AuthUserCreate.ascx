<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Contact.AuthUserCreate" Codebehind="AuthUserCreate.ascx.cs" %>

<asiweb:PanelTemplateControl2 ID="CreateUserLoginPanel" runat="server" FieldSet="true" Collapsible="false">
    
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" LoginCreatedUser="false" DisableCreatedUser="false" 
        DisplayCancelButton="false"
        OnCreatedUser="OnCreatedUser" 
        RequireEmail="true"
        CompleteSuccessText="" 
        InstructionText=""
        OnCreateUserError="OnCreateUserError" Width="100%"  >
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" Title="">
                <contenttemplate>
                    <div class="PanelField">
                        <asp:label runat="server" associatedcontrolid="UserName" id="UserNameLabel" CssClass="Required">Logon</asp:label>
                        <div class="PanelFieldValue">
                            <asp:textbox runat="server" id="UserName" CssClass="InputLarge" onblur="javascript: return VerifyForm();" autocomplete="off"></asp:textbox>
                            <asp:requiredfieldvalidator controltovalidate="UserName" CssClass="Important" Display="Dynamic" errormessage="Required" id="UserNameRequired" runat="server" tooltip="Logon is required" validationgroup="CreateUserWizard1" />                            
                            <div style="clear: both;">                            
                                <asp:RegularExpressionValidator runat="server" ID="LengthValidator" ValidationGroup="CreateUserWizard1" 
                                    ValidationExpression="^.{0,50}$" CssClass="Important" Display="Dynamic" ControlToValidate="UserName" 
                                    ErrorMessage="Logon cannot be greater than 50 characters">Logon cannot be greater than 50 characters</asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>
                    <div class="PanelField">
                        <asp:label runat="server" associatedcontrolid="Password" id="PasswordLabel" CssClass="Required">Password</asp:label>
                        <div class="PanelFieldValue">
                            <asp:textbox runat="server" textmode="Password" id="Password" CssClass="InputLarge" onblur="javascript: return VerifyForm();" autocomplete="off"></asp:textbox>
                            <asp:requiredfieldvalidator controltovalidate="Password" CssClass="Important" Display="Dynamic" errormessage="Required" id="PasswordRequired" runat="server" tooltip="Password is required" validationgroup="CreateUserWizard1" />
                        </div>
                    </div>
                    <div class="PanelField">
                        <asp:label runat="server" associatedcontrolid="ConfirmPassword" id="ConfirmPasswordLabel" CssClass="Required">Confirm password</asp:label>
                        <div class="PanelFieldValue">
                            <asp:textbox runat="server" textmode="Password" id="ConfirmPassword" CssClass="InputLarge" onblur="javascript: return VerifyForm();" autocomplete="off"></asp:textbox>
                            <asp:requiredfieldvalidator controltovalidate="ConfirmPassword" CssClass="Important" Display="Dynamic" errormessage="Required" id="ConfirmPasswordRequired" runat="server" tooltip="Confirm password is required" validationgroup="CreateUserWizard1" />                        
                            <div style="clear: both;">
                                <asp:comparevalidator runat="server" errormessage="Password and confirm password must match"
                                    controltocompare="Password" controltovalidate="ConfirmPassword" id="PasswordCompare"
                                    CssClass="Important" Display="Dynamic" />
                             </div>                        
                        </div>
                    </div>
                    <div class="PanelField">
                        <asp:label runat="server" associatedcontrolid="Email" id="EmailLabel" CssClass="Required">Email</asp:label>
                        <div class="PanelFieldValue">
                            <asp:textbox runat="server" id="Email" CssClass="InputLarge" onblur="javascript: return VerifyForm();"></asp:textbox>
                            <asp:requiredfieldvalidator controltovalidate="Email" CssClass="Important" Display="Dynamic" errormessage="Required" id="Requiredfieldvalidator1" runat="server" tooltip="Email is required." validationgroup="CreateUserWizard1" />
                            <div style="clear: both;">
                                <asp:RegularExpressionValidator id="revEmail" runat="server" validationgroup="CreateUserWizard1" ErrorMessage="A valid email is required" ControlToValidate="Email"
                                    Display="Dynamic" ValidationExpression="[^\s@]+@[^\s@]+\.[^\s@]+" CssClass="Important" >A valid email is required</asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>
                </contenttemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server" Title=""></asp:CompleteWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
</asiweb:PanelTemplateControl2>

<script type="text/javascript">
    //<![CDATA[ 
    var continueButton = jQuery("[id$=ContinueButtonButton]");
    continueButton.hide();
    var newButton = jQuery("[id$=StepNextButtonButton]");
    newButton.addClass('TextButton PrimaryButton');
    function VerifyForm() {
        var validationErrorFound = jQuery(".ValidationError");
        if (validationErrorFound != null && validationErrorFound.is(":visible"))
            newButton.prop("disabled", true);
        else 
            newButton.removeAttr('disabled');       
    }
    //]]>
</script>