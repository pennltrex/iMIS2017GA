<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AutoPayEnrollmentsEditDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.AutoPayEnrollments.AutoPayEnrollmentsEditDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="uc1" TagName="PaymentCreator" Src="~/iParts/Commerce/PaymentCreator/PaymentCreatorDisplay.ascx" %>
<%@ Register TagPrefix="ajaxToolkit" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=4.1.50508.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>

<asiweb:PanelTemplateControl2 ID="DetailedEnrollmentTemplateControl" runat="server" Collapsible="false" ShowBorder="false" ShowHeader="True">
        <h2><asiweb:StyledLabel runat="server" id="LabelPageTitle" Text="Recurring Donation"></asiweb:StyledLabel></h2>
        <p><asiweb:StyledLabel runat="server" id="EnrollmentSummary" Text=""></asiweb:StyledLabel></p> 
            
        <asp:Panel runat="server" ID="PanelDonationSpecificFields">
            <div runat="server" ID="PanelDonorName" class="PanelField Left">
                <div style="display: inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelDonorName" Text="Donor" CssClass="Label"></asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessHyperLink runat="server" ID="LinkDonorName" Text=""></asiweb:BusinessHyperLink>
                </div>
            </div>
            <div class="PanelField Left">
                <div style="display: inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelGiftItem" Text="Gift item" CssClass="Label"></asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:StyledLabel runat="server" ID="LabelGiftItemData" Text=""></asiweb:StyledLabel>
                </div>
            </div>
            <div class="PanelField Left">
                <div style="display: inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelDonationBeginDate" Text="Beginning" CssClass="Label"></asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:StyledLabel runat="server" ID="LabelDonationBeginDateData" Text=""></asiweb:StyledLabel>
                </div>
            </div>
            <div class="PanelField Left">
                <div style="display: inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelAmount" Text="Amount" CssClass="Label" AssociatedControlID="GiftAmount"></asiweb:StyledLabel>
               </div>
               <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox DisplayCaption="false" ID="GiftAmount" runat="server" CssClass="size" />
                            <ajaxToolkit:FilteredTextBoxExtender ID="GiftAmountFilter" runat="server"
                                TargetControlID="GiftAmount"         
                                FilterType="Custom, Numbers" />
                    <asiweb:AsiRequiredFieldValidator ControlToValidate="GiftAmount" CssClass="Important" ID="GiftAmountRequiredFieldValidator" runat="server" />
                    <asp:RangeValidator ControlToValidate="GiftAmount" CssClass="Important" Display="Dynamic" ID="GiftAmountRangeValidator1" MaximumValue="100000000" runat="server" Type="Double" />                    
                    &nbsp;<asiweb:StyledLabel runat="server" ID="LabelAmountData" Text=""></asiweb:StyledLabel>
                </div>
            </div>
        </asp:Panel> 
        <asp:Panel runat="server" ID="PanelMembershipSpecificFields">
            <div runat="server" id="PanelMemberName" class="PanelField Left">
                <div style="display: inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelMember" Text="Member" CssClass="Label"></asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue">
                   <asiweb:BusinessHyperLink runat="server" ID="LinkMemberData" Text=""></asiweb:BusinessHyperLink>
                </div>
            </div>
            <div id="GroupDisplay" runat="server">
                <div class="PanelField Left">
                    <div style="display: inline;">
                        <asiweb:StyledLabel runat="server" ID="LabelGroup" Text="Group" CssClass="Label"></asiweb:StyledLabel>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:StyledLabel runat="server" ID="LabelGroupData" Text=""></asiweb:StyledLabel>
                    </div>
                </div>
                <div class="PanelField Left">
                    <div style="display: inline;">
                        <asiweb:StyledLabel runat="server" ID="LabelRole" Text="Role" CssClass="Label"></asiweb:StyledLabel>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:StyledLabel runat="server" ID="LabelRoleData" Text=""></asiweb:StyledLabel>
                    </div>
                </div>
            </div>
            <div class="PanelField Left">
                <div style="display: inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelMembershipBegin" Text="Beginning" CssClass="Label"></asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:StyledLabel runat="server" ID="LabelMembershipBeginData" Text=""></asiweb:StyledLabel>
                </div>
            </div>
            <div class="PanelField Left">
                <div style="display: inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelFrequency" Text="Frequency" CssClass="Label"></asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:StyledLabel runat="server" ID="LabelFrequencyData" Text=""></asiweb:StyledLabel>
                </div>
            </div> 
        </asp:Panel>

        <%-- Common Fields --%>
        <div class="PanelField Left" runat="server" ID="collectionDayPanel">
            <div style="display: inline;"> 
                <asiweb:StyledLabel runat="server" ID="LabelCollectionDay" Text="Collection day" CssClass="Label" />
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessRadioButtonList runat="server" ID="RadioButtonCollectionDay" />
                <asiweb:BusinessDropDownList runat="server" ID="DropDownListCollectionDay" />
            </div>
        </div>
        <div class="PanelField Left">
            <div style="display: inline;">
                <asiweb:StyledLabel runat="server" ID="LabelDonationPaymentOption" Text="Payment option" CssClass="Label" AssociatedControlID="ListDonationPaymentOption"></asiweb:StyledLabel>
            </div>
            <div class="PanelFieldValue">
                <asiweb:StyledLabel runat="server" id="SelectedDonationPaymentOption"></asiweb:StyledLabel>
                <asiweb:BusinessDropDownList runat="server" id="ListDonationPaymentOption" AutoPostBack="False"  IncludeNullItem="False"/>
            </div>
        </div>
        <div class="ClearFix"></div>
        <div aria-live="polite">
        <asp:Panel runat="server" ID="PanelAddPaymentOption"  style="display: none;" CssClass="NeutralShading">
                <asiweb:StyledLabel ID="PaymentOptionTitleBar" runat="server" CssClass="SectionLabel"></asiweb:StyledLabel>
                <uc1:PaymentCreator ID="PaymentCreator1" runat="server" />
        </asp:Panel>
        </div>
        <div class="PanelField Left">
            <div style="display: inline;">
                <asiweb:StyledLabel runat="server" ID="LabelDonationStatus" Text="" CssClass="Label" AssociatedControlID="ListDonationStatus"></asiweb:StyledLabel>
            </div>
            <div class="PanelFieldValue">
                <asiweb:StyledLabel runat="server" ID="LabelDonationStatusData" Text=""></asiweb:StyledLabel>
                <asiweb:BusinessDropDownList runat="server" ID="ListDonationStatus" Required="True" AutoPostBack="True" OnSelectedIndexChanged="ListDonationStatus_OnSelectedIndexChanged" IncludeNullItem="False" />
            </div>
        </div>
        <div aria-live="polite">
        <asp:Panel runat="server" ID="PanelReasonForCancellationFieldGroup">
            <div class="PanelField">
                <asiweb:StyledLabel runat="server" ID="LabelCancellationReason" Text="Reason for cancellation" AssociatedControlID="txtCancellationReason" CssClass=""></asiweb:StyledLabel>
                <div class="PanelFieldValue ">
                    <asiweb:BusinessTextBox runat="server" TextMode="MultiLine" ID="txtCancellationReason" ></asiweb:BusinessTextBox>
                </div>
            </div>
        </asp:Panel> 
        </div>
        <asp:Panel runat="server" ID="PanelCancelledOnFieldGroup">
            <div class="PanelField Left">
                <div style="display: inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelCancelledOn" Text="Cancelled on" CssClass="Label"></asiweb:StyledLabel>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:StyledLabel runat="server" ID="LabelCancelledOnData" Text=""></asiweb:StyledLabel>
                </div>
            </div>
        </asp:Panel>
        <div class="PanelField Left">
            <div style="display: inline;">
                <asiweb:StyledLabel runat="server" ID="LabelUpdatedBy" Text="Updated by" CssClass="Label"></asiweb:StyledLabel>
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessHyperLink runat="server" ID="LinkUpdatedByData" Text=""></asiweb:BusinessHyperLink>
            </div>
        </div>
        
        <p class="clearfix">&nbsp;</p>
        <asp:Panel runat="server" ID="PanelViewTransactions">
             <h3><asiweb:StyledLabel runat="server" id="LabelTitleTransactions"></asiweb:StyledLabel></h3>     
                <asiweb:BusinessDataGrid2 runat="server" id="TransactionListGrid" OnNeedDataSource="TransactionListGrid_OnNeedDataSource" AllowPaging="false" 
                AllowMultiRowEdit="False" AutoGenerateColumns="False" AllowResumePaging="False">
                    <MasterTableView Width="100%" CommandItemDisplay="None" DataKeyNames="">
                    <Columns>
                        <telerik:GridBoundColumn UniqueName="InvoiceDate" HeaderText="Invoice Date" DataField="InvoiceDateDisplay"/>
                        <telerik:GridBoundColumn UniqueName="DueDate" HeaderText="Due Date" DataField="DueDateDisplay"/>
                        <telerik:GridBoundColumn UniqueName="InvoiceNumber" HeaderText="Invoice Number" DataField="InvoiceNumber"/>
                        <telerik:GridBoundColumn UniqueName="Amount" HeaderText="Amount" DataField="Amount" dataFormatString="{0:0.00}" />
                        <telerik:GridBoundColumn UniqueName="Balance" HeaderText="Balance" DataField="Balance" dataFormatString="{0:0.00}" />
                    </Columns>
                   </MasterTableView>
                </asiweb:BusinessDataGrid2>
          </asp:Panel>
        
        <br />
        <p><asiweb:BusinessHyperLink runat="server" Text="View transactions" ID="LinkViewTransactions"></asiweb:BusinessHyperLink></p>
        <p class="clearfix">&nbsp;</p>
     
    </asiweb:PanelTemplateControl2>