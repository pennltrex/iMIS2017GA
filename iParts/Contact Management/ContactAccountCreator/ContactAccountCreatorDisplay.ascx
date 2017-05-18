<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactAccountCreatorDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactAccountCreator.ContactAccountCreatorDisplay" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="Asi" %>
<%@ Import Namespace="Asi.Web.iParts.ContactManagement.ContactAccountCreator" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%-- ReSharper disable Html.PathError --%>
<%@ Register TagPrefix="primaryOrgSel" TagName="PrimaryOrganizationSelector" src="~/iParts/Contact Management/PrimaryOrganizationSelector/PrimaryOrganizationSelectorDisplay.ascx" %>
<%@ Register TagPrefix="authProviders" TagName="OpenAuthProviders" Src="../../../AsiCommon/Controls/Shared/ExternalAuthorizationProviders/AuthorizationProviders.ascx" %>
<%@ Register TagPrefix="uc1" TagName="PostalCodeLookup" Src="../PostalCodeLookup/PostalCodeLookupDisplay.ascx" %>

<%-- ReSharper restore Html.PathError --%>

<asp:Panel runat="server" ID="ContentPanel" CssClass="StandardPanel" BorderStyle="None" translate="yes">
    
    <asp:HiddenField ID="HiddenContactKey" runat="server" />
    <asp:HiddenField ID="HiddenPartyId" runat="server" />	
    <asp:HiddenField runat="server" ID="HiddenAdministratorContactKey" />

    <div runat="server" visible="false" id="DivLabelErrorMessage">
        <asp:Label id="LabelErrorMessage" runat="server" CssClass="Error" />
    </div>
    
    <div runat="server" visible="false" id="DivLabelSuccessMessage">
        <asp:Label id="LabelSuccessMessage" runat="server" CssClass="Information" />
        <asiweb:Hyperlink ID="ContinueLink" runat="server" visible="false" />
        <br /><br />
    </div>
    
    <asp:Panel runat="server" ID="FormPanel" CssClass="StandardPanel" BorderStyle="None">
                 
        <asp:UpdatePanel runat="server" ID="AddressValidatorUpdatePanel" RenderMode="Block">
            <ContentTemplate>
                <asp:HiddenField ID="AddressIsDirtyControl" runat="server" />  
                <asp:HiddenField ID="DeliveryPoint" runat="server" />
                <asp:HiddenField ID="BarCode" runat="server" />
                <asp:HiddenField ID="BarcodeSortPlanNumber" runat="server"/>       
                <div runat="server" id="DivValidateAddress">
                    <asiweb:AddressValidationControl ID="AddressValidator" runat="server" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <div runat="server" id="DivLogOnLink" class="Section">
            <div style="display:inline;">
                <asiweb:StyledLabel runat="server" ID="LabelLogOnLink" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Contact.ContactAccountCreator.AlreadyRegistered", "Already registered?")%>'/> 
                <asiweb:Hyperlink ID="LogOnLink" runat="server" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Contact.ContactAccountCreator.Security.SignIn", "Sign In")%>'/>
            </div>
        </div>
                
        <div class="SignUp" runat="server" id="DivAuthorizationProviders">
            <authProviders:OpenAuthProviders runat="server" ID="OpenAuthorizationLogin" IsSignIn="False" />
        </div>
        
        <div style="clear:both;"></div>
        <div runat="server" id="DivCreateAccountType" class="PanelField Left">
            <div style="display:inline;">  
                <asiweb:StyledLabel ID="LabelCreateAccountType" AssociatedControlID="CreateAccountType" runat="server" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Contact.ContactAccountCreator.AccountType", "Account type")%>' />
            </div>
            <div class="PanelFieldValue">    
                <asp:RadioButtonList BorderStyle="None" ID="CreateAccountType" RepeatLayout="Flow" RepeatDirection="Horizontal" runat="server" CssClass="PanelFieldValue AutoWidth"/>
            </div>             
        </div>
        <div runat="server" id="DivPrefix">
            <div class="PanelField Left">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelPrefix" Text='<%#ResourceManager.GetWord("Prefix")%>'
                        AssociatedControlID="Prefix"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessDropDownList  TranslateOnlyCaptionAndToolTip="True" runat="server" ID="Prefix"/>
                </div>
            </div>
        </div>
        <div runat="server" id="DivOrganizationName">
            <div class="PanelField Left">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelOrganizationName" CssClass="Required" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Contact.ContactAccountCreator.OrganizationName", "Organization name")%>'
                        AssociatedControlID="OrganizationName"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox runat="server" ID="OrganizationName" CssClass="InputLarge"/>
                    <asiweb:AsiRequiredFieldValidator runat="server" ID="OrganizationNameValidator" ControlToValidate="OrganizationName" ValidationGroup="AccountCreator" CssClass="Important" SetFocusOnError="True"/>
                </div>
            </div>
        </div>  
        <div runat="server" id="DivFirstName">
            <div class="PanelField Left">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelFirstName" CssClass="Required" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Contact.ContactAccountCreator.FirstName", "First name")%>'
                        AssociatedControlID="FirstName"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox MaxLength="20" runat="server" ID="FirstName"/>
                    <asiweb:AsiRequiredFieldValidator runat="server" ID="FirstNameValidator" ControlToValidate="FirstName" ValidationGroup="AccountCreator" CssClass="Important" SetFocusOnError="True" />
                </div>
            </div>
        </div>
        <div runat="server" id="DivMiddleName">
            <div class="PanelField Left">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelMiddleName" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Contact.ContactAccountCreator.MiddleName", "Middle name")%>'
                        AssociatedControlID="MiddleName" />
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox MaxLength="20" runat="server" ID="MiddleName" />
                </div>
            </div>
        </div>
        <div runat="server" id="DivLastName">
            <div class="PanelField Left">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelLastName" CssClass="Required" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Contact.ContactAccountCreator.LastName", "Last name")%>'
                        AssociatedControlID="LastName"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox MaxLength="30" runat="server" ID="LastName"/>
                    <asiweb:AsiRequiredFieldValidator runat="server" ID="LastNameValidator" ControlToValidate="LastName" ValidationGroup="AccountCreator" CssClass="Important" SetFocusOnError="True" />
                </div>
            </div>
        </div>   
        <div runat="server" id="DivSuffix">
            <div class="PanelField Left">
                <div style="display: inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelSuffix" Text='<%#ResourceManager.GetWord("Suffix")%>'
                        AssociatedControlID="Suffix"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessDropDownList TranslateOnlyCaptionAndToolTip="True" runat="server" ID="Suffix"/>
                </div>
            </div>
        </div>
        <div runat="server" id="DivDesignation">
            <div class="PanelField Left">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelDesignation" Text='<%#ResourceManager.GetWord("Designation")%>' 
                        AssociatedControlID ="Designation"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox runat="server" ID="Designation" MaxLength ="20" />
                </div>
            </div>
        </div>
        <div runat="server" id="DivInformalName">
            <div class="PanelField Left">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelInformalName" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Contact.ContactAccountCreator.InformalName", "Informal name")%>'
                        AssociatedControlID="InformalName"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox runat="server" ID="InformalName" MaxLength="20"/>
                </div>
            </div>
        </div>
        <div runat="server" id="DivTitle">
            <div class="PanelField Left">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelTitle" Text='<%#ResourceManager.GetWord("Title")%>' 
                        AssociatedControlID="PrimaryTitle"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox runat="server" ID="PrimaryTitle" MaxLength="80" CssClass="InputLarge" />
                </div>
            </div>
        </div>         
        <asp:UpdatePanel runat="server" ID="PrimaryOrganizationUpdatePanel" RenderMode="Block" >
            <ContentTemplate>
                <div style="clear:both;"></div>
                <div runat="server" id="DivPrimaryOrgSelector">
                    <primaryOrgSel:PrimaryOrganizationSelector runat="server" id="primaryOrgSelector" OnPrimaryOrganizationSelectionChanged="PrimaryOrganizationSelectionChanged" 
                        CssClass="PanelNoPadding" ValidatorsInitiallyDisabled="true" Caption="Organization" translate="no" />
                </div>   
            </ContentTemplate>
        </asp:UpdatePanel>
        <div runat="server" id="DivEmail" class="PanelField Left">
            <div style="display:inline;">
                <asiweb:StyledLabel runat="server" ID="LabelEmail" Text='<%#ResourceManager.GetWord("Email")%>'
                    AssociatedControlID="Email"/>
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox MaxLength="60" runat="server" ID="Email" CssClass="InputLarge" />
                <asiweb:AsiRequiredFieldValidator runat="server" ID="EmailValidator" ControlToValidate="Email" ValidationGroup="AccountCreator" CssClass="Important" />
                <asiweb:EmailValidator runat="server" ID="EmailRegularExpressionValidator" ControlToValidate="Email" 
                    ValidationGroup ="AccountCreator" Display="Dynamic" />
            </div>
        </div>
        <div runat="server" id="DivPhone" class="PanelField Left">
            <div style="display:inline;">
                <asiweb:StyledLabel runat="server" ID="LabelPhone" Text='<%#ResourceManager.GetWord("Phone")%>'
                    AssociatedControlID="Phone"/>
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox MaxLength="25" runat="server" ID="Phone" />
            </div>
        </div>       
        <div runat="server" id="DivMobilePhone" class="PanelField Left">
            <div style="display:inline;">
                <asiweb:StyledLabel runat="server" ID="LabelMobilePhone" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Contact.ContactAccountCreator.MobilePhone", "Mobile phone")%>'
                    AssociatedControlID="MobilePhone"/>
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox MaxLength="25" runat="server" ID="MobilePhone" />
            </div>
        </div> 
    </asp:Panel>
    <asp:Panel id="SelectCountryPanel" runat="server" >  
    <div class="PanelField Left">
        <div style="display:inline;">
            <asiweb:StyledLabel runat="server" ID="LabelCountry" CssClass="Required" Text='<%#ResourceManager.GetWord("Country")%>'
                AssociatedControlID="SelectCountry"/>
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessDropDownList runat="server" id="SelectCountry" AutoPostBack="True" OnTextChanged="AddressFieldManuallyChanged" />
            <asiweb:AsiRequiredFieldValidator runat="server" ID="SelectCountryValidator" ControlToValidate="SelectCountry" ValidationGroup="AccountCreator" CssClass="Important" SetFocusOnError="True" />
        </div>
    </div>
    </asp:Panel>
    <asp:Panel runat="server" id="PostalCodeLookupPanel" CssClass="PanelField Left hidden">
        <uc1:PostalCodeLookup ID="PostalCodeLookup" runat="server" jsCallback="CAC_PopulateAfterLookup"/>
    </asp:Panel>
    <asp:UpdatePanel ID="AddressPanel" RenderMode="Block" runat="server">
        <ContentTemplate>
        <div class="PanelField Left">
            <div style="display:inline;">
                <asiweb:StyledLabel runat="server" ID="LabelAddress1" CssClass="Required" Text='<%#ResourceManager.GetWord("Address")%>'
                    AssociatedControlID="TextAddress1"/>
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" MaxLength="40" ID="TextAddress1" OnTextChanged="AddressFieldManuallyChanged" CssClass="InputLarge" />
                <asiweb:AsiRequiredFieldValidator runat="server" ID="TextAddress1Validator" ControlToValidate="TextAddress1" ValidationGroup="AccountCreator" CssClass="Important" SetFocusOnError="True" />
            </div>
        </div>
        <asp:Panel id="AddressControls" runat="server" >           
            <div class="PanelField Left" id="DivAddress2" runat="server">
                <div style="display: inline;" class="LabelSpacer FloatLeft">
                    <asiweb:StyledLabel runat="server" ID="LabelAddress2" 
                        AssociatedControlID="TextAddress2"  Text='<%#ResourceManager.GetPhrase("AddressLine2", "Address line 2")%>' CssClass="screen-reader-text" />
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox MaxLength="40" runat="server" ID="TextAddress2" OnTextChanged="AddressFieldManuallyChanged" CssClass="InputLarge" />
                </div>
            </div>			
            <div style="clear:both;"></div>
            <div class="PanelField Left" id="DivAddress3" runat="server">
                <div style="display:inline;" class="LabelSpacer FloatLeft">
                    <asiweb:StyledLabel runat="server" ID="LabelAddress3" 
                        AssociatedControlID="TextAddress3" Text='<%#ResourceManager.GetPhrase("AddressLine3", "Address line 3")%>' CssClass="screen-reader-text" />
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox MaxLength="40" runat="server" ID="TextAddress3" OnTextChanged="AddressFieldManuallyChanged" CssClass="InputLarge" />
                </div>
            </div>
            <div class="PanelField Left">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelCity" CssClass="Required" Text='<%#ResourceManager.GetWord("City")%>'
                        AssociatedControlID="TextCity"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox MaxLength="40" runat="server" ID="TextCity" OnTextChanged="AddressFieldManuallyChanged" CssClass="InputLarge" />
                    <asiweb:AsiRequiredFieldValidator runat="server" ID="TextCityValidator" ControlToValidate="TextCity" ValidationGroup="AccountCreator" CssClass="Important" SetFocusOnError="True" />
                </div>
            </div>
            <div class="PanelField Left" id="DivSubEntity" runat="server" >
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelSubEntityCode" CssClass="Required" Text='<%#ResourceManager.GetWord("State")%>'
                        AssociatedControlID="SelectSubEntityCode"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessDropDownList runat="server" id="SelectSubEntityCode" OnTextChanged="AddressFieldManuallyChanged" />
                    <asiweb:AsiRequiredFieldValidator runat="server" ID="SubEntityCodeValidator" ControlToValidate="SelectSubEntityCode" ValidationGroup="AccountCreator" CssClass="Important" SetFocusOnError="True" />
                
                    <asiweb:BusinessTextBox MaxLength="50" runat="server" ID="TextSubEntity" OnTextChanged="AddressFieldManuallyChanged" />
                    <asiweb:AsiRequiredFieldValidator runat="server" ID="TextSubEntityValidator" ControlToValidate="TextSubEntity" ValidationGroup="AccountCreator" CssClass="Important" SetFocusOnError="True" />
                </div>
            </div>
            <div class="PanelField Left">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelPostalCode" CssClass="Required" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Contact.ContactAccountCreator.PostalCode", "Postal code")%>'
                        AssociatedControlID="TextPostalCode"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox runat="server" ID="TextPostalCode" OnTextChanged="AddressFieldManuallyChanged" CssClass="InputSmall" />
                    <asiweb:AsiRequiredFieldValidator runat="server" ID="TextPostalCodeValidator" ControlToValidate="TextPostalCode" ValidationGroup="AccountCreator" CssClass="Important" SetFocusOnError="True" />
                    <asiweb:AsiRegularExpressionValidator runat="server" ID="TextPostalCodeRegexValidator" ControlToValidate="TextPostalCode" ValidationGroup="AccountCreator" CssClass="Important" />
                </div>
            </div>          
        </asp:Panel> <!-- AddressControls -->
        </ContentTemplate>
     </asp:UpdatePanel>    
    <asp:UpdatePanel runat="server" ID="AdministratorPanel">
        <ContentTemplate>
            <div runat="Server" ID="AdministratorControls" class="PanelField Left">
                <asiweb:StyledLabel ID="AdministratorCaption" runat="server" Text='<%# ResourceManager.GetWord("Administrator") %>' AssociatedControlID="SetSelectedAdministratorContactKeyButton" />
                <div class="PanelFieldValue">
                    <asiweb:StyledLabel runat="server" ID="AdministratorName" CssClass="MarginRight" />
                    <asp:LinkButton runat="server" ID="RemoveLinkButton" CssClass="MarginLeft MarginRight" Text='<%# ResourceManager.GetWord("remove") %>' OnClick="RemoveAdministratorLinkButtonClicked" />
                    <asp:LinkButton runat="server" id="SelectLink" CssClass="MarginRight" Text='<%# ResourceManager.GetWord("select") %>' OnClientClick='<%# string.Format(CultureInfo.InvariantCulture, "{0}_AdministratorSelectOpenFinderAdder(); return false;", ClientID)%>' />
                    <asiweb:InfoControl runat="server" ID="AdministratorHelpInfo" />
                    <asp:Button ID="SetSelectedAdministratorContactKeyButton" runat="server" OnClick="SetSelectedAdministratorContactKeyButtonClick" CausesValidation="false" 
                        aria-hidden="true" Text="Set Contact" style="display:none" />
                </div>
            </div>  
        </ContentTemplate>
    </asp:UpdatePanel>  
                                                      
    <asp:Panel runat="server" ID="CreateLogonPanel">           
        <asiweb:BusinessCheckBox runat="server" ID="UserRequiresLogon" Caption='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Contact.ContactAccountCreator.CreateLogon", "Create an account")%>' RenderPanelField="true" DisplayCaption="true" PositionCaption="Right" />       
        <div class="PanelField Left">
            <div style="display:inline;">
                <asiweb:StyledLabel runat="server" CssClass="Label" ID="LabelLogon" Text='<%#ResourceManager.GetWord("Username")%>' Enabled="true" EnableViewState="true" />
            </div>
            <div runat="server" id="DivLogon" class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="Logon" Enabled="true" EnableViewState="true" autocomplete="off"/>
                <asiweb:AsiRequiredFieldValidator runat="server" ID="LogonValidator" ControlToValidate="Logon" Enabled="false" ValidationGroup="AccountCreator" CssClass="Important" SetFocusOnError="True" />
            </div>
            <div runat="server" id="DivLogonEmail" class="PanelFieldValue">
                <asiweb:StyledLabel EnableViewState="true" ID="LogonEmail" runat="server" />
            </div>
        </div>
        <div style="clear:both;"></div>
        <div class="PanelField Left">
            <div style="display:inline;">
                <asiweb:StyledLabel runat="server" ID="LabelPassword" Text='<%#ResourceManager.GetWord("Password")%>'
                    AssociatedControlID="Password" Enabled="true" EnableViewState="true"/>
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="Password" TextMode="Password" Enabled="true" EnableViewState="true" autocomplete="off" />
                <asiweb:AsiRequiredFieldValidator runat="server" ID="PasswordValidator" ControlToValidate="Password" Enabled="false" ValidationGroup="AccountCreator" CssClass="Important" SetFocusOnError="True" />
            </div>
        </div>
        <div style="clear:both;"></div>
        <div class="PanelField Left">
            <div style="display:inline;">
                <asiweb:StyledLabel runat="server" ID="LabelConfirmPassword" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Contact.ContactAccountCreator.ConfirmPassword","Confirm password")%>'
                    AssociatedControlID="ConfirmPassword" Enabled="true" EnableViewState="true"/>
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="ConfirmPassword" TextMode="Password" Enabled="true" EnableViewState="true" autocomplete="off" />
                <asiweb:AsiRequiredFieldValidator runat="server" ID="ConfirmPasswordValidator" ControlToValidate="ConfirmPassword"  Enabled="false" ValidationGroup="AccountCreator" CssClass="Important" SetFocusOnError="True" />
                <asp:CompareValidator runat="server" ID="ConfirmPasswordCompareValidator" ControlToValidate="ConfirmPassword" ControlToCompare="Password" Type="String" Operator="Equal" 
                    ErrorMessage="Passwords do not match" Display="Dynamic" Enabled="false" ValidationGroup="AccountCreator" CssClass="Important"/>   
            </div>  
        </div>
        <asp:Label runat="server" ID="PasswordMessage" CssClass="Info"/>   
        <div runat="server" id="DivPasswordRecoveryEmail">
            <div runat="server" id="DivRecoveryEmail" class="PanelField Left">
                <div style="display:inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelRecoveryEmail" Text='<%#ResourceManager.GetWord("Email to retrieve user name")%>'
                        AssociatedControlID="RecoveryEmail" />
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox MaxLength="60" runat="server" ID="RecoveryEmail" CssClass="InputLarge" autocomplete="off" />
                    <asiweb:AsiRequiredFieldValidator runat="server" ID="RecoveryEmailValidator" ControlToValidate="RecoveryEmail" ValidationGroup="AccountCreator" CssClass="Important" />
                    <asiweb:EmailValidator runat="server" ID="RecoveryEmailRegularExpressionValidator" ControlToValidate="RecoveryEmail" 
                        ValidationGroup ="AccountCreator" Display="Dynamic" />
                </div>
            </div>
       </div>                  
    </asp:Panel>
</asp:Panel>

<script type="text/javascript">   
    jQuery(function () { OnLoad(); });

    function OnLoad() {
        var logonElement = document.getElementById('<%#Logon.ClientID%>');
        if (logonElement != null) {
            logonElement.setAttribute("autocorrect", "off");
            logonElement.setAttribute("autocapitalize", "off");
        }
    }
    function <%#ClientID%>_AdminsistratorSelectFinderCallBackFunction(radwindow) {
        var contactKey;
        if (radwindow.newContactKey != null)
            contactKey = radwindow.newContactKey; // We are creating a new contact via the "Add a contact" window 
        else { // We are using a preexisting contact
            var result = radwindow.result;
            if (result != null)
                contactKey = result[0];
        }

        if (contactKey) {
            var contactSelectedKey = window.$get('<%# HiddenAdministratorContactKey.ClientID %>');
            contactSelectedKey.value = contactKey;
            var elm = window.$get('<%# SetSelectedAdministratorContactKeyButton.ClientID %>');
            if (elm != null)
                elm.click();
        }
    }
    function <%#ClientID%>_AdministratorSelectOpenFinderAdder() {
        var orgNameField = window.$get('<%#OrganizationName.ClientID%>');
        ShowDialog('~/AsiCommon/Controls/Shared/FinderAdder/PartyFinderAdder.aspx?DocumentPath=$/ContactManagement/DefaultSystem/Queries/Contacts&PartyType=1&AllowAdd=true&OrganizationName=' + encodeURIComponent(orgNameField.value), null, null, null, "Find", null, 'E', <%#ClientID%>_AdminsistratorSelectFinderCallBackFunction, 'ObjectBrowser', false, true);      
    }

     // Create the event handlers for PageRequestManager
    var prm = Sys.WebForms.PageRequestManager.getInstance();

    prm.add_initializeRequest(PageRequestManager_initializeRequest);
    prm.add_beginRequest(PageRequestManager_beginRequest);
    prm.add_endRequest(PageRequestManager_endRequest);

    var uiId = '';
    function PageRequestManager_initializeRequest(sender, args) {
        if (sender.get_isInAsyncPostBack()) {
            args.set_cancel(true);
        }
    }
    function PageRequestManager_beginRequest(sender, args) {
        var postbackElem = args.get_postBackElement();
        uiId = postbackElem.id;
        postbackElem.disabled = true;
    }
    function PageRequestManager_endRequest(sender, args) {
        var x = $get(uiId);
        if(x != undefined)
            x.disabled = false;

        if (args.get_error() != undefined) {
            var error = args.get_error().name;
            if (error != 'undefined' && error == 'Sys.WebForms.PageRequestManagerServerErrorException')
                args.set_errorHandled(true);

            document.getElementById(uiId).focus();
        }
    }

    //<![CDATA[   
    if (typeof(AccountCreatorClass) !== 'undefined') {
        var accountCreatorInstance_<%#ClientID%> = new AccountCreatorClass('<%#ContentPanel.ClientID%>', '<%#ClientID%>', '<%#IsOrgOnlyAccountEnabled%>', '<%#IsIndividualOnlyAccountEnabled%>', '<%#IsInTributeGiftEditor()%>');

        accountCreatorInstance_<%#ClientID%>.SoaErrorLabel = "<%#LabelErrorMessage.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.SoaSuccessLabel = "<%#LabelSuccessMessage.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.DivSuccessLabel = "<%#DivLabelSuccessMessage.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LogonEmail = "<%#LogonEmail.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.EmailTextbox = "<%#Email.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.UserRequiresLogon = "<%#UserRequiresLogon.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelLogon = "<%#LabelLogon.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.Logon = "<%#Logon.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelPassword = "<%#LabelPassword.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.Password = "<%#Password.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelConfirmPassword = "<%#LabelConfirmPassword.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.ConfirmPassword = "<%#ConfirmPassword.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.PasswordMessage = "<%#PasswordMessage.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.ConfirmPasswordCompareValidator = "<%#ConfirmPasswordCompareValidator.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.PasswordValidator = "<%#PasswordValidator.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.ConfirmPasswordValidator = "<%#ConfirmPasswordValidator.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LogonValidator = "<%#LogonValidator.ClientID%>";

        accountCreatorInstance_<%#ClientID%>.LabelRecoveryEmail = "<%#LabelRecoveryEmail.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.RecoveryEmailTextbox = "<%#RecoveryEmail.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.RecoveryEmailValidator = "<%#RecoveryEmailValidator.ClientID%>";
 
        accountCreatorInstance_<%#ClientID%>.CreateAccountType = '<%#CreateAccountType.ClientID.Replace("_", "$")%>';
        accountCreatorInstance_<%#ClientID%>.IndividualOnlyAccountType = "<%#AccountType.IndividualOnly.ToString()%>";
        accountCreatorInstance_<%#ClientID%>.OrgOnlyAccountType = "<%#AccountType.OrganizationOnly.ToString()%>";
        accountCreatorInstance_<%#ClientID%>.DivFirstName = "<%#DivFirstName.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelFirstName = "<%#LabelFirstName.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.FirstName = "<%#FirstName.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.DivMiddleName = "<%#DivMiddleName.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelMiddleName = "<%#LabelMiddleName.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.MiddleName = "<%#MiddleName.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelLastName = "<%#LabelLastName.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.DivLastName = "<%#DivLastName.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LastName = "<%#LastName.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.DivPrefix = "<%#DivPrefix.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelPrefix = "<%#LabelPrefix.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.Prefix = "<%#Prefix.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.DivSuffix = "<%#DivSuffix.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelSuffix = "<%#LabelSuffix.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.Suffix = "<%#Suffix.ClientID%>";

        accountCreatorInstance_<%#ClientID%>.DivDesignation = "<%#DivDesignation.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelDesignation = "<%#LabelDesignation.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.Designation = "<%#Designation.ClientID%>";
        
        accountCreatorInstance_<%#ClientID%>.DivInformalName = "<%#DivInformalName.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelInformalName = "<%#LabelInformalName.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.InformalName = "<%#InformalName.ClientID%>";
        
        accountCreatorInstance_<%#ClientID%>.DivTitle = "<%#DivTitle.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelTitle = "<%#LabelTitle.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.PrimaryTitle = "<%#PrimaryTitle.ClientID%>";
        
        accountCreatorInstance_<%#ClientID%>.FirstNameValidator = "<%#FirstNameValidator.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LastNameValidator = "<%#LastNameValidator.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelOrganizationName = "<%#LabelOrganizationName.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.DivOrganizationName = "<%#DivOrganizationName.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.OrganizationName = "<%#OrganizationName.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.OrganizationNameValidator = "<%#OrganizationNameValidator.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.CreateLogonPanel = "<%#CreateLogonPanel.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.DivEmail = "<%#DivEmail.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelEmail = "<%#LabelEmail.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.EmailValidator = "<%#EmailValidator.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.EmailRegularExpressionValidator = "<%#EmailRegularExpressionValidator.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.DivPrimaryOrgSelector = "<%#DivPrimaryOrgSelector.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.LabelPrimaryOrgSelector = "<%#PrimaryOrganizationSelector.PrimaryOrganizationCaptionLabelClientId%>";
        accountCreatorInstance_<%#ClientID%>.PrimaryOrgSelectorValidator = "<%#PrimaryOrganizationSelector.PrimaryOrganizationRequiredValidatorClientId%>";
        accountCreatorInstance_<%#ClientID%>.NewContactKey = "<%#HiddenContactKey.ClientID%>";
        accountCreatorInstance_<%#ClientID%>.NewPartyId = "<%#HiddenPartyId.ClientID%>";

        accountCreatorInstance_<%#ClientID%>.AdministratorControls = "<%#AdministratorControls.ClientID%>";
        
        // Booleans
        accountCreatorInstance_<%#ClientID%>.RequireUserToCreateLogon = <%#RequireUserToCreateLogon.ToString(CultureInfo.InvariantCulture).ToLowerInvariant()%>;
        accountCreatorInstance_<%#ClientID%>.IsOrgOnlyByConfig = <%#AccountTypeAllowed.Equals(AccountType.OrganizationOnly.ToString()).ToString(CultureInfo.InvariantCulture).ToLowerInvariant()%>;
        accountCreatorInstance_<%#ClientID%>.IsIndOnlyByConfig = <%#AccountTypeAllowed.Equals(AccountType.IndividualOnly.ToString()).ToString(CultureInfo.InvariantCulture).ToLowerInvariant()%>;
        accountCreatorInstance_<%#ClientID%>.IsContentDesignMode = <%#IsContentDesignMode.ToString(CultureInfo.InvariantCulture).ToLowerInvariant()%>;
        accountCreatorInstance_<%#ClientID%>.IsImis15 = <%#IsImis15.ToString(CultureInfo.InvariantCulture).ToLowerInvariant()%>;
        accountCreatorInstance_<%#ClientID%>.RequirePrimaryOrganizationSelection = <%# RequirePrimaryOrganizationSelection.ToString(CultureInfo.InvariantCulture).ToLowerInvariant() %>;        
        accountCreatorInstance_<%#ClientID%>.IncludeEmailForIndividual = <%# IncludeEmailForIndividual.ToString(CultureInfo.InvariantCulture).ToLowerInvariant()%>;
        accountCreatorInstance_<%#ClientID%>.RequireEmailForIndividual = <%# RequireEmailForIndividual.ToString(CultureInfo.InvariantCulture).ToLowerInvariant()%>;
        accountCreatorInstance_<%#ClientID%>.IncludeEmailForOrganization = <%# IncludeEmail.ToString(CultureInfo.InvariantCulture).ToLowerInvariant()%>;
        accountCreatorInstance_<%#ClientID%>.RequireEmailForOrganization = <%# RequireEmailForOrganization.ToString(CultureInfo.InvariantCulture).ToLowerInvariant()%>;
        accountCreatorInstance_<%#ClientID%>.UseEmailAsLogOn = <%# UseEmailAsLogon.ToString(CultureInfo.InvariantCulture).ToLowerInvariant()%>;
    }    
    //]]>
      function <%#ClientID%>_CAC_PopulateAfterLookup(address) {
    	var isDirtyField;
    	var isMultipleAddressLines = <%#MultipleAddressLines.ToString(CultureInfo.InvariantCulture).ToLowerInvariant()%>;
    	for (var i = 0; i < prm._form.length; i++) {
    		var field = prm._form[i];
    		if (field.id.indexOf("TextAddress1") !== -1) {
    			if (isMultipleAddressLines)
    				CAC_SetAddressFields(field, address, 0);
    			else {
    				field.value = "";
    				if (address.AddressLines.$values[0])
    					field.value = address.AddressLines.$values[0];
    				if (address.AddressLines.$values[1])
    					field.value += address.AddressLines.$values[1];
    				if (address.AddressLines.$values[2])
    					field.value += address.AddressLines.$values[2];
    			}
    		}
    		if (field.id.indexOf("TextAddress2") !== -1) {
    			CAC_SetAddressFields(field, address, 1);
    		}
    		if (field.id.indexOf("TextAddress3") !== -1) {
    			CAC_SetAddressFields(field, address, 2);
    		}
    		if (field.id.indexOf("TextCity") !== -1) {
    			CAC_SetAdditionalAddressFields(field, address.CityName);
    		}
    		if (field.id.indexOf("TextSubEntity") !== -1) {
    			CAC_SetAdditionalAddressFields(field, address.CountrySubEntityName);
    		}
    		if (field.id.indexOf("TextPostalCode") !== -1) {
    			CAC_SetAdditionalAddressFields(field, address.PostalCode);
    		}
    		if (field.id.indexOf("AddressIsDirtyControl") !== -1) {
    			isDirtyField = field;
    		}
    	}
		
    	isDirtyField.value = "false";
	}

    function CAC_SetAddressFields(field, address, index) {
        field.value = "";
        if (address.AddressLines.$values[index])
            field.value = address.AddressLines.$values[index];
    }

    function CAC_SetAdditionalAddressFields(field, addressItem) {
        field.value = "";
        if (addressItem)
            field.value = addressItem;
    }
</script>

