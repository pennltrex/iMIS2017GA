<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" EnableViewState="true" CodeBehind="Setup.aspx.cs"
    Inherits="Asi.Web.UI.Common.Utility.CustomersSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">

    <telerik:RadAjaxLoadingPanel BackgroundPosition="Center" BackgroundTransparency="0" ID="LoadingPanel" IsSticky="false" runat="server" Skin="Metro" Style="position:absolute;top: 0;left:0;width:100%;height:100%;" />

    <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel">

        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="true">
        
            <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" Width="45em" translate="yes">
                
                <div class="ShowFieldset">
                    <fieldset>
                        <legend>
                            <span class="SectionLabel"><%#GetTranslatedPhrase("Basic options")%></span> 
                        </legend>
                        <div class="PanelField">
                            <div class="PanelFieldValue" >
                                <div style="display:table-cell;">                  
                                    <asiweb:BusinessTextBox CssClass="InputSmall" DisplayCaption="True" ID="LastValueInput" PositionCaption="Left" RenderPanelField="true" runat="server"
                                        OnDataChanged="LastValueInput_OnDataChanged"/>
                                </div>
                                <div style="display:table-cell; vertical-align:middle;">
                                    <asiweb:InfoControl ID="LastValueInfo" runat="server" 
                                        Text="Displays the most recent iMIS ID that was auto-assigned. If you need to have the first assigned ID be other than one, you can enter a value of one less than what you want the first number to be. You can only enter a value between 0 and 2147483647; otherwise, an error will occur. If this field is left blank, the default value will be set to 0."/>
                                    <asp:RangeValidator runat="server" Type="Integer" Display="Dynamic"  
                                        MinimumValue="0" MaximumValue="2147483647" ControlToValidate="LastValueInput" 
                                        ErrorMessage="Value must be numeric" SetFocusOnError="True" />  
                                </div>            
                            </div>  
                        </div>                                       
                        <div class="SectionLabel"><%#GetTranslatedPhrase("Standard fields")%></div>        
                        <div class="AutoWidth FloatNone">
                            <div class="PanelField">
                                <div class="PanelFieldValue" >
                                    <div style="display:table-cell;">
                                        <asiweb:BusinessCheckBox DisplayCaption="True" ID="UniqueMajorKeyCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />
                                    </div>                  
                                </div>
                            </div>
                        </div>
                        <div class="PanelField">
                            <div class="PanelFieldValue" >
                                <div style="display:table-cell;">
                                    <asiweb:BusinessTextBox CssClass="InputXLarge" DisplayCaption="True" ID="IncludePrefixStringTextBox" MaxLength="5000" PositionCaption="Left" RenderPanelField="true" runat="server" />
                                </div>
                           </div>
                        </div>
                        <div class="PanelField">
                            <div class="PanelFieldValue" >
                                <div style="display:table-cell;">
                                    <div class="SectionLabel"><%#GetTranslatedPhrase("Chapters")%></div>
                                </div>
                                <div style="display:table-cell; vertical-align:middle;">
                                    <asiweb:InfoControl ID="ChaptersInfo" runat="server" 
                                    Text="The group labels appear when creating or editing a chapter, and allow you to define additional information about the chapter. 
                                        The content you put in these group fields will appear as their own field labels when creating or editing a chapter. For example, Country/Region in Group 1, States in Group 2, and Counties/City in Group 3."/> 
                                </div>
                            </div>
                        </div>
                        <div class="AddPaddingHorizontal Section">     
                            <asiweb:BusinessTextBox CssClass="InputLarge" DisplayCaption="True" ID="ChapterGroup1PromptTextBox" MaxLength="255" PositionCaption="Left" RenderPanelField="true" runat="server"/>       
                            <asiweb:BusinessTextBox CssClass="InputLarge" DisplayCaption="True" ID="ChapterGroup2PromptTextBox" MaxLength="255" PositionCaption="Left" RenderPanelField="true" runat="server" />        
                            <asiweb:BusinessTextBox CssClass="InputLarge" DisplayCaption="True" ID="ChapterGroup3PromptTextBox" MaxLength="255" PositionCaption="Left" RenderPanelField="true" runat="server" />
                        </div>
                        <asiweb:BusinessCheckBox DisplayCaption="True" ID="NoFormatTelCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />
                    </fieldset>
                </div>

                <div class="ShowFieldset">
                    <fieldset>
                        <legend>         
                            <span class="SectionLabel"><%#GetTranslatedPhrase("Address purpose")%></span>             
                        </legend>               
                        <div class="AddPaddingHorizontal Section">
                            <div class="PanelField">
                                 <asiweb:StyledLabel AssociatedControlID="Addr1PromptTextBox" CssClass="Required" ID="Addr1Label" runat="server" />
                                 <div class="PanelFieldValue" >
                                    <div style="display:table-cell;">
                                        <asiweb:BusinessTextBox CssClass="InputLarge" DisplayCaption="false" ID="Addr1PromptTextBox" MaxLength="255" RenderPanelField="True" Required="False" runat="server" />
                                     </div>
                                    <div style="display:table-cell; vertical-align:middle;">
                                        <asiweb:InfoControl ID="AddrsInfo" runat="server" Text="Specifies the label for the address block of the customer."/>    
                                         <asiweb:AsiRequiredFieldValidator ID="RequiredFieldValidatorAddr1"  CssClass="Important" runat="server" ControlToValidate="Addr1PromptTextBox" SetFocusOnError="True" Text="Required" Enabled="False" EnableClientScript="false"/>
                                    </div>
                                </div>
                            <div class="PanelFieldValue" >
                             <div style="display:table-cell;">
                            <asiweb:BusinessTextBox CssClass="InputLarge" DisplayCaption="True" ID="Addr2PromptTextBox" MaxLength="255" PositionCaption="Left" RenderPanelField="true" runat="server" Required="True" />
                            </div>
                                  <div style="display:table-cell; vertical-align:middle;">
                                  <asiweb:AsiRequiredFieldValidator ID="RequiredFieldValidatorAddr2"  CssClass="Important" runat="server" ControlToValidate="Addr2PromptTextBox" SetFocusOnError="True" Text="Required" Enabled="False" EnableClientScript="false"/>
                                  </div>
                            </div>
                            <div class="PanelFieldValue" >
                                <div style="display:table-cell;">
                                 <asiweb:BusinessTextBox CssClass="InputLarge" DisplayCaption="True" ID="Addr3PromptTextBox" MaxLength="255" PositionCaption="Left" RenderPanelField="true" runat="server" Required="True"/>
                                </div>
                                <div style="display:table-cell; vertical-align:middle;">
                                     <asiweb:AsiRequiredFieldValidator ID="RequiredFieldValidatorAddr3"  CssClass="Important" runat="server" ControlToValidate="Addr3PromptTextBox" SetFocusOnError="True" Text="Required" Enabled="False" EnableClientScript="false"/>
                                </div>
                            </div>
                            </div>        
                        </div>                       
                        <div class="Section">
                            <div class="SectionLabel"><%#GetTranslatedPhrase("Synchronize phone number and email")%></div>
                        </div>
                        <div class="AddPaddingHorizontal">
                            <div class="PanelBlock FullWidth MiddleAlign">
                                <asiweb:BusinessDropDownList DisplayCaption="True" ID="SyncWorkPhoneToAddressDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server"/>            
                                <asiweb:BusinessDropDownList DisplayCaption="True" ID="SyncHomePhoneToAddressDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server" />           
                                <asiweb:BusinessDropDownList DisplayCaption="True" ID="SyncFaxToAddressDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server" />           
                                <asiweb:BusinessDropDownList DisplayCaption="True" ID="SyncEmailToAddressDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server" />
                                
                            </div>
                        </div>
                    </fieldset>
                </div>

                <div class="ShowFieldset">
                    <fieldset>
                        <legend>
                            <span class="SectionLabel"><%#GetTranslatedPhrase("Advanced")%></span>  
                        </legend>                                                 
                        <div class="PanelField">
                            <div class="PanelFieldValue AddPaddingVertical" >
                                <div style="display:table-cell;">
                                    <asiweb:BusinessTextBox CssClass="InputXLarge" DisplayCaption="True" ID="FlowDownFieldsTextBox" PositionCaption="Left" RenderPanelField="true" Rows="5" runat="server" TextMode="MultiLine" />
                                </div>
                                <div style="display:table-cell; vertical-align:middle;">   
                                    <asiweb:InfoControl ID="UserDefineInfo" runat="server" Text="You can choose to have one or more customer fields flow down from company (parent) records to linked (child) records. iMIS already flows down, or synchronizes, the main address, county, telephone, and company customer type fields. 
                                    This feature adds additional information to flow down."/>  
                                </div>
                            </div>
                            <div class="PanelField">
                                <div class="PanelFieldValue">
                                    <div style="display:table-cell;">                                                       
                                      <asiweb:BusinessCheckBox DisplayCaption="True" ID="DisableAutoFlowDownCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="PanelField">
                                <div class="PanelFieldValue">
                                    <div style="display:table-cell;">
                                        <asiweb:BusinessCheckBox DisplayCaption="True" ID="UseParentCompanyPricingCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </div>

            </asiweb:PanelTemplateColumn>

        </asiweb:PanelTemplateControl2>

    </telerik:RadAjaxPanel>

    <script type="text/javascript">
        //<![CDATA[ 
        function ShowLoadingPanel() {
            if (Page_IsValid)
                jQuery("#<%#LoadingPanel.ClientID%>").show();
        }
     
        var lastValueInput = jQuery("#<%#LastValueInput.ClientID%>");
        var address1TextBox = jQuery("#<%#Addr1PromptTextBox.ClientID%>");
        var address2TextBox = jQuery("#<%#Addr2PromptTextBox.ClientID%>");
        var address3TextBox = jQuery("#<%#Addr3PromptTextBox.ClientID%>");

        var syncWorkDropDown = jQuery("#<%#SyncWorkPhoneToAddressDropDownList.ClientID%> option");
        var syncHomeDropDown = jQuery("#<%#SyncHomePhoneToAddressDropDownList.ClientID%> option");
        var syncFaxDropDown = jQuery("#<%#SyncFaxToAddressDropDownList.ClientID%> option");
        var syncEmailDropDown = jQuery("#<%#SyncEmailToAddressDropDownList.ClientID%> option");

        //taking the string value of Last Contact id, converting it to INT, using ParseInt for comparing with newValue.
        //Parseint needs two parameters, string to convert and radix - 10 for decimal system
        if (lastValueInput != null) {
            var lastValue = parseInt(lastValueInput.val(), 10);
            lastValueInput.change(function () {
                var str = lastValueInput.val();
                if (str !== "" && str !== "undefined") {
                    if (str.length > 0) {
                        if (!isNaN(str)) {
                            var newValue = parseInt(lastValueInput.val(), 10);
                            if (newValue < lastValue) {
                                var result =
                                    confirm("You are entering the contact ID less than the actual last ID. Please enter the contact ID greater than the existing one.");
                                if (result === false) {
                                    lastValueInput[0].value = lastValue;
                                }
                            }
                        }
                    }
                } else {
                    confirm("You are leaving the contact ID empty, by default it will be set to 0.");
                    lastValueInput[0].value = 0;
                }                  
            });
        }

        if (address1TextBox != null)
            address1TextBox.change(function () { ChangeDropDowns(); });

        if (address2TextBox != null)
            address2TextBox.change(function () { ChangeDropDowns(); });

        if (address3TextBox != null)
            address3TextBox.change(function () { ChangeDropDowns(); });

        function ChangeDropDowns() {

            var newOptions = {
                1 : address1TextBox.val(),
                2 : address2TextBox.val(),
                3 : address3TextBox.val()
            };

            syncWorkDropDown.each(function(index, option)
            {
                if (index > 0) {
                    option.text = newOptions[index]; 
                }                  
            });

            syncHomeDropDown.each(function(index, option)
            {
                if (index > 0) {
                    option.text = newOptions[index];
                }                  
            });

            syncFaxDropDown.each(function(index, option)
            {
                if (index > 0) {
                    option.text = newOptions[index];   
                }                  
            });

            syncEmailDropDown.each(function(index, option)
            {
                if (index > 0) {
                    option.text = newOptions[index]; 
                }                  
            });
        }

        //]]>
    </script>

</asp:Content>