<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmailProviderConfigurationDisplay.ascx.cs" Inherits="Asi.Web.iParts.Communications.EmailProviderConfiguration.EmailProviderConfigurationDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>


<asp:Panel runat="server" ID="PanelReactivate" CssClass="StandardPanel" BorderStyle="None" translate="yes">
 
    
            <div runat="server" visible="false" id="DivLabelErrorMessage">
                <asp:Label id="LabelErrorMessage" runat="server" CssClass="Error" />
            </div>
    
            <div runat="server" visible="false" id="DivLabelSuccessMessage">
                <asp:Label id="LabelSuccessMessage" runat="server" CssClass="Information" />
                <asiweb:Hyperlink ID="ContinueLink" runat="server" visible="false" />
                <br /><br />
            </div>
            <div runat="server" class="CommandBar" id="Div1">
            <asiweb:StyledButton ID="Reactivate" CssClass="TextButton" OnClick="OnReactivateButtonClicked" CausesValidation="true" runat="server" AutoPostBack="True"/>
            </div>
    </asp:Panel>
<asp:UpdatePanel ID="PriceUpdatePanel" runat="server" UpdateMode="Always">
    <ContentTemplate>
        <asp:Panel runat="server" ID="ContentPanel" CssClass="StandardPanel" BorderStyle="None" translate="yes">
 
    
           
            <%--Organization Name--%>      
            <div style="clear: both;"></div>
            <div runat="server" id="DivOrganizationName">
                <div class="PanelField Left">
                    <div style="display: inline;">
                        <asiweb:StyledLabel runat="server" ID="LabelOrganizationName" CssClass="Required" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Communications.EmailProviderConfiguration.OrganizationName", "Organization name") %>'
                                            AssociatedControlID="TextOrganizationName"/>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox MaxLength="255" runat="server" ID="TextOrganizationName"/>
                        <asiweb:AsiRequiredFieldValidator runat="server" ID="OrganizationNameValidator" ControlToValidate="TextOrganizationName" CssClass="Important" SetFocusOnError="True" />
                    </div>
                </div>
            </div>
            <%--First Name--%>
            <div style="clear: both;"></div>   
            <div runat="server" id="DivFirstName">
                <div class="PanelField Left">
                    <div style="display: inline;">
                        <asiweb:StyledLabel runat="server" ID="LabelFirstName" CssClass="Required" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Communications.EmailProviderConfiguration.FirstName", "First name") %>'
                                            AssociatedControlID="TextFirstName"/>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox MaxLength="50" runat="server" ID="TextFirstName"/>
                        <asiweb:AsiRequiredFieldValidator runat="server" ID="FirstNameValidator" ControlToValidate="TextFirstName" CssClass="Important" SetFocusOnError="True" />
                    </div>
                </div>
            </div>
            <%--Last Name--%>
            <div style="clear: both;"></div>
            <div runat="server" id="DivLastName">
                <div class="PanelField Left">
                    <div style="display: inline;">
                        <asiweb:StyledLabel runat="server" ID="LabelLastName" CssClass="Required" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Communications.EmailProviderConfiguration.LastName", "Last name") %>'
                                            AssociatedControlID="TextLastName"/>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox MaxLength="50" runat="server" ID="TextLastName"/>
                        <asiweb:AsiRequiredFieldValidator runat="server" ID="LastNameValidator" ControlToValidate="TextLastName" CssClass="Important" SetFocusOnError="True" />
                    </div>
                </div>
            </div>
            <%--Country--%>
            <div class="PanelField Left">
                <div style="display: inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelCountry" CssClass="Required" Text='<%#ResourceManager.GetWord("Country") %>'
                                        AssociatedControlID="SelectCountry"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessDropDownList runat="server" id="SelectCountry" AutoPostBack="True" />
                    <asiweb:AsiRequiredFieldValidator runat="server" ID="CountryValidator" ControlToValidate="SelectCountry" CssClass="Important" SetFocusOnError="True" />
                </div>
            </div>
            <%--Address--%>
            <div style="clear: both;"></div>
            <div class="PanelField Left">
                <div style="display: inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelAddress" CssClass="Required" Text='<%#ResourceManager.GetWord("Address") %>'
                                        AssociatedControlID="TextAddress"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox runat="server" MaxLength="100" ID="TextAddress"  />
                    <asiweb:AsiRequiredFieldValidator runat="server" ID="TextAddress1Validator" ControlToValidate="TextAddress" CssClass="Important" SetFocusOnError="True" />
                </div>
            </div>
            <%--City--%>
            <div style="clear: both;"></div>
            <div class="PanelField Left">
                <div style="display: inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelCity" CssClass="Required" Text='<%#ResourceManager.GetWord("City") %>'
                                        AssociatedControlID="TextCity"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox MaxLength="100" runat="server" ID="TextCity"  />
                    <asiweb:AsiRequiredFieldValidator runat="server" ID="TextCityValidator" ControlToValidate="TextCity" CssClass="Important" SetFocusOnError="True" />
                </div>
            </div>
    
            <%--State--%>
            <div style="clear: both;"></div>
            <div class="PanelField Left" id="DivSubEntity" runat="server" >
                <div style="display: inline;">
                    <asiweb:StyledLabel  runat="server" ID="LabelSubEntityCode" CssClass="Required" Text='<%#ResourceManager.GetWord("State") %>'
                                         AssociatedControlID="SelectSubEntityCode"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessDropDownList runat="server" id="SelectSubEntityCode"  />
                    <asiweb:AsiRequiredFieldValidator runat="server" ID="SubEntityCodeValidator" ControlToValidate="SelectSubEntityCode" CssClass="Important" SetFocusOnError="True" />
                    
                    <asiweb:BusinessTextBox MaxLength="15" runat="server" ID="TextSubEntity" Visible="False" />
                    <asiweb:AsiRequiredFieldValidator runat="server" ID="TextSubEntityValidator" ControlToValidate="TextSubEntity" CssClass="Important" SetFocusOnError="True" />
                </div>
            </div>
            <%--Postal Code--%>
            <div style="clear: both;"></div>
            <div class="PanelField Left">
                <div style="display: inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelPostalCode" CssClass="Required" Text='<%#ResourceManager.GetPhrase("Asi.Web.iParts.Communications.EmailProviderConfiguration.PostalCode", "Postal code") %>'
                                        AssociatedControlID="TextPostalCode"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox  MaxLength="50" runat="server" ID="TextPostalCode"  />
                    <asiweb:AsiRequiredFieldValidator runat="server" ID="TextPostalCodeValidator" ControlToValidate="TextPostalCode" CssClass="Important" SetFocusOnError="True" />
                </div>
            </div>
    
     

    
            <%--Phone--%>
            <div style="clear: both;"></div>
            <div class="PanelField Left">
                <div style="display: inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelPhone" CssClass="Required" Text='<%#ResourceManager.GetWord("Phone") %>'
                                        AssociatedControlID="TextPhone"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox  MaxLength="50" runat="server" ID="TextPhone"  />
                    <asiweb:AsiRequiredFieldValidator runat="server" ID="PhoneValidator" ControlToValidate="TextPhone" CssClass="Important" SetFocusOnError="True" />
                </div>
            </div>
    
            <%--Email--%>
            <div style="clear: both;"></div>
            <div class="PanelField Left">
                <div style="display: inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelEmail" CssClass="Required" Text='<%#ResourceManager.GetWord("Email") %>'
                                        AssociatedControlID="TextEmail"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox MaxLength="64" runat="server" ID="TextEmail"  />
                    <asiweb:AsiRequiredFieldValidator runat="server" ID="AsiRequiredFieldValidator1" ControlToValidate="TextEmail" CssClass="Important" SetFocusOnError="True" ValidationGroup="EmailProvider" />
                    <asiweb:EmailValidator runat="server" ID="EmailRegularExpressionValidator" ControlToValidate="TextEmail" Display="Dynamic" ValidationGroup="EmailProvider" />
                </div>
            </div>
    
            <%--Website--%>
            <div style="clear: both;"></div>
            <div class="PanelField Left">
                <div style="display: inline;">
                    <asiweb:StyledLabel runat="server" ID="LabelWebsite" CssClass="Required" Text='<%#ResourceManager.GetWord("Website") %>'
                                        AssociatedControlID="TextWebsite"/>
                </div>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox MaxLength="255" runat="server" ID="TextWebsite"  />
                    <asiweb:AsiRequiredFieldValidator runat="server" ID="WebsiteValidator" ControlToValidate="TextWebsite" CssClass="Important" SetFocusOnError="True" ValidationGroup="EmailProvider" />
                    <asiweb:WebSiteValidator runat="server" ControlToValidate="TextWebsite" ValidationGroup="EmailProvider"></asiweb:WebSiteValidator>
                </div>
            </div>
    
            <div class="ShowFieldset ClearFix">
                <fieldset>
                    <legend runat="server" ID="EmailNotificationsLegend">
                    </legend> 
                    
                    <%--DisableEventNotificationUrl--%>
                    <div style="clear: both;"></div>
                    <div class="PanelField Right">
        
                        <div class="PanelFieldValue">
                            <asiweb:BusinessCheckbox runat="server" ID="CheckBoxDisableEventNotification" AutoPostBack="True"></asiweb:BusinessCheckbox>
                        </div>
                        <div class="AutoWidth">
                            <asiweb:StyledLabel runat="server" ID="LabelDisableEventNotification" Text='<%#ResourceManager.GetPhrase("DisableEventNotifications", "Disable notifications") %>' AssociatedControlID="CheckBoxDisableEventNotification"></asiweb:StyledLabel>
                        </div>
                    </div>   
    
                    <%--Current URL--%>
                    <div style="clear: both;"></div>
                    <div class="PanelField Left" runat="server" ID="CurrentUrlDiv">
                        <div style="display: inline;">
                            <asiweb:StyledLabel runat="server" ID="LabelCurrentUrl" Text='<%#ResourceManager.GetPhrase("NotificationURL", "Notification URL") %>'
                                                AssociatedControlID="ValueCurrentURL"/>
                        </div>
                        <div class="PanelFieldValue">
                            <asiweb:StyledLabel runat="server" ID="ValueCurrentUrl"  />
                        </div>
                    </div> 
    
                    <%--New URL--%>
                    <div style="clear: both;"></div>
                    <div class="PanelField Left Section" runat="server" ID="NewUrlDiv">
                        <div style="display: inline;">
                            <asiweb:StyledLabel runat="server" ID="LabelNewUrl" Text='<%#ResourceManager.GetPhrase("NewURL", "New URL upon save") %>'
                                                AssociatedControlID="ValueNewUrl"/>
                        </div>
                        <div class="PanelFieldValue">
                            <asiweb:StyledLabel MaxLength="255" runat="server" ID="ValueNewUrl"  />
                            <asiweb:InfoControl ID="NewUrlInfo" runat="server"/>
                        </div>
                    </div> 
                    
                    <p id="notificationInfo" runat="server" class="Info"></p>
                </fieldset>
            </div>
    	
        </asp:Panel>
                                
    </ContentTemplate>
</asp:UpdatePanel>