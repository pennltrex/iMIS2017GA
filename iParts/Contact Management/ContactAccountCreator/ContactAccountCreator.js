function AccountCreatorClass(contentPanel, clientId, isOrgOnlyAccountEnabled, isIndOnlyAccountEnabled, isInTributeGiftEditor) {

    //
    // Variables
    //
    this.SoaErrorLabel;
    this.SoaSuccessLabel;
    this.DivSuccessLabel;

    this.LogonEmail;
    this.EmailTextbox;

    this.UserRequiresLogon;
    this.LabelLogon;
    this.Logon;
    this.LabelPassword;
    this.Password;
    this.LabelConfirmPassword;
    this.ConfirmPassword;
    this.PasswordMessage;
    this.ConfirmPasswordCompareValidator;
    this.PasswordValidator;
    this.ConfirmPasswordValidator;
    this.LogonValidator;
    this.LabelRecoveryEmail;
    this.RecoveryEmailTextbox;
    this.RecoveryEmailValidator;

    this.CreateAccountType;
    this.IndividualOnlyAccountType;
    this.OrgOnlyAccountType;
    this.DivFirstName;
    this.LabelFirstName;
    this.FirstName;

    this.DivMiddleName;
    this.LabelMiddleName;
    this.MiddleName;

    this.DivLastName;
    this.LabelLastName;
    this.LastName;
    this.DivPrefix;
    this.LabelPrefix;
    this.Prefix;
    this.DivSuffix;
    this.LabelSuffix;
    this.Suffix;
    
    this.DivDesignation;
    this.LabelDesignation;
    this.Designation;

    this.DivInformalName;
    this.LabelInformalName;
    this.InformalName;

    this.DivTitle;
    this.LabelTitle;
    this.PrimaryTitle;

    this.FirstNameValidator;
    this.LastNameValidator;

    this.DivOrganizationName;
    this.LabelOrganizationName;
    this.OrganizationName;
    this.OrganizationNameValidator;

    this.CreateLogonPanel;
    this.NewContactKey;

    this.DivEmail;
    this.LabelEmail;
    this.EmailValidator;
    this.EmailRegularExpressionValidator;
    this.DivPrimaryOrgSelector;
    this.LabelPrimaryOrgSelector;
    this.PrimaryOrgSelectorValidator;

    this.AdministratorControls;

    // Booleans
    this.RequireUserToCreateLogon;
    this.IsIndOnlyByConfig;
    this.IsOrgOnlyByConfig;
    this.IsContentDesignMode;
    this.IsImis15;
    this.RequirePrimaryOrganizationSelection;
    this.IncludeEmailForIndividual;
    this.RequireEmailForIndividual;
    this.IncludeEmailForOrganization;
    this.RequireEmailForOrganization;
    this.UseEmailAsLogOn;

    this.isInAutoComplete;
    //
    // Functions
    //
    this.ShowErrors = function () {
        // Clear out any SOA errors so they don't display along with any (client) Validator errors.
        var soaErrLabel = $get(this.SoaErrorLabel);
        if (soaErrLabel != null) soaErrLabel.textContent ? soaErrLabel.textContent = "" : soaErrLabel.innerText = "";

        // Now clear out the success message (in case 1 account was successfully created, 
        // then an error occurs creating another account).
        var successLabel = $get(this.SoaSuccessLabel);
        if (successLabel != null) successLabel.textContent ? successLabel.textContent = "" : successLabel.innerText = "";
        var divSuccessLabel = $get(this.DivSuccessLabel);
        if (divSuccessLabel != null) {
            divSuccessLabel.textContent ? divSuccessLabel.textContent = "" : divSuccessLabel.innerText = "";
            divSuccessLabel.visible = false;
        }
        var accountTypeValue = this.GetCreateAccountTypeValue();
        var isNotOrgOnly = !(this.IsOrgOnlyByConfig || accountTypeValue == this.OrgOnlyAccountType);
        if (isNotOrgOnly) {
            var field = $get(this.DivOrganizationName);
            if (field != null) {
                field.style.display = "none";
                field.setAttribute("disabled", "disabled");
            }
            field = $get(this.OrganizationNameValidator);
            if(field != null && (field.isvalid != null || field.controltovalidate != null)) { // It's a validator
                ValidatorEnable(field, !isNotOrgOnly); // Enable/disable the validator
                ValidatorValidate(field); // Call the validator
                field.isvalid = true; // This is needed so the Required validators don't display an error message
                field.style.display = "none"; // This is needed so the Required validators don't display an error message
            }
        }
    };    // End this.ShowErrors = function ()

    // Return the selected Account Type, or an empty string if the configuration is set to Individual Only or Organization Only.
    this.GetCreateAccountTypeValue = function() {
        // We're looking for a radio button value, so we need to replace the underscores, which are used in 'id' attributes, 
        // with dollar signs, which are used in 'name' attributes.
        var accountType = document.getElementsByName(this.CreateAccountType);
        if (accountType != null) {
            var len = accountType.length;
            if (len != undefined) {
                for (var i = 0; i < len; i++) {
                    if (accountType[i].checked) {
                        return accountType[i].value;
                    }
                }
            }
        }
        return "";
    }; // End this.GetCreateAccountTypeValue = function ()

    // Email logic
    this.VerifyEmail = function() {
        this.DefaultLogonText();
        this.SetEmailValidators();
    }; // End this.VerifyEmail = function ()

    // Set the email as the Logon Value if the email exists
    // (only really applies if UseEmailAsLogon is checked in configuration).
    this.DefaultLogonText = function() {
        var logonEmailLabel = $get(this.LogonEmail);
        if (logonEmailLabel == null) return;

        logonEmailLabel.textContent != null ? logonEmailLabel.textContent = "" : logonEmailLabel.innerText = ""; // Default

        var emailTextbox = $get(this.EmailTextbox);
        if (emailTextbox == null) return;

        logonEmailLabel.textContent != null ? logonEmailLabel.textContent = emailTextbox.value : logonEmailLabel.innerText = emailTextbox.value; // Default
    }; // End this.DefaultLogonText = function ()

    this.SetEmailValidators = function () {
        var userRequiresLogon = $get(this.UserRequiresLogon);
        var labelLogon = $get(this.LabelLogon);
        var emailRequiredForLogon = false;
        if ((userRequiresLogon == null && labelLogon != null) || (userRequiresLogon != null && userRequiresLogon.checked)) {
            emailRequiredForLogon = true;
        }
        var emailTextbox = $get(this.EmailTextbox);

        // This logic only applies if the email fields are not 'explicitly' required
        var accountTypeValue = this.GetCreateAccountTypeValue();
        var isNotOrgOnly = !(this.IsOrgOnlyByConfig || accountTypeValue == this.OrgOnlyAccountType);
        var isNotIndOnly = !(this.IsIndOnlyByConfig || accountTypeValue == this.IndividualOnlyAccountType);
        if(((isNotOrgOnly && this.RequireEmailForIndividual) ||
            (isNotIndOnly && this.RequireEmailForOrganization)))
            return;

        if (emailTextbox != null) {
            var emailFieldsAreRequired = this.RequireEmailForIndividual || emailRequiredForLogon;

            var emailFieldIds = new Array(this.EmailValidator, this.LabelEmail);

            var counter = 0;
            for (counter in emailFieldIds) {
                var fieldId = emailFieldIds[counter];
                var field = $get(fieldId);
                if (field == null) continue;

                if (field.tagName != null) {
                    if (field.tagName.toLowerCase() == "label")
                        emailFieldsAreRequired ? field.className = "Required" : field.className = null; // Set the style for labels
                }
                if (field.isvalid != null || field.controltovalidate != null) { // It's a validator
                    ValidatorEnable(field, emailFieldsAreRequired); // Enable/disable the validator
                    ValidatorValidate(field); // Call the validator
                    field.isvalid = true; // This is needed so the Required validators don't display an error message
                    field.style.display = "none"; // This is needed so the Required validators don't display an error message
                }
            }
        }
    }; // End this.SetEmailValidators = function ()

    // If the Create Logon section is not configured to be required, then let the user explicitly decide
    // if they want to create a logon by enabling/disabling and showing/hiding the logon fields.
    this.ToggleLogon = function () {
        var userRequiresLogon = $get(this.UserRequiresLogon);
        var labelLogon = $get(this.LabelLogon);
        var requireLogon = false;
        if ((userRequiresLogon == null && labelLogon != null) || (userRequiresLogon != null && userRequiresLogon.checked)) {
            requireLogon = true;
        }

        var createLogonFieldIds = [// Put validators at the end
            this.LabelLogon,
            this.Logon,
            this.LogonEmail,
            this.LabelPassword,
            this.Password,
            this.LabelConfirmPassword,
            this.ConfirmPassword,
            this.PasswordMessage,
            this.LabelRecoveryEmail,
            this.RecoveryEmailTextbox,
            this.LogonValidator,
            this.PasswordValidator,
            this.ConfirmPasswordValidator,
            this.ConfirmPasswordCompareValidator,
            this.RecoveryEmailValidator
        ];

        var counter = 0;
        for (counter in createLogonFieldIds) {
            if (createLogonFieldIds.hasOwnProperty(counter)) {
                var fieldId = createLogonFieldIds[counter];
                var field = $get(fieldId);
                if (field == null) continue;

                if (field.type != null) {
                    if (this.UseEmailAsLogOn) {
                        if (field.type == "password")
                            field.value = ""; // Blank out text fields
                    } else if (field.type == "text" || field.type == "password") {
                        field.value = ""; // Blank out text fields
                    }
                } else if (field.tagName != null) {
                    if (field.tagName.toLowerCase() == "label")
                        requireLogon ? field.className = "Required" : field.className = null; // Set the style for labels
                }

                // For Firefox/Safari to work correctly (e.g. Labels do not appear disabled when they're not), the disabled attribute
                // must be explicitly set and removed; you can't just do "field.disabled = true|false".
                requireLogon ? field.style.display = "inline" : field.style.display = "none";
                requireLogon ? field.removeAttribute("disabled") : field.setAttribute("disabled", "disabled");
                requireLogon ? jQuery('#' + fieldId).removeClass("aspNetDisabled") : jQuery('#' + fieldId).addClass("aspNetDisabled");

                if (field.isvalid != null || field.controltovalidate != null) { // It's a validator
                    ValidatorEnable(field, requireLogon); // Enable/disable the validator
                    ValidatorValidate(field); // Since the fields are now blank, the validator will be true, so there won't be an error message that displays
                    field.isvalid = true; // This is needed so the Required validators don't display an error message
                    field.style.display = "none"; // This is needed so the Required validators don't display an error message
                }
            }
        }

        this.SetEmailRequiredStatus();

        // Special case for setting the style for the Logon field/display.
        if (labelLogon != null) {
            // If the Logon label is just displaying the email as the Logon, then there is no required field.
            var logon = $get(this.Logon);
            logon == null || logon.disabled == true ? labelLogon.className = "Label" : labelLogon.className = "Required";
        }
    }; // End this.ToggleLogon = function ()

    // Set required status on email fields when 'Create an account' checkbox is toggled
    this.SetEmailRequiredStatus = function() {
        var userRequiresLogon = $get(this.UserRequiresLogon);
        var labelLogon = $get(this.LabelLogon);
        var emailRequiredForLogon = false;
        if ((userRequiresLogon == null && labelLogon != null) || (userRequiresLogon != null && userRequiresLogon.checked)) {
            emailRequiredForLogon = true;
        }

        //Don't disable the email required flag if "require email" configuration is enabled
        var accountTypeValue = this.GetCreateAccountTypeValue();
        var isNotOrgOnly = !(this.IsOrgOnlyByConfig || accountTypeValue == this.OrgOnlyAccountType);
        var isNotIndOnly = !(this.IsIndOnlyByConfig || accountTypeValue == this.IndividualOnlyAccountType);

        var enableValidators = ((isNotOrgOnly && this.RequireEmailForIndividual && (accountTypeValue == this.IndividualOnlyAccountType)) ||
                                (isNotIndOnly && this.RequireEmailForOrganization && (accountTypeValue == this.OrgOnlyAccountType)));

        if (enableValidators) {
            return;
        }

        var emailFieldIds = [// Put validators at the end
            this.LabelEmail,
            this.EmailValidator
        ];

        var counter = 0;
        for (counter in emailFieldIds) {
            if (emailFieldIds.hasOwnProperty(counter)) {
                var fieldId = emailFieldIds[counter];
                var field = $get(fieldId);

                if (field == null) continue;

                if (field.tagName != null) {
                    if (field.tagName.toLowerCase() == "label")
                        emailRequiredForLogon ? field.className = "Required" : field.className = null; // Set the style for labels
                }

                if (field.isvalid != null || field.controltovalidate != null) { // It's a validator
                    ValidatorEnable(field, emailRequiredForLogon); // Enable/disable the validator
                    ValidatorValidate(field); // Since the fields are now blank, the validator will be true, so there won't be an error message that displays
                    field.isvalid = true; // This is needed so the Required validators don't display an error message
                    field.style.display = "none"; // This is needed so the Required validators don't display an error message
                    field.focusOnError = 't'; // setting back to default for proper error validation handling on the UI
                }
            }
        }
    }; // END this.SetEmailRequiredStatus = function ()

    // Toggle the 'required' fields for Individual vs Organization account types.
    this.ToggleAccountTypeFields = function () {
        
        var accountTypeValue = this.GetCreateAccountTypeValue();
        var isNotOrgOnly = !(this.IsOrgOnlyByConfig || accountTypeValue == this.OrgOnlyAccountType);
        var isNotIndOnly = !(this.IsIndOnlyByConfig || accountTypeValue == this.IndividualOnlyAccountType);

        //
        // Enable/Disable fields for Individuals.
        //
        var createIndividualFieldIds = [// Put validators at the end
            this.DivFirstName,
            this.LabelFirstName,
            this.FirstName,
            this.DivMiddleName,
            this.LabelMiddleName,
            this.MiddleName,
            this.DivLastName,
            this.LabelLastName,
            this.LastName,
            this.DivPrefix,
            this.LabelPrefix,
            this.Prefix,
            this.DivSuffix,
            this.LabelSuffix,
            this.Suffix,
            this.DivDesignation,
            this.LabelDesignation,
            this.Designation,
            this.DivInformalName,
            this.LabelInformalName,
            this.InformalName,
            this.DivTitle,
            this.LabelTitle,
            this.PrimaryTitle,
            this.DivPrimaryOrgSelector,
            this.PrimaryOrgSelectorValidator,
            this.FirstNameValidator,
            this.LastNameValidator
        ];

        var counter = 0;
        for (counter in createIndividualFieldIds) {
            var fieldId = createIndividualFieldIds[counter];
            var field = $get(fieldId);
            if (field == null) continue;

            if (field.isvalid != null || field.controltovalidate != null) { // It's a validator
                var enableValidate = isNotOrgOnly;
                if (isNotOrgOnly && fieldId == this.PrimaryOrgSelectorValidator) {
                    // If the field is the primary org validator,
                    // validation should be dependent on the RequirePrimaryOrganizationSelection property
                    enableValidate = this.RequirePrimaryOrganizationSelection;
                }
                field.focusOnError = 'f'; // Setting property to 'false' to prevent input focus issue due to pre-emptive validation below
                this.SetValidator(field, enableValidate); 
                field.isvalid = true; // This is needed so the Required validators don't display an error message
                field.style.display = "none"; // This is needed so the Required validators don't display an error message
                field.focusOnError = 't'; // setting back to default for proper error validation handling on the UI
            } else {
                if (isNotOrgOnly) {
                    field.style.display = "inline";
                    field.removeAttribute("disabled");
                } else {
                    field.style.display = "none";
                    field.setAttribute("disabled", "disabled");
                }
            }
        }

        //
        // Enable/Disable fields for Organizations.
        //
        var createOrganizationFieldIds = [// Put validators at the end
            this.DivOrganizationName,
            this.LabelOrganizationName,
            this.OrganizationName,
            this.AdministratorControls,
            this.OrganizationNameValidator
        ];

        var counter = 0;
        for (counter in createOrganizationFieldIds) {
            var fieldId = createOrganizationFieldIds[counter];
            var field = $get(fieldId);
            if (field == null) continue;

            if (field.isvalid != null || field.controltovalidate != null) {
                // It's a validator
                enableValidate = !isNotOrgOnly;
                field.focusOnError = 'f'; // Setting property to 'false' to prevent input focus issue due to pre-emptive validation below
                this.SetValidator(field, enableValidate);
                field.isvalid = true; // This is needed so the Required validators don't display an error message
                field.style.display = "none"; // This is needed so the Required validators don't display an error message
            } else {
                if (!isNotOrgOnly) {
                    field.style.display = "inline";
                    field.removeAttribute("disabled");
                    //If disabled=disabled gets rendered then also aspNetDisabled class gets added, 
                    jQuery('#' + fieldId).removeClass("aspNetDisabled");
                } else {
                    field.style.display = "none";
                    field.setAttribute("disabled", "disabled");
                }
            }
        }

        //
        // Enable/Disable the Create Logon section
        //
        var createLogonFieldIds = [// Put validators at the end
            this.CreateLogonPanel,   
            this.LabelLogon,
            this.LabelPassword,   
            this.LabelConfirmPassword,
            this.LabelRecoveryEmail,
            this.LogonValidator,
            this.ConfirmPasswordCompareValidator,
            this.PasswordValidator,
            this.ConfirmPasswordValidator
        ];

        var counter = 0;
        for (counter in createLogonFieldIds) {
            var fieldId = createLogonFieldIds[counter];
            var field = $get(fieldId);
            if (field == null) continue;

            if (field.isvalid != null || field.controltovalidate != null) { // It's a validator
                var userRequiresLogon = $get(this.UserRequiresLogon);
                var doesUserRequiresLogon = (userRequiresLogon != null) ? userRequiresLogon.checked : false;
                enableValidate = (isNotOrgOnly && (doesUserRequiresLogon || this.RequireUserToCreateLogon) && !this.IsContentDesignMode);
                field.focusOnError = 'f'; // Setting property to 'false' to prevent input focus issue due to pre-emptive validation below
                this.SetValidator(field, enableValidate);
                field.isvalid = true; // This is needed so the Required validators don't display an error message
                field.style.display = "none"; // This is needed so the Required validators don't display an error message
            } else {
                if (isNotOrgOnly) {
                    field.style.display = "inline";
                    field.removeAttribute("disabled");
                } else {
                    field.style.display = "none";
                    field.setAttribute("disabled", "disabled");
                }
                //Initially disable the labels for logon section
                if (counter >= 7 && userRequiresLogon != null && !userRequiresLogon.checked) {                   
                    field.setAttribute("disabled", "disabled");
                }
            }
        }

        //
        // Email fields are optionally required for both Individual and Organizations in v10.
        // In v100 the email fields are optionally required for Individual and not shown for Organizations.
        //
        var createEmailFieldIds = [// Put validators at the end
            this.DivEmail,
            this.LabelEmail,
            this.EmailTextbox,
            this.EmailValidator
        ];

        var includeEmailFields = ((isNotOrgOnly && this.IncludeEmailForIndividual) ||
                                  (isNotIndOnly && this.IncludeEmailForOrganization));
        
        var enableValidators = ((isNotOrgOnly && this.RequireEmailForIndividual && (accountTypeValue == this.IndividualOnlyAccountType)) ||
                                (isNotIndOnly && this.RequireEmailForOrganization && (accountTypeValue == this.OrgOnlyAccountType)));
            
        var counter = 0;
        for (counter in createEmailFieldIds) {
            var fieldId = createEmailFieldIds[counter];
            var field = $get(fieldId);
            if (field == null) continue;

            if (field.isvalid != null || field.controltovalidate != null) { // It's a validator
                enableValidate = (!this.IsContentDesignMode && enableValidators && includeEmailFields);
                field.focusOnError = 'f'; // Setting property to 'false' to prevent input focus issue due to pre-emptive validation below
                this.SetValidator(field, enableValidate);
                field.isvalid = true; // This is needed so the Required validators don't display an error message
                field.style.display = "none"; // This is needed so the Required validators don't display an error message
            } else {
                if (field.tagName != null && field.tagName.toLowerCase() == "label") {
                        field.className = enableValidators ? "Required" : null;
                }
                field.style.display = includeEmailFields ? "inline" : "none";
            }
        }

        //Email regex validator is required whenever the email textbox is shown
        var emailRegularExpressionValidator = $get(this.EmailRegularExpressionValidator);
        if (emailRegularExpressionValidator != null)
            this.SetValidator(emailRegularExpressionValidator, includeEmailFields);
    }; // End this.ToggleAccountTypeFields = function ()
    
    // used in place of ValidatorEnable() and ValidatorValidate() in ToggleAccountTypeFields
    // which caused focus to be set on the fields when the page loaded
    this.SetValidator = function (field, enableValidate) {
        ValidatorEnable(field, enableValidate);
        ValidatorValidate(field);        
    };
   
    //function used to get newly created contact key, pass value & close pop up window
    this.ReturnAccountCreated = function() {
        //check if in PartyFinderAdder   
        var queryString = '&' + (document.location + '?').split('?')[1];
        if (queryString.match( /PartyType=/ )) {
            var oWindow = GetRadWindow();
            // RD 9/19/12: instead of just setting oWindow.result, we're 
            // setting both NewContactKey and NewPartyId because different consumers
            // require different values. For example, the Proxy Panel requires the guid contact key while
            // Register Someone Else in EventDisplay in i15 requires the string party id
            var newContactKey = $get(this.NewContactKey);
            var newPartyId = $get(this.NewPartyId);
            if (newContactKey || newPartyId) {
                oWindow.newContactKey = newContactKey.value;
                oWindow.newPartyId = newPartyId.value;
                oWindow.Close();
            }
        }
    };
    jQuery(document).ready(function () {
        if (isOrgOnlyAccountEnabled.toLowerCase() === "true" || (isIndOnlyAccountEnabled.toLowerCase() === "true" && isInTributeGiftEditor.toLowerCase() === 'true')) return;

        var toggleFunctionName = 'accountCreatorInstance_' + clientId + '.ToggleAccountTypeFields();';
        eval(toggleFunctionName);

        var toggleLogonFunctionName = 'accountCreatorInstance_' + clientId + '.ToggleLogon();';
        eval(toggleLogonFunctionName);
    });
}     // End function AccountCreatorClass() 