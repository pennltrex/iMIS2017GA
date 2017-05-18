<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EventEditDisplay.ascx.cs"
    Inherits="Asi.Web.iParts.Events.EventEditDisplay" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiCommon" TagName="FileUpload" Src="Common/BusinessFileUpload.ascx" %>
<%@ Register TagPrefix="event" TagName="Pricing" Src="EventFunctionPricing.ascx" %>
<%@ Register TagPrefix="event" TagName="Program" Src="EventProgramDisplayDisplay.ascx" %>
<%@ Register TagPrefix="uc1" TagName="EventQuestions" Src="../../Communications/FormDefinition/FormDefinitionDisplay.ascx" %>  
<%@ Import Namespace="Asi" %>

<div runat="server" ID="MainContentWrapper" translate="yes">
    <asp:Panel ID="ContentPanel" runat="server" Visible="true">
       <div runat="server" id="DivData">
            <asp:HiddenField runat="server" ID="HiddenLastSavedEventKey" />
            <asp:HiddenField runat="server" ID="HiddenTitle" />
            <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1"
                SelectedIndex="0" Visible="true" AutoPostBack="false">
                <Tabs>
                    <telerik:RadTab Text='<%# ResourceManager.GetWord("Info") %>' Value="info" />
                    <telerik:RadTab Text='<%# ResourceManager.GetWord("Pricing") %>' Value="pricing" Enabled="true" />
                    <%-- the event questions tab is loaded dynamically if the user has permissions --%>
                </Tabs>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage ID="RadMultipage1" runat="server" SelectedIndex="0">
                <telerik:RadPageView ID="RadPageViewInfo" runat="server" EnableViewState="true" CssClass="ContentTabbedDisplay">
                    <asiweb:PanelTemplateControl2 ID="PanelGeneralInfo" runat="server" TemplateTitle='<%# ResourceManager.GetPhrase("GeneralInfo", "General information") %>'
                        Collapsible="false" FieldSet="true" ShowBorder="False">
                    
                            <div class="PanelField Left" id="DivCode" runat="server">
                                <div style="display: inline;">
                                    <asiweb:StyledLabel runat="server" ID="LabelCode" CssClass="Required" AssociatedControlID="TextCode"></asiweb:StyledLabel>
                                </div>
                                <div class="PanelFieldValue">
                                    <asiweb:BusinessTextBox runat="server" ID="TextCode" MaxLength="60" />
                                    <asiweb:AsiRequiredFieldValidator runat="server" ID="RequiredValidatorCode" ControlToValidate="TextCode" Display="Dynamic" SetFocusOnError="true"></asiweb:AsiRequiredFieldValidator>
                                </div>
                            </div>

                            <div class="PanelField Left">
                                <div style="display: inline;">
                                    <asiweb:StyledLabel runat="server" ID="LabelName" CssClass="Required" AssociatedControlID="TextName"></asiweb:StyledLabel>
                                </div>
                                <div class="PanelFieldValue">
                                    <asiweb:BusinessTextBox runat="server" ID="TextName" MaxLength="60" CssClass="InputXLarge" />
                                    <asiweb:AsiRequiredFieldValidator runat="server" ID="RfvName" ControlToValidate="TextName" Display="Dynamic" SetFocusOnError="true"></asiweb:AsiRequiredFieldValidator>
                                </div>
                            </div>
                        
                            <div id="DivEventCategory" runat="server" class="PanelField Left">
                                <div style="display: inline;">
                                    <asiweb:StyledLabel runat="server" ID="LabelEventCategory" Text="Category" AssociatedControlID="SelectEventCategory" CssClass="Label"></asiweb:StyledLabel>
                                </div>
                                <div class="PanelFieldValue">
                                    <asiweb:BusinessDropDownList runat="server" ID="SelectEventCategory" AutoPostBack="false" DisplayCaption="False" IncludeNullItem="False" />
                                </div>
                            </div>

                            <div class="PanelField Left" id="DivRegType" runat="server">
                                <div style="display: inline;">
                                    <asiweb:StyledLabel runat="server" ID="LabelRegType" CssClass="Label"></asiweb:StyledLabel>
                                </div>
                                <div class="PanelFieldValue AutoWidth">
                                    <asp:RadioButtonList runat="server" ID="RadioRegType" RepeatDirection="Vertical" Width="100%">
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <div class="PanelField Left">
                                <div style="display: inline;">
                                    <asiweb:StyledLabel runat="server" ID="LabelDescription" AssociatedControlID="TextDescription"/>
                                </div>
                                <div id="EventDescriptionDiv" class="PanelFieldValue">
                                    <asiweb:BusinessHtmlEditor ID="TextDescription" runat="server" CssClass="ContentHtmlEditor InputXLargeWrapper" EnableTextareaEditorMode="True"
                                        Width="26.5em" Height="7em" ValidateRequestMode="Disabled" />
                                 <asiweb:StyledLabel runat="server" ID="LabelDescriptionCharacterLimit" CssClass="Info" Visible="False"/>
                                </div>                               
                            </div> 
                            <div class="PanelField Left">
                                <div style="display: inline;">
                                    <asiweb:StyledLabel runat="server" ID="LabelStartDate" CssClass="Label" ToolTip='<%# ResourceManager.GetPhrase("Event Start Date", "Start Date and Time of the event")%>' aria-hidden="true"></asiweb:StyledLabel>
                                </div>
                                <div class="PanelFieldValue">
                                    <asiweb:StyledLabel runat="server" ID="CalendarStartDateLabel" AssociatedControlID="CalendarStartDate" Text="Event Start Date" CssClass="screen-reader-text"></asiweb:StyledLabel>
                                    <asiweb:BusinessCalendar2 runat="server" ID="CalendarStartDate" RenderPanelField="false" DisplayCaption="false" UseSqlDateTimeMinValue="true" />
                                    <asiweb:StyledLabel runat="server" ID="CalendarStartTimeLabel" AssociatedControlID="CalendarStartTime" Text="Event Start Time" CssClass="screen-reader-text"></asiweb:StyledLabel>
                                    <asiweb:BusinessCalendar2 runat="server" ID="CalendarStartTime" ControlType="TimePicker"  UseSqlDateTimeMinValue="true" DisplayTimeZone="true" />
                                    <asp:HiddenField runat="server" ID="HiddenDateRangeValidationErrorMsg" />
                                    <asp:HiddenField runat="server" ID="HiddenDateTimeRangeValidationErrorMsg" />
                                    <asp:CustomValidator runat="server" ID="CustomValidatorDate" Display="Dynamic" style="margin-left:50px;" SetFocusOnError="true"/>
                                </div>
                            </div>                        
                            <div class="PanelField Left">
                                <div style="display: inline;">
                                    <asiweb:StyledLabel runat="server" ID="LabelEndDate" CssClass="Label" aria-hidden="true" ToolTip='<%# ResourceManager.GetPhrase("Event End Date", "End Date and Time of the event")%>'></asiweb:StyledLabel>
                                </div>
                                <div class="PanelFieldValue">
                                    <asiweb:StyledLabel runat="server" ID="CalendarEndDateLabel" AssociatedControlID="CalendarEndDate" Text="Event End Date" cssClass="screen-reader-text"></asiweb:StyledLabel>
                                    <asiweb:BusinessCalendar2 runat="server" ID="CalendarEndDate" RenderPanelField="false" DisplayCaption="false" UseSqlDateTimeMinValue="true" />
                                    <asiweb:StyledLabel runat="server" ID="CalendarEndTimeLabel" AssociatedControlID="CalendarEndTime" Text="Event End Date" cssClass="screen-reader-text"></asiweb:StyledLabel>
                                    <asiweb:BusinessCalendar2 runat="server" ID="CalendarEndTime" ControlType="TimePicker"  UseSqlDateTimeMinValue="true" DisplayTimeZone="true" />
                                </div>
                            </div>                       
                            <asp:UpdatePanel ID="PanelEventAddressFields" RenderMode="Block" runat="server">
                                <ContentTemplate>                             
                                <div class="PanelField Left">
                                    <div style="display:inline;">
                                        <asiweb:StyledLabel runat="server" ID="LabelCountry" Text='<%#ResourceManager.GetWord("Country")%>'
                                            AssociatedControlID="SelectCountry"/>
                                    </div>
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessDropDownList runat="server" id="SelectCountry" AutoPostBack="True" />
                                    </div>
                                </div>
                                <div class="PanelField Left">
                                    <div style="display:inline;">
                                        <asiweb:StyledLabel runat="server" ID="LabelAddress1" Text='<%#ResourceManager.GetWord("Address")%>'
                                            AssociatedControlID="TextAddress1"/>
                                    </div>
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessTextBox CssClass="InputLarge" ID="TextAddress1" MaxLength="50" runat="server" />
                                    </div>
                                </div>                                 
                                <div class="PanelField Left">
                                    <div style="display: inline;" class="LabelSpacer FloatLeft">
                                        <asiweb:StyledLabel runat="server" ID="LabelAddress2" 
                                            AssociatedControlID="TextAddress2" Text='<%#ResourceManager.GetPhrase("AddressLine2", "Address line 2")%>' CssClass="screen-reader-text" />
                                    </div>
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessTextBox CssClass="InputLarge" ID="TextAddress2" MaxLength="50" runat="server" />
                                    </div>
                                </div>			
                                <div style="clear:both;"></div>
                                <div class="PanelField Left">
                                    <div style="display:inline;" class="LabelSpacer FloatLeft">
                                        <asiweb:StyledLabel runat="server" ID="LabelAddress3" 
                                            AssociatedControlID="TextAddress3" Text='<%#ResourceManager.GetPhrase("AddressLine3", "Address line 3")%>' CssClass="screen-reader-text" />
                                    </div>
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessTextBox CssClass="InputLarge" ID="TextAddress3" MaxLength="50" runat="server" />
                                    </div>
                                </div>
                                <div class="PanelField Left">
                                    <div style="display:inline;">
                                        <asiweb:StyledLabel runat="server" ID="LabelCity" Text='<%#ResourceManager.GetWord("City")%>'
                                            AssociatedControlID="TextCity"/>
                                    </div>
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessTextBox CssClass="InputMedium" ID="TextCity" MaxLength="40" runat="server" />
                                    </div>
                                </div>                                                              
                                <div class="PanelField Left" id="DivSubEntity" runat="server" >
                                    <div style="display:inline;">
                                        <asiweb:StyledLabel runat="server" ID="LabelSubEntityCode" Text='<%#ResourceManager.GetWord("State")%>'
                                            AssociatedControlID="SelectSubEntityCode"/>
                                    </div>
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessDropDownList runat="server" id="SelectSubEntityCode" />
                                        <asiweb:BusinessTextBox MaxLength="15" runat="server" ID="TextSubEntity" />                                                        
                                    </div>
                                </div>
                                <div class="PanelField Left">
                                    <div style="display:inline;">
                                        <asiweb:StyledLabel runat="server" ID="LabelPostalCode" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Event.PostalCode", "Postal code")%>'
                                            AssociatedControlID="TextPostalCode"/>
                                    </div>
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessTextBox runat="server" MaxLength="10" ID="TextPostalCode" CssClass="InputSmall" />
                                    </div>
                                </div>                                                                                               
                                </ContentTemplate>
                            </asp:UpdatePanel>                               
                            <div id="DivFacilityContactAddressFields" runat="server">
                                <div><!-- class="FloatLeft"-->
                                    <asp:HiddenField runat="server" ID="HiddenLocationFullAddressId" />
                                    <asp:HiddenField runat="server" ID="HiddenPartyId" />
                                    <asiweb:StyledLabel runat="server" ID="LabelLocation" RenderPanelField="true" DisplayCaption="true" style="white-space: pre-line;" />
                                    <asiweb:StyledLabel runat="server" ID="LabelAddress" RenderPanelField="true" DisplayCaption="true" />
                                    <asiweb:StyledLabel runat="server" ID="LabelEmail" RenderPanelField="true" DisplayCaption="true" Visible="false" />
                                    <asiweb:StyledLabel runat="server" ID="LabelPhone" RenderPanelField="true" DisplayCaption="true" Visible="false" />
                                </div>                                       
                                <div id="SelectLocationDiv" runat="server"> <!-- class="FloatLeft" -->
                                    <div class="PanelField Left ">
                                        <div style="display: inline;" class="Label">&nbsp;</div>
                                        <div class="PanelFieldValue">
                                            <asiweb:StyledHyperlink runat="server" ID="LinkSelectAddress" RenderPanelField="false" DisplayCaption="False" Caption="&nbsp;" Text="Choose Address" Visible="false" />  
                                            <asiweb:StyledHyperlink runat="server" ID="SelectLocation" RenderPanelField="false" DisplayCaption="false" Text='<%# ResourceManager.GetWord("select")%>' />
                                        </div>
                                    </div>
                                </div>                                                               
                                <div style="display:none;visibility:hidden;">
                                    <asp:Button runat="server" ID="ButtonAddressSelected" OnClick="ButtonAddressSelectedClick" />
                                    <asp:HiddenField runat="server" ID="HiddenAddressSelectedId" />
                                </div>
                                <div style="clear: both;"></div>
                            </div>
                                                      
                            <asp:UpdatePanel ID="PanelEventContact" RenderMode="Block" runat="server">
                                <ContentTemplate>               
                                <div class="PanelField Left">
                                    <div class="FloatLeft">
                                        <asp:HiddenField runat="server" ID="HiddenEventContactId" />
                                        <asiweb:StyledLabel runat="server" ID="LabelEventContact" RenderPanelField="true" DisplayCaption="true" />
                                    </div>                                       
                                    <div id="DivSelectEventContact" runat="server" class="FloatLeft WorkSpace"> 
                                        <asiweb:StyledHyperlink runat="server" ID="SelectEventContact" RenderPanelField="false" DisplayCaption="false" Text="select" />
                                        &nbsp;<asiweb:StyledHyperlink runat="server" ID="RemoveEventContact" RenderPanelField="false" DisplayCaption="false" Text="remove" />                                                                     
                                    </div>                                                               
                                    <div style="display:none;visibility:hidden;">
                                        <asp:Button runat="server" ID="ButtonEventContactSelected" OnClick="ButtonEventContactSelectedClick" CausesValidation="false"/>
                                        <asp:HiddenField runat="server" ID="HiddenEventContactSelectedId" />
                                        <asp:Button runat="server" ID="ButtonEventContactRemoved" OnClick="ButtonEventContactRemovedClick" CausesValidation="false"/>
                                    </div>
                                    <div style="clear: both;"></div>
                                </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>  
                                               
                            <div class="PanelField Left">
                                <div style="display: inline;">
                                     <asiweb:StyledLabel runat="server" ID="LabelCapacity" AssociatedControlID="TextCapacity"></asiweb:StyledLabel>
                                </div>
                                <div class="PanelFieldValue">
                                    <asiweb:BusinessTextBox runat="server" ID="TextCapacity" MaxLength="6" />
                                    <asp:RangeValidator ID="CapacityRangeValidator" runat="server" MinimumValue="1" MaximumValue="999999" Type="Integer" Display="Dynamic"
                                        ControlToValidate="TextCapacity" ValidationGroup='<%# UniqueID %>'
                                        ErrorMessage='<%# ResourceManager.GetPhrase("Asi.Web.iParts.Commerce.ProductDisplay.QuantityInteger", "Must be a positive number (or blank for unlimited).")  %>' />
                                </div>
                            </div>

                            <asp:PlaceHolder runat="server" ID="UserDefinedFieldsPh"/> 
                            
                             
                            <div class="PanelField Left">
                                <div style="display: inline;">
                                    <label runat="server" id="LabelImageUrl"></label>
                                </div>
                                <div class="PanelFieldValue">
                                    <asp:UpdatePanel ID="uc2" runat="server">
                                        <ContentTemplate>
                                            <div class="Section">
                                                <asiweb:BusinessDropDownList id="SelectImageUrl" runat="server" OnSelectedIndexChanged="ImageUrlDropDownListSelectedIndexChanged" AutoPostBack="true" />
                                            </div>
                                            <%--Loading image may take long time, we don't want to match it with timeouts, instead we fire Fix Panel Height once image is downloaded to the client--%>
                                            <%--OnLoadClientScript="try{PanelTemplateControl_FixInitialHeight();}catch(exc){}"--%>
                                            <asp:Panel class="Section" runat="server" id="PanelImageControl">
                                                <asiweb:StyledImage id="ImageControl" runat="server" Width="200" />
                                            </asp:Panel>
                                            <div id="altTextDiv" runat="server" class="Section"> 
                                                <asiweb:StyledLabel ID="ImageAltTextLabel" runat="server" AssociatedControlID="ImageAltText" CssClass="PanelFieldLabel"/>                   
                                                <div class="PanelFieldValue">
                                                    <asiweb:BusinessTextBox runat="server" ID="ImageAltText" DisplayCaption="True" PositionCaption="Left"></asiweb:BusinessTextBox>                        
                                                </div>                                               
                                            </div>             							                                                                                                   
                                            <span ID="LabelUploadNewImage" runat="server" class="PanelFieldLabel Label"></span>                                             
                                            <div style="margin-top: 0 !important;">
                                                <asiCommon:FileUpload id="BusinessFileUploadControl" runat="Server" OnFileUploaded="FileUploadControlFileUploaded" AllowedExtensions=".jpg,.jpeg,.gif" />
                                            </div>                                            
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="BusinessFileUploadControl" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                            <div class="PanelField Left">     
                                <div style="display: inline;">
                                    <asiweb:StyledLabel runat="server" ID="DefaultProgramItemDisplayModeLabel" AssociatedControlID="DefaultProgramItemDisplayModeDropDownList"></asiweb:StyledLabel>
                                </div>                   
                                <div class="PanelFieldValue">
                                    <asiweb:BusinessDropDownList runat="server" ID="DefaultProgramItemDisplayModeDropDownList" RenderPanelField="false" DisplayCaption="true" />
                                </div>
                            </div>
                        <asiweb:StyledLabel runat="server" ID="PublishDatesFieldSetCaption" style="clear:both" CssClass="Label" Text='<%# ResourceManager.GetPhrase("ShowInSearch", "Show in search")%>'></asiweb:StyledLabel>                       
                        <div class="SubItems">
                            <div class="PanelField Left">
                                <div style="display: inline;">
                                    <asiweb:StyledLabel runat="server" ID="StyledLabelPublishStart" text="Beginning" CssClass="Label" aria-hidden="true" ToolTip='<%# ResourceManager.GetPhrase("ShowEventBeginning", "Date and Time to begin showing the event in search results")%>'/>
                                </div>
                                <div class="PanelFieldValue">
                                    <asiweb:StyledLabel runat="server" ID="PublishStartDateLabel" Text="Show in Search Start Date" AssociatedControlID="PublishStartDate" CssClass="screen-reader-text" />
                                    <asiweb:BusinessCalendar2 runat="server" ID="PublishStartDate" RenderPanelField="false" DisplayCaption="true" UseSqlDateTimeMinValue="true" />   
                                    <asiweb:StyledLabel runat="server" id="PublishStartTimeLabel" Text="Show in Search Start Time" AssociatedControlID="PublishStartTime" CssClass="screen-reader-text"></asiweb:StyledLabel>
                                    <asiweb:BusinessCalendar2 runat="server" ID="PublishStartTime" ControlType="TimePicker"  UseSqlDateTimeMinValue="true" DisplayTimeZone="true" />
                                    <asp:HiddenField runat="server" ID="HiddenDateRangeValidationErrorMsgPublishStart" />
                                    <asp:HiddenField runat="server" ID="HiddenDateTimeRangeValidationErrorMsgPublishStart" />
                                    <asp:CustomValidator runat="server" ID="CustomValidatorPublishStart" Display="Dynamic" style="margin-left:50px;" SetFocusOnError="true"/>                                
                                </div>   
                            </div>
                            <div class="PanelField Left">     
                                <div style="display: inline;">
                                    <asiweb:StyledLabel runat="server" ID="StyledLabelPublishEnd" Text="Ending"  CssClass="Label" aria-hidden="true" ToolTip='<%# ResourceManager.GetPhrase("ShowEventUntil", "Date and Time the event will no longer show in search results")%>' />

                                </div>                   
                                <div class="PanelFieldValue">
                                    <asiweb:StyledLabel runat="server" ID="StyledLabel1PublishEndDateLabel"  Text="Show in Search End Date" CssClass="screen-reader-text" AssociatedControlID="PublishEndDate"></asiweb:StyledLabel>
                                    <asiweb:BusinessCalendar2 runat="server" ID="PublishEndDate" RenderPanelField="false" DisplayCaption="true" UseSqlDateTimeMinValue="true" />
                                    <asiweb:StyledLabel runat="server" ID="StyledLabel1PublishEndTimeLabel"  Text="Show in Search End Time" CssClass="screen-reader-text" AssociatedControlID="PublishEndTime"></asiweb:StyledLabel>
                                    <asiweb:BusinessCalendar2 runat="server" ID="PublishEndTime" ControlType="TimePicker"  UseSqlDateTimeMinValue="true" DisplayTimeZone="true" />
                                </div>
                            </div>
                        </div>
                       <div class="clearfix">&nbsp;</div>
                        <asiweb:StyledLabel runat="server" ID="StyledLabelEventShowcaseLayout" style="clear:both" CssClass="Label" Text="Event showcase layout"></asiweb:StyledLabel> 
                        <asiweb:InfoControl runat="server" ID="OwnersShowcaseLayoutInfo" CssClass="Left" Text='Select a content record, or enter a shortcut. The shortcut must conform to the format "~/ShortcutName".'></asiweb:InfoControl>
                                                  
                        <div class="SubItems">
                            <asiweb:BusinessDocumentBrowserControl runat="server" ID="EventShowcaseDefaultLayout" Caption="Default"  
                                    DisplayCaption="true" RenderPanelField="true" CssClass="InputXLargeWrapper" RootFolder="@/"/>

                            <asiweb:BusinessDocumentBrowserControl runat="server" ID="EventShowcaseOwnersLayout" Caption="Owner"
                                    DisplayCaption="true" RenderPanelField="true" CssClass="InputXLargeWrapper" RootFolder="@/" OnDataChanged="EventShowcaseOwnerLayout_DataChanged" />
                        </div>
                    </asiweb:PanelTemplateControl2>
                    <asiweb:PanelTemplateControl2 ID="PanelRegistrations" runat="server" TemplateTitle='<%# ResourceManager.GetPhrase("Registration", "Registration") %>'
                        Collapsible="false" ShowBorder="False">
                       <div runat="server" id="DivRegistration"> 
                        <div class="PanelField Left">
                            <div style="display: inline;">
                                <asiweb:StyledLabel runat="server" ID="StyledLabelRegistrationStart" Text="Registration opens" CssClass="Label" aria-hidden="true"></asiweb:StyledLabel>
                            </div>                  
                            <div class="PanelFieldValue">
                                <asiweb:StyledLabel runat="server" ID="RegistrationStartDateLabel" Text="Registration Start Date" CssClass="screen-reader-text" AssociatedControlID="RegistrationStartDate" />
                                <asiweb:BusinessCalendar2 runat="server" ID="RegistrationStartDate" RenderPanelField="false" DisplayCaption="true" UseSqlDateTimeMinValue="true" />   
                                <asiweb:StyledLabel runat="server" ID="RegistrationStartTimeLabel" Text="Registration Start Time" CssClass="screen-reader-text" AssociatedControlID="RegistrationStartTime"></asiweb:StyledLabel>
                                <asiweb:BusinessCalendar2 runat="server" ID="RegistrationStartTime" ControlType="TimePicker"  UseSqlDateTimeMinValue="true" DisplayTimeZone="true" />
                                <asp:HiddenField runat="server" ID="HiddenDateRangeValidationErrorMsgRegistrationStart" />
                                <asp:HiddenField runat="server" ID="HiddenDateTimeRangeValidationErrorMsgRegistrationStart" />
                                <asp:CustomValidator runat="server" ID="CustomValidatorRegistrationStart" Display="Dynamic" style="margin-left:50px;" SetFocusOnError="true"/>
                            </div>
                        </div>
                        <div class="PanelField Left">     
                            <div style="display: inline;">
                                <asiweb:StyledLabel runat="server" ID="StyledLabelRegistrationEnd" Text="Registration closes" CssClass="Label" aria-hidden="true"></asiweb:StyledLabel>
                                <asiweb:StyledLabel runat="server" ID="RegistrationEndDateLabel" text="Registration End Date" CssClass="screen-reader-text" AssociatedControlID="RegistrationEndDate" ToolTip='<%# ResourceManager.GetPhrase("ShowEventUntil", "Date and Time registration closes for public users")%>'/>
                                <asiweb:StyledLabel runat="server" ID="RegistrationEndTimeLabel" text="Registration End Time" CssClass="screen-reader-text" AssociatedControlID="RegistrationEndTime"></asiweb:StyledLabel>

                            </div>                   
                            <div class="PanelFieldValue">
                                <asiweb:BusinessCalendar2 runat="server" ID="RegistrationEndDate" RenderPanelField="false" DisplayCaption="true" UseSqlDateTimeMinValue="true" />
                                <asiweb:BusinessCalendar2 runat="server" ID="RegistrationEndTime" ControlType="TimePicker"  UseSqlDateTimeMinValue="true" DisplayTimeZone="true" />
                            </div>
                      </div>
                        <div class="PanelField Left" id="DivRegistrationClosed" runat="server">
                                <div style="display: inline;">
                                    <asiweb:StyledLabel runat="server" ID="LabelRegistrationClosedMessage"  AssociatedControlID="TextRegistrationClosedMessage" ToolTip='<%# ResourceManager.GetPhrase("RegistrationClosedMessage", "")%>'></asiweb:StyledLabel>
                                </div>
                                <div class="PanelFieldValue">
                                    <asiweb:BusinessTextBox runat="server" ID="TextRegistrationClosedMessage" MaxLength="100" CssClass="InputXLarge" />
                                </div>
                         </div>
                        </div>
                          <div class="PanelField AutoWidth">          
                            <asiweb:BusinessCheckBox runat="server" ID="AllowRegisterOthers" class="PanelFieldValue FloatNone" /> 
                            <asp:Label ID="AllowRegisterOthersLabel" AssociatedControlID="AllowRegisterOthers" runat="server" Text='<%# ResourceManager.GetPhrase("AllowRegisterOthers", "Allow registering others")%>'/>
                          </div>
                      
                        <div class="PanelField AutoWidth">    
                            <asiweb:BusinessCheckBox runat="server" ID="AllowAddGuests" class="PanelFieldValue FloatNone" />
                            <asp:Label runat="server" ID="AllowAddGuestsLabel" AssociatedControlID="AllowAddGuests" Text='<%# ResourceManager.GetPhrase("AllowAddGuests", "Allow adding guests")%>'/>                           
                        </div>                  
                        <div runat="server" ID="RegistrationPanel">              
                            <div class="PanelField AutoWidth">        
                                <asiweb:BusinessCheckBox runat="server" ID="AllowRegistrationEditing" class="PanelFieldValue FloatNone" /> 
                                <asp:Label ID="AllowRegistrationEditingLabel" AssociatedControlID="AllowRegistrationEditing" runat="server" Text='<%# ResourceManager.GetPhrase("AllowItineraryEditing", "Allow itinerary changes after checkout")%>'/>                                
                            </div>
                            <asp:Panel ID="PanelCalendarRegistrationEditCutoff" runat="server">                          
                                <div class="SubItems">      
                                        <div class="PanelField Left">     
                                            <div style="display: inline;"> 
                                                <asiweb:StyledLabel runat="server" ID="CalendarRegistrationEditCutoffDateLabel" AssociatedControlID="CalendarRegistrationEditCutoffDate"></asiweb:StyledLabel>   
                                            </div>
                                            <div class="PanelFieldValue">
                                                <asiweb:BusinessCalendar2 runat="server" ID="CalendarRegistrationEditCutoffDate" DisplayCaption="False" UseSqlDateTimeMinValue="true" Required="false" />
                                            </div>
                                        </div>
                                </div>
                            </asp:Panel>
                        </div>    
                        <div class="PanelField AutoWidth">    
                            <asiweb:BusinessCheckBox runat="server" ID="EnableTimeConflicts" class="PanelFieldValue FloatNone" />
                            <asp:Label runat="server" ID="EnableTimeConflictsLabel" AssociatedControlID="EnableTimeConflicts" Text='<%# ResourceManager.GetPhrase("EnableTimeConflicts", "Enable time-based itinerary conflicts in program items by default")%>'/>                           
                        </div>
                        <div class="PanelField AutoWidth">    
                            <asiweb:BusinessCheckBox runat="server" ID="AllowRegistrantConflicts" class="PanelFieldValue FloatNone" />
                            <asp:Label runat="server" ID="AllowRegistrantConflictsLabel" AssociatedControlID="AllowRegistrantConflicts" Text='<%# ResourceManager.GetPhrase("AllowRegistrantConflicts", "Allow non-staff registrants to complete registration with conflicts in their itinerary")%>'/>                           
                        </div>                    
                    </asiweb:PanelTemplateControl2>
                    <asiweb:PanelTemplateControl2 ID="PanelTags" runat="server" TemplateTitle='<%# ResourceManager.GetWord("Tags") %>'
                        Collapsible="false" ShowBorder="False">
                        <asiweb:TagSelector ID="TagSelector" runat="server"></asiweb:TagSelector>
                    </asiweb:PanelTemplateControl2>
                    <asiweb:PanelTemplateControl2 ID="PanelAdditionalInfo" runat="server" TemplateTitle='<%# ResourceManager.GetPhrase("AdditionalInfo", "Additional information") %>'
                        Collapsible="false" ShowBorder="False">
                        <%--Using inline styles is not perfect, however HTML Editor will not be displayed correctly unless it is displayed within a block--%>
                        <asiweb:BusinessHtmlEditor runat="server" ID="HtmlAdditionalInfo" style="display:block;margin-left:auto;margin-right:auto;margin-top:1.5em;margin-bottom:1.5em;width:95%;" />         
                    </asiweb:PanelTemplateControl2>
                </telerik:RadPageView>
                <telerik:RadPageView ID="RadPageViewPricing" runat="server" EnableViewState="true" CssClass="ContentTabbedDisplay">
                    <asp:UpdatePanel runat="server" ID="PricingUpdatePanel" EnableViewState="True" ChildrenAsTriggers="True">
                        <ContentTemplate>
                            <asiweb:PanelTemplateControl2 ID="PanelPricing" runat="server" ShowHeader="false" FieldSet="true" ShowBorder="False"> 
                                <event:Pricing ID="Pricing" runat="server" />
                                <event:Program ID="ProgramList" runat="server" EventSetupMode="true" AllowGuestsId='<%# AllowAddGuests.ClientID %>'/>
                            </asiweb:PanelTemplateControl2>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </telerik:RadPageView>            
                <telerik:RadPageView ID="QuestionsPageView" runat="server" EnableViewState="true" CssClass="ContentTabbedDisplay">   
                    <uc1:EventQuestions runat="Server" id="EventQuestions"/>								                    
                </telerik:RadPageView>          
            </telerik:RadMultiPage>
        </div>
        <div runat="server" id="DesignTimeDetails" visible="false">
            <asiweb:StyledLabel runat="server" ID="EventConfigurationMessage" Visible="false" />
        </div>
    </asp:Panel>
    <div runat="server" id="DivErrors">
        <asiweb:BusinessLabel runat="server" ID="LabelError" CssClass="Error"></asiweb:BusinessLabel>
    </div>
    
</div> 
