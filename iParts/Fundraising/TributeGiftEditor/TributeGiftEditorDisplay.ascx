<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TributeGiftEditorDisplay.ascx.cs"
	Inherits="Asi.Web.iParts.Fundraising.TributeGiftEditor.TributeGiftEditorDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Import Namespace="Asi.Web.iParts.Fundraising.EFTBatchStatus" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="cac" TagName="ContactAccountCreator" Src="~/iParts/Contact Management/ContactAccountCreator/ContactAccountCreatorDisplay.ascx" %>
<asp:Panel ID="TributeGiftEditorDisplayPanel" runat="server" Translate="Yes">
    <div class="PanelField Top CalloutPanelField1">			
		<asiweb:StyledLabel ID="StyledLabel1" runat="server" Text="Is this Donation a tribute?" DisplayCaption="False" CssClass="Label" />			
	</div>
    <br/>
    <div class="PanelFieldValue AutoWidth FloatNone">
    <fieldset>
        <legend>Is this donation a tribute</legend>
        <asp:RadioButtonList ID="DisplayTributeOptions" runat="server" RepeatDirection="Vertical" RepeatLayout="Flow">
            <asp:ListItem Value="true">Yes</asp:ListItem>
            <asp:ListItem Value="false">No</asp:ListItem>
        </asp:RadioButtonList> 
    </fieldset>
    </div>          
	<div class="PanelField ">
		<asp:Panel ID="DetailsPanel" runat="server">
			<asiweb:BusinessDropDownList runat="server" ID="TributeTypes" DisplayCaption="true" Caption="Select tribute type" RenderPanelField="true"></asiweb:BusinessDropDownList>
			<asiweb:BusinessTextBox runat="server" ID="Name" DisplayCaption="true" Caption="Name" RenderPanelField="true"></asiweb:BusinessTextBox>
		    <asiweb:BusinessComboBox runat="server" ID="HonoreeNameComboBox" DisplayCaption="true" Caption="Name" RenderPanelField="true" 
                EnableLoadOnDemand="true" ShowMoreResultsBox="false" EnableVirtualScrolling="True" ShowNullItem="False" ShowToggleImage="false" AllowCustomText="true" 
                OnItemsRequested="HonoreeNameComboBoxItemsRequested" MaxLength="110" Width="250" Height="185" />
			<asiweb:BusinessTextBox runat="server" ID="Message" DisplayCaption="true" Caption="Tribute message" TextMode="MultiLine" Rows="5" RenderPanelField="true" CausesValidation="true"></asiweb:BusinessTextBox>
		    <asp:RegularExpressionValidator ID="MessageRegularExpressionValidator" runat="server" Display="Dynamic" ControlToValidate="Message" ErrorMessage="You can enter a maximum of 2000 characters in the tribute message." ValidationExpression="[\w\W*.]{0,2000}" SetFocusOnError="true" />
            <asp:Panel ID="TributeNotifyMainPanel" runat="server">
                <asiweb:BusinessCheckBox class="PanelFieldValue AutoWidth FloatNone" runat="server" ID="TributeNotification" Text="Please inform the following person about my donation"/>
				<div class="PanelField ">
					<asp:Panel ID="TributeNotifyPanel" runat="server" >					    
						<cac:ContactAccountCreator ID="ContactAccountCreator" runat="server"
                        ShowBorder="false"
                        Collapsible = "false"
						AccountTypeAllowed="IndividualOnly"
						HideForAuthenticatedUsers="false"
						IncludeSuffix="false"
						IncludePrefix="false"
						IncludePhone="false"
						IncludeEmail="false"                                                
						RequireAddress="<%# RequireAddress %>"
						MultipleAddressLines="<%# MultipleAddressLines %>"
						CreateAddressPurpose="<%# CreateAddressPurpose %>"                        
						IncludeLogOnLink="false"
						IncludeOptionToCreateLogon="false"
						RequireUserToCreateLogon="false"
						UseEmailAsLogon="false" />
					</asp:Panel>
				</div>
            </asp:Panel>
        </asp:Panel>
    </div>
    <asp:HiddenField ID="ValidatorIds" runat="server" />
</asp:Panel>
