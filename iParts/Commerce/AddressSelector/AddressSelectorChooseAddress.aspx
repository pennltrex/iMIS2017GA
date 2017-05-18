<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="AddressSelectorChooseAddress.aspx.cs"
    Inherits="Asi.Web.iParts.Commerce.AddressSelector.AddressSelectorChooseAddress" %>
<%@ Register TagPrefix="uc1" TagName="PostalCodeLookup" Src="~/iParts/Contact Management/PostalCodeLookup/PostalCodeLookupDisplay.ascx" %>
    
<asp:content id="ContentBody" runat="server" contentplaceholderid="TemplateBody">
    
    <script type="text/javascript">
        //<![CDATA[
        //TODO: Remove this script block to restore use of AddressSelector.js.  Note ther are changes in the code behind as well.
        var ChooseAddressMode = "<%=Mode%>";

        // called to manage addresses
        function ManageAddresses() {
            CloseDialog("ManageAddresses", "");
        }
        
        // close the dialog
        function CloseDialog(action, addressId) {
            var w = GetRadWindow();
            if (w == null) return;
            var r = ConstructResultsObject();
            r.Action = action;
            r.AddressId = addressId;
            w.AsiResults = r;
            w.Close();
        }

        // called when an address is selected and ChooseAddressMode==Path
        function UseAddress_Path(addressId) {
            $('<%=UseAddressIdText.ClientID%>').value = addressId;
            $('<%=UseAddressButton.ClientID%>').click();
        }

        // called when an address is selected and ChooseAddressMode==Party
        function UseAddress_Party(addressId) {
            CloseDialog("AddressSelected", addressId);
        }

        // called after an address has been inserted
        function InsertAddress_Callback(results) {
            if (results != null && typeof (results) == "object") {
                if (results.Saved == true)
                    $('<%=ButtonRefresh.ClientID%>').click();
            }
        }

        // construct the return object
        function ConstructResultsObject() {
            return { AddressId: "", Action: "" };
        }

        function AS_PopulateAfterLookup(address) {
            for (var i = 0; i < prm._form.length; i++) {
                var field = prm._form[i];
                if (field.id.indexOf("Address1Text") !== -1) {
                	AS_SetAddressFields(field, address, 0);
                }
                if (field.id.indexOf("Address2Text") !== -1) {
                	AS_SetAddressFields(field, address, 1);
                }
                if (field.id.indexOf("Address3Text") !== -1) {
                	AS_SetAddressFields(field, address, 2);
                }
                if (field.id.indexOf("CityText") !== -1) {
                	AS_SetAdditionalAddressFields(field, address.CityName);
                }
                if (field.id.indexOf("TextSubEntity") !== -1) {
                	AS_SetAdditionalAddressFields(field, address.CountrySubEntityName);
                }
                if (field.id.indexOf("PostcodeText") !== -1) {
                	AS_SetAdditionalAddressFields(field, address.PostalCode);
                }
            }
        }

        function AS_SetAddressFields(field, address, index) {
            field.value = "";
            if (address.AddressLines.$values[index])
                field.value = address.AddressLines.$values[index];
        }

        function AS_SetAdditionalAddressFields(field, addressItem) {
            field.value = "";
            if (addressItem)
                field.value = addressItem;
        }

        function SyncWithPostCodeLookup(postCode) {
            for (var i = 0; i < prm._form.length; i++) {
                var field = prm._form[i];
                if (field.id.indexOf("PostcodeText") !== -1)
                    field.value = postCode;
            }
        }
        //]]>
    </script>

    <asiweb:PanelTemplateControl ID="EditPanel" runat="server" ShowHeader="false" Collapsible="false" ScrollBars="None" BorderStyle="None">
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
                postbackElem.disabled = true;
                document.getElementById(uiId).focus();
            }
            function PageRequestManager_endRequest(sender, args) {
                $get(uiId).disabled = false;
                if (args.get_error() != undefined) {
                    var error = args.get_error().name;
                    if (error != 'undefined' && error == 'Sys.WebForms.PageRequestManagerServerErrorException')
                        args.set_errorHandled(true);

                    document.getElementById(uiId).focus();
                }                
            }
</script>                           
        <!--Hidden controls-->
        <div style="display:none;visibility:hidden;">
            <asp:Button runat="server" ID="UseAddressButton" OnClick="UseAddress_Click"/>
            <asp:TextBox runat="server" ID="UseAddressIdText" Text="" />
            <asp:Button runat="server" ID="ButtonRefresh" />
        </div>
                           
        <div runat="server" id="DivNoAddresses">
            <asp:Label runat="server" id="LabelNoAddresses" translate="yes"></asp:Label>
        </div>
        <asp:Table runat="server" id="AddressTable" width="100%" >
        </asp:Table>
        
        <br />

        <div runat="server" id="DivAddAddress">
            <asiweb:Hyperlink runat="server" ID="LinkAddAddress" translate="yes"></asiweb:Hyperlink>
        </div>

        <div runat="server" id="DivManageAddresses">
            <asiweb:Hyperlink runat="server" ID="LinkManageAddresses" translate="yes" NavigateUrl="javascript:ManageAddresses();" />
        </div>
       
       <asp:UpdatePanel ID="AddressUpdatePanel" Class="StandardPanel" Style="border-style: none;" runat="server" UpdateMode="Always">
            <ContentTemplate>
        <div runat="server" ID="DivTempAddress" visible="false" translate="yes">
            <br />
            <asiweb:StyledLabel runat="server" Text="Not one of these?  Enter an address." Font-Bold="true"/>
            <br />
            <br />
            <fieldset>
            
                <div class="PanelField Left">
                    <div style="display: inline;">
                        <asiweb:StyledLabel runat="server" ID="CountryLabel" Text="Country" AssociatedControlID="SelectCountry"></asiweb:StyledLabel>
                    </div>
                    <div class="PanelFieldValue">
                        <asp:DropDownList runat="server" ID="SelectCountry" AutoPostBack="True" CausesValidation="False" Width="165"/>
                    </div>
                </div>
                
                <div class="PanelField Left hidden" id="PostalCodeLookupDiv" runat="server">
                    <uc1:PostalCodeLookup runat="server" ID="PostalCodeLookup" jsCallback="AS_PopulateAfterLookup" />
                </div>

                <div class="PanelField Left">
                    <div style="display: inline;">
                        <asiweb:StyledLabel runat="server" ID="AddressLabel" Text="Address" AssociatedControlID="Address1Text"></asiweb:StyledLabel>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox runat="server" ID="Address1Text"></asiweb:BusinessTextBox>
                    </div>
                </div>
                <div class="PanelField Left LabelSpacer">
                    <div style="display: inline;">
                        <asiweb:StyledLabel runat="server" ID="Address2Label" Text="Address" AssociatedControlID="Address2Text" CssClass="screen-reader-text"></asiweb:StyledLabel>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox runat="server" ID="Address2Text"></asiweb:BusinessTextBox>
                    </div>
                </div>
                <div class="PanelField Left LabelSpacer">
                    <div style="display: inline;">
                        <asiweb:StyledLabel runat="server" ID="Address3Label" Text="Address" AssociatedControlID="Address3Text" CssClass="screen-reader-text"></asiweb:StyledLabel>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox runat="server" ID="Address3Text"></asiweb:BusinessTextBox>
                    </div>
                </div>
              
                <div class="PanelField Left">
                    <div style="display: inline;">
                        <asiweb:StyledLabel runat="server" ID="CityLabel" Text="City" AssociatedControlID="CityText"></asiweb:StyledLabel>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox runat="server" ID="CityText"></asiweb:BusinessTextBox>
                    </div>
                </div>
                <div class="PanelField Left">
                    <div style="display: inline;">
                        <asiweb:StyledLabel runat="server" ID="StateLabel" Text="State" AssociatedControlID="SelectSubEntityCode"></asiweb:StyledLabel>
                    </div>
                    <div class="PanelFieldValue">
                        <asp:DropDownList ID="SelectSubEntityCode" runat="server" Visible="false" style="display:inline" Width="165" />
                        <asiweb:BusinessTextBox runat="server" ID="TextSubEntity" Visible="false" style="display:inline"></asiweb:BusinessTextBox>
                        <br /><asiweb:AsiRegularExpressionValidator id="RegExpTextSubEntity" runat="server" ControlToValidate="TextSubEntity"     
                                        ValidationExpression="^[\s\S]{0,50}$" Display="None" />  
                    </div>
                </div>
                <div class="PanelField Left" runat="server" id="PostalCodeRow">
                    <div style="display: inline;">
                        <asiweb:StyledLabel runat="server" ID="PostcodeLabel" Text="Postal code" AssociatedControlID="PostcodeText"></asiweb:StyledLabel>
                    </div>
                    <div class="PanelFieldValue">
                        <asiweb:BusinessTextBox runat="server" ID="PostcodeText"></asiweb:BusinessTextBox>
                    </div>
                </div>

            </fieldset>                
        </div>
        </ContentTemplate>
        </asp:UpdatePanel>              
    </asiweb:PanelTemplateControl>          
</asp:content>
