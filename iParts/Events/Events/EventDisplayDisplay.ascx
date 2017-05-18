<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="EventDisplayDisplay.ascx.cs"
    Inherits="Asi.Web.iParts.Events.EventDisplayDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="uc2" TagName="FormDisplay" Src="~/iParts/Communications/FormDisplay/FormDisplayDisplay.ascx" %>
<%@ Register TagPrefix="asiEvent" Namespace="Asi.Web.iParts.Events.Common" Assembly="Asi.Web.iParts.Events" %>
<%@ Register TagPrefix="asiEvent" TagName="PriceOverrideDisplay" Src="~/iParts/Events/Events/Common/PriceOverrideDisplay.ascx" %>
<input type="hidden" id="VersionIsV10" runat="server" />
<input type="hidden" id="SelectedContactId" runat="server" />
<input type="hidden" id="AddressId" runat="server" />
<input type="hidden" id="IsGuest" runat="server" />
<input type="hidden" id="GuestAddMode" runat="server" />
<asp:Button ID="RefreshRedirectButton" runat="server" Text=" " CausesValidation="false" CssClass="DisplayNone" aria-hidden="true"
        OnClick="RefreshRedirectButtonClick" />

<telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1" SkinID="AjaxLoadingPanel" Enabled="true" />

<asp:Panel ID="ContentPanel" runat="server" Visible="true" translate="yes">

    <asiweb:TitleBar ID="TitleBar" OptionsMenuBehavior="AlwaysDisplay" runat="server" DoNotTranslateTitle="True"/>
   
    <div runat="server" id="DataDiv" class="EventDisplay">

        <div class="EventSummary">

            <div runat="server" id="ImageDiv" class="PhotoArea">
                <asp:Image ID="EventImage" runat="server" ImageUrl="" />
            </div>

            <div runat="server" id="DesignTimeImageDiv" class="DesignTimePhotoArea" visible="false">
                <asi:StyledLabel runat="server" ID="DesignTypeImageLabel" />
            </div>

            <div class="Description">

                <div runat="server" id="DescriptionDiv" class="PanelField">
                    <asi:StyledLabel runat="server" ID="DescriptionData" translate="no" />
                </div>
                <div runat="server" id="AdditionalInfoDiv" class="PanelField">
                    <asi:StyledLabel runat="server" ID="AdditionalInfoHtmlData" translate="no" />
                </div>
                <div runat="server" id="DesignTimeDescriptionDiv" class="PanelField" visible="false">
                    <asi:StyledLabel runat="server" ID="DesignTimeDescriptionLabel" />
                </div>

            </div>
        </div>

        <div class="EventDetails row">

            <div runat="server" id="ContactLocationAreaDiv" class="ContactLocationArea col-sm-6">

                <%-- This pricing data only appears when there is only one price configured; otherwise pricing matrix appears --%>
                <div runat="server" id="SinglePriceDiv" class="PanelField ClearFix">
                    <div class="PanelFieldLabel">
                        <asi:StyledLabel runat="server" ID="SinglePriceCaption" Text="Price" CssClass="Label" />
                    </div>
                    <div class="PanelFieldValue">
                        <asiEvent:PriceOverrideDisplay runat="server" ID="SinglePriceOverride" Visible="False" ViewStateMode="Enabled" />
                        <asi:StyledLabel runat="server" ID="SinglePriceData" />
                    </div>
                </div>

                <div runat="server" id="WhenDiv" class="PanelField ClearFix">
                    <div class="PanelFieldLabel">
                        <asi:StyledLabel runat="server" ID="WhenCaption" Text="When" CssClass="Label"/>
                    </div>
                    <div class="PanelFieldValue">
                        <asi:StyledLabel runat="server" ID="WhenData" />
                    </div>
                </div>

                <div runat="server" id="WhereDiv" class="PanelField ClearFix">
                    <div class="PanelFieldLabel">
                        <asi:StyledLabel runat="server" ID="WhereCaption" Text="Where" CssClass="Label"/>
                    </div>
                    <div class="PanelFieldValue">
                        <div runat="server" id="AddressDiv">
                            <asi:StyledLabel runat="server" ID="AddressData" translate="no" style="white-space: pre-line;" />
                        </div>
                    </div>
                </div>

                <div runat="server" id="EmailDiv" class="PanelField ClearFix" Visible="false">
                    <div class="PanelFieldLabel">
                        <asi:StyledLabel runat="server" ID="EmailCaption" Text="Email" CssClass="Label" />
                    </div>
                    <div class="PanelFieldValue">
                        <asi:StyledLabel runat="server" ID="EmailData" translate="no" />
                    </div>
                </div>

                <div runat="server" id="PhoneDiv" class="PanelField ClearFix" Visible="false">
                    <div class="PanelFieldLabel">
                        <asi:StyledLabel runat="server" ID="PhoneCaption" Text="Phone" CssClass="Label" />
                    </div>
                    <div class="PanelFieldValue">
                        <asi:StyledLabel runat="server" ID="PhoneData" translate="no" />
                    </div>
                </div>
                
                <div runat="server" id="UserFieldsDiv" class="PanelField ClearFix NeutralShading" Visible="False">
                    <div><i>Staff use only</i></div>
                    <asp:PlaceHolder runat="server" ID="UserFieldsPh"></asp:PlaceHolder>
                </div>

                 <div runat="server" id="AddToCalendarSection" class="btn-group dropdown AddPadding" Visible="False"> 
                    <asp:Button runat="server" Text="Add to Calendar" id="LinkAddToCalendar" CssClass="btn btn-default btn-lg dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                      ></asp:Button> 
                    <ul class="dropdown-menu">
                        <li><asp:HyperLink runat="server" id="AddToGoogleCalendar" Text="Google" Target="_blank"></asp:HyperLink></li>
                        <li><asp:HyperLink runat="server" id="AddToYahooCalendar" Text="Yahoo"  Target="_blank"></asp:HyperLink></li>
                        <li><asp:linkbutton runat="server" id="AddToOutlookCalendar" Text="Outlook/iCalendar" OnClick="AddToOutlookCalendar_OnClick"></asp:linkbutton></li>
                    </ul>
                </div>

            </div>
                          
            <div runat="server" id="RegistrationInfoDiv" visible="false" class="RegistrationArea col-sm-6">
                <div runat="server" id="DivRegisterButtons">
                    <div runat="server" id="DivRegisterMyselfButton">
                        <asi:StyledButton ID="RegisterButton" runat="server" CssClass="PrimaryButton MediumButton" OnClick="RegisterButtonOnClick" />
                    </div>
                    <asiweb:BusinessLabel runat="server" ID="RegisterButtonDisabledExplanation" CssClass="HelperText PanelField" Visible="False" />
                    <asp:Button ID="CancelRegistrationButton" runat="server" CssClass="SecondaryButton MediumButton TextButton" CausesValidation="False" OnClick="CancelRegistrationButtonOnClick" />
                    <asi:StyledButton ID="UndoCancelation" runat="server" CssClass="SecondaryButton MediumButton" OnClick="UndoCancelationOnClick" CausesValidation="False" />
                </div>
                <div runat="server" id="DivRegisterSomeoneElseButton">
                    <asiweb:StyledButton ID="RegisterSomeoneElseButton" runat="server" Text="Register Someone Else"
                        AutoPostBack="false" CssClass="SecondaryButton MediumButton" />
                </div>
                <div runat="server" id="DivRegisterButtonError">
                    <asiweb:StyledLabel runat="server" ID="LabelRegisterButtonError" CssClass="HelperText" />
                </div>
                <div runat="server" ID="DivInfoRegistrationFull" Visible="False" class="AsiValidation">
                      <asi:StyledLabel ID="RegistrationFullLabel" runat="server" Text="This event is full."  /> 
                      <div ID="DivWaitList" runat="server" Visible="False">
                          <asi:BusinessRadioButtonList runat="server" ID="WaitListRadioButtons" DisplayCaption="False">
                               <asp:ListItem Text="Add to waitlist" Value="Waitlist" />
                               <asp:ListItem Text="Register" Value="Register"/>                      
                          </asi:BusinessRadioButtonList>
                      </div>       
                </div>
                <asi:StyledLabel ID="RegistrationStatusCaption" runat="server" CssClass="Label" />
                <asi:StyledLabel ID="RegistrationStatusData" runat="server" />
                <asp:LinkButton ID="RegisterWaitlistLinkButton" Visible="False" CssClass="AddPadding" OnClick="RegisterWaitlistLinkButton_OnClick" runat="server">Register from the waitlist</asp:LinkButton>
                <asp:LinkButton ID="UndoRegisterFromWaitlistLinkButton" Visible="False" CssClass="AddPadding" Onclick="UndoRegisterFromWaitlistLinkButton_OnClick" runat="server">Undo</asp:LinkButton>

                <div id="RegistrantInfoSection" runat="server" class="RegistrationEditSection">
                    <div runat="server" id="RegistrantEditSection">
                        <asp:HyperLink runat="server" ID="RegistrantInfoEditLink">
                            <asp:Image ID="RegistrantInfoEditImage" runat="server" SkinID="PanelCommandButtonEdit" AlternateText="Pencil Icon" />
                            <asiweb:StyledLabel ID="RegistrantInfoLabel" runat="server" />
                        </asp:HyperLink>
                    </div>
                    <div id="AddGuestSection" runat="server">
                        <asp:HyperLink runat="server" ID="AddGuestLink">
                            <asp:Image ID="AddGuestImage" runat="server" SkinID="PanelCommandButtonAdd" AlternateText="Plus Sign Icon" />
                            <asiweb:StyledLabel ID="AddGuestLabel" runat="server" />
                        </asp:HyperLink>
                    </div>
                    <asp:TextBox runat="server" ID="RegistrantInfoEditAddressId" OnTextChanged="PrimaryRegistrantInfoEdit_AddressChanged" AutoPostBack="True" Style="display: none; clear: both" />
                </div>                
            </div>                
                            
        </div>
        <div style="clear: both;"></div>

        <div runat="server" id="RegisteredAttendeesDiv">

            <asiweb:TitleBar ID="attendeesCaption" CssClass="TitleBarCaption" runat="server" OptionsMenuBehavior="AlwaysDisplay" Visible="true" Text="Registrants"></asiweb:TitleBar>

            <telerik:RadListView ID="RegisteredAttendeesList" runat="server" AllowNodeEditing="False"
                CausesValidation="False" EnableAjaxSkinRendering="False" ItemPlaceholderID="AttendeeItemContainer"
                DataKeyNames="Id" OnSelectedIndexChanged="RegisteredAttendeesListSelectedIndexChanged">
                <LayoutTemplate>
                    <div>
                        <asp:Panel ID="attendeePanel" runat="server">
                            <div>
                                <asp:PlaceHolder ID="AttendeeItemContainer" runat="server"></asp:PlaceHolder>
                            </div>
                        </asp:Panel>
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="PersonDisplay">                        
                        <asp:ImageButton ID="RadListViewImage1" runat="server" AlternateText='<%# Eval("Text") %>'
                            CommandName="Select" ImageUrl='<%# Eval("ImageUrl") %>' />
                        <asp:LinkButton ID="LinkButton" runat="server" CommandName="Select">
                            <span>
                                <%#Eval("Text") %>
                            </span>
                        </asp:LinkButton>
                    </div>
                </ItemTemplate>
                <SelectedItemTemplate>
                    <div class="PersonDisplay SelectedItem">                        
                        <asp:ImageButton runat="server" ID="ImageButton1" AlternateText='<%# Eval("Text") %>'
                                CommandName="Select" ImageUrl='<%# Eval("ImageUrl") %>' OnClientClick="return false;" />
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select" OnClientClick="return false;" >
                            <span>
                                <%#Eval("Text") %>
                            </span>
                        </asp:LinkButton>
                    </div>
                </SelectedItemTemplate>
            </telerik:RadListView>
            <div runat="server" id="AttendeeLinksSection">
                <div runat="server" id="AttendeeRegistrationStatusSection">
                    <asi:StyledLabel ID="AttendeeRegistrationStatusCaption" runat="server" CssClass="Label"/>
                    <asi:StyledLabel ID="AttendeeRegistrationStatusData" runat="server" />
                    <asp:LinkButton ID="AttendeeRegisterWaitlistLinkButton" Visible="False" CssClass="AddPadding" OnClick="AttendeeRegisterWaitlistLinkButton_OnClick" runat="server">Register from the waitlist</asp:LinkButton>
                    <asp:LinkButton ID="AttendeeUndoRegisterFromWaitlistLinkButton" Visible="False" CssClass="AddPadding" OnClick="AttendeeUndoRegisterFromWaitlistLinkButton_OnClick" runat="server">Undo</asp:LinkButton>
                </div>
                <div id="AttendeeRegistrationEditSection" runat="server" class="RegistrationEditSection">
                    <div runat="server" id="AttendeeEditSection">
                        <asp:HyperLink ID="AttendeeInfoEditLink" runat="server">
                            <asp:Image ID="AttendeeInfoEditImage" runat="server" SkinID="PanelCommandButtonEdit" AlternateText="Pencil Icon" />
                            <asiweb:StyledLabel ID="AttendeeInfoEditLabel" runat="server" />
                        </asp:HyperLink>
                    </div>
                    <div id="AttendeeAddGuestSection" runat="server">
                        <asp:HyperLink ID="AttendeeAddGuestLink" runat="server">
                            <asp:Image ID="AttendeeAddGuestImage" runat="server" SkinID="PanelCommandButtonAdd" AlternateText="Plus Sign Icon" />
                            <asiweb:StyledLabel ID="AttendeeAddGuestLabel" runat="server" />
                        </asp:HyperLink>
                    </div>
                    <div id="AttendeeRegistrationCancelSection" runat="server">
                        <asp:HyperLink ID="AttendeeRegistrationCancelLink" runat="server">
                            <asp:Image ID="AttendeeRegistrationCancelImage" runat="server" SkinID="PanelCommandButtonDelete" AlternateText="Delete Sign Icon" />
                            <asiweb:StyledLabel ID="AttendeeRegistrationCancelLabel" runat="server" />
                        </asp:HyperLink>
                        <asp:Button ID="CancelAttendeeRegistrationButton" runat="server" Text=" " CausesValidation="false" CssClass="DisplayNone" aria-hidden="true" OnClick="CancelAttendeeRegistrationButton_OnClick" />
                    </div>
                </div>
                <asp:TextBox runat="server" ID="AttendeeInfoEditAddressId" OnTextChanged="AttendeeInfoEdit_AddressChanged" AutoPostBack="True" Style="display: none; clear: both" />
           </div>
        </div>

        <div class="PricingData" id="PricingDiv" runat="server" visible="true">

            <div runat="server" id="RegistrationOptionsDiv">

                <div runat="server" id="DivSelectRegistrationOption">
                    <asi:StyledLabel runat="server" ID="LabelSelectRegistrationOption" />
                </div>

                <telerik:RadGrid runat="server" ID="RegistrationOptionsGrid" SkinID="RegistrationOptions">
                    <ClientSettings EnableAlternatingItems="false"></ClientSettings>
                    <MasterTableView>
                        <Columns>
                            <telerik:GridTemplateColumn HeaderText="RegistrationOptions">
                                <ItemTemplate>
                                    <div style="vertical-align: middle;">
                                        <asiweb:StyledRadioButton runat="server" ID="RadioRegistrationOption" Text='<%# Eval("Function.Name") %>' />
                                    </div>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn HeaderText="Price" HeaderStyle-HorizontalAlign="Right">
                                <ItemTemplate>
                                    <div style="vertical-align: middle;" Class="AlignRight">
                                        <asiweb:StyledLabel runat="server" ID="PriceLabel" Text='<%# Eval("Price", "{0:0.00}") %>' />
                                        <asiEvent:PriceOverrideDisplay runat="server" ID="PriceOverride" Visible="False" ViewStateMode="Enabled" />
                                    </div>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn Visible="False">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="RegistrationOptionMessageLabel" />
                                    <div runat="server" ID="OptionDivRegistrationFull" Visible="False" class="AsiValidation">
                                         <asi:StyledLabel ID="OptionRegistrationFullLabel" runat="server" Text="This option is full."  /> 
                                         <div ID="OptionDivWaitList" runat="server" style="display:none">
                                              <asi:BusinessRadioButtonList runat="server" ID="OptionWaitListRadioButtons" DisplayCaption="False">
                                                  <asp:ListItem Text="Add to waitlist" Value="Waitlist" />
                                                  <asp:ListItem Text="Register" Value="Register"/>                      
                                              </asi:BusinessRadioButtonList>
                                         </div>       
                                     </div>
                                </ItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                    </MasterTableView>
                </telerik:RadGrid>

            </div>

            <div style="display: none; visibility: hidden;">
                <asp:TextBox runat="server" ID="TextSelectedRegistrationOptionFunctionId" aria-hidden="true" title="Selected Function ID" />
                <asp:Button runat="server" ID="ButtonUpdateRegistrationOption" OnClick="ButtonUpdateRegistrationOptionOnClick" title="Update Registration Option" aria-hidden="true" />
                <asp:Button runat="server" ID="ButtonWaitListChoice" OnClick="ButtonWaitListChoiceOnClick" aria-hidden="true" />
               <input type="hidden" runat="server" id="SelectedOptionId" title="Selected Option ID" aria-hidden="true" />
               <input type="hidden" id="HiddenWaitListChoice" runat="server" />
            </div>

        </div>

    </div>   

    <div style="clear: both;"></div>
     <div class="AsiMessage" runat="server" ID="ItineraryUpdatedMessage" Visible="False">
         <div class="AsiInformation">
             <asp:Image ID="UserWarningIcon" runat="server" CssClass="iMISUserMessageIcon" ImageAlign="AbsMiddle" SkinID="AsiInformation" />			                  
             <div runat="server" ID="ItineraryUpdated"></div>
         </div>       
     </div>
    <div style="clear: both;"></div>

    <div runat="server" id="FormDisplayDiv" visible="False" class="EventQuestions">
        <h2 class="PanelTitle"><span runat="server" translate="no">Questions</span><%=RegistrantNameForQuestionsHeader %></h2>
        <uc2:FormDisplay id="FormDisplay" runat="server" />
    </div>

    <div style="clear: both;"></div>

    <asp:Button ID="RefreshButton" runat="server" CausesValidation="false" cssClass="DisplayNone" aria-hidden="true" Text=" "
        OnClick="RefreshButtonClick" />

    <asp:Button ID="DeleteButton" runat="server" CausesValidation="false"  cssClass="DisplayNone" aria-hidden="true" Text=" " 
        OnClick="DeleteButtonClick" />

</asp:Panel>
