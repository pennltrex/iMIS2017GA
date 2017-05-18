<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageSingleDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.RecurringDonation.Commitment.PageSingleDisplay" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" TagPrefix="asiweb" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<script type="text/javascript" language="javascript">

    function checkMaxLen(txt, maxLen) {
        try {
            if (txt.value.length > (maxLen - 1)) {
                var cont = txt.value;
                txt.value = cont.substring(0, (maxLen - 1));
                return false;
            };
        } catch (e) {
        }
    }

</script>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">

    <div style="clear: both;padding-top: 0.25em;width: 100%;">
         <div  style="float:right; text-align:right;"> 
             <asp:LinkButton ID="switchViewLinkButton" runat="server" CausesValidation="false" onclick="SwitchViewLinkButton_Click" >Switch to list view</asp:LinkButton>
             <asp:Label ID="lbOr" Text="or" runat="server" />
             <asp:LinkButton ID="newLinkButton" runat="server" CausesValidation="false" Text="Create new commitment" onclick="NewLinkButton_Click" />
        </div>
    </div>

    <div>
        <asp:ValidationSummary id="validationSummaryControl" CssClass="Error" runat="server" DisplayMode="List" />
    </div>
    <div>
        <asp:Label ID="errorLabel" runat="server" Text="" CssClass="Error"></asp:Label><br />
        <asp:Label ID="newLabel" class="mdTitle" runat="server" Text=""></asp:Label>
    </div>
    
    <asp:PlaceHolder ID="detailsPlaceholder" runat="server" >
       
        <asiweb:PanelTemplateControl ID="Ex3Fields" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None"  GroupingText="top" LabelWidth="11em">

            <asiweb:PanelTemplateColumn ID="PanelTemplateColumn3" Width="40%" runat="server" >
            
                <asiweb:SmartControl ID="commitmentStatus" Width="400px" runat="Server" Caption="Status" BoundPropertyName="CommitmentStatusInd" EnableClientScript="false" DisplayCaption="true" BorderStyle="None"  OnClientChange="ClearErrorLabel()" />

                <asiweb:SmartControl ID="donationAmountControl" TextBoxWidth="178px" runat="Server" BoundPropertyName="DonationAmount" EnableClientScript="false" DisplayCaption="true" BorderStyle="None"  OnClientChange="ClearErrorLabel()" />
                                      
                <div class="PanelField Left" style="border-bottom-style:none;">
                    <asp:Label ID="donationFrequencyLabel" runat="server" Text="Per" AssociatedControlID="commitmentDonationFrequency" CssClass="Required" ></asp:Label>
                    <asp:DropDownList id="commitmentDonationFrequency" Width="180px" CausesValidation="true" runat="server" DataValueField="Key" DataTextField="Value" OnMousedown="ClearErrorLabel()" />
                    <asp:RequiredFieldValidator class="Important" ID="frequencyRequiredFieldValidator"  runat="server" Display="Dynamic" ControlToValidate="commitmentDonationFrequency" EnableClientScript="false" Text="Required" ErrorMessage="Per: Required" ></asp:RequiredFieldValidator>
                </div>

                <asiweb:SmartControl ID="commitmentStartDate" runat="Server" BoundPropertyName="StartDate" DisplayCaption="true" BorderStyle="None"  OnMousedown="ClearErrorLabel()" Style="font-family:verdana,tahoma,arial,helvetica;" EnableClientScript="false" PositionValidator="Bottom"  />            

                 <div class="PanelField Left" style="border-bottom-style:none;">
                     <asp:Label ID="endDateLabel" runat="server" Text="End Date" AssociatedControlID="noEndDateRadio" CssClass="Required" ></asp:Label>
                     <div class="PanelFieldValue">
                            <div><asp:RadioButton ID="noEndDateRadio" runat="server" GroupName="CommitmentEnddate" Text="No End Date" OnMousedown="ClearErrorLabel()" ></asp:RadioButton>
                                <span>&nbsp;</span>
                            </div>
                            <br />
                            <div id="Div1" runat="server">
                                <asp:RadioButton ID="endDateRadio" runat="server" GroupName="CommitmentEnddate" OnMousedown="ClearErrorLabel()" ></asp:RadioButton>
                                <asiweb:BusinessCalendar2 Width="166px" ID="endDateCalendar" runat="server" BoundPropertyName="EndDate" AutoPostBack="true" OnDataChanged="OnEndDateChanged" OnMousedown="ClearErrorLabel()" Style="font-family:verdana,tahoma,arial,helvetica;" EnableClientScript="false" />                            
                            </div>
                     </div>
                  </div>                        
                  <asp:UpdatePanel ID="DistributionAppealCampaignFundPanel" runat="server">
                  <ContentTemplate>
                <div class="PanelField Left" style="border-bottom-style:none;">
                    <asp:Label ID="distributionLabel" runat="server" Text="distributionLabel" AssociatedControlID="distributionDropDown" CssClass="Required" ></asp:Label>
                    <asiweb:BusinessDropDownList Width="180px" id="distributionDropDown" CausesValidation="true" Required="true" runat="server" DataValueField="ProductCode" DataTextField="Title" QueryPath="$/Common/Queries/Value Lists/DistributionList" OnMousedown="ClearErrorLabel()" OnDataChanged="OnDistributionListChanged" AutoPostBack="true" />
                    <asp:RequiredFieldValidator class="Important" ID="distributionRequiredFieldValidator" runat="server" Display="Dynamic" EnableClientScript="false" ControlToValidate="distributionDropDown" Text="Required" ErrorMessage="Distribution: Required" ></asp:RequiredFieldValidator>
                </div>
                
                <div class="PanelField Left" style="border-bottom-style:none;">
                    <asp:Label ID="appealLabel" runat="server" Text="Appeal" AssociatedControlID="appealDropDown" ></asp:Label>
                    <asiweb:BusinessDropDownList Width="180px" id="appealDropDown" runat="server" DataValueField="Code" DataTextField="Title" QueryPath="$/Common/Queries/Value Lists/CsAppealCodes" OnMousedown="ClearErrorLabel()" OnDataChanged="OnAppealListChanged" AutoPostBack="true" />
                </div>
                
                <div class="PanelField Left" style="border-bottom-style:none;">
                    <asp:Label ID="campaignLabel" runat="server" Text="Campaign" AssociatedControlID="campaignDropDown" ></asp:Label>
                    <asiweb:BusinessDropDownList Width="180px" id="campaignDropDown" runat="server" DataValueField="Campaign_Code" DataTextField="Title" QueryPath="$/Fundraising/DefaultSystem/Queries/Recurring Donations/CampaignLegacyList" OnMousedown="ClearErrorLabel()" OnDataChanged="OnCampaignListChanged" AutoPostBack="true" />
                </div>
                
                <div class="PanelField Left" style="border-bottom-style:none;">
                    <asp:Label ID="fundLabel" runat="server" Text="Fund" AssociatedControlID="fundDropDown" CssClass="Required" ></asp:Label>
                    <asiweb:BusinessDropDownList Width="180px" id="fundDropDown" CausesValidation="true" runat="server" Required="true" DataValueField="Fund Code" DataTextField="Fund Name" QueryPath="$/Fundraising/DefaultSystem/Queries/Recurring Donations/FundCodeList" OnMousedown="ClearErrorLabel()" />
                    <asp:RequiredFieldValidator class="Important" ID="fundRequiredFieldValidator" runat="server" Display="Dynamic" EnableClientScript="false" ControlToValidate="fundDropDown" Text="Required" ErrorMessage="Fund: Required" ></asp:RequiredFieldValidator>
                </div>
                </ContentTemplate>
                </asp:UpdatePanel>
            </asiweb:PanelTemplateColumn>
            
            <asiweb:PanelTemplateColumn ID="PanelTemplateColumn4" runat="server" BorderStyle="None" LabelWidth="11em" Width="28em">           
                 <div class="PanelField Left" style="border-bottom-style:none">
                    <asp:Label ID="bankAccountNameLabel" runat="server" Text="Account Holder Name" AssociatedControlID="bankAccountNameControl" CssClass="Required" ></asp:Label>
                    <asiweb:BusinessTextBox ID="bankAccountNameControl" runat="server" CausesValidation="true" text style='text-transform:uppercase' BoundPropertyName="BankAccountName" Required="true" OnClientChange="ClearErrorLabel()" MaxLength="18" />
                    <asp:RequiredFieldValidator class="Important" ID="bankAccountNameValidator" runat="server" Display="Dynamic" EnableClientScript="false" ControlToValidate="bankAccountNameControl" Text="Required" ErrorMessage="Bank Account Name: Required" ></asp:RequiredFieldValidator>
                </div>
                
                <asiweb:SmartControl ID="branchSortCode" runat="Server" EnableClientScript="false" BoundPropertyName="BranchSortCode" DisplayCaption="true" BorderStyle="None"  OnMousedown="ClearErrorLabel()" />            
                
                <asiweb:SmartControl ID="bankAccountNumberControl" Width="400px" EnableClientScript="false" runat="Server" Caption="Account Number" BoundPropertyName="BankAccountNumber" DisplayCaption="true" BorderStyle="None"  OnClientChange="ClearErrorLabel()" />

                <asiweb:SmartControl ID="commitmentMatchReference" Width="400px" EnableClientScript="false" runat="Server" BoundPropertyName="MatchReference" DisplayCaption="true" BorderStyle="None"  OnClientChange="ClearErrorLabel()" />            

                <div class="PanelField Left" style="border-bottom-style:none;">
                    <asp:Label ID="notesLabel" runat="server" Text="Notes" AssociatedControlID="commitmentNotes" ></asp:Label>                
                    <asiweb:BusinessTextBox TextMode="MultiLine" width="160px" height="168px" ID="commitmentNotes" runat="server" BoundPropertyName="CommitmentNotes" OnClientChange="ClearErrorLabel()" OnKeyUp="return checkMaxLen(this,4001)"  />
                </div>
                                                                               
            </asiweb:PanelTemplateColumn>
        </asiweb:PanelTemplateControl>       
    </asp:PlaceHolder>
</asp:Panel> 