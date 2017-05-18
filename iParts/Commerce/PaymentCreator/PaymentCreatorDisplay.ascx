<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PaymentCreatorDisplay.ascx.cs"
    Inherits="Asi.Web.iParts.Commerce.PaymentCreator.PaymentCreatorDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="uc1" TagName="AddressSelector" Src="~/iParts/Commerce/AddressSelector/AddressSelectorDisplay.ascx" %>    
<%@ Register Src="~/iParts/Commerce/PaymentCreator/DirectDebits.ascx" TagPrefix="uc1" TagName="DirectDebits" %>
<asp:HiddenField ID="dvBatchId" runat="server" />

<asp:Panel ID="ContentPanel" runat="server" Visible="true" translate="yes">

    <script type="text/javascript">
        //<![CDATA[
        <%=ClientID%>_applyHeadTagStyles();

        // Apply AddressSelector styles to head tag
        function <%=ClientID%>_applyHeadTagStyles() {
            var ss1 = document.createElement('style');
            /* This style removes the floating attributes that would be applied to the AddressSelector iPart display control which we use within this iPart*/
            var def = '#<%=AddressSelectorDiv.ClientID%> * {clear: both;} .padLeft{ padding-left: 5px;}';
            ss1.setAttribute("type", "text/css");
            document.getElementsByTagName('head')[0].appendChild(ss1);
            if (ss1.styleSheet) { // IE
                ss1.styleSheet.cssText = def;
            }
            else {
                ss1.appendChild(document.createTextNode(def));
            }
        }

        //on any post we will assign method to payment dropdown onChange to disable all inputs to avoid users typing in and losing everything on postback with slow server
        Sys.Application.add_load(function() {
             jQuery('#<%=PaymentMethodDropDown.ClientID%>').change(function() {
                  <%=ClientID%>_disableCreditCardPanel("#<%=CreditCardPanel.ClientID%> :input ", "#<%=ContentPanel.ClientID%> ");
             });
            jQuery('#<%=CCExpiryMonthDropDown.ClientID%>, #<%=CCExpiryYearDropDown.ClientID%>').on("change", function () {
                Page_ClientValidate("<%# ValidationGroupName %>");

            });
        });

        //disables all inputs for a given panel id - assumes correct selector
        function <%=ClientID%>_disableCreditCardPanel(panelId, mainPanelId) {
            jQuery(panelId).attr('disabled', 'disabled');
            var panel = jQuery(mainPanelId);
            if (panel != null && panel.parent() != null && panel.parent().parent() != null)
                panel.parent().parent().css('height', 'auto'); //sometimes resizing breaks in Chrome
        }
        
        // Validate the expiry date
        function <%=this.ClientID%>_ValidateExpiryDate(source, args) {

            var currentMonth = parseInt("<%= DateTime.Today.Month.ToString() %>", 10);
            var currentYear = parseInt('<%= DateTime.Today.Year.ToString() %>', 10);

            var selectedMonth = parseInt(document.getElementById("<%= CCExpiryMonthDropDown.ClientID %>").value, 10);
            var selectedYear = parseInt(document.getElementById("<%= CCExpiryYearDropDown.ClientID %>").value, 10);

            // check we have what we need
            if (isNaN(selectedMonth) || isNaN(selectedYear) || selectedMonth == 0 || selectedYear == 0) {
                source.innerHTML = "<%= GetTranslatedPhrase(Required) %>";//Grabs message from C# code
                args.IsValid = false;
                return;
            }

            // check the date is valid
            if (selectedYear == currentYear && currentMonth > selectedMonth) {
                source.innerHTML = "<%= GetTranslatedPhrase(InvalidDate) %>";//Grabs message from C# code
                args.IsValid = false;
                return;
            }

            args.IsValid = true;
        }

        // Validate the issue date
        function <%=this.ClientID%>_ValidateIssueDate(source, args) {

            var currentMonth = parseInt("<%= DateTime.Today.Month.ToString() %>", 10);
            var currentYear = parseInt('<%= DateTime.Today.Year.ToString() %>', 10);

            var selectedMonth = parseInt(document.getElementById("<%= CCIssueMonthDropDown.ClientID %>").value, 10);
            var selectedYear = parseInt(document.getElementById("<%= CCIssueYearDropDown.ClientID %>").value, 10);
            // check we have what we need
            if (isNaN(selectedMonth) || isNaN(selectedYear) || selectedMonth == 0 || selectedYear == 0) {
                source.innerHTML = "<%= GetTranslatedPhrase(Required) %>";//Grabs message from C# code
                args.IsValid = false;
                return;
            }

            // check the date is valid
            if (selectedYear == currentYear && currentMonth < selectedMonth) {
                source.innerHTML = "<%= GetTranslatedPhrase(InvalidDate) %>";//Grabs message from C# code
                args.IsValid = false;
                return;
            }

            args.IsValid = true;
        }

        // Validate the cc number
        function <%=this.ClientID%>_ValidateCardNumber(source, args)
        {
            args.IsValid = true;
            source.innerHTML = "";
            var invalidMsg = "<%= GetTranslatedPhrase(InvalidCardNumber) %>";//Grabs message: "Invalid card number" from C# code
            var cc = $get("<%= txtCCNumber.ClientID %>");
            if (!cc) return;
            var ccNum = cc.value + "";            

            // don't validate if its empty, we have already done that with a required field validator
            if (ccNum.replace(" ","").length==0) return;
            
            // does it contain anything that isn't a digit or a space
            if (ccNum.search(/[^0-9\s]/)>=0)
            {
                args.IsValid = false;
                source.innerHTML = invalidMsg;
                return;
            }
            
            // Luhn check
            var numLuhn = ccNum.replace(/\D+/g, '');
            var numLuhnArray = numLuhn.split('').reverse();
            var total = 0, i;
            for (i = 0; i < numLuhnArray.length; i++) {
                numLuhnArray[i] = parseInt(numLuhnArray[i])
                total += i % 2 ? 2 * numLuhnArray[i] - (numLuhnArray[i] > 4 ? 9 : 0) : numLuhnArray[i];
            }
            if ((total % 10) != 0)
            {
                args.IsValid = false;
                source.innerHTML = invalidMsg;	            
                return;
            }
            
            // all good
            cc.value = numLuhn;
            ValidateCardNumber(source, args, ccNum);
          
            return;
        }

        function ValidateCardNumber(source, args,ccNum) {

            ccNum = ccNum.replace(/\s/g, '');
            invalidMsg = "<%= GetTranslatedPhrase(InvalidCardNumberForCardType) %>";//Grabs message: "Invalid card number" from C# code
            var selected = $get("<%= PaymentMethodDropDown.ClientID %> :selected");
            var re = {
                visa: /^4[0-9]{12}(?:[0-9]{3})?$/,
                mastercard: /^5[1-5][0-9]{14}$/,
                mastercard2: /^2[2-7][0-9]{14}$/,
                amex: /^3[47][0-9]{13}$/,
                diners: /^3(?:0[0-5]|[68][0-9])[0-9]{11}$/,
                discover: /^6(?:011|5[0-9]{2})[0-9]{12}$/,
                jcb: /^(?:2131|1800|35\d{3})\d{11}$/
            };
            var ccType = selected.text.toUpperCase();
            if (ccType.indexOf("VISA", 0) >= 0 && !re.visa.test(ccNum)) {
                args.IsValid = false;
                source.innerHTML = invalidMsg;
            }
            if (ccType.indexOf("MASTER", 0) >= 0 && !(re.mastercard.test(ccNum) || re.mastercard2.test(ccNum))) {
                args.IsValid = false;
                source.innerHTML = invalidMsg;
            }
            if ((ccType.indexOf("AMEX", 0) >= 0 || ccType.indexOf("AMERICAN") >= 0) && !re.amex.test(ccNum)) {
                args.IsValid = false;
                source.innerHTML = invalidMsg;
            }
            if (ccType.indexOf("DINER", 0) >= 0 && !re.diners.test(ccNum)) {
                args.IsValid = false;
                source.innerHTML = invalidMsg;
            }
            if (ccType.indexOf("DISCOVER", 0) >= 0 && !re.discover.test(ccNum)) {
                args.IsValid = false;
                source.innerHTML = invalidMsg;
            }
            if (ccType.indexOf("JCB", 0) >= 0 && !re.jcb.test(ccNum)) {
                args.IsValid = false;
                source.innerHTML = invalidMsg;
            }
            return;
        }

// Fire all validators in the named ValidationGroup
        // We use this to fire validators in the PaymentCreatorDisplay when the commit button is clicked
        // There is a custom validator on the page, that has no validation group. It calls this function.
        function <%=this.ClientID%>_RunAllValidators(source, args)
        {
            //if (typeof Page_ClientValidate == "function" )
            // {
            //     Page_ClientValidate("<%# ValidationGroupName %>");
            // }
        }

        function PayPalClick(source, args)
        {
            //Fire all validators except our special validation group (credit card fields)
            var isValid = true;                
            for (i = 0; i < Page_Validators.length; i++) 
            {            
                var val = Page_Validators[i];
                if(val.validationGroup != '<%# ValidationGroupName  %>')
                {
                    ValidatorValidate(val, val.validationGroup); //this fires the validator
                    if(!val.isvalid)
                        isValid = false;
                }
            }

            if(isValid)
            {
                // Set hidden control that indicates whether we've clicked the PayPal button
                document.getElementById("IsPayPalButtonPressed").value = "true";
            }

            return isValid;
        }

        function <%=this.ClientID%>_HasDdrRequired_ClientValidate(sender, e)
        {
            e.IsValid = jQuery('#<%= HasDdrCheckBox.ClientID%>').is(':checked');
        }
        function <%=this.ClientID%>_PaymentAmountEdit_ClientValidate(sender, e) {
            var amount = parseFloat(jQuery('#<%= txtPaymentAmountEdit.ClientID %>').val());
            e.IsValid = amount >= parseFloat('0') && amount <= parseFloat(' <%= GrandTotal%>');
        }
    //]]>
    </script>   
     <asp:UpdatePanel ID="UpdatePanelValidation" runat="server" UpdateMode="Always" ChildrenAsTriggers="True" >
        <ContentTemplate >       
            <input type="hidden" id="IsPayPalButtonPressed" name="IsPayPalButtonPressed"/>
            <asp:Panel ID="PanelPayPal" runat="server" >
                <div class="ShowFieldset">
                    <fieldset>
                        <legend>
                            <asp:Literal ID="PayPalHeader" runat="server"/>
                        </legend>
                        <div class="PanelBlock FullWidth MiddleAlign">
                            <div class="PanelField">
                                <div class="FloatLeft">
                                    <asiweb:BusinessHyperLink runat="server" ID="PayPalLink" /> 
                                    <br/>
                                    <asiweb:StyledLabel runat="server" ID="PayPalLabel" />                            
                                </div>
                                <div class="PanelFieldValue">
                                    <asp:ImageButton ID="CheckoutWithPayPalButton" runat="server" OnClick="PayPalButton_Click" OnClientClick="return PayPalClick();" 
                                        CausesValidation="false"/>
                                </div>                        
                            </div>
                        </div>
                    </fieldset>
                </div>   
            </asp:Panel>    

        <div runat="server" id="OtherPaymentOptionsDiv">
            <fieldset id="OtherPaymentOptionsFieldset">
                <legend><asp:Literal runat="server" ID="OptionsLegendTitle" /></legend>
                <asp:Panel runat="server" ID="DataPanel"  CssClass="StandardPanel" BorderStyle="None">
                <asp:HiddenField ID="HiddenFocusableFieldId" runat="server" />
                    <asp:Panel runat="server" ID="PaymentPanel" BorderStyle="None">
                        <asp:Panel runat="server" ID="PaymentRadiosPanel" CssClass="" BorderStyle="None">
                            <fieldset id="PaymentRadiosFieldset"> 
                            <div class="PanelField ">
                                <div class="PanelFieldValue AutoWidth FloatNone">
                                    <asp:RadioButtonList runat="server" ID="PaymentMethodRadioButtonList" RepeatDirection="Horizontal" RepeatLayout="Flow" AutoPostBack="true" />                 
                                </div>
                            </div>
                            </fieldset>
                            <div style="clear: both;">
                            </div>
                        </asp:Panel>
                        <asp:Panel runat="server" ID="BillToPanel">
                            <asiweb:BusinessDropDownList runat="server" ID="BillToPartyDropDown" DisplayCaption="true"
                                RenderPanelField="true" Caption="Bill To" Required="True" ShowNullItem="False" OnSelectedIndexChanged="BillToPartyDropDown_SelectedIndexChanged"
                                AutoPostBack="true" />
                        </asp:Panel>
                        <asp:Panel runat="server" ID="PurchaseOrderPanel" CssClass="PanelField Left">
                            <asiweb:StyledLabel runat="server" ID="PoNumberLabel" Text="PO number"
                                CssClass='<%# PurchaseOrderNumberRequired ? "Required" : string.Empty %>' 
                                AssociatedControlID="txtPoNumber" />
                            <div class="PanelFieldValue">
                                <asiweb:BusinessTextBox runat="server" ID="txtPoNumber" CausesValidation="True"></asiweb:BusinessTextBox>
                                <asiweb:AsiRequiredFieldValidator runat="server" ID="PoNumberRequired" ControlToValidate="txtPoNumber"
                                    CssClass="Important" ValidationGroup="<%# ValidationGroupName %>" Enabled='<%# PurchaseOrderNumberRequired %>' />
                            </div>
                        </asp:Panel>
                        <asp:Panel runat="server" ID="PaymentMethodTypePanel" CssClass="" BorderStyle="None">
                        <asp:Panel runat="server" ID="PaymentAmountDisplay">
                            <div class="PanelField Left ReadOnly">
                                <div class="PanelFieldLabel">
                                    <asiweb:StyledLabel runat="server" ID="lblPaymentAmountLabel" CssClass="Label Required" Text="Payment amount" />
                                </div>
                                <div class="PanelFieldValue">
                                    <asiweb:StyledLabel runat="server" ID="lblPaymentAmountReadOnly"></asiweb:StyledLabel>
                                    <asiweb:BusinessTextBox runat="server" ID ="txtPaymentAmountEdit" Visible="False" Required="True" />
                                    <asiweb:AsiRequiredFieldValidator runat="server" ID="PaymentAmountRequired" ControlToValidate="txtPaymentAmountEdit"
                                        CssClass="Important" ValidationGroup="<%# ValidationGroupName %>"></asiweb:AsiRequiredFieldValidator>
                                    <div style="clear: both;">
                                    <asp:CustomValidator runat="server" ID="PaymentAmountValidator" CssClass="Important"
                                        ControlToValidate="txtPaymentAmountEdit" 
                                        
                                        OnServerValidate="PaymentAmountEdit_ServerValidate"
                                        ErrorMessage="<%# GetTranslatedPhrase(InvalidPaymentAmount) %>" 
                                        Display="Dynamic" 
                                        ValidationGroup="<%# ValidationGroupName %>"
                                        SetFocusOnError="True">
                                    </asp:CustomValidator>
                                </div>
                            </div>
                            <div style="clear: both;">
                            </div>
                        </asp:Panel>
                            <asp:Panel runat="server" ID="PaymentMethodPanel">  
                                <asiweb:BusinessDropDownList runat="server" ID="PaymentMethodDropDown" DisplayCaption="true"
                                    RenderPanelField="true" Caption="Payment method" OnSelectedIndexChanged="PaymentMethodDropDown_SelectedIndexChanged"
                                    AutoPostBack="true" TranslateOnlyCaptionAndToolTip="True" />
                            </asp:Panel>                                                                                       
                            <asp:Panel runat="server" ID="TransactionDateWarningDiv" CssClass="PanelField Left" Visible="False">                                                                                              
                                <div class="PanelField Left">               
                                    <div class="PanelFieldLabel" translate="no">
                                        <label>&nbsp;</label>
                                    </div>
                                    <div class="PanelFieldValue Right" >
                                    <asiweb:StyledLabel runat="server" ID="TransactionDateWarning" Text="" CssClass="PanelFieldLabel Error"
                                        AssociatedControlID="PaymentMethodDropDown" /> 
                                    </div>
                                </div> 
                            </asp:Panel>                                                                                       
                            <script type="text/javascript">
                                Sys.Application.add_load(function () {
                                    var manager = window['<%=this.ClientID%>_jsmanager'];
                                    if (manager != undefined)
                                    {manager.Onload();}
                                });
                            </script>                            
                            <asp:Panel runat="server" ID="CheckPanel" CssClass="" BorderStyle="None">
                            <div class="PanelField Left">   
                                <div class="PanelFieldLabel">
                                        <asiweb:StyledLabel runat="server" ID="CheckNumberLabel" Text="Check number"  CssClass=""
                                        AssociatedControlID="txtCheckNumber" />
                                </div>
                                <div class="PanelFieldValue">
                                    <asiweb:BusinessTextBox runat="server" ID="txtCheckNumber" MaxLength="10" autocomplete="off"></asiweb:BusinessTextBox>
                                    
                                            <div style="clear: both;">
                                        <asp:RegularExpressionValidator ID="revCheckNumber" runat="server" CssClass="Important"
                                            ControlToValidate="txtCheckNumber" ErrorMessage="<%# GetTranslatedPhrase(InvalidCheckNumber) %>" ValidationExpression="[a-zA-Z0-9 ]{0,10}"
                                            ValidationGroup="<%# ValidationGroupName %>" Display="Dynamic"/>
                                        </div>
                                </div>
                            </div>
                          <div style="clear: both;">
                            </div>
                        </asp:Panel>
                        <asp:Panel runat="server" ID="UKDirectDebitsPanel" CssClass="" BorderStyle="None">
                            <uc1:DirectDebits runat="server" id="DirectDebits" />
                        </asp:Panel>
                        <asp:Panel runat="server" ID="CanadianBankDraftPanel" CssClass="" BorderStyle="None">
                            
                                <div class="PanelField Left">   
                                    <div class="PanelFieldLabel">
                                            <asiweb:StyledLabel runat="server" ID="lblTransitNumber" CssClass="Label Required" Text="Transit Number" AssociatedControlID="txtTransitNumber" />
                                    </div>
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessTextBox runat="server" ID="txtTransitNumber" MaxLength="20" autocomplete="off"></asiweb:BusinessTextBox>
                                    <asiweb:AsiRequiredFieldValidator runat="server" ID="rfvTransitNumber" ControlToValidate="txtTransitNumber"
                                        CssClass="Important" ValidationGroup="<%# ValidationGroupName %>"></asiweb:AsiRequiredFieldValidator>
                                   <asiweb:AsiRegularExpressionValidator runat="server" ID="revTransitNumber" CssClass="Important"
                                       ControlToValidate="txtTransitNumber" ValidationGroup="<%# ValidationGroupName %>" ValidationExpression="\d{6,20}"></asiweb:AsiRegularExpressionValidator>
                                    </div>
                                </div>
                               
                                <div class="PanelField Left">   
                                    <div class="PanelFieldLabel">
                                            <asiweb:StyledLabel runat="server" ID="lblAccountNumber" CssClass="Label  Required" Text="Account Number" AssociatedControlID="txtAccountNumber" />
                                    </div>
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessTextBox runat="server" ID="txtAccountNumber" MaxLength="20" autocomplete="off"></asiweb:BusinessTextBox>
                                        <asiweb:AsiRequiredFieldValidator ID="rfvAccountNumber" runat="server" ValidationGroup="<%# ValidationGroupName %>"  ControlToValidate="txtAccountNumber" ></asiweb:AsiRequiredFieldValidator>
                                        <asiweb:AsiRegularExpressionValidator runat="server" ID="revAccountNumber" CssClass="Important"
                                        ControlToValidate="txtAccountNumber" ValidationGroup="<%# ValidationGroupName %>" ValidationExpression="\d{6,20}"></asiweb:AsiRegularExpressionValidator>

                                                                           </div>
                                </div>
                                
                                <div class="PanelField Left">   
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessDropDownList runat="server" ID="BankAccountTypeDropDown" DisplayCaption="true"
                                            RenderPanelField="true" Caption="Account Type" Required="True" ShowNullItem="False" />
                                    </div>
                                </div>
                        </asp:Panel> <!-- CanadianBankDraftPanel -->

                        <asp:Panel runat="server" ID="SecurePayDirectEntryPanel" CssClass="" BorderStyle="None">

                            <div class="PanelField Left">
                                <div class="PanelFieldLabel">
                                    <asiweb:StyledLabel runat="server" ID="lblSecurePayBSBNumber" CssClass="Label Required" Text="BSB Number" AssociatedControlID="txtSecurePayBSBNumber" />
                                </div>
                                <div class="PanelFieldValue">
                                    <asiweb:BusinessTextBox runat="server" ID="txtSecurePayBSBNumber" MaxLength="6" autocomplete="off"></asiweb:BusinessTextBox>
                                    <asiweb:AsiRequiredFieldValidator runat="server" ID="rfvSecurePayBSBNumber" ControlToValidate="txtSecurePayBSBNumber"
                                        CssClass="Important" ValidationGroup="<%# ValidationGroupName %>"></asiweb:AsiRequiredFieldValidator>
                                    <asiweb:AsiRegularExpressionValidator runat="server" ID="revSecurePayBSBNumber" ControlToValidate="txtSecurePayBSBNumber"  Text="Enter 6 digits"
                                        ValidationExpression="^\d{6}$" CssClass="Important" ValidationGroup="<%# ValidationGroupName %>"></asiweb:AsiRegularExpressionValidator>
                                </div>
                            </div>

                            <div class="PanelField Left">
                                <div class="PanelFieldLabel">
                                    <asiweb:StyledLabel runat="server" ID="lblSecurePayAccountNumber" CssClass="Label  Required" Text="Account Number" AssociatedControlID="txtSecurePayAccountNumber" />
                                </div>
                                <div class="PanelFieldValue">
                                    <asiweb:BusinessTextBox runat="server" ID="txtSecurePayAccountNumber" MaxLength="9" autocomplete="off"></asiweb:BusinessTextBox>
                                    <asiweb:AsiRequiredFieldValidator ID="rfvSecurePayAccountNumber" runat="server" ValidationGroup="<%# ValidationGroupName %>" ControlToValidate="txtSecurePayAccountNumber"></asiweb:AsiRequiredFieldValidator>
                                    <asiweb:AsiRegularExpressionValidator runat="server" ID="revSecurePayAccountNumber" ControlToValidate="txtSecurePayAccountNumber" Text="Enter up to 9 digits" 
                                        ValidationExpression="^\d{1,9}$" CssClass="Important" ValidationGroup="<%# ValidationGroupName %>"></asiweb:AsiRegularExpressionValidator>

                                </div>
                            </div>

                            <div class="PanelField Left">
                                <div class="PanelFieldLabel">
                                    <asiweb:StyledLabel runat="server" ID="lblSecurePayHasDDR" CssClass="Label  Required" Text="Has DDR" AssociatedControlID="HasDdrCheckBox" />
                                </div>
                                <div class="PanelFieldValue">
                                    <asiweb:BusinessCheckBox runat="server" ID="HasDdrCheckBox" ></asiweb:BusinessCheckBox>
                                    <asp:CustomValidator ID="cvHasDdrCheckBox" runat="server" ValidationGroup="<%# ValidationGroupName %>" EnableClientScript="true"
                                        OnServerValidate="HasDdrRequired_ServerValidate"
                                        ClientValidationFunction="HasDdrRequired_ClientValidate">Please confirm to proceed</asp:CustomValidator>
                                </div>
                            </div>

                        </asp:Panel> <!-- SecurePayDirectDebitsPanel -->

                        <asp:Panel runat="server" ID="CreditCardPanel" CssClass="" BorderStyle="None">                        
                            <div class="PanelField Left">
                                <div class="PanelFieldLabel">
                                    <asiweb:StyledLabel runat="server" ID="CCNumberLabel" CssClass="Required" Text="Card number"
                                        AssociatedControlID="txtCCNumber"></asiweb:StyledLabel>
                                </div>
                                <div class="PanelFieldValue">
                                    <asiweb:BusinessTextBox runat="server" ID="txtCCNumber" autocomplete="off"></asiweb:BusinessTextBox>
                                    <asiweb:AsiRequiredFieldValidator runat="server" ID="CCNumberRequired" ControlToValidate="txtCCNumber"
                                        CssClass="Important" ValidationGroup="<%# ValidationGroupName %>"></asiweb:AsiRequiredFieldValidator>
                                    <div style="clear: both;">
                                        <asp:CustomValidator runat="server" ID="cvCCNumber" ControlToValidate="txtCCNumber" SetFocusOnError="True"
                                            ClientValidationFunction="" CssClass="Important" Display="Dynamic" ValidationGroup="<%# ValidationGroupName %>"/>
                                    </div>
                                </div>
                            </div>
                            <div class="PanelField Left">
                                <div class="PanelFieldLabel">
                                    <asiweb:StyledLabel runat="server" ID="CCNameLabel" CssClass="Required" Text="Name on card"
                                        AssociatedControlID="txtCCName"></asiweb:StyledLabel>
                                </div>
                                <div class="PanelFieldValue">
                                    <asiweb:BusinessTextBox runat="server" ID="txtCCName" autocomplete="off"></asiweb:BusinessTextBox>
                                    <asiweb:AsiRequiredFieldValidator runat="server" ID="CCNameRequired" ControlToValidate="txtCCName"
                                        CssClass="Important" ValidationGroup="<%# ValidationGroupName %>"></asiweb:AsiRequiredFieldValidator>
                                </div>
                            </div>
                            <div class="PanelField Left">
                                <div class="PanelFieldLabel">
                                    <asiweb:StyledLabel runat="server" ID="CCExpiryDateLabel" CssClass="Required" Text="Expiration date"
                                        AssociatedControlID="CCExpiryMonthDropDown"></asiweb:StyledLabel>
                                </div>
                                <div class="PanelFieldValue">
                                    <asiweb:BusinessDropDownList runat="server" ID="CCExpiryMonthDropDown">
                                    </asiweb:BusinessDropDownList>
                                    <asiweb:StyledLabel runat="server" AssociatedControlID="CCExpiryYearDropDown" Text='<%#ResourceManager.GetPhrase("ExpiryYear", "Expiry year")%>' CssClass="screen-reader-text" />
                                    <asiweb:BusinessDropDownList runat="server" ID="CCExpiryYearDropDown" CssClass="padLeft" >
                                    </asiweb:BusinessDropDownList>
                                    <asp:CustomValidator runat="server" ID="cvExpirationDate" ControlToValidate="" ValidateEmptyText="true"
                                        ClientValidationFunction="" CssClass="Important" Display="Dynamic" ValidationGroup="<%# ValidationGroupName %>" />
                            
                                </div>
                            </div>
                            <div class="PanelField Left" runat="server" ID="divCSC">
                                <div class="PanelFieldLabel">
                                    <asiweb:StyledLabel runat="server" ID="CCCSCLabel" CssClass="Required" Text="CSC" AssociatedControlID="txtCCCSC"></asiweb:StyledLabel>
                                </div>
                                <div class="PanelFieldValue">
                                    <asiweb:BusinessTextBox runat="server" ID="txtCCCSC" MaxLength="4" Columns="4" autocomplete="off"></asiweb:BusinessTextBox>
                                    <asiweb:AsiRequiredFieldValidator runat="server" ID="CCCSCRequired" ControlToValidate="txtCCCSC"
                                        CssClass="Important" ValidationGroup="<%# ValidationGroupName %>"></asiweb:AsiRequiredFieldValidator>
                                    <div style="clear: both;">
                                        <asp:RegularExpressionValidator ID="revCCCSC" runat="server" CssClass="Important"
                                            ControlToValidate="txtCCCSC" ErrorMessage="<%# GetTranslatedPhrase(InvalidCardSecurityCode) %>" ValidationExpression="\d{3,4}"
                                            ValidationGroup="<%# ValidationGroupName %>" Display="Dynamic" SetFocusOnError="True"/>

                                    </div>
                                </div>
                            </div>
                            <div class="PanelField Left" runat="server" ID="divIssueNumber">
                                <div class="PanelFieldLabel">
                                    <asiweb:StyledLabel runat="server" ID="CCIssueNumberLabel" CssClass="Required" Text="Issue Number" AssociatedControlID="txtCCIssueNumber"></asiweb:StyledLabel>
                                </div>
                                <div class="PanelFieldValue">
                                    <asiweb:BusinessTextBox runat="server" ID="txtCCIssueNumber" MaxLength="2" Columns="2" autocomplete="off"></asiweb:BusinessTextBox>
                                    <asiweb:AsiRequiredFieldValidator runat="server" ID="CCIssueNumberRequired" ControlToValidate="txtCCIssueNumber"
                                        CssClass="Important" ValidationGroup="<%# ValidationGroupName %>"></asiweb:AsiRequiredFieldValidator>
                                    <div style="clear: both;">
                                        <asp:RegularExpressionValidator ID="revCCIssueNumber" runat="server" CssClass="Important"
                                            ControlToValidate="txtCCIssueNumber" ErrorMessage="<%# GetTranslatedPhrase(NumericValueOnly) %>" ValidationExpression="\d{1,2}"
                                            ValidationGroup="<%# ValidationGroupName %>" Display="Dynamic" SetFocusOnError="True"/>
                                    </div>
                                </div>
                            </div>
                            <div class="PanelField Left" runat="server" ID="divIssueDate">
                                <div class="PanelFieldLabel">
                                    <asiweb:StyledLabel runat="server" ID="CCIssueDateLabel" CssClass="Label Required" Text="Issue Date" aria-hidden="true"></asiweb:StyledLabel>
                                </div>
                                <div class="PanelFieldValue">
                                    <asiweb:StyledLabel runat="server" ID="CCIssueMonthDropDownLabel" CssClass="screen-reader-text" Text="Issue Month"
                                        AssociatedControlID="CCIssueMonthDropDown"></asiweb:StyledLabel>
                                    <asiweb:BusinessDropDownList runat="server" ID="CCIssueMonthDropDown">
                                    </asiweb:BusinessDropDownList>
                                    &nbsp;
                                    <asiweb:StyledLabel runat="server" ID="CCIssueYearDropDownLabel" CssClass="screen-reader-text" Text="Issue Year"
                                        AssociatedControlID="CCIssueYearDropDown"></asiweb:StyledLabel>
                                    <asiweb:BusinessDropDownList runat="server" ID="CCIssueYearDropDown">
                                    </asiweb:BusinessDropDownList>
                                    <asp:CustomValidator runat="server" ID="cvIssueDate" ControlToValidate="" ValidateEmptyText="true" EnableClientScript="true"
                                        ClientValidationFunction="" CssClass="Important" Display="Dynamic" ValidationGroup="<%# ValidationGroupName %>" />                            
                                </div>
                            </div>
                
                            <asp:Panel ID="CardAddressPanel" runat="server" CssClass="PanelField Left" >
                                <div>
                                    <span class="Label" runat="server">Card address</span></div>
                                <div runat="server" id="AddressSelectorDiv" class="PanelFieldValue">
                                    <uc1:AddressSelector runat="Server" id="AddressSelector" AddressPath="" OverrideFloating="true"
                                        PageTitle="" ShowBorder="false">
                                    </uc1:AddressSelector>
                                </div>
                            </asp:Panel>
                        </asp:Panel>
                        </asp:Panel>

                       
                        <div class="DisplayNone">
                            <!-- Hidden validator, used to run all the other validators in the named ValidationGroup when someone clicks next or commit in the command buttons -->
                            <!-- Normally in this instance the validators wouldn't run because they have a ValidationGroup assigned -->
                            <!-- We use this CustomValidator, which does not have a validation group, to force the other validators to run -->
                            <asp:CustomValidator runat="server" ID="cvRunAllValidators" Enabled="true" ></asp:CustomValidator>
                        </div>
                    </asp:Panel>
                    <br />
                    <div runat="server" id="DivUpdate" class="FloatRight">
                        <asiweb:StyledButton ID="SaveButton" runat="server" Text="Update" OnClick="Save_Click" ValidationGroup="<%# ValidationGroupName %>" />
                    </div>
                </asp:Panel>
            </fieldset>
        </div>            
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="BillToPartyDropDown" />
        </Triggers>
    </asp:UpdatePanel>	    
    <div style="clear: both;"></div>
</asp:Panel>
