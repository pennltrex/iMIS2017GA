<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageSingleDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.GiftAidDeclaration.PageSingleDisplay" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" TagPrefix="asiweb" %>

<div style="clear: both;padding-top: 0.25em;width: 100%;">
     <div  style="float:right; text-align:right;"> 
         <asp:LinkButton ID="SwitchViewLinkButton" runat="server" CausesValidation="false" onclick="SwitchViewLinkButton_Click" >Switch to list view</asp:LinkButton>
         <asp:Label ID="lbOr" Text="or" runat="server" />
         <asp:LinkButton ID="newButton" runat="server" CausesValidation="false" Text="Create new declaration" onclick="NewButton_Click" />
    </div>
</div>

<div>
    <asp:UpdatePanel ID="UpdatePanel4" runat="server">
        <ContentTemplate>
            <asp:ValidationSummary ID="validationSummaryControl" runat="server" CssClass="Error" />
            <asp:Label ID="ErrorLabel" runat="server" Text="" CssClass="Error"></asp:Label>                        
        </ContentTemplate>
    </asp:UpdatePanel>
</div>

<asp:PlaceHolder ID="phDetails" runat="server" >
   
    <asiweb:PanelTemplateControl ID="Ex3Fields" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None"  GroupingText="top" >

        <asiweb:PanelTemplateColumn ID="PanelTemplateColumn3"  Width="50%" runat="server"  >

            <asiweb:SmartControl ID="taxpayerPrefix" runat="Server" BoundPropertyName="TaxpayerPrefix" DisplayCaption="true" BorderStyle="None"  />
            <asiweb:SmartControl ID="taxpayerFirstName" runat="Server" BoundPropertyName="TaxpayerFirstName" DisplayCaption="true" BorderStyle="None"  />
            <asiweb:SmartControl ID="taxpayerLastName" runat="Server" BoundPropertyName="TaxpayerLastName" DisplayCaption="true" BorderStyle="None"  />
            
            <asiweb:SmartControl ID="taxpayerAddress1" runat="Server" BoundPropertyName="TaxpayerAddress1" DisplayCaption="true" BorderStyle="None"  />
            <asiweb:SmartControl ID="taxpayerAddress2" runat="Server" BoundPropertyName="TaxpayerAddress2" DisplayCaption="true" BorderStyle="None"  />
            <asiweb:SmartControl ID="taxpayerAddress3" runat="Server" BoundPropertyName="TaxpayerAddress3" DisplayCaption="true" BorderStyle="None"  />
            <asiweb:SmartControl ID="taxpayerCity" runat="Server" BoundPropertyName="TaxpayerCity" DisplayCaption="true" BorderStyle="None"  />
            <asiweb:SmartControl ID="taxpayerCounty" runat="Server" BoundPropertyName="TaxpayerCounty" DisplayCaption="true" BorderStyle="None"  />
            <asiweb:SmartControl ID="taxpayerPostcode" runat="Server" BoundPropertyName="taxpayerPostcode" DisplayCaption="true" BorderStyle="None"  />
            <asiweb:SmartControl ID="taxpayerCountry" runat="Server" BoundPropertyName="TaxpayerCountry" DisplayCaption="true" BorderStyle="None"  />
            <asiweb:SmartControl ID="isHighRateTaxpayer" runat="Server" BoundPropertyName="isHighRateTaxpayer" DisplayCaption="true" BorderStyle="None"  />

            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/iparts/fundraising/giftaid/declaration/spacerImage.png"></asp:ImageButton>
        </asiweb:PanelTemplateColumn>
        <asiweb:PanelTemplateColumn ID="PanelTemplateColumn4" runat="server" BorderStyle="None">
             <asiweb:SmartControl ID="statusControl" runat="Server"  BoundPropertyName="Status" DisplayCaption="true"   BorderStyle="None"  AutoPostBack="true" OnDataChange="StatusControl_DataChange"  EnableAjaxPostback="true" />
             
             <div style="border-style: none" class="PanelField Left">
                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="statusUpdatedLabelDateLabel" runat="server"  AssociatedControlID="statusUpdatedLabel" Enabled="false"  ></asp:Label>
                        <div class="PanelFieldValue"> 
                            <asp:Label ID="statusUpdatedLabel" runat="server"  Enabled="false" ></asp:Label>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
             </div>
             
             <asiweb:SmartControl ID="declarationMethodKey" runat="Server"  BoundPropertyName="DeclarationMethodKey" DisplayCaption="true" ListSearchEnabled="true"  BorderStyle="None" OnDataChange="DeclarationMethodKey_DataChange" AutoPostBack="true" EnableAjaxPostback="true" />
             
             <div style="border-style: none" class="PanelField Left">
                    <asp:Label ID="isConfirmationRequiredLabel" runat="server"  AssociatedControlID="isConfirmationRequired"></asp:Label>
                <div class="PanelFieldValue"> 
                    <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                        <ContentTemplate>
                            <asiweb:BusinessCheckBox ID="isConfirmationRequired" runat="server" BoundPropertyName="IsConfirmationRequired" Enabled="false"></asiweb:BusinessCheckBox>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
             </div>
             
             <asiweb:SmartControl ID="confirmationSentDate" runat="Server"  BoundPropertyName="ConfirmationSentDate"  DisplayCaption="true" BorderStyle="None"  />
             
             <asiweb:SmartControl ID="declarationReceivedDate" runat="Server"  BoundPropertyName="DeclarationReceivedDate" DisplayCaption="true" BorderStyle="None"  OnDataChange="DeclarationReceivedDate_DataChange" AutoPostBack="true" EnableAjaxPostback="true" />
             <div class="PanelField Left" style="border-bottom-style:none;">
                 <asp:Label ID="declarationStartDate" runat="server" AssociatedControlID="SixYearRule" CssClass="Required" ></asp:Label>
                 <div  class="PanelFieldValue">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div><asp:RadioButton ID="SixYearRule" runat="server" GroupName="DeclarationStartDate" Text="Apply 4 year rule" AutoPostBack="true" ></asp:RadioButton>
                                <span>&nbsp;</span>
                            </div>
                            <br />
                            <div id="effectivePanel" runat="server">
                                <asp:RadioButton ID="SpecificDate" runat="server" GroupName="DeclarationStartDate" Text="Other:" AutoPostBack="true" ></asp:RadioButton>
                                <asiweb:BusinessCalendar2 ID="startDateCalendar" runat="server" BoundPropertyName="DeclarationStartDate" PositionValidator="Bottom"  />
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                 </div>
              </div>
              <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                  <ContentTemplate>
                     <asiweb:SmartControl ID="declarationEndDate" runat="Server"  BoundPropertyName="DeclarationEndDate" DisplayCaption="true" BorderStyle="None" />         
                  </ContentTemplate>
              </asp:UpdatePanel>
               
             <asiweb:SmartControl ID="appeal" runat="Server" BoundPropertyName="AppealCode" DisplayCaption="true" BorderStyle="None" />
               
        </asiweb:PanelTemplateColumn>
    </asiweb:PanelTemplateControl>
       
    
    <asiweb:SmartControl  Visible="false" ID="isTaxRecoveredUnrestricted" runat="Server"  BoundPropertyName="IsTaxRecoveredUnrestricted" PositionCaption="Right" DisplayCaption="True" BorderStyle="None"  />
    <asiweb:SmartControl ID="declarationNotes"  runat="Server" BoundPropertyName="DeclarationNotes" DisplayCaption="true" BorderStyle="None"/>


  
</asp:PlaceHolder>
