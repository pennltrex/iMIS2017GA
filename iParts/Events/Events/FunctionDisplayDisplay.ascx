<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FunctionDisplayDisplay.ascx.cs" Inherits="Asi.Web.iParts.Events.FunctionDisplayDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asiweb:TitleBar ID="TitleBar" OptionsMenuBehavior="AlwaysDisplay" runat="server" DoNotTranslateTitle="true" CssClass="Section"/>
    <div runat="server" id="TitleDiv" class="Section">
        <asi:StyledLabel runat="server" ID="TitleText" />
    </div>
    <div runat="server" id="DataDiv" class="AddPadding ClearFix">
        <div runat="server" id="ImageDiv">
            <asp:Image ID="FunctionImage" runat="server" ImageUrl="" />
        </div>
        <div runat="server" id="DesignTimeImageDiv" class="Section" visible="false">
            <asi:StyledLabel runat="server" ID="DesignTypeImageLabel" />
        </div>
        <div runat="server" id="DescriptionDiv" class="Section">
            <asi:StyledLabel runat="server" ID="DescriptionData" TranslateOnlyCaptionAndToolTip="True" />
        </div>
        <div runat="server" id="AdditionalInfoDiv" class="Section">
            <asi:StyledLabel runat="server" ID="AdditionalInfoHtmlData" />
        </div> 
        <div runat="server" id="DesignTimeDescriptionDiv" class="Section" visible="false">
            <asi:StyledLabel runat="server" ID="DesignTimeDescriptionLabel" translate="yes" />
        </div>       
        <div class="PanelBlock">
            <div class="PanelField Left" runat="server" id="CategoryDiv">
                <div class="PanelFieldLabel">
                    <asi:StyledLabel runat="server" ID="CategoryLabel" translate="yes" CssClass="Label" Text="Category" />
                </div>
                <div class="PanelFieldValue">
                    <asi:StyledLabel runat="server" ID="CategoryData" />
                </div>
            </div>
            <div class="PanelField" runat="server" id="TrackDiv">
                <div class="PanelFieldLabel">
                    <asi:StyledLabel runat="server" ID="TrackLabel" translate="yes"  CssClass="Label" Text="Track" />
                </div>
                <div class="PanelFieldValue">
                    <asi:StyledLabel runat="server" ID="TrackData" />
                </div>
            </div> 
            <div runat="server" id="WhereDiv" class="PanelField Left" translate="yes" Visible="False">
                <div class="PanelFieldLabel">
                    <asi:StyledLabel runat="server" ID="WhereCaption" Text="Where" class="Label" />
                </div>
                <div class="PanelFieldValue">
                    <div runat="server" id="LocationDiv">
                        <asi:StyledLabel runat="server" ID="LocationData" />
                    </div>
                    <div runat="server" id="AddressDiv">
                        <asi:StyledLabel runat="server" ID="AddressData" Text="" />
                    </div>
                </div>
            </div>
            <div runat="server" id="EmailDiv" class="PanelField Left" Visible="False">
                <div class="PanelFieldLabel">
                    <asi:StyledLabel runat="server" ID="EmailCaption" Text="Email" translate="yes" class="Label" />
                </div>
                <div class="PanelFieldValue">
                    <asi:StyledLabel runat="server" ID="EmailData" Text="" />
                </div>
            </div>
            <div runat="server" id="PhoneDiv" class="PanelField Left" Visible="False">
                <div class="PanelFieldLabel">
                    <asi:StyledLabel runat="server" ID="PhoneCaption" Text="Phone" translate="yes" class="Label" />
                </div>
                <div class="PanelFieldValue">
                    <asi:StyledLabel runat="server" ID="PhoneData" Text="" />
                </div>
            </div>
            <div runat="server" id="WhenDiv" class="PanelField Left">
                <div class="PanelFieldLabel">
                    <span ID="WhenCaption" runat="server" translate="yes" class="Label">When</span>
                </div>
                <div class="PanelFieldValue">
                    <asi:StyledLabel runat="server" ID="WhenData" />
                </div>
            </div>
            <div runat="server" id="PriceDiv" class="PanelField Left">
                <div class="PanelFieldLabel">
                    <label ID="PriceCaption" runat="server" translate="yes" class="Label">Price</label>
                </div>
                <div class="PanelFieldValue">
                    <asi:StyledLabel runat="server" ID="PriceData" />
                </div>
            </div>
        </div>  

        <div runat="server" id="RegistrationInfoDiv" visible="false" class="Section">           
            <div runat="server" id="QuantityFields" Visible="False" class="PanelField Left">
                <asiweb:StyledLabel runat="server" ID="QuantityLabel" translate="yes" AssociatedControlID="QuantityInput" CssClass="AutoWidth"/>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox runat="server" ID="QuantityInput" Text="1" CssClass="InputXXSmall" ValidationGroup="QuantityInputValidation" translate="yes" />
                    <asp:RangeValidator runat="server" ID="QuantityInputRangeValidator" Type="Integer" Display="Dynamic" ControlToValidate="QuantityInput" ValidationGroup="QuantityInputValidation" />
                </div>
            </div>
            <asiweb:StyledButton runat="server" ID="AddButton"  OnClick="AddButtonOnClick" ValidationGroup="QuantityInputValidation" />
            <div>
                <asp:LinkButton ID="RemoveLinkButton" runat="server" OnClick="RemoveButtonOnClick" translate="yes" />
            </div>                     
            <div runat="server" ID="DivInfoRegistrationFull" Visible="False" class="AsiValidation" style="max-width: 350px;">
                      <asi:StyledLabel ID="RegistrationFullLabel" runat="server"  /> 
                      <div ID="DivWaitList" runat="server" Visible="False">
                          <asi:BusinessRadioButtonList runat="server" ID="WaitListRadioButtons" DisplayCaption="False" AutoPostBack="True" OnSelectedIndexChanged="WaitListRadioButtons_OnSelectedIndexChanged">
                               <asp:ListItem Text="Add to waitlist" Value="Waitlist" />
                               <asp:ListItem Text="Register" Value="Register"/>                      
                          </asi:BusinessRadioButtonList>
                      </div>       
             </div>        
        </div>

        <div runat="server" id="FunctionUnavailableMessageDiv" visible="false" class="Section">
            <asi:StyledLabel runat="server" ID="FunctionUnavailableMessageLabel" translate="yes" />
        </div>
    </div>
    <div style="display:none;visibility:hidden;">
        <asp:Button ID="RefreshButton" runat="server" CausesValidation="false" OnClick="RefreshButtonClick" />
        <asp:Button ID="RefreshDirtyButton" runat="server" CausesValidation="false" OnClick="RefreshDirtyButtonClick" />
        <asp:Button ID="DeleteButton" runat="server" CausesValidation="false" OnClick="DeleteButtonClick" />
    </div>
</asp:Panel>    
