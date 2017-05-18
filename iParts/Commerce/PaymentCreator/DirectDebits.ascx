<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DirectDebits.ascx.cs" Inherits="Asi.Web.iParts.Commerce.PaymentCreator.DirectDebits" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=4.1.50508.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<%@ Register TagPrefix="uc1" TagName="PostalCodeLookup" Src="~/iParts/Contact Management/PostalCodeLookup/PostalCodeLookupDisplay.ascx" %>

<asp:Panel runat="server" ID="UkDirectDebitPanel" CssClass="" BorderStyle="None">
    
    <asp:Panel runat="server" runat="server" ID="UkDirectDebitBankAccountDetails" CssClass="" BorderStyle="None">
    <div class="PanelField Left">
        <div class="PanelFieldLabel">
            <asiweb:StyledLabel runat="server" ID="lblSortCode" CssClass="Label Required" Text="Sort code" AssociatedControlID="txtSortCode" />
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessTextBox runat="server" ID="txtSortCode" MaxLength="8"></asiweb:BusinessTextBox>
            <asiweb:AsiRequiredFieldValidator runat="server" ID="rfvSortCode" ControlToValidate="txtSortCode"
                CssClass="Important" ValidationGroup="<%# DirectDebitValidationGroupName %>"></asiweb:AsiRequiredFieldValidator>
            <ajaxToolkit:MaskedEditExtender 
                ID="SortCodeFilter" 
                runat="server"
                TargetControlID="txtSortCode"         
                MaskType="Number"
                Mask="99-99-99"
                ClearMaskOnLostFocus="True"
                 />
        </div>
    </div>

    <div class="PanelField Left">
        <div class="PanelFieldLabel">
            <asiweb:StyledLabel runat="server" ID="lblAccountNumber" CssClass="Label  Required" Text="Account number" AssociatedControlID="txtAccountNumber" />
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessTextBox runat="server" ID="txtAccountNumber" MaxLength="8"></asiweb:BusinessTextBox>
            <asiweb:AsiRequiredFieldValidator ID="rfvAccountNumber" runat="server" ValidationGroup="<%# DirectDebitValidationGroupName %>" ControlToValidate="txtAccountNumber"></asiweb:AsiRequiredFieldValidator>
            <ajaxToolkit:FilteredTextBoxExtender ID="AccountNumberFilter" runat="server"
                TargetControlID="txtAccountNumber"         
                FilterType="Numbers"/>
        </div>
    </div>

    <h3>Account Holder Details</h3>
        
        <div class="PanelField Left">
        <div class="PanelFieldLabel">
            <asiweb:StyledLabel runat="server" ID="lblAccountName" CssClass="Label Required" Text="First name" AssociatedControlID="txtAccountName" />
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessTextBox runat="server" ID="txtAccountName" MaxLength="50"></asiweb:BusinessTextBox>
            <asiweb:AsiRequiredFieldValidator runat="server" ID="rfvAccountName" ControlToValidate="txtAccountName"
                CssClass="Important" ValidationGroup="<%# DirectDebitValidationGroupName %>"></asiweb:AsiRequiredFieldValidator>

        </div>
    </div>
    
    <div class="PanelField Left">
        <div class="PanelFieldLabel">
            <asiweb:StyledLabel runat="server" ID="lblAccountLastName" CssClass="Label Required" Text="Last name" AssociatedControlID="txtAccountLastName" />
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessTextBox runat="server" ID="txtAccountLastName" MaxLength="50"></asiweb:BusinessTextBox>
            <asiweb:AsiRequiredFieldValidator runat="server" ID="rfvAccountLastName" ControlToValidate="txtAccountLastName"
                CssClass="Important" ValidationGroup="<%# DirectDebitValidationGroupName %>"></asiweb:AsiRequiredFieldValidator>

        </div>
    </div>
         <div class="PanelField Left">
    <uc1:PostalCodeLookup runat="server" ID="PostalCodeLookup" jsCallback="PCDD_PopulateAfterLookup"  />
	 </div>
    <div class="PanelField Left">
        <div class="PanelFieldLabel">
            <asiweb:StyledLabel runat="server" ID="AddressLabelLine1" CssClass="Label Required" Text="Address" AssociatedControlID="txtAddressLine1" />
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessTextBox runat="server" ID="txtAddressLine1" MaxLength="50"></asiweb:BusinessTextBox>
            <asiweb:AsiRequiredFieldValidator runat="server" ID="rfvAddressLine1" ControlToValidate="txtAddressLine1"
                CssClass="Important" ValidationGroup="<%# DirectDebitValidationGroupName %>"></asiweb:AsiRequiredFieldValidator>
        </div>
    </div>

    <div class="PanelField Left">
        <div class="PanelFieldLabel">
            <asiweb:StyledLabel runat="server" ID="AddressLabelLine2" CssClass="screen-reader-text" Text="Address Line 2" AssociatedControlID="txtAddressLine2" />
        </div>
        <div class="LabelSpacer PanelFieldValue">
            <asiweb:BusinessTextBox runat="server" ID="txtAddressLine2" MaxLength="50"></asiweb:BusinessTextBox>
        </div>
    </div>

    <div class="PanelField Left">
        <div class="PanelFieldLabel">
            <asiweb:StyledLabel runat="server" ID="AddressLabelLine3" CssClass="screen-reader-text" Text="Address Line 3" AssociatedControlID="txtAddressLine3" />
        </div>
        <div class="LabelSpacer PanelFieldValue">
            <asiweb:BusinessTextBox runat="server" ID="txtAddressLine3" MaxLength="50"></asiweb:BusinessTextBox>
        </div>
    </div>

    <div class="PanelField Left">
        <div class="PanelFieldLabel">
            <asiweb:StyledLabel runat="server" ID="AddressLabelTown" CssClass="Label Required" Text="City" AssociatedControlID="txtAddressTown" />
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessTextBox runat="server" ID="txtAddressTown" MaxLength="50"></asiweb:BusinessTextBox>
            <asiweb:AsiRequiredFieldValidator runat="server" ID="rfvAddressTown" ControlToValidate="txtAddressTown"
                CssClass="Important" ValidationGroup="<%# DirectDebitValidationGroupName %>"></asiweb:AsiRequiredFieldValidator>
        </div>
    </div>

    <div class="PanelField Left">
        <div class="PanelFieldLabel">
            <asiweb:StyledLabel runat="server" ID="AddressLabelCounty" CssClass="Label" Text="County" AssociatedControlID="txtAddressCounty" />
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessTextBox runat="server" ID="txtAddressCounty" MaxLength="50"></asiweb:BusinessTextBox>
        </div>
    </div>

    <div class="PanelField Left">
        <div class="PanelFieldLabel">
            <asiweb:StyledLabel runat="server" ID="AddressLabelPostCode" CssClass="Label Required" Text="Postal Code" AssociatedControlID="txtAddressPostCode" />
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessTextBox runat="server" ID="txtAddressPostCode" MaxLength="50"></asiweb:BusinessTextBox>
            <asiweb:AsiRequiredFieldValidator runat="server" ID="rfvAddressPostCode" ControlToValidate="txtAddressPostCode"
                CssClass="Important" ValidationGroup="<%# DirectDebitValidationGroupName %>"></asiweb:AsiRequiredFieldValidator>
        </div>
    </div>
        
    <div class="PanelField Left">
        <div class="PanelFieldLabel">
            <asiweb:StyledLabel runat="server" ID="EmailLabel" CssClass="Label Required" Text="Email" AssociatedControlID="txtEmail" />
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessTextBox runat="server" ID="txtEmail" MaxLength="50"></asiweb:BusinessTextBox>
            <asiweb:AsiRequiredFieldValidator runat="server" ID="rfvEmail" ControlToValidate="txtEmail"
                CssClass="Important" ValidationGroup="<%# DirectDebitValidationGroupName %>"></asiweb:AsiRequiredFieldValidator>
        </div>
    </div>

    <asiweb:BusinessTextBox CssClass="Ui-helper-hidden-accessible" runat="server" ID="CheckAccountHolderValidationCompleted" Text="" title="Validation Completed" aria-hidden="true" />            
    <asiweb:AsiRequiredFieldValidator runat="server" ID="rfvAccountDetailsValidated" 
        ControlToValidate="CheckAccountHolderValidationCompleted" CssClass="Important"
        ValidationGroup="<%# ValidationGroupName %>" ErrorMessage="The Account Holder Details must be validated"></asiweb:AsiRequiredFieldValidator>
    </asp:Panel>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="ErrorMsg" runat="server" CssClass="Error"></asp:Label>
            <asp:Panel runat="server" ID="BankAddressPanel"  CssClass="PanelField Left" style="border:darkgray solid 2px;" Visible="False">
                <h5>Name and Address of your Bank/Building Society</h5>
                <div>
                    <strong><asp:Literal ID="BankAddress" runat="server"></asp:Literal></strong>
                </div>
                <h5>Bank Account Details</h5>
                    <strong><asp:Literal runat="server" ID="BankAccountDetailsDisplay"></asp:Literal></strong>
                <h5>Account Holder Details</h5>
                    <strong><asp:Literal runat="server" ID="AccountHolderDetails"></asp:Literal></strong>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnValidateBankAccount" />
        </Triggers>
    </asp:UpdatePanel>  

    <asp:Panel runat="server" ID="UkDirectDebitValidateButtonPanel" CssClass="" BorderStyle="None">
    <div class="PanelField">
        <div class="FloatRight">
            <asp:Button ID="btnValidateBankAccount" runat="server" CssClass="TextButton" Text="Validate" 
                OnClick="btnValidateBankAccount_Click" ValidationGroup="<%# DirectDebitValidationGroupName %>" 
                CausesValidation="True" />
        </div>
    </div>
    </asp:Panel>
    <asp:Panel runat="server" ID="CustomDDHtml" BorderStyle="None">
        <asp:Literal ID="DirectDebitMandate" runat="server"></asp:Literal>
    </asp:Panel>
    
    <div class="PanelField">
        <div class="FloatRight">
            <asp:Button ID="btnPrintMandate" runat="server" CssClass="TextButton" Text="Print" />
        </div>
    </div>

    <script type="text/javascript">
        // Create the event handlers for PageRequestManager (this cannot be placed on the separate js file)
        var prm = Sys.WebForms.PageRequestManager.getInstance();

        function PCDD_PopulateAfterLookup(address) {
            for (var i = 0; i < prm._form.length; i++) {
                var field = prm._form[i];
                if (field.id.indexOf("txtAddressLine1") !== -1) {
                	PCDD_SetAddressFields(field, address.AddressLines.$values[0]);
                }
                if (field.id.indexOf("txtAddressLine2") !== -1) {
                	PCDD_SetAddressFields(field, address.AddressLines.$values[1]);
                }   
                if (field.id.indexOf("txtAddressLine3") !== -1) {
                	PCDD_SetAddressFields(field, address.AddressLines.$values[2]);
                }   
                if (field.id.indexOf("txtAddressTown") !== -1) {
                	PCDD_SetAddressFields(field, address.CityName);
                }   
                if (field.id.indexOf("txtAddressCounty") !== -1) {
                	PCDD_SetAddressFields(field, address.CountrySubEntityName);
                }   
                if (field.id.indexOf("txtAddressPostCode") !== -1) {
                	PCDD_SetAddressFields(field, address.PostalCode);
                }
            }
        }

        function PCDD_SetAddressFields(field, addressItem) {
            field.value = "";
            if (addressItem)
                field.value = addressItem;
        }
    </script>
</asp:Panel>