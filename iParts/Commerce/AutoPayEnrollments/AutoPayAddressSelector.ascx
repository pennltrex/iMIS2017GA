<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AutoPayAddressSelector.ascx.cs" Inherits="Asi.Web.iParts.Commerce.AutoPayEnrollments.AutoPayAddressSelector" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="uc1" TagName="PostalCodeLookup" Src="~/iParts/Contact Management/PostalCodeLookup/PostalCodeLookupDisplay.ascx" %>

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
	function CAE_PopulateAfterLookup(address) {
		var isDirtyField;
		for (var i = 0; i < prm._form.length; i++) {
		    var field = prm._form[i];

			if (field.id.indexOf("TextAddress1") !== -1) {
			    SetAddressFields(field, address, 0);
			}
			if (field.id.indexOf("TextAddress2") !== -1) {
			    SetAddressFields(field, address, 1);
			}
			if (field.id.indexOf("TextAddress3") !== -1) {
			    SetAddressFields(field, address, 2);
			}
			if (field.id.indexOf("TextCity") !== -1) {
			    SetAdditionalAddressFields(field, address.CityName);
			}
			if (field.id.indexOf("TextSubEntity") !== -1) {
			    SetAdditionalAddressFields(field, address.CountrySubEntityName);
			}
			if (field.id.indexOf("TextPostalCode") !== -1) {
			    SetAdditionalAddressFields(field, address.PostalCode);
			}
			if (field.id.indexOf("AddressIsDirtyControl") !== -1) {
				isDirtyField = field;
			}
		}
		isDirtyField.value = "false";
	}

    function SetAddressFields(field, address, index) {
        field.value = "";
        if (address.AddressLines.$values[index])
            field.value = address.AddressLines.$values[index];
    }

    function SetAdditionalAddressFields(field, addressItem) {
        field.value = "";
        if (addressItem)
            field.value = addressItem;
    }

</script>
<div runat="server" ID="ContentWrapper" translate="yes">
      
    <asp:HiddenField ID="AddressIsDirtyControl" runat="server" />
    <asp:HiddenField ID="DeliveryPoint" runat="server" />
    <asp:HiddenField ID="Barcode" runat="server" />
    <asp:HiddenField ID="BarcodeSortPlanNumber" runat="server"/>
    <asp:Label id="LabelErrorMessage" runat="server" visible="false" cssclass="Error" />
          
    <div runat="server" id="DivValidateAddress">
        <asiweb:AddressValidationControl ID="AddressValidator" runat="server" />
    </div> 
    <asiweb:BusinessComboBox id="SelectAddressStatus" runat="server" RenderPanelField="True" visible="false"
                                Caption="Status" DisplayCaption="True" PositionCaption="Left" AllowCustomText="false"  />
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <div class="FullWidth">                
                 <div id="DivAddressEntry" runat="server">
                        <asp:Table runat="server">
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
                        </asp:Table>
                        </div>

            </div>
            </ContentTemplate>
        </asp:UpdatePanel> 
</div>
</asiweb:PanelTemplateControl2>
