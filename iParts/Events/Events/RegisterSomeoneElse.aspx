<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterSomeoneElse.aspx.cs" Inherits="Asi.Web.iParts.Events.RegisterSomeoneElse" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="uc1" TagName="ContactAccountCreator" Src="~/iParts/Contact Management/ContactAccountCreator/ContactAccountCreatorDisplay.ascx" %>
<%@ Register TagPrefix="uc1" TagName="RegistrantInfoEdit" Src="RegistrantInfoEdit.ascx" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asp:Content id="ContentPanel" runat="server" contentplaceholderid="TemplateBody" translate="yes">
    <input type="hidden" id="PartyId" runat="server"/>   
    <input type="hidden" id="AddressId" runat="server"/>   
    <asiweb:PanelTemplateControl ID="PanelTemplateControl1" runat="server" Collapsible="False" BorderWidth="0">
        <asp:Panel runat="server" ID ="RegistrantTypePanel" translate="yes">
            <div class="ShowFieldset">
                <fieldset style="margin-bottom: 0.375em;">
                    <legend>
                        <asp:Label runat="server" ID="LabelLegend"/>
                    </legend>
                        <asp:RadioButton ID="SelectContact" runat="server" GroupName="RegistrantType" Checked="True" AutoPostBack="True" OnCheckedChanged="RegistrantTypeChanged" />
                        <asiweb:BusinessComboBox runat="server" id="ContactComboBox" RenderPanelField="false" DisplayCaption="false" AutoPostBack="True" OnSelectedIndexChanged="ContactComboBoxSelectedIndexChanged"
                EnableLoadOnDemand="true" ShowMoreResultsBox="true" EnableVirtualScrolling="True" ShowNullItem="true" OnItemsRequested="ContactComboBoxItemsRequested" CausesValidation="False" Width="200px"
                 IsCaseSensitive="false" MaxLength="80" ShowToggleImage="false"  AllowCustomText="true" Height="185px" /> 
                        <br>
                        <asp:RadioButton ID="AddContact" runat="server" GroupName="RegistrantType" AutoPostBack="True" OnCheckedChanged="RegistrantTypeChanged"  />
                </fieldset>
            </div>
        </asp:Panel>
        <asp:Panel runat="server" ID="RegistrantInfoPanel" Visible="False">
            <uc1:RegistrantInfoEdit ID="RegistrantInfo" runat="server" />
        </asp:Panel>
            <div runat="server" ID="DivInfoRegistrationFull" Visible="False" class="AsiValidation FloatRight" style="width: 25%">
         <asi:StyledLabel ID="RegistrationFullLabel" runat="server" Text="This event is full."  /> 
         <div ID="DivWaitList" runat="server">
              <asi:BusinessRadioButtonList runat="server" ID="WaitListRadioButtons" DisplayCaption="False" OnSelectedIndexChanged="WaitListRadioButtons_OnSelectedIndexChanged">
                   <asp:ListItem Text="Add to waitlist" Value="Waitlist" />
                   <asp:ListItem Text="Register" Value="Register"/>                      
               </asi:BusinessRadioButtonList>
               <asp:RequiredFieldValidator runat="server" ControlToValidate="WaitListRadioButtons" ID="WaitListValidator" ErrorMessage="Please choose an option." Display="Dynamic" Enabled="False"></asp:RequiredFieldValidator>
         </div>       
    </div>
        <asp:Panel runat="server" ID="NewContactPanel">
            <uc1:ContactAccountCreator runat="server" ID="ContactAccountCreator" 
                CssClass="RegistrantInfoAddressEntry"
                Collapsible="false"
                ShowBorder="false"
                HideForAuthenticatedUsers="False" 
                AccountTypeAllowed="IndividualOnly"
                IncludePrimaryOrganizationSelection="true"
                RequirePrimaryOrganizationSelection="false"
                IncludePrefix="true" 
                IncludeSuffix="true"
                IncludeDesignation="true"
                IncludeInformalName="true"
                IncludeTitle="true"
                IncludePhone="true"
                IncludeAddress="true"                               
                RequireAddress="false"
                MultipleAddressLines="true"/>
        </asp:Panel>
    </asiweb:PanelTemplateControl>
</asp:Content>
