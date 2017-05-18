<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="PublicViewDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.RecurringDonation.Commitment.PublicViewDisplay" %>
<%@ Register Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" TagPrefix="asiweb" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<script type="text/javascript">

    var amountField;
    function checkAmountFormat(amount) {
        amountField = amount;

        var amountValue = amount.value;

        // is it a number
        if (isNaN(amountValue)) {
            // not a number, just highlight and set focus
            // FireFox needs setTimeout calls to work
            validating = true;
            setTimeout("amountField.focus()", 1);
            setTimeout("amountField.select()", 1);
            return false;
        }

        var dpPos = amountValue.indexOf(".");
        if (dpPos < 0) {
            // no decimal point 0 is there no value at all?
            if (amount.value.trim() == "") {
                amount.value = "0.00";
            }
            else {
                amount.value += ".00";
            }
        }
        else {
            // make sure decimal value is correct
            var lhs = amountValue.substring(dpPos);
            if (lhs.length == 1) {
                // just a decimal point
                amount.value += "00";
            }
            else if (lhs.length == 2) {
                // one number 
                amount.value += "0";
            }
            else if (lhs.length > 3) {
                // too many pence
                amount.value = amountValue.substring(0, amountValue.length - (lhs.length - 3));
            }
        }
    }

    var sortCodeField;
    function validateSortCode(sortCode) {

        sortCodeField = sortCode;

        // is it a number
        if (isNaN(sortCode.value)) {
            // not a number, just highlight and set focus
            // FireFox needs setTimeout calls to work
            setTimeout("sortCodeField.focus()", 1);
            setTimeout("sortCodeField.select()", 1);
            return false;
        }

        return true;
    }

    var acNumberField;
    function validateAcNumber(acNumber) {

        acNumberField = acNumber;

        // is it a number
        if (isNaN(acNumber.value)) {
            // not a number, just highlight and set focus
            // FireFox needs setTimeout calls to work
            setTimeout("acNumberField.focus()", 1);
            setTimeout("acNumberField.select()", 1);
            return false;
        }

        return true;
    }
    
</script>

<style type="text/css">

.PanelInlineField
{
    display:inline;
}
.PanelInlineFieldValue
{
    padding-left:2px;
    padding-right:2px;
    display:inline;
}
.StandardPanel div.PanelInlineField label 
{
	text-align: left;
	font-size: .9em;
	font-weight: bold;
	color: #666666;
}
.StandardPanel div.PanelInlineField .PanelField 
{
    float:none;
}
</style>

<asp:Label ID="ErrorMsg" runat="server" CssClass="Error" Visible="false" />

<div id="MainContent" runat="server" visible="true">

    <asp:Panel ID="ContentPanel" runat="server" Visible="true" BorderStyle="Solid" BorderWidth="1px" BorderColor="Gray" style="border-spacing:10px;padding:10px">
        
        <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" runat="server" />

        <div><asp:Label ID="errorLabel" runat="server" Text="" CssClass="Error" /></div>          
        <div style="height:1px;"></div>

        <asiweb:PanelTemplateControl ID="PanelTemplateControl1" Text="Your donation" runat="server" FieldSet="true"
                ShowHeader="false" BorderStyle="None" DisplayCaption="false"   Collapsible="false" >
            <h3 class="SectionTitle">Your Donation</h3>
            <div style="height:7px;"></div>

            <div class="PanelInlineField">
                <asp:Label ID="donationAmountLabel" ToolTip="Required" runat="server" Text="£" AssociatedControlID="donationAmountControl" CssClass="Required" ></asp:Label>
                <div class="PanelInlineFieldValue" >
                    <asp:TextBox ID="donationAmountControl" runat="server" CausesValidation="true" Width="5.6em" Required="true" OnMousedown="ClearErrorLabel()" OnBlur="return checkAmountFormat(this)" />&nbsp;
                </div>
            </div>
            <div class="PanelInlineField">
                <asp:Label ID="donationFrequencyLabel" runat="server" ToolTip="Required" Text="Per" AssociatedControlID="commitmentDonationFrequency" CssClass="Required" ></asp:Label>
                <div class="PanelInlineFieldValue" >
                    <asp:DropDownList id="commitmentDonationFrequency" CausesValidation="true" runat="server" Font-Bold="false" DataValueField="Key" DataTextField="Value" OnMousedown="ClearErrorLabel()"  />
                    <asp:RequiredFieldValidator class="Important" ID="donationFrequencyValidator" runat="server" Display="Dynamic" EnableClientScript="false" ControlToValidate="commitmentDonationFrequency" ErrorMessage="Required" ></asp:RequiredFieldValidator>
                </div>
            </div>
           
        </asiweb:PanelTemplateControl>

        <asiweb:PanelTemplateControl ID="PanelTemplateControl2" Text="Your bank details" runat="server" FieldSet="true"
                ShowHeader="false" BorderStyle="None" Collapsible="false" >
             <h3 class="SectionTitle">Your Bank Details</h3>           
            <div style="height:5px;"></div>

            <div class="PanelField Left" style="border-bottom-style:none">
                <asp:Label ID="bankAccountNameLabel" ToolTip="Required" runat="server" Text="Account Name" AssociatedControlID="bankAccountNameControl" CssClass="Required" ></asp:Label>
                <asiweb:BusinessTextBox ID="bankAccountNameControl" runat="server" CausesValidation="true" style='text-transform:uppercase' BoundPropertyName="BankAccountName" Required="true" OnMousedown="ClearErrorLabel()" MaxLength="18" />
                <asp:RequiredFieldValidator class="Important" ID="bankAccountNameValidator" runat="server" Display="Dynamic" EnableClientScript="false" ControlToValidate="bankAccountNameControl" ErrorMessage="Required" ></asp:RequiredFieldValidator>
            </div>
   
            <div class="PanelField Left" style="border-bottom-style:none;" >
                <asp:Label ID="branchSortCodeLabel" ToolTip="Required" runat="server" Text="Sort Code" AssociatedControlID="branchSortCodeControl" CssClass="Required" ></asp:Label>
                <asiweb:BusinessTextBox ID="branchSortCodeControl" runat="server" CausesValidation="true" BoundPropertyName="BranchSortCode" Required="true" OnMousedown="ClearErrorLabel()" OnBlur="return validateSortCode(this)" MaxLength="6" />
                <asp:RequiredFieldValidator ID="branchSortCodeRequiredFieldValidator" class="Important" runat="server" Display="Dynamic" EnableClientScript="false" ControlToValidate="branchSortCodeControl" ErrorMessage="Required" ></asp:RequiredFieldValidator>
            </div>
     
            <div class="PanelField Left" style="border-bottom-style:none">          
                <asp:Label ID="accountNumberLabel" ToolTip="Required" runat="server" Text="Account Number" AssociatedControlID="bankAccountNameControl" CssClass="Required" ></asp:Label>
                <asiweb:BusinessTextBox ID="bankAccountNumberControl" runat="server" CausesValidation="true" BoundPropertyName="BankAccountNumber" Required="true" OnMousedown="ClearErrorLabel()" OnBlur="return validateAcNumber(this)" MaxLength="8" />
                <asp:RequiredFieldValidator class="Important" ID="bankAccountNumberControlValidator" runat="server" Display="Dynamic" EnableClientScript="false" ControlToValidate="bankAccountNumberControl" ErrorMessage="Required" ></asp:RequiredFieldValidator>
            </div>

        </asiweb:PanelTemplateControl>

    </asp:Panel> 

</div>