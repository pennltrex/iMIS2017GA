<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Title="Billing options" Inherits="Asi.WebRoot.iMIS.Setup.Billing.BillingSetup" CodeBehind="BillingSetup.aspx.cs" %>
<%@ Import Namespace="Asi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">

        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="true">    
            <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" Width="35em" translate="yes">

                <div class="SectionLabel"><%#GetTranslatedPhrase("Billing interval")%></div>
                <div class="SubItems">
                    <asiweb:BusinessTextBox class="Section" DisplayCaption="True" ID="StandardBillingMonthsTextBox" PositionCaption="Left" RenderPanelField="true" runat="server" />     
                    <asp:RangeValidator runat="server" Type="Integer" Display="Dynamic"  
                        MinimumValue="0" MaximumValue="255" ControlToValidate="StandardBillingMonthsTextBox" 
                        ErrorMessage="Invalid entry" />        
                </div>   
                
                <div class="SectionLabel"><%#GetTranslatedPhrase("Accounting method")%></div>
                <div class="SubItems">
                    <asiweb:BusinessRadioButtonList class="Section" DisplayCaption="True" ID="AccountingMethodDefaultRadioButtonList" PositionCaption="Right" RenderPanelField="true" runat="server">
                        <asp:ListItem Text="Cash" Enabled="True" Value="C"/>
                        <asp:ListItem Text="Accrual" Enabled="True" Value="A"/>
                    </asiweb:BusinessRadioButtonList>
                </div>
                <asp:HiddenField ID="HiddenInitialAccountMethodSelection" runat="server" Value=""/>
                
                <div class="SectionLabel"><%#GetTranslatedPhrase("Billing time")%></div>
                <div class="SubItems">
                    <asiweb:BusinessRadioButtonList class="Section" DisplayCaption="True" ID="BillCycleRadioButtonList" PositionCaption="Right" RenderPanelField="true" runat="server">
                        <asp:ListItem Text="Annual" Enabled="True" Value="A"/>
                        <asp:ListItem Text="Anniversary" Enabled="True" Value="M"/>
                    </asiweb:BusinessRadioButtonList>
                </div>
                
                <div class="SectionLabel"><%#GetTranslatedPhrase("Paid thru date update")%></div>   
                <div class="SubItems">
                    <asiweb:BusinessCheckBox DisplayCaption="True" id="UpdateCompsAtPaymentCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />            
                    
                    <asiweb:BusinessRadioButtonList class="Section" DisplayCaption="True" ID="PaidThruDateUpdateRadioButtonList" PositionCaption="Right" RenderPanelField="true" runat="server">
                        <asp:ListItem Text="Paid in full" Enabled="True" Value="" Selected="True"/>
                        <asp:ListItem Text="Billing time" Enabled="True" Value="1"/>
                    </asiweb:BusinessRadioButtonList>
                </div>      
                
                <div class="SectionLabel"><%#GetTranslatedPhrase("Start date control")%></div>                  
                <div class="SubItems">
                    <asiweb:BusinessCheckBox DisplayCaption="True" id="ApplyToNewMemberCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />            
                
                    <div class="SubItems">
                        <asiweb:BusinessTextBox DisplayCaption="True" ID="AdvanceStartMonthTextBox" PositionCaption="Left" RenderPanelField="true" runat="server" /> 
                        <asp:RangeValidator runat="server" Type="Integer" Display="Dynamic"  
                            MinimumValue="0" MaximumValue="28" ControlToValidate="AdvanceStartMonthTextBox" 
                            ErrorMessage="Valid entries are 0 - 28" />            
                    </div>
                
                    <asiweb:BusinessCheckBox DisplayCaption="True" id="ApplyToDeliquentMemberCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />            
                
                    <div class="SubItems">
                        <asiweb:BusinessTextBox class="Section" DisplayCaption="True" ID="GracePeriodTextBox" PositionCaption="Left" RenderPanelField="true" runat="server" />   
                        <asp:RangeValidator runat="server" Type="Integer" Display="Dynamic"  
                            MinimumValue="0" MaximumValue="12" ControlToValidate="GracePeriodTextBox" 
                            ErrorMessage="Valid entries are 0 - 12" />  
                    </div>         
                </div>
                
                <div class="SectionLabel"><%#GetTranslatedPhrase("Prorating")%></div>  
                <div class="SubItems">
                    <asiweb:BusinessRadioButtonList class="Section" DisplayCaption="True" ID="ProrateRadioButtonList" PositionCaption="Right" RenderPanelField="true" runat="server">
                        <asp:ListItem Text="Do not prorate" Enabled="True" Value="" Selected="True"/>
                        <asp:ListItem Text="Standard prorating"  Enabled="True" Value="1"/>
                        <asp:ListItem Text="Special prorating" Enabled="True" Value="2"/>
                    </asiweb:BusinessRadioButtonList>
                </div>
                
                <div class="SectionLabel"><%#GetTranslatedPhrase("Balances")%></div>  
                <div class="SubItems">
                    <asiweb:BusinessCheckBox class="Section" DisplayCaption="True" id="MaintainPreviousBalanceCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />            
                </div>	
                		
                <div class="SectionLabel"><%#GetTranslatedPhrase("Billing contact")%></div>        
                <div class="SubItems">
                    
                    <asp:HiddenField ID="HiddenBillingContactId" runat="server" Value="" />
                    <asiweb:BusinessTextBox ID="BillingContactIdTextBox" Enabled="True" runat="server"/>   
                    <asp:HiddenField ID="HiddenServerValidatorBillingContact" runat="server" Value="" />
                    <asp:CustomValidator runat="server" ClientValidationFunction="ValidateCurrentBillingContactId" />

                    <asp:LinkButton runat="server" ID="SelectLink" CssClass="MarginLeft MarginRight" Text='<%# ResourceManager.GetWord("select") %>' OnClientClick="BillingContactFinder(); return false;" />
                    <a href="javascript:;" ID="RemoveLinkButton" onclick="RemoveBillingContactInformation()">remove</a>
                    
                    <span id="BillingContactErrorMessage" hidden class="ValidationError MarginLeft">Invalid billing contact</span>
                    <div>
                        <span runat="server" ID="BillingContactInfo"></span>      
                    </div>
                    <asp:HiddenField ID="HiddenBillingContactInfo" runat="server" Value="" />

                    <asp:HiddenField ID="TargetServerBaseUrl" runat="server" Value="" />
                </div>

            </asiweb:PanelTemplateColumn>    
        </asiweb:PanelTemplateControl2>
    
 <script type="text/javascript">
     //<![CDATA[
     SetEntityFieldsState();

     function SetEntityFieldsState() {
         var applyToNewMembers = jQuery("#<%#ApplyToNewMemberCheckBox.ClientID%>");
         var advanceStartMonthTextBox = jQuery("#<%#AdvanceStartMonthTextBox.ClientID%>");
         if (applyToNewMembers != null && applyToNewMembers.is(':checked')) {
             EnableField(advanceStartMonthTextBox);
         }
         else {
             DisableField(advanceStartMonthTextBox);
         }

         var applyToDeliquentCustomers = jQuery("#<%#ApplyToDeliquentMemberCheckBox.ClientID%>");
         var gracePeriodInMonthsTextBox = jQuery("#<%#GracePeriodTextBox.ClientID%>");
         if (applyToDeliquentCustomers != null && applyToDeliquentCustomers.is(':checked')) {
             EnableField(gracePeriodInMonthsTextBox);
         }
         else {
             DisableField(gracePeriodInMonthsTextBox);
         }

         var accountingMethodSelected = jQuery("#<%= AccountingMethodDefaultRadioButtonList.ClientID %> input:checked").val(); 
         var paidThruUpdateRadioList = jQuery("#<%#PaidThruDateUpdateRadioButtonList.ClientID%>");
         if (accountingMethodSelected === "A") {
             EnableField(paidThruUpdateRadioList);
         }
         else {
             jQuery('#<%=PaidThruDateUpdateRadioButtonList.ClientID%> :radio[value=""]').prop('checked', true);
             DisableField(paidThruUpdateRadioList);
         }
     }

     function ValidateCurrentBillingContactId(source, arguments) {
         var isValid = jQuery("#<%#HiddenServerValidatorBillingContact.ClientID%>").val();
         arguments.IsValid = isValid !== "Invalid";
     }

     //for the EnableField() and DisableField() functions IE will not recognize disabled asiweb:BusinessRadioButtonList changes so we need to add a class instead
     //asiweb:BusinessRadioButtonList renders as a table so we're essentially checking to see if the control is a radio button list type
     function EnableField(control) {
         var controlType = control.get(0).tagName;
         if (controlType === "TABLE") {
             control.removeClass("aspNetDisabled");
         }
         else {
             control.removeProp('disabled');    
         }
     }

     function DisableField(control) {
         var controlType = control.get(0).tagName;
         if (controlType === "TABLE") {
             control.addClass("aspNetDisabled");
         }
         else {
             control.prop('disabled', 'disabled');
         }
     }

     function RemoveBillingContactInformation() {
         var removeLink = jQuery("#RemoveLinkButton");
         if (removeLink.hasClass("aspNetDisabled")) {
             return;
         }
         else {
             removeLink.addClass("aspNetDisabled");
         }

         jQuery("#BillingContactErrorMessage").hide();
         jQuery("#<%#HiddenServerValidatorBillingContact.ClientID%>").val("");
         var billingContactTextbox = jQuery("#<%#BillingContactIdTextBox.ClientID%>");
         billingContactTextbox.val("");

         var billingContactInfo = jQuery("#<%#BillingContactInfo.ClientID%>");
         billingContactInfo.text("");
     }

     function BillingContactFinderCallBackFunction(radwindow) {
         var billingContactKey;
         if (radwindow.newContactKey != null)
             billingContactKey = radwindow.newContactKey;
         else {
             var result = radwindow.result;
             if (result != null)
                 billingContactKey = result[0];
         }

         if (!billingContactKey) {
             return;
         }

         var targetBaseUrl = jQuery("#<%#TargetServerBaseUrl.ClientID%>").val();
             jQuery.ajax(targetBaseUrl + "/api/party?UniformId=" + billingContactKey,
             {
                 type: "get",
                 contentType: "application/json",
                 headers: { "RequestVerificationToken": document.getElementById("__RequestVerificationToken").value },
                 success: function (data) {
                     var billingContact = data.Items.$values[0];
                     if (!billingContact) {
                        jQuery("#BillingContactErrorMessage").show();
                        jQuery("#<%#HiddenServerValidatorBillingContact.ClientID%>").val("Invalid");
                        return;
                     }

                SetBillingContactInfo(billingContact);
            },
            error: function (data) {
                jQuery("#BillingContactErrorMessage").show();
                jQuery("#<%#HiddenServerValidatorBillingContact.ClientID%>").val("Invalid");
            }
        });
    }

     jQuery("#" + "<%= BillingContactIdTextBox.ClientID %>").blur(function () {
        var billingContactTextbox = jQuery("#<%#BillingContactIdTextBox.ClientID%>");
        if (billingContactTextbox.val() !== "" && !jQuery.isNumeric(billingContactTextbox.val())) {
            jQuery("#BillingContactErrorMessage").show();
            jQuery("#<%#HiddenServerValidatorBillingContact.ClientID%>").val("Invalid");
            return;
        }
        else {
            jQuery("#BillingContactErrorMessage").hide();
        }

        var targetBaseUrl = jQuery("#<%#TargetServerBaseUrl.ClientID%>").val();
        jQuery.ajax(targetBaseUrl + "/api/party/" + billingContactTextbox.val(),
        {
            type: "get",
            contentType: "application/json",
            headers: { "RequestVerificationToken": document.getElementById("__RequestVerificationToken").value },
            success: function (billingContact) {
                if (!billingContact || (billingContact.Count && billingContact.Count != 1)) {
                    jQuery("#BillingContactErrorMessage").show();
                    jQuery("#<%#HiddenServerValidatorBillingContact.ClientID%>").val("Invalid");
                    return;
                }

                SetBillingContactInfo(billingContact);
            },
            error: function (data) {
                jQuery("#BillingContactErrorMessage").show();
                jQuery("#<%#HiddenServerValidatorBillingContact.ClientID%>").val("Invalid");
            }
        });
     });

     jQuery("#" + "<%= BillingContactIdTextBox.ClientID %>").keydown(function (e) {
         if (e.keyCode === 13) {
             return false;
         }
     });

     function SetBillingContactInfo(billingContact) {
        var billingContactTextbox = window.$get('<%= BillingContactIdTextBox.ClientID %>');
        var billingContactInfo = window.$get('<%= BillingContactInfo.ClientID %>');
        var removeLink = jQuery("#RemoveLinkButton");
        jQuery("#BillingContactErrorMessage").hide();
        jQuery("#<%#HiddenServerValidatorBillingContact.ClientID%>").val("");

        if (removeLink.hasClass("aspNetDisabled")) {
            removeLink.removeClass("aspNetDisabled");
        }

        billingContactTextbox.value = billingContact.Id;

        if (billingContact.PersonName) {
            billingContactInfo.innerText = billingContact.PersonName.FullName;
        }
        else {
            billingContactInfo.innerText = billingContact.Name;
        }

        if (!billingContact.Emails || !billingContact.Emails.$values || billingContact.Emails.$values.length === 0) {
            return;
        }

        var primaryEmail = billingContact.Emails.$values.filter(function (email) {
            return email.IsPrimary;
        });

        if (primaryEmail == null || primaryEmail.length === 0) {
            return;
        }

        billingContactInfo.innerText += " - " + primaryEmail[0].Address;
     }

     function BillingContactFinder() {
         OpenPartyFinderAdderWithQueryFilter(BillingContactFinderCallBackFunction,
             true,
             null,
             '$/ContactManagement/DefaultSystem/Queries/Contacts',
             null,
             null,
             null,
             "",
             null,
             null,
             false,
             1);
     }

     function pageLoad() {
        var hiddenServerBillingContact = jQuery("#<%#HiddenServerValidatorBillingContact.ClientID%>");
        if (hiddenServerBillingContact.val() === "Invalid") {
            jQuery("#BillingContactErrorMessage").show();
        }

        var billingContactTextbox = jQuery("#<%#BillingContactIdTextBox.ClientID%>");
        if (billingContactTextbox.val() === "") {
            jQuery("#RemoveLinkButton").addClass("aspNetDisabled");
        }
     }

     jQuery('form').on('reset', function (e) {
        jQuery("#BillingContactErrorMessage").hide();
        jQuery("#<%#HiddenServerValidatorBillingContact.ClientID%>").val("");
        var originalBillingId = jQuery("#<%#HiddenBillingContactId.ClientID%>").val();
        var originalBillingContactInfo = jQuery("#<%#HiddenBillingContactInfo.ClientID%>").val();


        var removeLink = jQuery("#RemoveLinkButton");
        if (originalBillingId !== "" && removeLink.hasClass("aspNetDisabled")) {
            removeLink.removeClass("aspNetDisabled");
        }

        if (originalBillingId === "" && !removeLink.hasClass("aspNetDisabled")) {
            removeLink.addClass("aspNetDisabled");
        }
        
        jQuery("#<%#BillingContactIdTextBox.ClientID%>").val(originalBillingId);
        jQuery("#<%#BillingContactInfo.ClientID%>").text(originalBillingContactInfo);

        var accountingMethodSelected = jQuery("#<%= HiddenInitialAccountMethodSelection.ClientID %>").val(); 
        var paidThruUpdateRadioList = jQuery("#<%#PaidThruDateUpdateRadioButtonList.ClientID%>");
        if (accountingMethodSelected === "A") {
            EnableField(paidThruUpdateRadioList);
        }
        else {
            jQuery('#<%=PaidThruDateUpdateRadioButtonList.ClientID%> :radio[value=""]').prop('checked', true);
            DisableField(paidThruUpdateRadioList);
        }
    });
    //]]>
 </script>

</asp:Content> 
