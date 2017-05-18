<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BillingItemCreatorDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.ItemCreator.BillingItemCreatorDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="asiCommon" TagName="GeneralLedger" Src="GeneralLedgerAccountDisplay.ascx" %>

<telerik:RadAjaxLoadingPanel BackgroundPosition="Center" BackgroundTransparency="0" ID="LoadingPanel" IsSticky="false" runat="server" Skin="Metro" Style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;" />

<telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel" EnableAJAX="False">

    <asiweb:PanelTemplateControl2 ID="ContentPanel1" runat="server" Visible="true" translate="yes" BorderStyle="None" Collapsible="false">
 
        <div class="PanelField Left">
            <asiweb:StyledLabel ID="TypeLabel" AssociatedControlID="TypeDescriptionTextBox" runat="server" />                           
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox ID="TypeDescriptionTextBox" Enabled="False" RenderPanelField="False" runat="server" CssClass="InputXLarge" />
                <asiweb:BusinessDropDownList DisplayCaption="False" Required="True" ID="TypeBusinessDropDown" RenderPanelField="False" runat="server" Enabled="False" 
                    AutoPostBack="True" OnTextChanged="TypeBusinessDropDown_OnTextChanged"/>
                <asiweb:AsiRequiredFieldValidator Enabled="False" ControlToValidate="TypeBusinessDropDown" CssClass="Important" Display="Dynamic" ID="TypeDropDownRequired" runat="server" SetFocusOnError="true" />
            </div>
        </div>
        <div class="PanelField Left">
            <asiweb:StyledLabel AssociatedControlID="CodeTextBox" CssClass="Required" ID="CodeLabel" runat="server" />                           
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="CodeTextBox" MaxLength="15" />
                <asiweb:AsiRequiredFieldValidator ControlToValidate="CodeTextBox" CssClass="Important" Display="Dynamic" ID="CodeRequired" runat="server" SetFocusOnError="true" />
                <asp:CustomValidator ControlToValidate="CodeTextBox" CssClass="Important" Display="Dynamic" ErrorMessage="The code is in use. Enter a unique code." ID="CodeUniqueCustomValidator" OnServerValidate="ItemCodeUniqueCustomValidator_OnServerValidate" runat="server" />
                <asiweb:AsiRegularExpressionValidator ControlToValidate="CodeTextBox" Display="Dynamic" id="CodeRegExpValidator" runat="server" 
                    ValidationExpression="^[a-zA-Z0-9_]{1,15}$" ErrorMessage="Enter up to 15 letters, numbers, or the underscore character." />
            </div>
        </div>

        <div class="PanelField Left">
            <asiweb:StyledLabel AssociatedControlID="NameTextBox" CssClass="Required" ID="NameLabel" runat="server"/>                           
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="NameTextBox" MaxLength="60" CssClass="InputXLarge"/>
                <asiweb:AsiRequiredFieldValidator ControlToValidate="NameTextBox" CssClass="Important" ID="NameRequired" runat="server" SetFocusOnError="true"/>
            </div>
        </div>   
       
        <div ID="ChapterGroupSection" runat="server">
            <asiweb:BusinessTextBox DisplayCaption="True" ID="ChapterGroup1TextBox" RenderPanelField="True" runat="server" MaxLength="31"/>
            <asiweb:BusinessTextBox DisplayCaption="True" ID="ChapterGroup2TextBox" RenderPanelField="True" runat="server" MaxLength="31"/>
            <asiweb:BusinessTextBox DisplayCaption="True" ID="ChapterGroup3TextBox" RenderPanelField="True" runat="server" MaxLength="31"/>
        </div>
    
        <asiweb:BusinessHtmlEditor CssClass="ContentHtmlEditor" DisplayCaption="True" EnableTextareaMode="true" Height="100" ID="DescriptionTextArea" RenderPanelField="True" runat="server" style="width:500px!important;" Width="500" /> 
        <asiweb:BusinessHtmlEditor CssClass="ContentHtmlEditor" DisplayCaption="True" EnableTextareaMode="true" Height="100" ID="NotesTextArea" RenderPanelField="True" runat="server" style="width:500px!important;" Width="500" /> 
    
    </asiweb:PanelTemplateControl2>

    <asiweb:PanelTemplateControl2 ID="ContentPanel2" runat="server" Visible="true" translate="yes" BorderStyle="None" Collapsible="false" ShowHeader="True" TemplateTitle="Pricing">
 
        <asp:UpdatePanel ID="PriceUpdatePanel" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <div class="PanelField Left">
                                    
                    <div style="display: inline;">
                        <asiweb:StyledLabel AssociatedControlID="txtStandardPrice" ID="StandardPriceLabel" runat="server" Text="Standard price"/>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox CssClass="InputSmall" ID="txtStandardPrice" OnTextChanged="TxtStandardPrice_OnTextChanged" runat="server" />                  
                        <asiweb:StyledHyperlink ID="AddStandardPricingRulesLink" runat="server" Text="Add pricing rules" Visible="False" />
                        <asp:RangeValidator ControlToValidate="txtStandardPrice" CssClass="Important" Display="Dynamic" ID="StandardPriceRange" 
                            MaximumValue="1000000" MinimumValue="0" runat="server" Type="Currency" 
                            ErrorMessage="Must be a currency amount between 0 and 1000000." />
                        <br/>
                        <asiweb:StyledLabel ID="UsesStandardPricingRulesLabel" runat="server" Text="Uses pricing rules" Visible="False" />
                        <asp:LinkButton CausesValidation="False" ClientIDMode="Static" ID="RemoveStandardPricingRulesLink" OnClick="RemoveStandardPricingRules_OnClick" OnClientClick="return confirm(RemovePricingRulesMessage());" runat="server" Text="Remove" Visible="False"/>
                    </div>
                </div>
                <div class="PanelField Left">
                    <div style="display: inline;">
                        <asiweb:StyledLabel AssociatedControlID="txtDiscountPrice" ID="DiscountPriceLabel" runat="server" Text="Discount price"/>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox CssClass="InputSmall" ID="txtDiscountPrice" OnTextChanged="TxtDiscountPrice_OnTextChanged" runat="server" />
                        <asiweb:StyledHyperlink ID="AddDiscountPricingRulesLink" runat="server" Text="Add pricing rules" Visible="False" />
                        <asp:RangeValidator ControlToValidate="txtDiscountPrice" CssClass="Important" Display="Dynamic" ID="DiscountPriceRange" 
                            MaximumValue="1000000" MinimumValue="0" runat="server" Type="Currency"
                            ErrorMessage="Must be a currency amount between 0 and 1000000." />
                        <br/>
                        <asiweb:StyledLabel ID="UsesDiscountPricingRulesLabel" runat="server" Text="Uses pricing rules" Visible="False" />
                        <asp:LinkButton CausesValidation="False" ClientIDMode="Static" ID="RemoveDiscountPricingRulesLink" OnClick="RemoveDiscountPricingRules_OnClick" OnClientClick="return confirm(RemovePricingRulesMessage());" runat="server" Text="Remove" Visible="False"/>
                        <asp:LinkButton CausesValidation="False" ClientIDMode="Static" ID="UseStandardPricingForDiscountPricingRulesLink" OnClick="UseStandardPricingForDiscountPricingRules_OnClick" runat="server" Text="Use standard pricing rules" Visible="False"/>
                        <asp:Button CausesValidation="False" ID="RefreshTrigger" OnClick="RefreshTriggerClick" runat="server" style="display:none" Visible="False"  />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>    
    
        <div class="PanelField Left">
            <asiweb:StyledLabel AssociatedControlID="PayPriorityTextBox" ID="PayPriorityLabel" runat="server" />                           
            <div class="PanelFieldValue">
				<asiweb:BusinessTextBox CssClass="InputXSmall" DisplayCaption="False" ID="PayPriorityTextBox" RenderPanelField="False" runat="server" />
				<asp:CompareValidator ID="PayPriorityValidator" runat="server" ControlToValidate="PayPriorityTextBox" Type="Integer" 
                    Operator="GreaterThanEqual" ValueToCompare="0" ErrorMessage="Must be zero or greater." Display="Dynamic" />           
            </div>
        </div>
        <div class="PanelField Left">
            <asiweb:StyledLabel AssociatedControlID="TermSpanMonthsTextBox" ID="TermSpanMonthsLabel" runat="server" />                           
            <div class="PanelFieldValue">
				<asiweb:BusinessTextBox CssClass="InputXSmall" DisplayCaption="False" ID="TermSpanMonthsTextBox" RenderPanelField="False" runat="server" />
				<asp:CompareValidator ID="TermSpanMonthsValidator" runat="server" ControlToValidate="TermSpanMonthsTextBox" Type="Integer"
                    Operator="GreaterThanEqual" ValueToCompare="0"
                    ErrorMessage="Must be zero or greater." Display="Dynamic" />     
            </div>
        </div>

        <asp:Panel cssclass="PanelField Left" runat="server" id="ProratePanel">
            <asiweb:StyledLabel AssociatedControlID="ProrateScheduleDropDownList" ID="ProrateFeesLabel" runat="server" />                           
            <div class="PanelFieldValue">               
                <asiweb:BusinessDropDownList DisplayCaption="False" ID="ProrateScheduleDropDownList" RenderPanelField="False" runat="server" />                                  
            </div>
        </asp:Panel>

    </asiweb:PanelTemplateControl2>

    <asiweb:PanelTemplateControl2 ID="ContentPanel3" runat="server" Visible="true" translate="yes" BorderStyle="None" Collapsible="false" ShowHeader="True" TemplateTitle="Accounting">
    
        <asp:UpdatePanel ID="IncomeAccountPanel" runat="server" UpdateMode="Always" ChildrenAsTriggers="true" EnableViewState="True">
                <ContentTemplate>
            <asp:HiddenField ID="IncomeAccountDataHF" runat="server"/>
            <asp:HiddenField ID="DeferredIncomeAccountDataHF" runat="server"/>
        <asiweb:BusinessDropDownList DisplayCaption="True" id="FinancialEntityDropDownList" RenderPanelField="True" runat="server" AutoPostBack="true" />  
        <div class="Section">
            <asiweb:BusinessCheckBox AutoPostBack="True" CssClass="jsIsCharitableCheckbox" PositionCaption="Right" DisplayCaption="True" ID="IsCharitableCheckBox" OnCheckedChanged="IsCharitableCheckBox_OnCheckedChanged" RenderPanelField="True" runat="server" />         
            <asp:panel CssClass="PanelField Left SubItems" ID="FairMarketValuePanel" runat="server" >
                <asiweb:StyledLabel AssociatedControlID="FairMarketValueTextBox" ID="FairMarketValueLabel" runat="server" />                           
                <div class="PanelFieldValue">
				    <asiweb:BusinessTextBox CssClass="InputSmall" DisplayCaption="False" ID="FairMarketValueTextBox" RenderPanelField="False" runat="server" /> 
				    <asp:CompareValidator ID="FairMarketValueValidator" runat="server" ControlToValidate="FairMarketValueTextBox" Type="Currency" Operator="DataTypeCheck" ErrorMessage="Invalid" Display="Dynamic" />     
                </div>
            </asp:panel> 
        </div>                       
        <asiweb:StyledLabel CssClass="Label" ID="InstructionsLabel" runat="server" />
        <div class="SubItems">
                    <div class="PanelField Left Section">                
                        <asiweb:StyledLabel runat="server" ID="IncomeAccountLabel" AssociatedControlID="IncomeAccountList"/> 
                        <div class="PanelFieldValue">
                            <asiweb:BusinessComboBox TranslateOnlyCaptionAndToolTip="True" runat="server" CssClass="WideTextBox"
                                ID="IncomeAccountList" 
                                CausesValidation="false" OnClientBlur="OnClientBlurHandler" Filter="Contains"
                                ShowNullItem="false" MarkFirstMatch="True" AllowCustomText="True"
                                OnSelectedIndexChanged="AccountSelected"  
                                OnClientFocus="OpenDropDown"
                                Height="185px">
                            </asiweb:BusinessComboBox>
                            <asp:CustomValidator ControlToValidate="IncomeAccountList" CssClass="Important" Display="Dynamic" ID="AccountCustomValidator" OnServerValidate="AccountSelectedCustomValidator_OnServerValidate" runat="server" />
                        </div>
                    </div>
                    <div style="clear: both;"></div>
                    <asp:Panel ID="DeferredIncomePanel" runat="server" CssClass="PanelField Left Section">                
                        <asiweb:StyledLabel runat="server" ID="DeferredIncomeAccountLabel" AssociatedControlID="DeferredIncomeAccountList" Text="Deferred Income"/> 
                        <div class="PanelFieldValue">
                            <asiweb:BusinessComboBox TranslateOnlyCaptionAndToolTip="True" runat="server" CssClass="WideTextBox"
                                ID="DeferredIncomeAccountList" 
                                CausesValidation="false" OnClientBlur="OnClientBlurHandler" Filter="Contains"
                                ShowNullItem="false" MarkFirstMatch="True" AllowCustomText="True"
                                OnSelectedIndexChanged="AccountSelected"  
                                OnClientFocus="OpenDropDown"
                                Height="185px">
                            </asiweb:BusinessComboBox>
                            <asp:CustomValidator ControlToValidate="DeferredIncomeAccountList" CssClass="Important" Display="Dynamic" ID="CustomValidator1" OnServerValidate="AccountSelectedCustomValidator_OnServerValidate" runat="server" />
                        </div>
                    </asp:Panel>
                    <div style="clear: both;"></div>
        </div> 
                </ContentTemplate>
            </asp:UpdatePanel>
    </asiweb:PanelTemplateControl2>

</telerik:RadAjaxPanel>

<script>
    function ShowLoadingPanel() {
        if (!Page_ClientValidate()) return false;
        jQuery("[id$='_LoadingPanel']").show();
        return false;
    }

    //add includes to browsers that don't support it
    if (!String.prototype.includes) {
        String.prototype.includes = function () {
            'use strict';
            return String.prototype.indexOf.apply(this, arguments) !== -1;
        };
    }

    function myCon(obj) {
        console.log(obj);
    }

    //exists because findFirstMatch on RadComboBox does not 
    function findItem(sender, text) {
        var items = sender.get_items();
        var upperText = text.toUpperCase();
        for (var i = 0; i < items.get_count() ; i++)
            if (items.getItem(i).get_text().toUpperCase().includes(upperText))
                return items.getItem(i);
        return null;
    }

    function OnClientBlurHandler(sender, eventArgs) {
        var textInTheCombo = sender.get_text();
        var previouslySelecedItem = sender.get_selectedItem();
        var item = findItem(sender, textInTheCombo);
        if (item != null)
            item.select();
        else
            previouslySelecedItem.select();
        myCon(item);
    }

    function OpenDropDown(sender, eventArgs) {
        if (!sender.get_dropDownVisible())
            sender.showDropDown();
    }
</script>
