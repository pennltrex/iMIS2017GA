<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GeneralProductDisplayConfigEdit.ascx.cs" Inherits="Asi.Web.iParts.Commerce.GeneralProductDisplay.GeneralProductDisplayConfigEdit" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" %>
<%@ Import Namespace="Asi" %>

<asiweb:paneltemplatecontrol ID="ContainerPanel" runat="server" FieldSet="true" ShowHeader="false" BorderStyle="None">

    <asiweb:SmartControl ID="PageTitle" runat="server" BoundPropertyName="PageTitle" DisplayCaption="true" PositionCaption="Left" />
        
    <asiweb:SmartControl ID="DoNotRenderInDesignMode" runat="server" BoundPropertyName="DoNotRenderInDesignMode" 
                         DisplayCaption="true" PositionCaption="Right" CssClass="AutoWidth" />
    <asiweb:SmartControl ID="ShowBorderControl" runat="server" BoundPropertyName="ShowBorder" DisplayCaption="true" 
                         PositionCaption="Right" CssClass="AutoWidth" />
            
    <asiweb:SmartControl ID="ProductCode" runat="server" BoundPropertyName="ProductCode" DisplayCaption="true" PositionCaption="Left" />
    
    <asiweb:SmartControl ID="DisplayStyle" runat="server" BoundPropertyName="DisplayStyle" DisplayCaption="true" PositionCaption="Left" ShowNullItem="false" />

        <div style="clear: both;"/>
        <div class="ShowFieldset">
            <fieldset>
                <legend>Image</legend> 
                <asiweb:SmartControl ID="DisplayPicture" runat="server" BoundPropertyName="DisplayPicture" DisplayCaption="true" 
                                     PositionCaption="Right" CssClass="AutoWidth" AutoPostBack="true" OnDataChange="DisplayPictureDataChange" />
            <asp:Panel ID="PictureOptionsPanel" runat="server">
            <div class="SubItems">
            <asiweb:BusinessTextBox id="MaxPictureWidth" runat="server" DisplayCaption="true" PositionCaption="Left" RenderPanelField="true" Caption='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Commerce.GeneralProductDisplay.MaxPictureWidth.Caption","Picture width (px)") %>' CssClass="InputSmall"></asiweb:BusinessTextBox>
             <div style="clear: both;"/>
            <asp:RangeValidator ID="RangeValidatorForPictureWidth" runat="server"  ControlToValidate="MaxPictureWidth" Type="Integer"  Display="Dynamic"></asp:RangeValidator>
            <asp:RequiredFieldValidator ID="RequiredValidatorForPictureWidth" runat="server"  ControlToValidate="MaxPictureWidth"  Display="Dynamic"></asp:RequiredFieldValidator>            
            </div>
            </asp:Panel>
        </fieldset>
        </div>
        <div style="clear: both;"/> 
        <div class="ShowFieldset">
            <fieldset>
                <legend>Pricing</legend>
            <div class="PanelField AutoWidth" style="padding-bottom: 1em;">
                <asiweb:StyledLabel ID="CustomPricingInfoLabel" runat="server" 
                Text='<%# ResourceManager.GetPhrase("Asi.Web.iParts.Commerce.GeneralProductDisplayConfigEdit.CustomPricingInfoLabel", 
                "The customer price is always displayed. Comparison prices, Standard and Discount, are optional and illustrate the savings a customer receives or could receive if they qualify for a discount (e.g., are members)") %>' />
            </div>
            <asiweb:SmartControl ID="CustomerPriceLabel" runat="server" BoundPropertyName="CustomerPriceLabel" DisplayCaption="true" PositionCaption="Left" InputFieldCssClass="InputLargeWrapper"></asiweb:SmartControl>            
            <div class="PanelField AutoWidth" style="padding-bottom: 0.80em; padding-top: 1em;">
            <asiweb:SmartControl id="DisplayComparisonPrices" runat="server" BoundPropertyName="DisplayComparisonPrices" CssClass="AutoWidth" 
            DisplayCaption="True" PositionCaption="Top" ShowNullItem="false" AutoPostBack="True" OnDataChange="DisplayComparisonPricesDataChanged" />
            </div>            
            <asp:Panel ID="ComparisonPricesPanel" runat="server" CssClass="SubItems" >
                <asiweb:SmartControl ID="StandardPriceLabel" runat="server" BoundPropertyName="StandardPriceLabel" DisplayCaption="true" PositionCaption="Left" InputFieldCssClass="InputLargeWrapper" />                
                <asiweb:SmartControl ID="DiscountPriceLabel" runat="server" BoundPropertyName="DiscountPriceLabel" DisplayCaption="true" PositionCaption="Left" InputFieldCssClass="InputLargeWrapper" />                                                             
            </asp:Panel>
            <div style="clear: both;"></div>
                <div style="padding-top: 1em;">            
                <asiweb:SmartControl ID="DisplayDiscountPercentage" runat="server" BoundPropertyName="DisplayDiscountPercentage" DisplayCaption="true" PositionCaption="Right"
                 CssClass="AutoWidth" AutoPostBack="true" OnDataChange="DisplayDiscountPercentageDataChanged"  />   
             </div>             
            <asp:Panel ID="DiscountPercentageLabelPanel" runat="server">
                 <div class="SubItems">
                     <asiweb:SmartControl id="DiscountPercentageLabelWhenDiscountApplied" runat="server" BoundPropertyName="DiscountPercentageLabelWhenDiscountApplied" DisplayCaption="true" PositionCaption="Left" InputFieldCssClass="InputLargeWrapper"/>
                     <asiweb:SmartControl ID="DiscountPercentageLabelWhenDiscountNotApplied" runat="server" BoundPropertyName="DiscountPercentageLabelWhenDiscountNotApplied" DisplayCaption="true" PositionCaption="Left" InputFieldCssClass="InputLargeWrapper"/>
                     <asiweb:SmartControl ID="DiscountPercentageFormat" runat="server" BoundPropertyName="DiscountPercentageFormat" 
                                          DisplayCaption="true" PositionCaption="Left" HIControlType="ComboBox" ShowNullItem="false" />
                 </div>
            </asp:Panel>
        </fieldset>
        </div>
        <div style="clear: both;"/> 
        <div class="ShowFieldset">
            <fieldset>
                <legend>Shopping</legend>
                <asiweb:SmartControl ID="ItemAddedLabel" runat="server" BoundPropertyName="ItemAddedLabel" HtmlEncode="true" 
                                     DisplayCaption="true" PositionCaption="Left" InputFieldCssClass="InputXLargeWrapper"/>
                <asiweb:SmartControl ID="ItemUpdatedLabel" runat="server" BoundPropertyName="ItemUpdatedLabel" HtmlEncode="true" 
                                     DisplayCaption="true" PositionCaption="Left" InputFieldCssClass="InputXLargeWrapper"/>
            </fieldset>
        </div>       
        <div style="clear: both;"/> 
        <div ID="AutomaticRenewalsFieldset" class="ShowFieldset" runat="server">
            <fieldset>
                <legend>Automatic Renewals</legend>

                <div class="PanelField Top">
                    <div>
                        <asiweb:StyledLabel runat="server" ID="AutoRenewalTextLabel" Text='Automatic Renewal Top Text'
                            AssociatedControlID="AutoRenewalText"></asiweb:StyledLabel>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessHtmlEditor runat="server" ID="AutoRenewalText" CssClass="ContentHtmlEditor" EnableTextareaMode="true" 
                            Height="150" Width="500" style="width:500px!important;display:inline;" ValidateRequestMode="Disabled" />  
                    </div>
                </div>

                <div class="PanelField Top">
                    <div>
                        <asiweb:StyledLabel runat="server" ID="AutoRenewalLabelLabel" Text='Automatic Renewal Label'
                            AssociatedControlID="AutoRenewalLabel"></asiweb:StyledLabel>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessHtmlEditor runat="server" ID="AutoRenewalLabel" CssClass="ContentHtmlEditor" EnableTextareaMode="true" 
                            Height="150" Width="500" style="width:500px!important;display:inline;" ValidateRequestMode="Disabled" />  
                    </div>
                </div>

               <div class="PanelField Top">
                    <div>
                        <asiweb:StyledLabel runat="server" ID="AutoRenewalBottomTextLabel" Text='Automatic Renewal Bottom Text'
                            AssociatedControlID="AutoRenewalBottomText"></asiweb:StyledLabel>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessHtmlEditor runat="server" ID="AutoRenewalBottomText" CssClass="ContentHtmlEditor" EnableTextareaMode="true" 
                            Height="150" Width="500" style="width:500px!important;display:inline;" ValidateRequestMode="Disabled" />  
                    </div>
                </div>
                                                
           </fieldset>
        </div> 
 </asiweb:paneltemplatecontrol>