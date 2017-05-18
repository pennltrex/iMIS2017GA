<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ItemCreatorDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.ItemCreator.ItemCreatorDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="asiCommon" TagName="ItemCreatorPicture" Src="ItemCreatorPictureDisplay.ascx" %>
<%@ Register TagPrefix="asiCommon" TagName="GeneralLedger" Src="GeneralLedgerAccountDisplay.ascx" %>
<%@ Register TagPrefix="uc2" TagName="ItemCreatorTaxInfo" Src="ItemCreatorTaxInfo.ascx" %>
<script type="text/javascript">
    //<![CDATA[

    // Script that re-enables disabled numeric text boxes that have just been edited
    try {
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(OnajaxPostbackComplete);
    }
    catch (exc) { }
    ResetBlocker();

    function RemovePricingRulesMessage() {
        return '<%# ResourceManager.GetPhrase("ConfirmRemovePricingRules", "Remove pricing rules?") %>';
    }

    //]]>
</script>
<asp:Label ID="ErrorLabel" runat="server" CssClass="Error" translate="yes"></asp:Label>
<asiweb:PanelTemplateControl2 ID="ContentPanel" runat="server" Visible="true" translate="yes" BorderStyle="None" Collapsible="false">
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" />
    <div runat="server" id="DivData">
        <telerik:RadTabStrip ID="TabStripControl" runat="server" MultiPageID="MultiPageControl"
            SelectedIndex="0" Visible="true" AutoPostBack="true" CausesValidation="false">
            <Tabs>
                <telerik:RadTab Text='<%# ResourceManager.GetWord("Summary") %>' Value="summary" />
                <telerik:RadTab Text='<%# ResourceManager.GetWord("Accounting") %>' Value="accounting" />
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage ID="MultipageControl" runat="server" SelectedIndex="0" CssClass="ContentTabbedDisplay">
            <telerik:RadPageView ID="RadPageSummary" runat="server" EnableViewState="true">
                <asiweb:PanelTemplateControl2 ID="NewProductTable" runat="server" Collapsible="False">
                    <asp:Panel ID="SimpleOrCollectionPanel" runat="server" CssClass="Section">
                        <asiweb:StyledLabel runat="server" ID="IWantToLabel" Text='<%# ResourceManager.GetPhrase("IWantTo", "I want to:")%>' CssClass="Label" />
                        <asp:Panel ID="SimpleOrCollectionPanelHelper" runat="server" CssClass="AutoWidth">    
                            <asiweb:StyledRadioButton ID="SimpleRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right" OnCheckedChanged="SimpleOrCollectionRadioChanged"
                                Caption='<%# ResourceManager.GetPhrase("CreateSimpleProduct", "Create a simple item")%>' RenderPanelField="true"
                                AutoPostBack="true" GroupName="SimpleOrCollection" Checked="true"/>
                            <asiweb:StyledRadioButton ID="CollectionRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right" OnCheckedChanged="SimpleOrCollectionRadioChanged"
                                Caption='<%# ResourceManager.GetPhrase("CreateCollection", "Create a collection of items")%>' RenderPanelField="true"
                                AutoPostBack="true" GroupName="SimpleOrCollection" Checked="false"/>
                        </asp:Panel> 
                        <asp:Panel ID="SelectCollectionTypePanel" runat="server" Visible="false" CssClass="AutoWidth SubItems">
                            <asiweb:StyledRadioButton ID="KitRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right" OnCheckedChanged="CollectionTypeRadioChanged"
                                Caption='<%# ResourceManager.GetPhrase("CreateKit", "Create a kit or bundle with a single item description and one price")%>' RenderPanelField="true"
                                AutoPostBack="true" GroupName="CollectionType" Checked="true"/>
                            <asiweb:StyledRadioButton ID="CollectionOfSeparateItemsRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right" OnCheckedChanged="CollectionTypeRadioChanged"
                                Caption='<%# ResourceManager.GetPhrase("CreateCollectionOfSeparateItems", "Create a collection of items shown separately and individually priced")%>' RenderPanelField="true"
                                AutoPostBack="true" GroupName="CollectionType" style="white-space: nowrap;" Checked="false" Enabled="true"/> 
                            <asiweb:StyledRadioButton ID="SeriesOfCollectionsRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right" OnCheckedChanged="CollectionTypeRadioChanged"
                                Caption='<%# ResourceManager.GetPhrase("CreateSeriesOfCollections", "Create a series of collections of items shown separately and individually priced")%>' RenderPanelField="true"
                                AutoPostBack="true" GroupName="CollectionType" style="white-space: nowrap;" Checked="false" Enabled="true"/>
                        </asp:Panel>       
                    </asp:Panel>  
                    <asiweb:PanelTemplateColumn ID="Col1" runat="server" Width="80%">
                        <div id="ProductTypeDiv" runat="server" class="PanelField Left">                          
                            <asiweb:StyledLabel AssociatedControlID="ProductTypeDropDown" CssClass="Required" ID="ProductTypeLabel" runat="server" Text='<%# ResourceManager.GetPhrase("ItemType", "Item type") %>' />                           
                            <div class="PanelFieldValue">
                                <asiweb:BusinessDropDownList runat="server" ID="ProductTypeDropDown" RenderPanelField="false" AutoPostBack="true" Required="true" OnSelectedIndexChanged="ProductTypeDropDown_SelectedIndexChanged" />
                                <asiweb:AsiRequiredFieldValidator ControlToValidate="ProductTypeDropDown" CssClass="Important" Display="Dynamic" ID="ProductTypeRequired" runat="server" />
                            </div>
                        </div>

                        <div class="PanelField Left">
                            <asiweb:StyledLabel AssociatedControlID="ProductClassDropDown" CssClass="Required" ID="ProductClassLabel" runat="server" Text='<%# ResourceManager.GetPhrase("ItemClass", "Item class") %>' />
                            <div class="PanelFieldValue">
                                <asiweb:BusinessDropDownList runat="server" ID="ProductClassDropDown" RenderPanelField="false" AutoPostBack="true" Required="true" OnSelectedIndexChanged="ProductClassDropDown_SelectedIndexChanged"/>
                                <asiweb:AsiRequiredFieldValidator ControlToValidate="ProductClassDropDown" CssClass="Important" ID="ProductClassRequired" runat="server" SetFocusOnError="true" />
                            </div>
                        </div>
                        
                        <div class="PanelField Left">
                            <asiweb:StyledLabel AssociatedControlID="txtItemCode" CssClass="Required" ID="ItemCodeLabel" runat="server" Text='<%# ResourceManager.GetPhrase("ItemCode", "Item code") %>' />
                            <div class="PanelFieldValue">
                                <asiweb:BusinessTextBox runat="server" ID="txtItemCode" />
                                <asiweb:AsiRequiredFieldValidator runat="server" ID="ItemCodeRequired" ControlToValidate="txtItemCode"
                                    CssClass="Important" SetFocusOnError="true" Display="Dynamic" />
                                <asp:CustomValidator ID="ItemCodeUniqueCustomValidator" runat="server" ControlToValidate="txtItemCode" 
                                    OnServerValidate="ItemCodeUniqueCustomValidator_OnServerValidate" Display="Dynamic" CssClass="Important"
                                    ErrorMessage='<%# ResourceManager.GetPhrase("ItemCodeInUse", "The item code is in use. Enter a unique item code.") %>' />
                                <asiweb:AsiRegularExpressionValidator id="ItemCodeRegExpValidator" runat="server" ControlToValidate="txtItemCode"     
                                                    ValidationExpression="^[\s\S]{0,15}$" Display="Dynamic" />
                            </div>
                        </div>

                        <div style="clear: both;">
                        </div>

                        <div class="PanelField Left">
                            <asiweb:StyledLabel AssociatedControlID="txtName" CssClass="Required" ID="NameLabel" runat="server" Text='<%# ResourceManager.GetWord("Name") %>' />
                            <div class="PanelFieldValue">
                                <asiweb:BusinessTextBox runat="server" ID="txtName" MaxLength="60" CssClass="InputXLarge"/>
                                <asiweb:AsiRequiredFieldValidator ControlToValidate="txtName" CssClass="Important" ID="NameRequired" runat="server" SetFocusOnError="true" />
                            </div>
                        </div>
                        <div style="clear: both;">
                        </div>
        
                        <div class="PanelField Left">
                            <asiweb:StyledLabel AssociatedControlID="txtDescription" ID="DescriptionLabel" runat="server" Text='<%# ResourceManager.GetWord("Description") %>' />
                            <div class="PanelFieldValue">
                               <asiweb:BusinessHtmlEditor ID="txtDescription" runat="server" CssClass="ContentHtmlEditor" EnableTextareaMode="true" 
                                Height="150" Width="500" style="width:500px!important;" />  
                            </div>
                        </div>
                        <div style="clear: both;">
                        </div>                                                   
                        
                        <asp:UpdatePanel ID="PriceUpdatePanel" runat="server" UpdateMode="Always">
                            <ContentTemplate>
                                <div class="PanelField Left">                                   
                                    <asiweb:StyledLabel AssociatedControlID="txtStandardPrice" CssClass="Required" ID="StandardPriceLabel" runat="server" Text='<%# ResourceManager.GetPhrase("StandardPrice", "Standard price") %>' />
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessTextBox runat="server" ID="txtStandardPrice" OnTextChanged="TxtStandardPrice_OnTextChanged" CssClass="InputSmall"/>
                                        <asiweb:AsiRequiredFieldValidator runat="server" ID="StandardPriceRequired" ControlToValidate="txtStandardPrice"
                                                                          CssClass="Important" SetFocusOnError="true"/>
                                        <asiweb:StyledHyperlink runat="server" ID="AddStandardPricingRulesLink" Text='<%# ResourceManager.GetPhrase("AddStandardPricingRulesLink", "Add pricing rules") %>'  />
                                        <asp:RangeValidator runat="server" ID="StandardPriceRange" Type="Currency" ControlToValidate="txtStandardPrice"
                                                Display="Dynamic" MinimumValue="0" MaximumValue="1000000"
                                                CssClass="Important" 
                                                ErrorMessage='<%# ResourceManager.GetPhrase("PriceOutOfRange", "Must be a currency amount between 0 and 1000000.")%>' />
                                        <br/>
                                        <asiweb:StyledLabel runat="server" ID="UsesStandardPricingRulesLabel" Text='<%# ResourceManager.GetPhrase("UseStandardPricingRulesLabel", "Uses pricing rules") %>'/>
                                        <asp:LinkButton runat="server" CausesValidation="False" ID="RemoveStandardPricingRulesLink" ClientIDMode="Static" Visible="False" OnClick="RemoveStandardPricingRules_OnClick" OnClientClick="return confirm(RemovePricingRulesMessage());" Text='<%# ResourceManager.GetPhrase("RemoveStandardPricingRulesLink", "remove") %>'/>
                                    </div>
                                    <div class="PanelFieldValue AutoWidth">
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessCheckBox ID="PriceIsTotalCheckBox" runat="server" OnCheckedChanged="PriceIsTotalCheckedChanged" Visible="false" AutoPostBack="true"/>
                                        </div>
                                        <asiweb:StyledLabel runat="server" ID="PriceIsTotalCheckBoxLabel" Text='<%# ResourceManager.GetPhrase("PriceIsTotal", "Price is total of components") %>' Visible="false" AssociatedControlID="PriceIsTotalCheckBox"/>
                                    </div>
                                </div>
                                <div class="PanelField Left">
                                    <asiweb:StyledLabel AssociatedControlID="txtDiscountPrice" CssClass="Required" ID="DiscountPriceLabel" runat="server" Text='<%# ResourceManager.GetPhrase("DiscountPrice", "Discount price") %>' />
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessTextBox runat="server" ID="txtDiscountPrice" OnTextChanged="TxtDiscountPrice_OnTextChanged" CssClass="InputSmall"/>
                                        <asiweb:AsiRequiredFieldValidator runat="server" ID="DiscountPriceRequired" ControlToValidate="txtDiscountPrice"
                                                                          CssClass="Important" SetFocusOnError="true"/>
                                        <asiweb:StyledHyperlink runat="server" ID="AddDiscountPricingRulesLink" Text='<%# ResourceManager.GetPhrase("AddDiscountPricingRulesLink", "Add pricing rules") %>' />
                                        <asp:RangeValidator runat="server" ID="DiscountPriceRange" Type="Currency" ControlToValidate="txtDiscountPrice"
                                                Display="Dynamic" MinimumValue="0" MaximumValue="1000000"
                                                CssClass="Important" 
                                                ErrorMessage='<%# ResourceManager.GetPhrase("PriceOutOfRange", "Must be a currency amount between 0 and 1000000.")%>' />
                                        <br/>
                                        <asiweb:StyledLabel runat="server" ID="UsesDiscountPricingRulesLabel" Text='<%# ResourceManager.GetPhrase("UseDiscountPricingRulesLabel", "Uses pricing rules") %>'/>
                                        <asp:LinkButton ClientIDMode="Static" ID="RemoveDiscountPricingRulesLink" CausesValidation="False" OnClick="RemoveDiscountPricingRules_OnClick" runat="server" OnClientClick="return confirm(RemovePricingRulesMessage());" Text='<%# ResourceManager.GetPhrase("RemoveDiscountPricingRulesLink","remove") %>' Visible="False" ></asp:LinkButton>
                                        <asp:LinkButton  runat="server" ID="UseStandardPricingForDiscountPricingRulesLink"  CausesValidation="False" ClientIDMode="Static" Visible="False" OnClick="UseStandardPricingForDiscountPricingRules_OnClick" Text='<%# ResourceManager.GetPhrase("UseStandardPricingForDiscountPricingRulesLink", "Use standard pricing rules" ) %>' ></asp:LinkButton>
                                        <asp:Button runat="server" ID="RefreshTrigger" CausesValidation="False" OnClick="RefreshTriggerClick" style="display:none"/>
                                   </div>
                                   <div style="clear: both;">
                                   </div>
                                </div> 
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        
                        <div runat="server" ID="WeightDiv" class="PanelField Left">
                            <asiweb:StyledLabel AssociatedControlID="txtWeight" ID="WeightLabel" runat="server" Text='<%# ResourceManager.GetWord("Weight") %>'/>                           
                            <div class="PanelFieldValue">
                                <asiweb:BusinessTextBox runat="server" ID="txtWeight" CssClass="InputXSmall" />
                            </div>
                            <asp:RangeValidator runat="server" ID="WeightRangeValidator"  Type="Double" ControlToValidate="txtWeight" Display="Dynamic" 
                                MinimumValue="0" MaximumValue="1000000" CssClass="Important" SetFocusOnError="True" 
                                ErrorMessage='<%# ResourceManager.GetPhrase("WeightRangeValidator", "Must be a whole number between 0 and 1000000") %>'/>
                        </div>
                        <div runat="server" id="DivShowInSearch">                 
                            <div class="PanelField Top">
                                <asiweb:BusinessLabel runat="server"  ID="LabelShowInSearch" DisplayCaption="True" TranslateOnlyCaptionAndToolTip="True" DisplayValue="False" RenderPanelField="True" Caption='<%# ResourceManager.GetWord("Show in search:")%>' ToolTip='<%# ResourceManager.GetPhrase("ShowInSearch", "Show in search")%>' ></asiweb:BusinessLabel>
                                <div class="PanelFieldValue">
                                    <asp:CustomValidator runat="server" ID="CustomValidatorPublishStart" Display="Dynamic" SetFocusOnError="true"/>
                                    <asp:HiddenField runat="server" ID="HiddenDateRangeValidationErrorMsgPublishStart" />
                                    <asp:HiddenField runat="server" ID="HiddenDateTimeRangeValidationErrorMsgPublishStart" />
                                </div>
                            </div>
                            <div class="SubItems Section">
                                <div class="PanelField Top">
                                    <asiweb:StyledLabel runat="server" ID="StyledLabelPublishStart" AssociatedControlID="PublishStartDate" ToolTip='<%# ResourceManager.GetPhrase("ShowPrductBeginning", "Date and time to begin showing the product in search results")%>' Text='<%# ResourceManager.GetWord("Beginning")%>'/>
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessCalendar2 runat="server" ID="PublishStartDate" RenderPanelField="false" DisplayCaption="true" UseSqlDateTimeMinValue="true" />   
                                        <asiweb:BusinessCalendar2 runat="server" ID="PublishStartTime" ControlType="TimePicker"  UseSqlDateTimeMinValue="true" DisplayTimeZone="true" />                               
                                    </div>   
                                </div>
                                <div class="PanelField Top">     
                                    <asiweb:StyledLabel runat="server" ID="StyledLabelPublishEnd" AssociatedControlID="PublishEndDate" ToolTip='<%# ResourceManager.GetPhrase("ShowProductUntil", "Date and time the product will no longer show in search results")%>' Text='<%# ResourceManager.GetWord("Ending")%>'/>
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessCalendar2 runat="server" ID="PublishEndDate" RenderPanelField="false" DisplayCaption="true" UseSqlDateTimeMinValue="true" />
                                        <asiweb:BusinessCalendar2 runat="server" ID="PublishEndTime" ControlType="TimePicker"  UseSqlDateTimeMinValue="true" DisplayTimeZone="true" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div style="clear: both;">
                        </div>
                        <asp:UpdatePanel runat="server" ID="DivGroupsUpdatePanel" UpdateMode="Conditional" ChildrenAsTriggers="True">
                            <ContentTemplate>                                                            
                                <div runat="server" id="DivGroups">
                                    <div id="RecurringGiftPanel" class="PanelField Right" runat="server" Visible="False">
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessCheckBox runat="server" ID="RecurringGiftCheckBox" OnCheckedChanged="RecurringGiftChanged" AutoPostBack="true" />
                                        </div>
                                        <asiweb:StyledLabel runat="server" ID="RecurringGiftLabel" AssociatedControlID="RecurringGiftCheckBox" Text='<%# ResourceManager.GetPhrase("SupportsRecurringDonations", "Supports recurring donations") %>'/>
                                    </div>                            
                                    <div id="GroupPropertiesDiv" runat="server" class="PanelField Right">
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessCheckBox runat="server" ID="GroupProperties" OnCheckedChanged="GroupPropertiesChanged" AutoPostBack="true" />
                                        </div>
                                        <asiweb:StyledLabel runat="server" ID="GroupPropertiesLabel" AssociatedControlID="GroupProperties" Text='<%# ResourceManager.GetPhrase("GroupProperties", "Assign purchaser to a group") %>'/>
                                    </div>
                                    
                                    <div style="clear: both;">
                                    </div>
                                    <asp:Panel ID="panelGroupProperties" runat="server">
                                        <div class="PanelField Left SubItems">
                                            <asiweb:StyledLabel ID="GroupListCaptionLabel" runat="server"  CssClass="Required" AssociatedControlID="GroupList" Text='<%# ResourceManager.GetPhrase("GroupName", "Group")%>' />
                                            <div class="PanelFieldValue">
                                                <asiweb:BusinessComboBox runat="server" ID="GroupList" EnableLoadOnDemand="True" ShowMoreResultsBox="True"
                                                    EnableVirtualScrolling="True" OnItemsRequested="GroupListItemsRequested"  ItemsPerRequest="100" OnSelectedIndexChanged="GroupListSelected" AutoPostBack="true" 
                                                    CausesValidation="false" Required="True" Height="185px"/>
                                                <asiweb:AsiRequiredFieldValidator runat="server" ControlToValidate="GroupList" />
                                                <asp:LinkButton CausesValidation="False" ID="AddNewGroupLinkButton" OnClick="AddNewGroupLinkButtonOnClick" runat="server" Text="Add new group" Visible='<%# IsV10 %>' />                              
                                            </div>
                                            <div id="AddNewGroupSection" runat="server" class="PanelField Left SubItems" Visible="false">                                            
                                                <asiweb:StyledLabel ID="NewGroupCaptionLabel" runat="server" Text='<%# ResourceManager.GetPhrase("NewGroupName", "New group name") %>'
                                                    AssociatedControlID="NewGroupNameTextBox" />
                                                <div class="PanelFieldValue">                                                
                                                    <asiweb:BusinessTextBox runat="server" ID="NewGroupNameTextBox" />
                                                    <asp:ImageButton runat="server" ID="SaveNewGroupButton" CausesValidation="False" SkinID="CheckButton" 
                                                        OnClick="SaveNewGroupButtonOnClick" ToolTip="Save" />
                                                    <asp:ImageButton runat="server" ID="CancelNewGroupButton" CausesValidation="False" SkinID="PanelCommandButtonDelete" 
                                                        OnClick="CancelNewGroupButtonOnClick" ToolTip="Cancel" />  
                                                    <asiweb:AsiRequiredFieldValidator runat="server" ID="NewGroupNameRequired" ControlToValidate="NewGroupNameTextBox" />                                  
                                                </div>
                                            </div>
                                        </div>                                
                                        <div class="PanelField Left SubItems" id="GroupRoleSection" runat="server" Visible='<%# !IsV10 %>'>
                                            <asiweb:StyledLabel runat="server" ID="GroupRoleListCaption" CssClass="Required" AssociatedControlID="GroupRoleList" Text='<%# ResourceManager.GetPhrase("GroupRole", "Group role")%>'/>
                                            <div class="PanelFieldValue">
                                                <asiweb:BusinessComboBox runat="server" ID="GroupRoleList" EmptyMessage='<%# ResourceManager.GetWord("(Select)")%>' AllowCustomText="false" Required="True" />
                                                <asiweb:AsiRequiredFieldValidator runat="server" ID="GroupRoleListRequired" ControlToValidate="GroupRoleList" CssClass="Important" SetFocusOnError="true" />  
                                            </div>                          
                                        </div>
                                        <div class="PanelField Left SubItems">
                                            <asiweb:StyledLabel runat="server" ID="GroupTermCaption" CssClass="Required" AssociatedControlID="GroupTermTextBox" Text='<%# ResourceManager.GetPhrase("TermSpan", "Term span in months")%>'/>
                                            <div class="PanelFieldValue">
                                                <asiweb:BusinessTextBox AutoPostBack="True" CssClass="InputXSmall" Enabled="False" ID="GroupTermTextBox" OnDataChanged="Term_OnDataChanged" runat="server" />
                                                <asiweb:AsiRequiredFieldValidator runat="server" ID="TermTextBoxRequired" ControlToValidate="GroupTermTextBox"
                                                                                  CssClass="Important" SetFocusOnError="true" Enabled="False"/>                          
                                                <asp:CompareValidator ID="GroupTermTextBoxCompare" runat="server" ControlToValidate="GroupTermTextBox"
                                                    ValueToCompare="0" Operator="GreaterThan" Enabled="False" Display="Dynamic" ErrorMessage='<%# Asi.ResourceManager.GetPhrase("TermSpanLessThanZero", "Term span must be a number greater than zero") %>' />
                                                <asp:CompareValidator ID="GroupTermTextBoxCompareDataType" Enabled="False" runat="server" ControlToValidate="GroupTermTextBox" 
                                                    Operator="DataTypeCheck" Type="Integer" Display="Dynamic" ErrorMessage='<%# Asi.ResourceManager.GetPhrase("TermSpanLessThanZero", "Term span must be a number greater than zero") %>' /> 
                                            </div>
                                        </div>
                                        <div class="PanelField Left SubItems">
                                            <asiweb:StyledLabel runat="server" ID="GroupProrationTypeCaption" Visible="False" Text='<%# ResourceManager.GetPhrase("ProrationType", "Prorate fees")%>' AssociatedControlID="ProrationButtonPanel" />   
                                            <asp:Panel ID="ProrationButtonPanel" runat="server" Visible="False" CssClass="AutoWidth SubItems">
                                                <asiweb:StyledRadioButton runat="server" ID="NoProrationButton" Enabled="True" DisplayCaption="true" PositionCaption="Right" AutoPostBack="true"  OnCheckedChanged="ProrationButton_OnCheckedChanged" CommandName="None"
                                                    Caption='<%# ResourceManager.GetPhrase("NoProration", "Do not prorate") %>' GroupName="ProrationButtons" Checked="True" RenderPanelField="True"/> 
                                                <div class="form-inline">
                                                    <asiweb:StyledRadioButton runat="server" ID="MonthlyProrationButton" Enabled="True" DisplayCaption="true" PositionCaption="Right" AutoPostBack="true"  OnCheckedChanged="ProrationButton_OnCheckedChanged" CommandName="Monthly"
                                                        Caption='<%# ResourceManager.GetPhrase("Monthly", "Standard monthly prorating") %>' GroupName="ProrationButtons" Checked="False" RenderPanelField="True" />
                                                </div>
                                                <div class="form-inline">
                                                    <asiweb:StyledRadioButton runat="server" ID="CustomProrationButton" Enabled="True" DisplayCaption="True" PositionCaption="Right" AutoPostBack="true" OnCheckedChanged="ProrationButton_OnCheckedChanged" CommandName="Custom"
                                                        Caption='<%# ResourceManager.GetPhrase("Custom", "Use a custom schedule") %>' GroupName="ProrationButtons" Checked="False" RenderPanelField="True"/>
                                                    <asiweb:StyledLabel runat="server" CssClass="screen-reader-text" Text="List of available prorating schedules." AssociatedControlID="CustomScheduleDropDown"/>
                                                    <asiweb:BusinessDropDownList runat="server" RenderPanelField="false" AutoPostBack="false" Required="false" ID="CustomScheduleDropDown" Visible="False"/>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                        <div class="PanelField Left SubItems form-inline">
                                            <asiweb:BusinessCheckBox runat="server" ID="AdvanceEndDateCheckBox" Visible="False" RenderPanelField="True" AutoPostBack="True" OnCheckedChanged="AdvanceEndData_OnCheckChanged"
                                                Caption='<%# ResourceManager.GetPhrase("AdvanceEndDates", "Advance end date to end of subsequent term starting in month")%>' DisplayCaption="True" PositionCaption="Right"/>
                                            <asiweb:BusinessDropDownList runat="server" ID="AdvanceEndDateMonthDropDown" Visible="False" AutoPostBack="false" Required="false" IncludeNullItem="False"/>
                                        </div>
                                        <div class="PanelField Left SubItems">
                                            <asiweb:StyledLabel runat="server" Visible="True" ID="AdvanceEndDateInfo" CssClass="Info"/>
                                        </div>
                                    </asp:Panel>                            
                                    <div style="clear: both;">
                                    </div>
                                    
                                    <div id="InKindGroupPropertiesDiv" runat="server" class="PanelField Right">
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessCheckBox runat="server" ID="AllowOrderLineNoteCheckBox" OnCheckedChanged="AllowOrderLineNote_OnCheckedChanged" AutoPostBack="true" />
                                        </div>
                                        <asiweb:StyledLabel runat="server" ID="AllowOrderLineNoteCheckBoxLabel" AssociatedControlID="AllowOrderLineNoteCheckBox" Text='<%# ResourceManager.GetPhrase("AllowOrderLineNoteCheckBox", "Allow purchaser to enter details (Staff only)") %>'/>
                                    </div>                            
                                    <div class="PanelField Top">
                                        <asiweb:StyledLabel AssociatedControlID="RelatedContentEditor" ID="RelatedContentEditorLabel" runat="server" Text='<%# ResourceManager.GetPhrase("PostPurchaseInfo", "Post-purchase information") %>'/>                                      
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessHtmlEditor runat="server" ID="RelatedContentEditor" CssClass="ContentHtmlEditor" EnableTextareaMode="true" 
                                                Height="150" Width="500" style="width:500px!important;display:inline;" ValidateRequestMode="Disabled" />  
                                            <asiweb:InfoControl ID="RelatedContentInfo" runat="server" 
                                                Text="Information to be displayed to a user following purchase of this item. It will be included in the order confirmation message and can be used to indicate how to retrieve downloadable content." />
                                        </div>
                                    </div>
                                    <div style="clear: both;">
                                    </div> 
                                </div> 
                            </ContentTemplate>
                        </asp:UpdatePanel>                                                                       
                    </asiweb:PanelTemplateColumn>

                    <asiweb:PanelTemplateColumn ID="Col2" runat="server">
                        <div class="ContentBorder">
                           <asiCommon:ItemCreatorPicture id="ItemCreatorPicture" runat="Server"/>
                           <br />
                           <div id="altTextDiv" runat="server"> 
                              <asiweb:StyledLabel ID="ImageAltTextLabel" runat="server" AssociatedControlID="ImageAltText" Text='<%# ResourceManager.GetPhrase("ImageAltText", "Image alt text")%>' CssClass="PanelFieldLabel"/>                   
                              <div class="PanelFieldValue">
                                  <asiweb:BusinessTextBox runat="server" ID="ImageAltText" DisplayCaption="True" PositionCaption="Left" CssClass="InputLarge"/>                        
                              </div>
                           </div>
                           <div style="clear: both;">  
                           </div>
                        </div>           
                    </asiweb:PanelTemplateColumn>

                    <asiweb:PanelTemplateControl2 ID="PanelTags" runat="server" TemplateTitle='<%# ResourceManager.GetWord("Tags") %>' Collapsible="False" ShowBorder="False">
                        <asiweb:TagSelector ID="TagSelector" runat="server"></asiweb:TagSelector>
                    </asiweb:PanelTemplateControl2>

                    <asiweb:PanelTemplateControl ID="ItemSetPropertiesPanel" runat="server" ShowHeader="true" Collapsible="false" Collapsed="false" TemplateTitle="Item Set Properties" BorderWidth="0" Visible="false">
                        <asp:Panel ID="ItemSetPropertiesPanelHelper" runat="server" CssClass="AutoWidth">  
                            <asiweb:StyledRadioButton ID="MultipleComponentsRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right"
                                    Caption='<%# ResourceManager.GetPhrase("MultipleComponents", "Customer may select multiple components")%>' RenderPanelField="true"
                                    AutoPostBack="true" GroupName="ItemSetProperties" Checked="false" Enabled="true" OnCheckedChanged="ItemSetPropertiesRadioChanged" />
                            <div style="clear:both;"></div>
                            <asp:Panel ID="MultipleComponentsPanelHelper" runat="server" CssClass="AutoWidth SubItems" >
                                <div style="display:table;">
                                <div style="display:table-row;">
                                    <div style="display:table-cell;padding-right:1em;">
                                        <asiweb:StyledLabel runat="server" ID="MinimumComponentSelectionsLabel"  Text='<%# ResourceManager.GetPhrase("MinimumComponentSelections", "Minimum component selections") %>'
                                                            AssociatedControlID="txtMinimumComponentSelections"/>
                                    </div>
                                    <div style="display:table-cell;">
                                        <asiweb:BusinessTextBox runat="server" ID="txtMinimumComponentSelections" RenderPanelField="false"/>
                                        <asp:RangeValidator ID="MinimumComponentSelectionsRangeValidator" runat="server" MinimumValue="0" MaximumValue="<%#MaxComponentCount%>" Type="Integer" Display="Dynamic"
                                            ControlToValidate="txtMinimumComponentSelections" CssClass="Important" SetFocusOnError="true" 
                                            ErrorMessage='<%# ResourceManager.GetPhrase("MinimumComponentSelectionsRange", "Must be a whole number between 0 and {0}",MaxComponentCount)  %>' />
                                   
                                        <%-- We attach txtMinimumComponentSelections and txtMaximumComponentSelections to this custom validator using some javascript in Asi_Web_iParts_Commerce_ItemCreatorDisplay.OnLoad() --%>
                                        <%-- The validator will automatically fire when we save, but we also want it to fire when we change min or max --%>
                                        <asp:CustomValidator runat="server" ID="ComponentSelectionsCustomValidator" Display="Dynamic" CssClass="Important" />
                                    </div>
                                </div>
                                <div style="display:table-row;">
                                    <div style="display:table-cell;padding-right:1em;padding-top:0.18em;">
                                        <asiweb:StyledLabel runat="server" ID="MaximumComponentSelectionsLabel" Text='<%# ResourceManager.GetPhrase("MaximumComponentSelections", "Maximum component selections") %>'
                                                            AssociatedControlID="txtMaximumComponentSelections"/>
                                    </div>
                                    <div style="display:table-cell;padding-top:0.18em;">
                                        <asiweb:BusinessTextBox runat="server" ID="txtMaximumComponentSelections" RenderPanelField="false"/>
                                        <asp:RangeValidator ID="MaximumComponentSelectionsRangeValidator" runat="server" MinimumValue="0" MaximumValue="<%#MaxComponentCount%>" Type="Integer" Display="Dynamic"
                                            ControlToValidate="txtMaximumComponentSelections" CssClass="Important" SetFocusOnError="true" 
                                            ErrorMessage='<%# ResourceManager.GetPhrase("MaximumComponentSelectionsRange", "Must be a whole number between 0 and {0}", MaxComponentCount)  %>' />

                                    </div>
                                </div>                          
                                </div>                          
                            </asp:Panel>

                            <asiweb:StyledRadioButton ID="OneComponentRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right"
                                Caption='<%# ResourceManager.GetPhrase("OneComponent", "Customer must select only one component")%>' RenderPanelField="true"
                                AutoPostBack="true" GroupName="ItemSetProperties" Checked="true" Enabled="true" OnCheckedChanged="ItemSetPropertiesRadioChanged" /> 
                            <asiweb:StyledRadioButton ID="AllComponentsRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right"
                                Caption='<%# ResourceManager.GetPhrase("AllComponents", "All components are selected by default and required")%>' RenderPanelField="true"
                                AutoPostBack="true" GroupName="ItemSetProperties" Checked="false" Enabled="true" OnCheckedChanged="ItemSetPropertiesRadioChanged" />
                        </asp:Panel>
                    </asiweb:PanelTemplateControl>

                    <asp:UpdatePanel ID="GridUpdatePanel" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                            <asiweb:PanelTemplateControl ID ="GridPanel" runat="server" ShowHeader="true" Collapsible="false" Collapsed="false" TemplateTitle='<%# ResourceManager.GetPhrase("ItemSetComponents", "Item set components")%>' BorderWidth="0" Visible="false">
                                <asiweb:BusinessDataGrid2 ID="CollectionItemsGrid" runat="server" Visible="true" EnableViewstate="true" AutoPostBack="true" AllowPaging="true" PageSize="9999"
                                    OnItemDeleted="CollectionItemsGrid_OnItemDeleted" 
                                    OnNeedDataSource="CollectionItemsGrid_NeedDataSource"
                                    OnItemDataBound="CollectionItemsGrid_OnItemDataBound"
                                    OnDeleteCommand="RemoveLink_OnClick"
                                    OnPreRender="CollectionItemsGrid_OnPreRender">
                                    <ClientSettings AllowKeyboardNavigation="True"/>
                                    <MasterTableView AutoGenerateColumns="false" CommandItemDisplay="Top" NoMasterRecordsText='<%# ResourceManager.GetPhrase("NoSetItems", "There are no set items.") %>'>
                                        <CommandItemStyle HorizontalAlign="right" />
                                        <CommandItemTemplate>
                                            <asp:LinkButton ID="AddLinkButton" runat="server" CommandName="AddComponent" CausesValidation="false" Text='<%# ResourceManager.GetPhrase("(add)", "(add)")%>'/>
                                            <div runat="server" id="SeriesOfCollectionsOptionsDiv" style="text-align:left;padding:1em 1em 1em 1em">
                                                <asp:LinkButton runat="server" ID="AddExistingCollectionLinkButton" CausesValidation="false" Text='<%# ResourceManager.GetPhrase("AddExistingCollectionToSeries", "Add an existing collection to this series")%>' />
                                            </div>
                                        </CommandItemTemplate>
                                        <Columns>
                                            <telerik:GridBoundColumn 
                                            DataField="Item.ItemCode"
                                            HeaderText="Item Code"
                                            />
                                            <telerik:GridBoundColumn 
                                            DataField="Item.Name"
                                            HeaderText="Product"
                                            />
                                            <telerik:GridTemplateColumn
                                            HeaderText="Default"
                                            UniqueName="DefaultColumn">
                                                <ItemTemplate>
                                                    <asiweb:BusinessCheckBox ID="IsDefaultCheckBox" runat="server" OnCheckedChanged="IsDefaultChanged" AutoPostBack="true" />
                                                </ItemTemplate> 
                                            </telerik:GridTemplateColumn>                                                    
                                            <telerik:GridTemplateColumn
                                            HeaderText="Quantity"
                                            UniqueName="QuantityColumn">
                                                <ItemTemplate>
                                                    <telerik:RadNumericTextBox ID="QuantityTextBox" runat="server" 
                                                        AutoPostBack="true" ValidationText="GridErrorMessage"
                                                        EnableViewState="true" ShowSpinButtons="true" 
                                                        OnTextChanged="QuantityTextBox_OnTextChanged"
                                                        AllowOutOfRangeAutoCorrect="true"
                                                        MinValue="1"
                                                        MaxValue="<%#MaxComponentCount%>">
                                                            <ClientEvents OnValueChanged="checksubmit" OnKeyPress="QuantityOrDisplayOrderKeyPressed"/>
                                                            <NumberFormat DecimalDigits="0" GroupSeparator=""/>
                                                    </telerik:RadNumericTextBox> 
                                                </ItemTemplate> 
                                            </telerik:GridTemplateColumn>                                                    
                                            <telerik:GridTemplateColumn
                                            HeaderText="Max Quantity"
                                            UniqueName="MaxQuantityColumn">
                                                <ItemTemplate>
                                                    <telerik:RadNumericTextBox ID="MaxQuantityTextBox" runat="server" 
                                                        AutoPostBack="true" ValidationText="GridErrorMessage"
                                                        EnableViewState="true" ShowSpinButtons="true" 
                                                        OnTextChanged="MaxQuantityTextBox_OnTextChanged"
                                                        AllowOutOfRangeAutoCorrect="true"
                                                        MinValue="0"
                                                        MaxValue="<%#MaxComponentCount%>">
                                                            <ClientEvents OnValueChanged="checksubmit" OnKeyPress="QuantityOrDisplayOrderKeyPressed"/>
                                                            <NumberFormat DecimalDigits="0" GroupSeparator=""/>
                                                    </telerik:RadNumericTextBox> 
                                                </ItemTemplate> 
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridTemplateColumn 
                                            HeaderText="Display Order"
                                            UniqueName="DisplayOrderColumn">
                                            <ItemTemplate>
                                                <telerik:RadNumericTextBox ID="DisplayOrderTextBox" runat="server" ShowSpinButtons="true"
                                                    MinValue="1" AutoPostBack="true" EnableViewState="true"
                                                    OnTextChanged="DisplayOrderTextBox_OnTextChanged">
                                                        <ClientEvents OnValueChanged="checksubmit" OnKeyPress="QuantityOrDisplayOrderKeyPressed"/>
                                                        <NumberFormat DecimalDigits="0"/>
                                                        <IncrementSettings Step="-1" /> 
                                                </telerik:RadNumericTextBox>
                                            </ItemTemplate>   
                                            </telerik:GridTemplateColumn>
                                            <telerik:GridButtonColumn UniqueName="DeleteColumn" ButtonType="LinkButton" 
                                                Text="remove" ConfirmDialogType="RadWindow"
                                                CommandName="Delete"></telerik:GridButtonColumn>
                                        </Columns>
                                    </MasterTableView>
                                </asiweb:BusinessDataGrid2>
                                <div style="clear: both;">
                                </div>
                                <asiweb:BusinessTextBox ID="HiddenProductGuidTextBox" runat="server" Style="display: none"/>
                                <asp:Button ID="HiddenButton" runat="server" OnClick="HiddenButton_OnClick" CausesValidation="false" Style="display: none"/>

                             </asiweb:PanelTemplateControl>
                            <asiweb:StyledLabel runat="server" ID="GridErrorMessage0" Visible="false" CssClass="Error"/>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asiweb:PanelTemplateControl2>
            </telerik:RadPageView>
            <telerik:RadPageView ID="RadPageAccounting" runat="server" EnableViewState="true">
                <asiweb:PanelTemplateControl2 runat="server" Collapsible="False">
                    <asp:Panel ID="PanelTemplateControl1" runat="server" CssClass="Section">
                        <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" Width="40%">
                            
                            <asiweb:BusinessDropDownList Caption='<%# ResourceManager.GetPhrase("FinancialEntity", "Financial entity")%>' DisplayCaption="True" id="FinancialEntityDropDownList" RenderPanelField="True" runat="server" />

                            <uc2:ItemCreatorTaxInfo ID="TaxInfo" runat="Server" />
                                
                            <div id="InventoryItemDiv" runat="server">
                                <asiweb:BusinessCheckBox ID="InventoryItemCheckBox" runat="server" CssClass="FloatLeft" RenderPanelField="True" Caption='<%# ResourceManager.GetPhrase("InventoryItem", "Inventory item")%>' DisplayCaption="True" PositionCaption="Right" />
                            </div>
                            <div id="PremiumDiv" runat="server" class="Section">
                                <asiweb:BusinessCheckBox ID="IsPremiumCheckBox" runat="server" CssClass="FloatLeft" RenderPanelField="True" Caption='<%# ResourceManager.GetPhrase("OfferAsPremium", "Offer item as a premium")%>' DisplayCaption="True" PositionCaption="Right" />
                                <div id="MinimumGiftAmountDiv" runat="server" class="SubItems">
                                    <div class="PanelFieldLabel"><asiweb:StyledLabel ID="MinimumGiftAmountLabel" runat="server" Text='<%# ResourceManager.GetPhrase("MinimumGiftAmount", "Listed minimum gift amount") %>' AssociatedControlID="MinimumGiftAmountTextBox" CssClass="Required"/></div>
                                    <div class="PanelFieldValue">&nbsp;<asiweb:BusinessTextBox ID="MinimumGiftAmountTextBox" runat="server" AutoPostBack="False" CssClass="InputSmall" /></div>
                                    <asiweb:AsiRequiredFieldValidator runat="server" ID="MinimumGiftAmountRequiredValidator" 
                                        ControlToValidate="MinimumGiftAmountTextBox"
                                        CssClass="Important" 
                                        SetFocusOnError="True" 
                                        Enabled="False"/>          
                                    <asp:RangeValidator runat="server" ID="MinimumGiftAmountRangeValidator" Type="Currency" ControlToValidate="MinimumGiftAmountTextBox"
                                        Display="Dynamic" MinimumValue="0" MaximumValue="1000000"
                                        CssClass="Important" 
                                        ErrorMessage='<%# ResourceManager.GetPhrase("PriceOutOfRange", "Must be a currency amount between 0 and 1000000.")%>' />                
                                </div>
                            </div>
                                
                            <asp:Panel ID="FMVTemplate" runat="server">
                                <div id="FMVDiv" class="PanelField Left">
                                    <div class="PanelFieldLabel"><asiweb:StyledLabel ID="FairMarketValueLabel" runat="server" Text='<%# ResourceManager.GetPhrase("FairMarketValue", "Fair market value") %>' AssociatedControlID="FairMarketValueTextBox"/></div>
                                    <div class="PanelFieldValue"><asiweb:BusinessTextBox ID="FairMarketValueTextBox" runat="server" AutoPostBack="False" CssClass="InputSmall" /></div>
                                    <asp:RangeValidator runat="server" ID="FairMarketValueRangeValidator" Type="Currency" ControlToValidate="FairMarketValueTextBox"
                                        Display="Dynamic" MinimumValue="0" MaximumValue="1000000"
                                        CssClass="Important" 
                                        ErrorMessage='<%# ResourceManager.GetPhrase("PriceOutOfRange", "Must be a currency amount between 0 and 1000000.")%>' />
                                    <asiweb:AsiRequiredFieldValidator runat="server" ID="FairMarketRequiredFieldValidator" 
                                    ControlToValidate="FairMarketValueTextBox"
                                    CssClass="Important" 
                                    SetFocusOnError="True" 
                                    Enabled="False"/>  
                                    <div style="clear: both;"></div>
                                </div>
                                <asp:UpdatePanel ID="PremiumUpdatePanel" runat="server" UpdateMode="Always">
                                    <ContentTemplate>
                                        <div class="PanelField SubItems" id="PremiumSetDiv" runat="server">
                                            <div class="PanelFieldLabel"><asiweb:BusinessLabel ID="PremiumSetLabel" runat="server" Text='<%# ResourceManager.GetPhrase("PremiumSetLabel", "Include in premium sets") %>'/></div>
                                            <div class="PanelFieldValue"><asiweb:MultiSelectControl2 ID="PremiumMultiSelect" runat="server" Width="250px"  /> </div>
                                            <asiweb:StyledHyperlink runat="server" ID="AddNewRuleLink" Text='<%# ResourceManager.GetPhrase("AddNew", "Add new") %>' style="padding-left: 10px;" />     
                                            <asp:Button runat="server" ID="RefreshPremiumTrigger" CausesValidation="False" OnClick="RefreshPremiumTriggerClick" style="display:none"/>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </asp:Panel>
                        </asiweb:PanelTemplateColumn>
                        <asiweb:PanelTemplateColumn ID="ShippingAndHandlingDiv" runat="server">
                            <div class="PanelField Left">
                                <div class="PanelFieldLabel">
                                    <asp:CheckBox ID="IncursShippingCheckBox" runat="server" />
                                </div>
                                <div class="PanelFieldLabel AutoWidth">
                                    <asiweb:StyledLabel runat="server" ID="IncursShippingLabel" AssociatedControlID="IncursShippingCheckBox" Text='<%# ResourceManager.GetPhrase("IncursShipping", "Incurs shipping") %>'/>
                                </div>
                            </div>
                            <div class="PanelField Left">
                                <div class="PanelFieldLabel">
                                    <asp:CheckBox ID="IncursHandlingCheckBox" runat="server" />
                                </div>
                                <div class="PanelFieldLabel AutoWidth">
                                    <asiweb:StyledLabel runat="server" ID="IncursHandlingLabel" AssociatedControlID="IncursHandlingCheckBox" Text='<%# ResourceManager.GetPhrase("IncursHandling", "Incurs handling") %>'/>
                                </div>
                            </div>
                        </asiweb:PanelTemplateColumn>
                    </asp:Panel>
                    <asp:Panel ID="AccountTemplate" runat="server" CssClass="Section">
                        <asiweb:BusinessLabel ID="Instructions" runat="server" CssClass="Label"/>
                            <div class="SubItems">
                                <asiCommon:GeneralLedger ID="AccountsReceivable" runat="Server" AccountType="AccountsReceivable"/>
                                <asiCommon:GeneralLedger ID="Income" runat="Server" AccountType="Income"/>
                            </div>
                    </asp:Panel>
                </asiweb:PanelTemplateControl2>
                <asiweb:StyledLabel runat="server" ID="GridErrorMessage1" Visible="false" CssClass="Error"/>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </div>
</asiweb:PanelTemplateControl2>
