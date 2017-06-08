<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Inherits="Asi.Web.UI.Common.Utility.AccountingSetup" Codebehind="Setup.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
     
    <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" BackgroundTransparency="0" IsSticky="false"
        BackgroundPosition="Center" Skin="Metro" style="position:absolute;top:0;left:0;width:100%;height:100%;"/>

    <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel" >
    
        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="true">
                  
            <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" Width="35em" translate="yes">
            
                <div class="ShowFieldset">
                    <fieldset>
                        <legend>
                            <span class="SectionLabel"><%#GetTranslatedPhrase("Default entities")%></span> 
                        </legend>		                
                        <div class="Section AutoWidth FloatNone">
                            <asiweb:BusinessCheckBox DisplayCaption="True" ID="MutipleEntityCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />             
                        </div>
                        <div class="PanelBlock FullWidth MiddleAlign SubItems">
                            <asiweb:BusinessDropDownList DisplayCaption="True" ID="DefaultEntityArDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server" />            
                            <asiweb:BusinessDropDownList DisplayCaption="True" ID="DefaultEntityDuesDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server" />           
                            <asiweb:BusinessDropDownList DisplayCaption="True" ID="DefaultEntityMeetingsDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server" />           
                            <asiweb:BusinessDropDownList DisplayCaption="True" ID="DefaultEntityOrdersDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server" />           
                            <asiweb:BusinessDropDownList DisplayCaption="True" ID="DefaultEntityFRDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server" />     
                        </div>
                    </fieldset>
                </div>             
            
            </asiweb:PanelTemplateColumn>
                   
        </asiweb:PanelTemplateControl2>
    
        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl2" runat="server" Collapsible="false" FieldSet="true" BorderStyle="None" ShowHeader="False">

            <div class="SectionLabel Section"><%#GetTranslatedPhrase("Cash application")%></div>  
            <div class="AddPaddingHorizontal Section">
                <asiweb:BusinessCheckBox DisplayCaption="True" id="AutoCashApplicationCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />            
            </div>
     
            <div class="SectionLabel Section"><%#GetTranslatedPhrase("CR/DB write-offs")%></div>  
            <div class="AddPaddingHorizontal Section">              
                <asiweb:BusinessTextBox CssClass="InputSmall" DisplayCaption="True" ID="WriteOffDefAmtTextBox" PositionCaption="Left" RenderPanelField="true" runat="server" />
                <asp:RangeValidator runat="server" Type="Currency" Display="Dynamic"  
                    MinimumValue="0" MaximumValue="1000000" ControlToValidate="WriteOffDefAmtTextBox" 
                    ErrorMessage="Value must be a valid currency amount" />                          
            </div>

            <div class="SectionLabel Section"><%#GetTranslatedPhrase("Batch control")%></div>        
            <div class="AddPaddingHorizontal Section">                                
                <asiweb:BusinessCheckBox DisplayCaption="True" id="PostingCycleCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />            
            </div>

            <div class="SectionLabel Section"><%#GetTranslatedPhrase("General")%></div>        
            <div class="AddPaddingHorizontal Section">
                <asiweb:BusinessTextBox CssClass="InputXSmall" DisplayCaption="True" ID="YearBeginsTextBox" PositionCaption="Left" RenderPanelField="true" runat="server" /> 
                <asp:RangeValidator runat="server" Type="Integer" Display="Dynamic" 
                    MinimumValue="0" MaximumValue="255" ControlToValidate="YearBeginsTextBox" 
                    ErrorMessage="Value must be a whole number between 0 and 255" />                                  
                <asiweb:BusinessCheckBox DisplayCaption="True" id="AllowGlAcctEditForSalesCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />            
            </div>

            <div class="SectionLabel Section"><%#GetTranslatedPhrase("General ledger interface")%></div>        
            <div class="AddPaddingHorizontal">                                
                <asiweb:BusinessDropDownList ID="GlSumDistDropDownList" runat="server" IncludeNullItem="false" DisplayCaption="true" PositionCaption="Left" RenderPanelField="true" />
                <asiweb:BusinessDropDownList ID="GlTypeDropDownList" runat="server" IncludeNullItem="false" DisplayCaption="true" PositionCaption="Left" RenderPanelField="true" />
                <asiweb:BusinessCheckBox DisplayCaption="True" id="ExportSeperateFilesCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />   
            </div>
            
            <div class="ClearFix"></div>
                               
            <div class="PanelField AutoWidth AddPaddingHorizontal">        
                <asiweb:BusinessCheckBox id="ApplyPCIComplianceCheckBox" runat="server" Text='<%#GetTranslatedPhrase(" Enable PCI compliance for cardholder information")%>' class="PanelFieldValue FloatNone" OnCheckedChanged="ApplyPCIComplianceCheckBox_Changed" />
            </div>  
            <div class="ClearFix"></div>
            <asp:Panel ID="PciRadioButtonsPanel" runat="server" >    
                <div ID="PciRadioButtonsDiv" class="SubItems" runat="server" translate="yes">                                           
                    <asiweb:BusinessRadioButtonList DisplayCaption="False" ID="PCIOptionRadioButtonList" RepeatDirection="Vertical" RenderPanelField="False" runat="server" OnSelectedIndexChanged="PCIOptionRadioButtonList_Changed">
                        <asp:ListItem Text="Do not retain cardholder information" Value="2" />
                        <asp:ListItem Text="Maintain audit log of cardholder information" Value="1" />
                    </asiweb:BusinessRadioButtonList>
                    <div class="AddPaddingVertical">                                         
                        <div class="AutoWidth">                                       
                            <asiweb:BusinessLabel runat="server" ID="BusinessLabel1" CssClass="Info" Text='<%#GetTranslatedPhrase("To be PCI Compliant, deferred payments must be purged and disabled.")%>'/>
                        </div>
                    </div>                                           
                </div>                                                                                     
            </asp:Panel>                 

            <div class="SectionLabel Section"><%#GetTranslatedPhrase("DataVault")%></div>
            <div class="AddPaddingHorizontal">
                <div class="AutoWidth">
                    <asiweb:StyledLabel runat="server" ID="DataVaultServiceAddressLabel" Text="DataVault service address i.e. https://[ServiceHostName]/[DataVaultServiceName] (DataVault.DataVaultServiceAddress)" CssClass="Label"></asiweb:StyledLabel>
                </div>
                    <div style="width:50%">
                        <asiweb:BusinessTextBox runat="server" ID="DataVaultServiceAddressTb" CssClass="FullWidth" />
                </div>
            </div>
                                  
        </asiweb:PanelTemplateControl2>
        
        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl3" runat="server" Collapsible="false" FieldSet="true" BorderStyle="None" ShowHeader="False">
        
            <asiweb:PanelTemplateColumn ID="PanelTemplateColumn2" runat="server" Width="50em" LabelWidth="30em" translate="yes">

                <div class="Section SectionLabel"><%#GetTranslatedPhrase("VAT setup")%></div> 
                    
                <div class="AddPaddingHorizontal AddPadding">
                    
                    <asiweb:StyledLabel CssClass="Label" runat="server" id="TaxBasedOnLabel"/>
                    <div class="SubItems">
                        <asiweb:BusinessRadioButtonList class="Section" DisplayCaption="False" ID="TaxOnShipToRadioButtonList" RepeatDirection="Vertical" RenderPanelField="False" runat="server">
                            <asp:ListItem Text="Bill to data" Enabled="True" Value="" Selected="True" />
                            <asp:ListItem Text="Ship to / Recipient data" Enabled="True" Value="YES" />
                        </asiweb:BusinessRadioButtonList>
                    </div>
                    <div class="Section">   
                        <asiweb:BusinessCheckBox DisplayCaption="True" id="VatInclusiveCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />            
                        <div class="SubItems" data-id="VatInstructions" runat="server" id="VatInstructions">            
                            <div class="AsiMessage">
                                <div class="AsiWarning">
                                    <asp:Image ID="UserWarningIcon1" runat="server" CssClass="iMISUserMessageIcon" ImageAlign="AbsMiddle" SkinID="AsiWarning" />			                  
                                    <asiweb:StyledLabel CssClass="Section" runat="server" id="VatInstruction1Label"/>  
                                </div>  
                                <div class="AsiWarning">
                                    <asp:Image ID="UserWarningIcon2" runat="server" CssClass="iMISUserMessageIcon" ImageAlign="AbsMiddle" SkinID="AsiWarning" />			                  
                                    <asiweb:StyledLabel CssClass="Section" runat="server" id="VatinstructionWarningLabel"/>  
                                </div>                                       
                            </div>                        
                        </div>                                                                                                       
                    </div> 
                    <asiweb:StyledLabel CssClass="Label" runat="server" id="VatInstruction2Label"/>
                    <div class="SubItems">
                        <asiweb:BusinessDropDownList DisplayCaption="True" ID="VatZeroExemptDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server" />  
                        <asiweb:BusinessDropDownList DisplayCaption="True" ID="VatZeroOrderOtherEuDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server" />  
                        <asiweb:BusinessDropDownList DisplayCaption="True" ID="VatZeroOrderOutsideEuDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server" />   
                    </div>
                </div>
                  
            </asiweb:PanelTemplateColumn> 

        </asiweb:PanelTemplateControl2>

    </telerik:RadAjaxPanel>
    
 <script type="text/javascript">
    //<![CDATA[
    SetEntityFieldsState();
    function SetEntityFieldsState() {
        var mutipleEntity = jQuery("#<%#MutipleEntityCheckBox.ClientID%>");
        var defaultEntityAr = jQuery("#<%#DefaultEntityArDropDownList.ClientID%>");
        var defaultEntityDues = jQuery("#<%#DefaultEntityDuesDropDownList.ClientID%>");
        var defaultEntityMeetings = jQuery("#<%#DefaultEntityMeetingsDropDownList.ClientID%>");
        var defaultEntityOrders = jQuery("#<%#DefaultEntityOrdersDropDownList.ClientID%>");
        var defaultEntityFr = jQuery("#<%#DefaultEntityFRDropDownList.ClientID%>");

        if (mutipleEntity != null && mutipleEntity.is(':checked')) {
            EnableField(defaultEntityAr);
            EnableField(defaultEntityDues);
            EnableField(defaultEntityMeetings);
            EnableField(defaultEntityOrders);
            EnableField(defaultEntityFr);
        } else {
            DisableField(defaultEntityAr);
            DisableField(defaultEntityDues);
            DisableField(defaultEntityMeetings);
            DisableField(defaultEntityOrders);
            DisableField(defaultEntityFr);
        }
    }

    function EnableField(control) {
        jQuery("label[for='" + control.selector.replace('#', '') + "']").removeAttr('disabled');
        control.removeAttr('disabled');
    }

    function DisableField(control) {
        jQuery("label[for='" + control.selector.replace('#', '') + "']").attr('disabled', 'disabled');
        control.attr('disabled', 'disabled');
    }
       
    SetConfirmMessageState();
    function SetConfirmMessageState() {
        var vatInclusiveCheckBox = jQuery("#<%#VatInclusiveCheckBox.ClientID%>");

        if (vatInclusiveCheckBox != null && vatInclusiveCheckBox.is(':checked')) 
            jQuery('div[data-id="VatInstructions"]').show();
        else
            jQuery('div[data-id="VatInstructions"]').hide();
    }

    function ConfirmMessage(control) {
        if (control.checked)
            jQuery('div[data-id="VatInstructions"]').show();
        else
            jQuery('div[data-id="VatInstructions"]').hide();
    }

   AdvancedPciCheckbox_CheckedChanged();
    function AdvancedPciCheckbox_CheckedChanged()
    {
        var advancedPciCheckbox = jQuery("#<%#ApplyPCIComplianceCheckBox.ClientID%>");         
        if (advancedPciCheckbox != null) {
            var pciOptionRadioButtonList = jQuery("#<%#PCIOptionRadioButtonList.ClientID%>");
            var pciRadioButtonsPanel = jQuery("#<%#PciRadioButtonsPanel.ClientID%>");
            if (advancedPciCheckbox.prop('checked') == true) {
                pciRadioButtonsPanel.show();
                var selectedItem = pciOptionRadioButtonList.find(":checked").val();
                if (selectedItem == null) {
                    jQuery("#<%#PCIOptionRadioButtonList.ClientID%>_0").attr('checked', 'checked');
                }               
            } else {
                jQuery("#<%#PCIOptionRadioButtonList.ClientID%>_0").removeAttr("checked");
                jQuery("#<%#PCIOptionRadioButtonList.ClientID%>_1").removeAttr("checked");
                pciRadioButtonsPanel.hide();
            }
        }
    };

    function ShowLoadingPanel() {
        if (!Page_ClientValidate()) return false;
        jQuery("[id$='_LoadingPanel']").show();
        return true;
    }
    //]]>
</script>

</asp:Content> 