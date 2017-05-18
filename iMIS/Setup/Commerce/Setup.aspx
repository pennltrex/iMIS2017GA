<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" EnableViewState="true" CodeBehind="Setup.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.CommerceSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">

    <telerik:RadAjaxLoadingPanel BackgroundPosition="Center" BackgroundTransparency="0" ID="LoadingPanel" IsSticky="false" runat="server" Skin="Metro" Style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;" InitialDelayTime="200" />

    <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel">

        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="true">
        
            <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" Width="45em" translate="yes">
                
                <div class="ShowFieldset">
                    <fieldset>
                        <legend>
                            <span class="SectionLabel" id="OrderStagingSpan" runat="server"/> 
                        </legend>        
                        <div class="AddPaddingHorizontal">
                            <div class="SectionLabel" id="StandardOrdersDiv" runat="server" />     
                            <div class="SubItems Section">
                                <asiweb:BusinessCheckBox DisplayCaption="True" ID="StandardOrdersPickListCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />
                                <asiweb:BusinessCheckBox DisplayCaption="True" ID="StandardOrdersShippingPaperCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />
                                <asiweb:BusinessCheckBox DisplayCaption="True" ID="StandardOrdersInvoiceCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />
                                <asiweb:BusinessCheckBox DisplayCaption="True" ID="StandardOrdersAffectInventoryCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />
                            </div>

                            <div class="SectionLabel" id="DebitOrdersDiv" runat="server" />
                            <div class="SubItems Section">
                                <asiweb:BusinessCheckBox DisplayCaption="True" ID="DebitOrdersInvoiceCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />
                                <asiweb:BusinessCheckBox DisplayCaption="True" ID="DebitOrdersAffectInventoryCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />
                            </div>

                            <div class="SectionLabel" id="CreditOrdersDiv" runat="server" />
                            <div class="SubItems Section">
                                <asiweb:BusinessCheckBox DisplayCaption="True" ID="CreditOrdersInvoiceCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />
                                <asiweb:BusinessCheckBox DisplayCaption="True" ID="CreditOrdersAffectInventoryCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />
                            </div>

                            <div class="SectionLabel" id="ProFormaOrdersDiv" runat="server" />
                            <div class="SubItems">
                                <asiweb:BusinessCheckBox DisplayCaption="True" ID="ProFormaPrintCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />
                                <asiweb:BusinessDropDownList DisplayCaption="True" ID="ProFormaConvertToDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server"/>
                            </div>
                        </div>
                    </fieldset>
                </div>

                <div class="ShowFieldset">
                    <fieldset>
                        <legend>         
                            <span class="SectionLabel" id="AddOnChargesSpan" runat="server" />             
                        </legend>         
                        <div class="AddPaddingHorizontal">                            
                            <asiweb:BusinessDropDownList DisplayCaption="True" ID="ShipMethodDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server"/>
                            <asiweb:BusinessCheckBox DisplayCaption="True" ID="TaxFreightCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />
                            <asiweb:BusinessCheckBox DisplayCaption="True" ID="TaxHandlingCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />

                            <asiweb:BusinessCheckBox AutoPostBack="false" DisplayCaption="True" ID="AutoCalcHandlingCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />
                            <div id="HandlingAutoCalcSettings" runat="server" visible="true" class="SubItems Section">
                                <asiweb:MultiSelectControl2 DisplayCaption="True" ID="ExcludeOrderTypesMultiSelect" MaxLength="255" PositionCaption="Left" RenderPanelField="true" NoneSelectedText="Select types" runat="server"/>
                                <asiweb:BusinessDropDownList DisplayCaption="True" ID="HandlingChargeTypeDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server" AutoPostBack="false"/>
                                <div id="HandlingFlatRateSettings" runat="server" >
                                    <div class="PanelField Left">
                                        <asiweb:StyledLabel AssociatedControlID="FlatRateHandlingTextBox" ID="FlatRateHandlingLabel" runat="server" />
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessTextBox CssClass="InputSmall" ID="FlatRateHandlingTextBox" MaxLength="255" runat="server" onblur="javascript: truncate();"/>
                                            <asp:RegularExpressionValidator ID="FlatRateHandlingRegularExpressionValidator" ControlToValidate="FlatRateHandlingTextBox" runat="server" ErrorMessage="Must be numeric" ValidationExpression="\d*\.?\d*" />
                                        </div>
                                    </div>
                                    <div class="PanelField Left">
                                        <asiweb:StyledLabel AssociatedControlID="MinimumOrderTextBox" ID="MinimumOrderLabel" runat="server" />
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessTextBox CssClass="InputSmall" ID="MinimumOrderTextBox" MaxLength="255" runat="server" onblur="javascript: truncate();"/>
                                            <asp:RegularExpressionValidator ID="MinimumOrderTextBoxRegularExpressionValidator" ControlToValidate="MinimumOrderTextBox" runat="server" ErrorMessage="Must be numeric" ValidationExpression="\d*\.?\d*" />
                                        </div>
                                    </div>
                                </div>
                                <div id="HandlingPercentOfAmountSettings" class="Section" runat="server" >
                                    <div class="PanelField Left">
                                        <asiweb:StyledLabel AssociatedControlID="PercentOfTotalTextBox" ID="PercentOfTotalLabel" runat="server" />
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessTextBox CssClass="InputSmall" ID="PercentOfTotalTextBox" MaxLength="255" runat="server" onblur="javascript: truncate();"/>
                                            <asp:RegularExpressionValidator ID="PercentOfTotalTextBoxRegularExpressionValidator" ControlToValidate="PercentOfTotalTextBox" runat="server" ErrorMessage="Must be numeric" ValidationExpression="\d*\.?\d*" />
                                        </div>
                                    </div>
                                    <div class="PanelField Left">
                                    <asiweb:StyledLabel AssociatedControlID="MinChargeOfTotalTextBox" ID="MinChargeOfTotalLabel" runat="server" />
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessTextBox CssClass="InputSmall" ID="MinChargeOfTotalTextBox" MaxLength="255" runat="server" onblur="javascript: truncate();"/>
                                            <asp:RegularExpressionValidator ID="MinChargeOfTotalTextBoxRegularExpressionValidator" ControlToValidate="MinChargeOfTotalTextBox" runat="server" ErrorMessage="Must be numeric" ValidationExpression="\d*\.?\d*" />
                                        </div>
                                    </div>
                                    <div class="PanelField Left">
                                        <asiweb:StyledLabel AssociatedControlID="MaxChargeOfTotalTextBox" ID="MaxChargeOfTotalLabel" runat="server" />
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessTextBox CssClass="InputSmall" ID="MaxChargeOfTotalTextBox" MaxLength="255" runat="server" onblur="javascript: truncate();"/>
                                            <asp:RegularExpressionValidator ID="MaxChargeOfTotalTextBoxRegularExpressionValidator" ControlToValidate="MaxChargeOfTotalTextBox" runat="server" ErrorMessage="Must be numeric" ValidationExpression="\d*\.?\d*" />
                                        </div>
                                    </div>
                                </div>
                                <div id="HandlingPercentOfFreightSettings" runat="server" >
                                    <div class="PanelField Left">
                                        <asiweb:StyledLabel AssociatedControlID="PercentOfFreightTextBox" ID="PercentOfFreightLabel" runat="server" />
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessTextBox CssClass="InputSmall" ID="PercentOfFreightTextBox" MaxLength="255" runat="server" onblur="javascript: truncate();"/>
                                            <asp:RegularExpressionValidator ID="PercentOfFreightTextBoxRegularExpressionValidator" ControlToValidate="PercentOfFreightTextBox" runat="server" ErrorMessage="Must be numeric" ValidationExpression="\d*\.?\d*" />
                                        </div>
                                    </div>
                                    <div class="PanelField Left">
                                        <asiweb:StyledLabel AssociatedControlID="MinFreightChargeTextBox" ID="MinFreightChargeLabel" runat="server" />
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessTextBox CssClass="InputSmall" ID="MinFreightChargeTextBox" MaxLength="255" runat="server" onblur="javascript: truncate();"/>
                                            <asp:RegularExpressionValidator ID="MinFreightChargeTextBoxRegularExpressionValidator" ControlToValidate="MinFreightChargeTextBox" runat="server" ErrorMessage="Must be numeric" ValidationExpression="\d*\.?\d*" />
                                        </div>
                                    </div>
                                    <div class="PanelField Left">
                                        <asiweb:StyledLabel AssociatedControlID="MaxFreightChargeTextBox" ID="MaxFreightChargeLabel" runat="server" />
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessTextBox CssClass="InputSmall" ID="MaxFreightChargeTextBox" MaxLength="255" runat="server" onblur="javascript: truncate();"/>
                                            <asp:RegularExpressionValidator ID="MaxFreightChargeTextBoxRegularExpressionValidator" ControlToValidate="MaxFreightChargeTextBox" runat="server" ErrorMessage="Must be numeric" ValidationExpression="\d*\.?\d*" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <asiweb:BusinessCheckBox AutoPostBack="false" DisplayCaption="True" ID="AutoCalcFreightCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />
                            <div id="FreightAutoCalcSettings" runat="server" visible="true" class="SubItems">
                                <asiweb:MultiSelectControl2 DisplayCaption="True" ID="ExcludeFreightOrderTypesMultiSelect" MaxLength="255" PositionCaption="Left" NoneSelectedText="Select types" RenderPanelField="true" runat="server" />
                                <asiweb:BusinessDropDownList DisplayCaption="True" ID="AutoFreightTypeDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server" AutoPostBack="false"/>
                                <div id="FreightByWeightSettings" runat="server" visible="true">
                                    <div class="PanelField Left">
                                        <asiweb:StyledLabel AssociatedControlID="MinAutoFreightChargeTextBox" ID="MinAutoFreightChargeLabel" runat="server" />
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessTextBox CssClass="InputSmall" ID="MinAutoFreightChargeTextBox" MaxLength="255" runat="server" onblur="javascript: truncate();"/>
                                            <asp:RegularExpressionValidator ID="MinAutoFreightChargeTextBoxRegularExpressionValidator" ControlToValidate="MinAutoFreightChargeTextBox" runat="server" ErrorMessage="Must be numeric" ValidationExpression="\d*\.?\d*" />
                                        </div>
                                    </div>
                                    <div class="PanelField Left">
                                        <asiweb:StyledLabel AssociatedControlID="MaxAutoFreightChargeTextBox" ID="MaxAutoFreightChargeLabel" runat="server" />
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessTextBox CssClass="InputSmall" ID="MaxAutoFreightChargeTextBox" MaxLength="255" runat="server" onblur="javascript: truncate();"/>
                                            <asp:RegularExpressionValidator ID="MaxAutoFreightChargeTextBoxRegularExpressionValidator" ControlToValidate="MaxAutoFreightChargeTextBox" runat="server" ErrorMessage="Must be numeric" ValidationExpression="\d*\.?\d*" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> 
                    </fieldset>
                </div>
                <div class="ShowFieldset">
                    <fieldset>
                        <legend>         
                            <span class="SectionLabel" id="WebSalesTaxAuthoritySpan" runat="server" />             
                        </legend>

                        <div class="AddPaddingHorizontal">
                            <asiweb:BusinessTextBox CssClass="InputLarge" DisplayCaption="True" ID="TaxAuthorityCityTextBox" MaxLength="255" PositionCaption="Left" RenderPanelField="true" runat="server"/>
                            <asiweb:BusinessDropDownList DisplayCaption="True" ID="TaxAuthorityCityCodeDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server"/>
                            <asiweb:BusinessDropDownList DisplayCaption="True" ID="TaxAuthorityStateProvinceDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server"/>
                            <asiweb:BusinessDropDownList DisplayCaption="True" ID="TaxAuthorityStateProvinceCodeDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server"/>
                            <asiweb:BusinessCheckBox DisplayCaption="True" ID="UseCustomerDefaultTaxAuthorityCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />
                        </div>
                    </fieldset>
                </div>

                <%--These values are defaults and cannot be changed --%>
                <asiweb:BusinessCheckBox ID="NewInvoiceBatchCheckBox" runat="server" Visible="false" Checked="true" />
                <asiweb:BusinessCheckBox ID="AutoInvReceiptPostingCheckBox" runat="server" Visible="false" Checked="false" />

            </asiweb:PanelTemplateColumn>

        </asiweb:PanelTemplateControl2>

    </telerik:RadAjaxPanel>

    <script type="text/javascript">
        //<![CDATA[
        function ShowLoadingPanel() {
            if (Page_IsValid)
                jQuery("#<%#LoadingPanel.ClientID%>").show();
        }
        
        function truncate() {
            var oSource = window.event.srcElement;
            if (!isNaN(oSource.value) && oSource.value) {
                oSource.value = parseFloat(oSource.value).toFixed(2);;
            }            
        }

        HideShowHandlingChargeSection();
        function HideShowHandlingChargeSection() {
            var autoCalcHandlingCheckBox = jQuery("#<%#AutoCalcHandlingCheckBox.ClientID%>");
            var handlingAutoCalcSettings = jQuery("#<%#HandlingAutoCalcSettings.ClientID%>");
            var handlingExcludeMultiSelect = jQuery("#<%#ExcludeOrderTypesMultiSelect.SelectedValuesListBox.ClientID%>");

            if (autoCalcHandlingCheckBox != null && autoCalcHandlingCheckBox.is(':checked')) {
                jQuery(handlingAutoCalcSettings).show();
                jQuery(handlingExcludeMultiSelect).next().css("width", "300px");
            }
            else {
                jQuery(handlingAutoCalcSettings).hide();
            }
        }

        HideShowShippingChargeSection();
        function HideShowShippingChargeSection() {
            var autoCalcFreightCheckBox = jQuery("#<%#AutoCalcFreightCheckBox.ClientID%>");
            var freightAutoCalcSettings = jQuery("#<%#FreightAutoCalcSettings.ClientID%>");
            var freightExcludeMultiSelect = jQuery("#<%#ExcludeFreightOrderTypesMultiSelect.SelectedValuesListBox.ClientID%>");

            if (autoCalcFreightCheckBox != null && autoCalcFreightCheckBox.is(':checked')) {
                jQuery(freightAutoCalcSettings).show();
                jQuery(freightExcludeMultiSelect).next().css("width", "300px");
            }
            else {
                jQuery(freightAutoCalcSettings).hide();
            }
        }

        HandlingChargeTypeDropDownListChange();
        function HandlingChargeTypeDropDownListChange() {
            var handlingChargeTypeDropDownList = jQuery("#<%#HandlingChargeTypeDropDownList.ClientID%>");
            var selectedOption = jQuery(handlingChargeTypeDropDownList).find(":selected").val();

            var handlingFlatRateSettings = jQuery("#<%#HandlingFlatRateSettings.ClientID%>");
            var handlingPercentOfAmountSettings = jQuery("#<%#HandlingPercentOfAmountSettings.ClientID%>");
            var handlingPercentOfFreightSettings = jQuery("#<%#HandlingPercentOfFreightSettings.ClientID%>");
          
            if (selectedOption == "1") {              
                handlingFlatRateSettings.hide();
                handlingPercentOfAmountSettings.show();
                handlingPercentOfFreightSettings.hide();
            }
            else if (selectedOption == "2") {               
                handlingFlatRateSettings.hide();
                handlingPercentOfAmountSettings.hide();
                handlingPercentOfFreightSettings.show();
            } else {             
                handlingFlatRateSettings.show();
                handlingPercentOfAmountSettings.hide();
                handlingPercentOfFreightSettings.hide();
            }
        }

        ShippingChargeTypeDropDownListChange();
        function ShippingChargeTypeDropDownListChange() {
            var shippingChargeTypeDropDownList = jQuery("#<%#AutoFreightTypeDropDownList.ClientID%>");
            var selectedOption = jQuery(shippingChargeTypeDropDownList).find(":selected").val();
            var shippingByWeightSettings = jQuery("#<%#FreightByWeightSettings.ClientID%>");
          
            if (selectedOption == "1" || selectedOption == "2") {              
                shippingByWeightSettings.hide();
            } else {             
                shippingByWeightSettings.show();
            }
        }

        //]]>

    </script>

</asp:Content>
