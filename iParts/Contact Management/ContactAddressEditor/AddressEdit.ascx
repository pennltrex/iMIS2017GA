<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddressEdit.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.ContactAddressEditor.AddressEdit" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="uc1" TagName="PostalCodeLookup" Src="../PostalCodeLookup/PostalCodeLookupDisplay.ascx" %>

<asiweb:PanelTemplateControl2 ID="EditPanel" runat="server" ShowHeader="false" Collapsible="false" ScrollBars="None" BorderStyle="None">
<script type="text/javascript">
	// Create the event handlers for PageRequestManager (this cannot be placed on the separate js file)
	var prm = Sys.WebForms.PageRequestManager.getInstance();

	prm.add_initializeRequest(PageRequestManager_initializeRequest);
	prm.add_beginRequest(PageRequestManager_beginRequest);
	prm.add_endRequest(PageRequestManager_endRequest);

	var uiId = '';
	function PageRequestManager_initializeRequest(sender, args) {
		if (sender.get_isInAsyncPostBack()) {
			args.set_cancel(true);
		}
	}
	function PageRequestManager_beginRequest(sender, args) {
		var postbackElem = args.get_postBackElement();
		uiId = postbackElem.id;
		document.getElementById(uiId).focus();      // Ensure focus comes back to the posting control, but do this before we disable the control, to avoid an IE8 JS failure
		postbackElem.disabled = true;
	}
	function PageRequestManager_endRequest(sender, args) {
		var elem = $get(uiId);
		if (elem && elem.length > 0) {
			elem.disabled = false;
			if (args.get_error() != undefined) {
				var error = args.get_error().name;
				if (error != 'undefined' && error == 'Sys.WebForms.PageRequestManagerServerErrorException')
					args.set_errorHandled(true);
			}

			document.getElementById(uiId).focus();
		}
	}

	function AdjustPadding(sender, args) {
		var div = jQuery('div[id$=SelectPurpose]')[0];
		if (div != null) {
			var parentDiv = div.parentNode;
			if (parentDiv != null)
				parentDiv.setAttribute("style", "padding-left: 8px;");
		}
	}
	function CAE_PopulateAfterLookup(address) {
		var isDirtyField;
		for (var i = 0; i < prm._form.length; i++) {
		    var field = prm._form[i];

			if (field.id.indexOf("TextAddress1") !== -1) {
				CAE_SetAddressFields(field, address, 0);
			}
			if (field.id.indexOf("TextAddress2") !== -1) {
				CAE_SetAddressFields(field, address, 1);
			}
			if (field.id.indexOf("TextAddress3") !== -1) {
				CAE_SetAddressFields(field, address, 2);
			}
			if (field.id.indexOf("TextCity") !== -1) {
				CAE_SetAdditionalAddressFields(field, address.CityName);
			}
			if (field.id.indexOf("TextSubEntity") !== -1) {
				CAE_SetAdditionalAddressFields(field, address.CountrySubEntityName);
			}
			if (field.id.indexOf("TextPostalCode") !== -1) {
				CAE_SetAdditionalAddressFields(field, address.PostalCode);
			}
			if (field.id.indexOf("AddressIsDirtyControl") !== -1) {
				isDirtyField = field;
			}
		}
		isDirtyField.value = "false";
	}

	function CAE_SetAddressFields(field, address, index) {
        field.value = "";
        if (address.AddressLines.$values[index])
            field.value = address.AddressLines.$values[index];
    }

	function CAE_SetAdditionalAddressFields(field, addressItem) {
        field.value = "";
        if (addressItem)
            field.value = addressItem;
    }

</script>
    <div runat="server" ID="ContentWrapper" translate="yes">
        <div style="padding:5px;">
            <asp:HiddenField ID="AddressIsDirtyControl" runat="server" />
            <asp:HiddenField ID="DeliveryPoint" runat="server" />
            <asp:HiddenField ID="BarCode" runat="server" />
            <asp:HiddenField ID="BarcodeSortPlanNumber" runat="server"/>
            <asp:Label id="LabelErrorMessage" runat="server" visible="false" cssclass="Error" />
            
            <div runat="server" ID="DivLabelPurpose" class="PanelTitle">
                <asiweb:StyledLabel id="LabelPurposeCaption" runat="server" Text="Address" />
            </div>      
            
            <div runat="server" id="DivValidateAddress">
                <asiweb:AddressValidationControl ID="AddressValidator" runat="server" />
            </div>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
            <table class="Form FullWidth">
                <tbody>
                    <tr>
                        <td>
                        <div class="RegistrantInfoBadgeBackground" id="DivRegistrantInfo" runat="server" Visible="False">
                                <div class="RegistrantInfoBadge">
                                    <asp:Image runat="server" ID="RegistrationEventImage" />
                                    <asp:Image runat="server" SkinID="EventSearchImage" ID="DefaultEventImage"/> 
                                    <fieldset>
                                        <div>
                                            <asiweb:StyledLabel runat="server" RenderPanelField="true" ID="FullName" DisplayCaption="True" PositionCaption="Left" CssClass="SectionLabel"/>
                                        </div>
                                                    
                                        <div class="PanelField Left">
                                            <div class="PanelFieldLabel">
                                                <asiweb:StyledLabel runat="server" ID="RegInfoLabelInformalNamePrompt" 
                                                                    AssociatedControlID="RegInfoInformalName" />
                                            </div>
                                            <div class="PanelFieldValue">
                                                <asiweb:BusinessTextBox runat="server" ID="RegInfoInformalName" TextMode="SingleLine" />
                                                <asiweb:AsiRegularExpressionValidator id="RegExpRegInfoInformalName" runat="server"     
                                                    ControlToValidate="RegInfoInformalName"     
                                                    ValidationExpression="^[\s\S]{0,20}$"
                                                    Display="None" />
                                            </div>
                                        </div>                                        
                                        <div class="PanelField Left">
                                            <div class="PanelFieldLabel">
                                                <asiweb:StyledLabel runat="server" ID="RegInfoLabelOrganizationTitlePrompt" 
                                                                    AssociatedControlID="RegInfoOrganizationTitle" />
                                                        
                                            </div>
                                            <div class="PanelFieldValue">
                                                <asiweb:BusinessTextBox runat="server" ID="RegInfoOrganizationTitle" TextMode="SingleLine" />
                                                <asiweb:AsiRegularExpressionValidator id="RegExpRegInfoOrganizationTitle" runat="server"     
                                                    ControlToValidate="RegInfoOrganizationTitle"     
                                                    ValidationExpression="^[\s\S]{0,80}$"
                                                    Display="None" />
                                            </div>
                                        </div>                                        
                                        <div class="PanelField Left">
                                            <div class="PanelFieldLabel">
                                                <asiweb:StyledLabel runat="server" ID="RegInfoLabelOrganizationNamePrompt" 
                                                                    AssociatedControlID="RegInfoOrganizationName" />
                                                        
                                            </div>
                                            <div class="PanelFieldValue">
                                                <asiweb:BusinessTextBox runat="server" ID="RegInfoOrganizationName" TextMode="SingleLine" />
                                                <asiweb:AsiRegularExpressionValidator id="RegExpRegInfoOrganizationName" runat="server"     
                                                    ControlToValidate="RegInfoOrganizationName"     
                                                    ValidationExpression="^[\s\S]{0,80}$"
                                                    Display="None" />
                                            </div>
                                        </div>                                        
                                    </fieldset>
                                </div>                        
                            </div>
                        <div id="DivAddressEntry" runat="server">
                        <asiweb:StyledLabel CssClass="SectionLabel" ID="LabelPurposeHeader" runat="server" Text="Address" Visible="False" />
                        <asp:Table runat="server">
                            <asp:TableRow runat="server" id="RowPurpose" CssClass="PanelField Left">
                               <asp:TableCell runat="server" >
                               <asiweb:StyledLabel id="SelectPurposeLabel" runat="server" AssociatedControlID="SelectPurpose" Text="Purpose" />
                                </asp:TableCell>
    <asp:TableCell runat="server">
        <asiweb:BusinessComboBox ID="SelectPurpose" runat="server" TranslateOnlyCaptionAndToolTip="true" RenderPanelField="True" AutoPostBack="True" AllowCustomText="false" DisplayCaption="False" />
        <asiweb:AsiRequiredFieldValidator runat="server" ID="RequiredValidatorCode" ControlToValidate="SelectPurpose" Display="Dynamic" SetFocusOnError="true"></asiweb:AsiRequiredFieldValidator>
    </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" CssClass="PanelField Left">
                                <asp:TableCell runat="server" >
                                    <asiweb:StyledLabel id="LabelCountryPrompt" runat="server" AssociatedControlID="SelectCountry" />
                                </asp:TableCell>
                                <asp:TableCell runat="server">
                                    <div class="PanelFieldValue">
                                        <asp:DropDownList runat="server" ID="SelectCountry" AutoPostBack="True" CausesValidation="False" Width="165"/>
                                    </div>
                                </asp:TableCell>
                            </asp:TableRow>
							<asp:TableRow runat="server" CssClass="PanelField Left hidden" ID="RowPostalCodeLookup">
								<asp:TableCell runat="server">
									<uc1:PostalCodeLookup runat="server" ID="PostalCodeLookup" jsCallback="CAE_PopulateAfterLookup"/>
								</asp:TableCell>
							</asp:TableRow>
                            <asp:TableRow runat="server" CssClass="PanelField Left">
                                <asp:TableCell runat="server">
                                    <asiweb:StyledLabel id="LabelAddressLine1Prompt" runat="server" AssociatedControlID="TextAddress1" />
                                </asp:TableCell>
                                <asp:TableCell runat="server">
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessTextBox id="TextAddress1" runat="server" TextMode="SingleLine" />
                                        <asiweb:AsiRegularExpressionValidator id="RegExpTextAddress1" runat="server"     
                                                        ControlToValidate="TextAddress1"     
                                                        ValidationExpression="^[\s\S]{0,40}$"
                                                        Display="None" /> 
                                    </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" CssClass="PanelField Left LabelSpacer">
                                <asp:TableCell runat="server">
                                    <asiweb:StyledLabel id="LabelAddressLine2Prompt" runat="server" AssociatedControlID="TextAddress2" CssClass="screen-reader-text" />
                                </asp:TableCell>
                                <asp:TableCell runat="server">
                                    <div class="PanelFieldValue">                   
                                        <asiweb:BusinessTextBox id="TextAddress2" runat="server" TextMode="SingleLine" />
                                        <asiweb:AsiRegularExpressionValidator id="RegExpTextAddress2" runat="server"     
                                                        ControlToValidate="TextAddress2"     
                                                        ValidationExpression="^[\s\S]{0,40}$"
                                                        Display="None" />  
                                    </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" CssClass="PanelField Left LabelSpacer">
                                <asp:TableCell runat="server">
                                    <asiweb:StyledLabel id="LabelAddressLine3Prompt" runat="server" AssociatedControlID="TextAddress3" CssClass="screen-reader-text" />
                                </asp:TableCell>
                                <asp:TableCell runat="server">
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessTextBox id="TextAddress3" runat="server" TextMode="SingleLine" />
                                        <asiweb:AsiRegularExpressionValidator id="RegExpTextAddress3" runat="server"     
                                                        ControlToValidate="TextAddress3"     
                                                        ValidationExpression="^[\s\S]{0,40}$"
                                                        Display="None" />   
                                    </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" id="RowCity" CssClass="PanelField Left">
                                <asp:TableCell runat="server">
                                    <asiweb:StyledLabel id="LabelCityPrompt" runat="server" AssociatedControlID="TextCity" />
                                </asp:TableCell>
                                <asp:TableCell runat="server">
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessTextBox id="TextCity" runat="server" TextMode="SingleLine" />
                                        <br /><asiweb:AsiRegularExpressionValidator id="RegExpTextCity" runat="server"     
                                                ControlToValidate="TextCity"     
                                                ValidationExpression="^[\s\S]{0,40}$"
                                                Display="None" /> 
                                    </div>      
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" id="rowSubEntity" CssClass="PanelField Left">
                                <asp:TableCell runat="server">
                                    <asiweb:StyledLabel id="LabelSubEntityCodePrompt" runat="server" AssociatedControlID="SelectSubEntityCode" />
                                </asp:TableCell>
                                <asp:TableCell runat="server">
                                    <div class="PanelFieldValue">
                                        <asp:DropDownList ID="SelectSubEntityCode" runat="server" Visible="false" Width="165" />
                                        <asiweb:BusinessTextBox id="TextSubEntity" runat="server" TextMode="SingleLine" Visible="false"  />
                                        <br /><asiweb:AsiRegularExpressionValidator id="RegExpTextSubEntity" runat="server" ControlToValidate="TextSubEntity"     
                                                        ValidationExpression="^[\s\S]{0,15}$" Display="None" />   
                                    </div>                               
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" id="RowPostcode" CssClass="PanelField Left">
                                <asp:TableCell runat="server">
                                    <asiweb:StyledLabel id="LabelPostalCodePrompt" runat="server" AssociatedControlID="TextPostalCode" />
                                </asp:TableCell>
                                <asp:TableCell runat="server">
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessTextBox id="TextPostalCode" runat="server" TextMode="SingleLine" />
                                        <br /><asiweb:AsiRegularExpressionValidator id="RegExpTextPostalCode" runat="server" EnableClientScript="true"      
                                                ControlToValidate="TextPostalCode"     
                                                ValidationExpression="^[\s\S]{0,10}$"
                                                Display="None" />  
                                    </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" CssClass="PanelField Left">
                                <asp:TableCell runat="server">
                                    <asiweb:StyledLabel id="LabelPhonePrompt" runat="server" AssociatedControlID="TextPhone" />
                                </asp:TableCell>
                                <asp:TableCell runat="server">
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessTextBox id="TextPhone" runat="server" TextMode="SingleLine" />
                                        <br /><asiweb:AsiRegularExpressionValidator id="RegExpTextPhone" runat="server"     
                                                ControlToValidate="TextPhone"     
                                                ValidationExpression="^[\s\S]{0,25}$"
                                                Display="None" />  
                                    </div>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" id="RowFaxNumber" CssClass="PanelField Left">
                                <asp:TableCell runat="server">
                                    <asiweb:StyledLabel id="LabelFaxPrompt" runat="server" AssociatedControlID="TextFax" />
                                </asp:TableCell>
                                <asp:TableCell runat="server">
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessTextBox id="TextFax" runat="server" TextMode="SingleLine" />
                                        <br /><asiweb:AsiRegularExpressionValidator id="RegExpTextFax" runat="server"     
                                                        ControlToValidate="TextFax"     
                                                        ValidationExpression="^[\s\S]{0,25}$"
                                                        Display="None" /> 
                                    </div>

                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow runat="server" CssClass="PanelField Left">
                                <asp:TableCell runat="server">
                                    <asiweb:StyledLabel id="LabelEmailPrompt" runat="server" AssociatedControlID="TextEmail" />
                                </asp:TableCell>
                                <asp:TableCell runat="server">
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessTextBox id="TextEmail" runat="server" TextMode="SingleLine" />  
                                        <!-- br tags are incorporated into the validator message to avoid an extra line appearing on the page  -->
                                        <asiweb:AsiRegularExpressionValidator id="RegExpTextEmailFormat" runat="server" 
                                                        ControlToValidate="TextEmail"
                                                        ValidationExpression="[^\s@]+@[^\s@]+\.[^\s@]+"
                                                        Display="None" /> 
                                        <asiweb:AsiRegularExpressionValidator id="RegExpTextEmailLength" runat="server" 
                                                        ControlToValidate="TextEmail"
                                                        ValidationExpression="^[\s\S]{0,100}$"
                                                        Display="None" />        
                                    </div>        
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                        </div>
                        </td>
                        <td valign="top" id="RightCell" runat="server">
                            <asp:Panel class="AutoWidth Section" runat="server" id="PreferredPanel">
                                <asp:CheckBox id="CheckBoxPreferredMailing" Visible="True" runat="server" /><br />
                                <asp:CheckBox id="CheckBoxPreferredShipping" Visible="True" runat="server" /><br />
                                <asp:CheckBox id="CheckBoxPreferredBilling" Visible="True" runat="server" /><br />
                            </asp:Panel>

                            <asiweb:BusinessComboBox id="SelectAddressStatus" runat="server" RenderPanelField="True" visible="false"
                                Caption="Status" DisplayCaption="True" PositionCaption="Left" AllowCustomText="false"  />

                            <div runat="server" id="OptionalGroup" class="ShowFieldset Section">
                                <fieldset>
                                    <legend><%=OptionalGroupLabel %></legend>  
                                    <div class="PanelField Left">
                                        <div class="PanelFieldLabel">
                                            <asiweb:StyledLabel runat="server" ID="LabelInformalNamePrompt" 
                                                AssociatedControlID="InformalName">
                                            </asiweb:StyledLabel>
                                        </div>
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessTextBox runat="server" ID="InformalName" TextMode="SingleLine" />
                                            <asiweb:AsiRegularExpressionValidator id="RegExpInformalName" runat="server"     
                                                ControlToValidate="InformalName"     
                                                ValidationExpression="^[\s\S]{0,20}$"
                                                Display="None" />
                                        </div>
                                    </div>                                        
                                    <div class="PanelField Left">
                                        <div class="PanelFieldLabel">
                                            <asiweb:StyledLabel runat="server" ID="LabelOrganizationTitlePrompt" 
                                                AssociatedControlID="OrganizationTitle">
                                            </asiweb:StyledLabel>
                                        </div>
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessTextBox runat="server" ID="OrganizationTitle" TextMode="SingleLine" />
                                            <asiweb:AsiRegularExpressionValidator id="RegExpOrganizationTitle" runat="server"     
                                                ControlToValidate="OrganizationTitle"     
                                                ValidationExpression="^[\s\S]{0,80}$"
                                                Display="None" />
                                        </div>
                                    </div>                                        
                                    <div class="PanelField Left">
                                        <div class="PanelFieldLabel">
                                            <asiweb:StyledLabel runat="server" ID="LabelOrganizationNamePrompt" 
                                                AssociatedControlID="OrganizationName">
                                            </asiweb:StyledLabel>
                                        </div>
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessTextBox runat="server" ID="OrganizationName" TextMode="SingleLine" />
                                            <asiweb:AsiRegularExpressionValidator id="RegExpOrganizationName" runat="server"     
                                                ControlToValidate="OrganizationName"     
                                                ValidationExpression="^[\s\S]{0,80}$"
                                                Display="None" />
                                        </div>
                                    </div>                                        
                                </fieldset>
                            </div>
                            
                            

                            <asiweb:BusinessTextBox id="TextNote" runat="server" TextMode="MultiLine" Rows="5" RenderPanelField="True" DisplayCaption="True" PositionCaption="Top" />  
                        </td>
                    </tr>          
                </tbody> 
            </table>
            </ContentTemplate>
        </asp:UpdatePanel> 
        </div>
    </div>
</asiweb:PanelTemplateControl2>
