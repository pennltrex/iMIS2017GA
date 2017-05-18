<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Title="Billing cycle detail" Inherits="Asi.Web.UI.Common.Utility.BillingCycleDetail" CodeBehind="BillingCycleDetail.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">

    <telerik:RadAjaxLoadingPanel BackgroundPosition="Center" BackgroundTransparency="0" ID="LoadingPanel" IsSticky="false" runat="server" Skin="Metro" Style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;" />

    <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel" EnableAJAX="False">

        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="true">    
        <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" LabelWidth="10em" runat="server" Width="25em" translate="yes">
            
           <div class="AddPaddingHorizontal Section">           
               <div class="PanelField Left">
                    <div class="PanelFieldValue">
                        <asiweb:PanelTemplateColumn ID="PanelTemplateColumn4" LabelWidth="12em" runat="server" Width="70em">
                            
                            <asiweb:StyledLabel AssociatedControlID="CycleNameTextBox" CssClass="Required" ID="CycleLabel" runat="server" />
                            <asiweb:BusinessTextBox CssClass="InputMedium" DisplayCaption="False" ID="CycleNameTextBox" RenderPanelField="False" CausesValidation="True" runat="server" />
                            <asp:CustomValidator id="CustomValidator1" ControlToValidate="CycleNameTextBox" ClientValidationFunction="CheckForExistingBillCycle"  
                                runat="server" ErrorMessage="Billing cycle already exists"/>
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="CycleNameTextBox" Text="Required" Display="Dynamic"></asp:RequiredFieldValidator>    

                        </asiweb:PanelTemplateColumn>
                    </div>
               </div>  

               <div class="PanelField Left">
                   <div class="PanelFieldValue">
                       <asiweb:PanelTemplateColumn ID="PanelTemplateColumn3" LabelWidth="12em" runat="server" Width="40em">
                            <asiweb:MultiSelectControl2 NoneSelectedText="Select member type" DisplayCaption="True" ID="MemberTypesMultiSelectControl" 
                                 RenderPanelField="True" runat="server" Width="15em" /> 
                            <asiweb:MultiSelectControl2 NoneSelectedText="Select category type" DisplayCaption="True" ID="CategoriesMultiSelectControl" RenderPanelField="True" runat="server" Width="15em" /> 

                       </asiweb:PanelTemplateColumn>
                   </div>
               </div>                                            
           </div>
           
            <div runat="server" class="ShowFieldset" style="width:800px;">
                <fieldset>
                    <legend>
                        <span id="ProductsLegendLabel" runat="server" class="SectionLabel"></span>             
                    </legend>
                    <div class="Section">
                        <asiweb:PanelTemplateColumn ID="PanelTemplateColumn2" LabelWidth="12em" runat="server" Width="100em">
                            <asiweb:MultiSelectControl2 NoneSelectedText="Select dues product" DisplayCaption="True" ID="DuesMultiSelect" RenderPanelField="True" runat="server" Width="15em"/>
                            <asiweb:MultiSelectControl2 NoneSelectedText="Select chapter product" DisplayCaption="True" ID="ChaptersMultiSelectControl" RenderPanelField="True" runat="server" Width="15em"/>
                            <asiweb:MultiSelectControl2 NoneSelectedText="Select miscellaneous product" DisplayCaption="True" ID="MiscellaneousMultiSelectControl" RenderPanelField="True" runat="server" Width="15em"/>
                            <asiweb:MultiSelectControl2 NoneSelectedText="Select section/specialty product" DisplayCaption="True" ID="SectionsMultiSelectControl" RenderPanelField="True" runat="server" Width="15em"/>
                            <asiweb:MultiSelectControl2 NoneSelectedText="Select subscription product" DisplayCaption="True" ID="SubscriptionsMultiSelectControl" RenderPanelField="True" runat="server" Width="15em" />
                            <asiweb:MultiSelectControl2 NoneSelectedText="Select voluntary product" DisplayCaption="True" ID="VoluntaryMultiSelectControl" RenderPanelField="True" runat="server" Width="15em"/> 
                        </asiweb:PanelTemplateColumn>         
                    </div>
                </fieldset>
            </div>
           
            <div class="ShowFieldset" style="width:800px;">
                <fieldset>
                    <legend>
                        <span id="BillingTypeLegendLabel" runat="server" class="SectionLabel"></span>         
                    </legend>
                    
                    <div class="PanelField Left">
                        <asiweb:BusinessDropDownList DisplayCaption="True" ID="BillingTypeAnnualAnniversaryDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="true" runat="server"/> 
                        <asiweb:StyledLabel AssociatedControlID="BillingTypeCashAccrualDropDownList" ID="BillingTypeCashAccrualLabel" runat="server"  />
                        <asiweb:BusinessDropDownList DisplayCaption="True" ID="BillingTypeCashAccrualDropDownList" IncludeNullItem="True" PositionCaption="Left" RenderPanelField="False" runat="server"/>                           
                        <asp:CustomValidator id="BillingTypeCashAccrualDropDownValidation" ControlToValidate="BillingTypeCashAccrualDropDownList" ClientValidationFunction="CheckDefaultBillType" 
                            runat="server" ErrorMessage="Accounting method setup must be changed to Accrual"/>
                    </div>
                </fieldset>    
            </div>
                        
            <div class="ShowFieldset" style="width:800px;">
                <fieldset>
                    <legend>
		                <span id="IncludeLegendLabel" runat="server" class="SectionLabel"></span> 
		            </legend>               
                    <asiweb:BusinessCheckBox DisplayCaption="True" id="InactiveMembersCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />            
                    <asiweb:BusinessCheckBox DisplayCaption="True" id="InactiveSectionsCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />
                    <asiweb:BusinessCheckBox DisplayCaption="True" id="SuspendedMembersCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />
                    <asiweb:BusinessCheckBox DisplayCaption="True" id="PrintZeroBalanceCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />  
                </fieldset>    
            </div>
            
            <div class="ShowFieldset" style="width:800px;">
                <fieldset>
                    <legend>
                        <span id="OtherBillingInstructionsLegendLabel" runat="server" class="SectionLabel"></span>                  
                    </legend>
                    <asiweb:BusinessCheckBox DisplayCaption="True" id="IncludeAllSectionsCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />            
                    <asiweb:BusinessCheckBox DisplayCaption="True" id="IncludeAllChaptersCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />
                    <asiweb:BusinessCheckBox DisplayCaption="True" id="AddMemberTypeCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />
                    <asiweb:BusinessCheckBox DisplayCaption="True" id="UpdateComplimentaryPaidCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />  
                </fieldset>
            </div>
           
            
            <div class="ShowFieldset" style="width:800px;">
                <fieldset>
                    <legend>
                        <span id="DisplayAsItemSetLegendLabel" runat="server" class="SectionLabel"></span>                              
                    </legend>
                    <asiweb:BusinessCheckBox DisplayCaption="True" id="DisplayJoinItemSetCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />            
                    <asiweb:BusinessCheckBox DisplayCaption="True" id="DisplayItemizedRenewalsCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />
                </fieldset>    
            </div>
            
            <asp:HiddenField ID="TargetServerBaseUrl" runat="server" Value="" />
            
        </asiweb:PanelTemplateColumn>    
        </asiweb:PanelTemplateControl2>

    </telerik:RadAjaxPanel>

    <script type="text/javascript">
        //<![CDATA[
        function ShowLoadingPanel() {
            if (!Page_ClientValidate()) return false;
            jQuery("[id$='_LoadingPanel']").show();
            return false;
        }

        function CheckForExistingBillCycle(sender, args) {
            var targetBaseUrl = jQuery("#<%= TargetServerBaseUrl.ClientID %>").val();
            var cycleNameTextbox = jQuery("#<%= CycleNameTextBox.ClientID %>");

            if (cycleNameTextbox.val() && !cycleNameTextbox.prop('disabled')) {
                jQuery.ajax(targetBaseUrl + "/api/LegacyBillingCycle?Name=" + cycleNameTextbox.val(),
                {
                    type: "get",
                    async: false,
                    contentType: "application/json",
                    headers: {
                        "RequestVerificationToken": document
                            .getElementById("__RequestVerificationToken")
                            .value
                    },
                    success: function (apiData) {
                        if (apiData.Count === 1) {
                            args.IsValid = false;
                        }
                    }
                });
            }
        }

        function CheckDefaultBillType(sender, args) {
            var targetBaseUrl = jQuery("#<%= TargetServerBaseUrl.ClientID %>").val();
            var billingTypeDropdown = jQuery("#<%= BillingTypeCashAccrualDropDownList.ClientID %>");

            if (billingTypeDropdown.val() === "Accrual") {
                jQuery.ajax(targetBaseUrl + "/api/SystemParam?ParameterName=startsWith:Dues_Control&ParameterName=contains:AccountingMethodDefault",
                {
                    type: "get",
                    async: false,
                    contentType: "application/json",
                    headers: {
                        "RequestVerificationToken": document
                            .getElementById("__RequestVerificationToken")
                            .value
                    },
                    success: function (apiData) {
                        if (apiData.Count === 1 && apiData.Items.$values[0].ShortValue === "C") {
                            args.IsValid = false;
                        }
                    }
                });
            }
        }

        jQuery(document).ready(function () {
            var multiselectDelay = 300;

            var MULTISELECTTYPES = {
                MEMBER: 0,
                CATEGORY: 1,
                PRODUCTS: 2
            };

            jQuery("#<%= MemberTypesMultiSelectControl.ClientID %>_ListBox_chosen input").autocomplete({
                delay: multiselectDelay,
                source: function (request, response) {
                    var multiSelectDropdownControl = jQuery("#<%= MemberTypesMultiSelectControl.ClientID %>_ListBox");
                    var optionDescriptions = jQuery.map(document.getElementById("<%= MemberTypesMultiSelectControl.ClientID %>_ListBox").options, function (a) { return a.innerHTML; });

                    apiCallForMultiSelectDropdown(request, "/api/legacycustomertype?description=contains:{0}", multiSelectDropdownControl, optionDescriptions, MULTISELECTTYPES.MEMBER);
                }
            });

            jQuery("#<%= CategoriesMultiSelectControl.ClientID %>_ListBox_chosen input").autocomplete({
                delay: multiselectDelay,
                source: function (request, response) {
                    var multiSelectDropdownControl = jQuery("#<%= CategoriesMultiSelectControl.ClientID %>_ListBox");
                    var optionDescriptions = jQuery.map(document.getElementById("<%= CategoriesMultiSelectControl.ClientID %>_ListBox").options, function (a) { return a.innerHTML; });

                    apiCallForMultiSelectDropdown(request, "/api/gentable?tablename=category&description=contains:{0}", multiSelectDropdownControl, optionDescriptions, MULTISELECTTYPES.CATEGORY);
                }
            });

            jQuery("#<%= DuesMultiSelect.ClientID %>_ListBox_chosen input").autocomplete({
                delay: multiselectDelay,
                source: function (request, response) {
                    var multiSelectDropdownControl = jQuery("#<%= DuesMultiSelect.ClientID %>_ListBox");
                    var optionDescriptions = jQuery.map(document.getElementById("<%= DuesMultiSelect.ClientID %>_ListBox").options, function (a) { return a.innerHTML; });

                    apiCallForMultiSelectDropdown(request, "/api/itemsummary?itemclassid=dues&name=contains:{0}", multiSelectDropdownControl, optionDescriptions, MULTISELECTTYPES.PRODUCTS);
                }
            });

            jQuery("#<%= ChaptersMultiSelectControl.ClientID %>_ListBox_chosen input").autocomplete({
                delay: multiselectDelay,
                source: function (request, response) {
                    var multiSelectDropdownControl = jQuery("#<%= ChaptersMultiSelectControl.ClientID %>_ListBox");
                    var optionDescriptions = jQuery.map(document.getElementById("<%= ChaptersMultiSelectControl.ClientID %>_ListBox").options, function (a) { return a.innerHTML; });

                    apiCallForMultiSelectDropdown(request, "/api/itemsummary?itemclassid=chapt&name=contains:{0}", multiSelectDropdownControl, optionDescriptions, MULTISELECTTYPES.PRODUCTS);
                }
            });

            jQuery("#<%= MiscellaneousMultiSelectControl.ClientID %>_ListBox_chosen input").autocomplete({
                delay: multiselectDelay,
                source: function (request, response) {
                    var multiSelectDropdownControl = jQuery("#<%= MiscellaneousMultiSelectControl.ClientID %>_ListBox");
                    var optionDescriptions = jQuery.map(document.getElementById("<%= MiscellaneousMultiSelectControl.ClientID %>_ListBox").options, function (a) { return a.innerHTML; });

                    apiCallForMultiSelectDropdown(request, "/api/itemsummary?itemclassid=misc&name=contains:{0}", multiSelectDropdownControl, optionDescriptions, MULTISELECTTYPES.PRODUCTS);
                }
            });

            jQuery("#<%= SectionsMultiSelectControl.ClientID %>_ListBox_chosen input").autocomplete({
                delay: multiselectDelay,
                source: function (request, response) {
                    var multiSelectDropdownControl = jQuery("#<%= SectionsMultiSelectControl.ClientID %>_ListBox");
                    var optionDescriptions = jQuery.map(document.getElementById("<%= SectionsMultiSelectControl.ClientID %>_ListBox").options, function (a) { return a.innerHTML; });

                    apiCallForMultiSelectDropdown(request, "/api/itemsummary?itemclassid=sec&name=contains:{0}", multiSelectDropdownControl, optionDescriptions, MULTISELECTTYPES.PRODUCTS);
                }
            });

            jQuery("#<%= SubscriptionsMultiSelectControl.ClientID %>_ListBox_chosen input").autocomplete({
                delay: multiselectDelay,
                source: function (request, response) {
                    var multiSelectDropdownControl = jQuery("#<%= SubscriptionsMultiSelectControl.ClientID %>_ListBox");
                    var optionDescriptions = jQuery.map(document.getElementById("<%= SubscriptionsMultiSelectControl.ClientID %>_ListBox").options, function (a) { return a.innerHTML; });

                    apiCallForMultiSelectDropdown(request, "/api/itemsummary?itemclassid=sub&name=contains:{0}", multiSelectDropdownControl, optionDescriptions, MULTISELECTTYPES.PRODUCTS);
                }
            });

            jQuery("#<%= VoluntaryMultiSelectControl.ClientID %>_ListBox_chosen input").autocomplete({
                delay: multiselectDelay,
                source: function (request, response) {
                    var multiSelectDropdownControl = jQuery("#<%= VoluntaryMultiSelectControl.ClientID %>_ListBox");
                    var optionDescriptions = jQuery.map(document.getElementById("<%= VoluntaryMultiSelectControl.ClientID %>_ListBox").options, function (a) { return a.innerHTML; });

                    apiCallForMultiSelectDropdown(request, "/api/itemsummary?itemclassid=vol&name=contains:{0}", multiSelectDropdownControl, optionDescriptions, MULTISELECTTYPES.PRODUCTS);
                }
            });

            function apiCallForMultiSelectDropdown(request, apiCallArgument, multiSelectControl, multiSelectOptions, multiselectType) {
                var targetBaseUrl = jQuery("#<%= TargetServerBaseUrl.ClientID %>").val();
                apiCallArgument = apiCallArgument.replace("{0}", request.term);

                var activeInputFieldWithinMultiSelectControl = document.activeElement;

                jQuery.ajax(targetBaseUrl + apiCallArgument,
                {
                    type: "get",
                    contentType: "application/json",
                    headers: {
                        "RequestVerificationToken": document
                            .getElementById("__RequestVerificationToken")
                            .value
                    },
                    success: function (apiData) {
                        var userInputPreMultiSelectUpdate = activeInputFieldWithinMultiSelectControl.value;

                        if (multiselectType === MULTISELECTTYPES.PRODUCTS) {
                            var filteredApiData = jQuery.grep(apiData.Items.$values, function (n) {
                                return (n.ItemCode.indexOf('/') === -1);
                            });

                            populateMultiSelectDropdownForProducts(multiSelectControl, multiSelectOptions, filteredApiData);
                        }
                        else {
                            populateMultiSelectDropdown(multiSelectControl, multiSelectOptions, apiData, multiselectType);
                        }

                        if (activeInputFieldWithinMultiSelectControl.value !== userInputPreMultiSelectUpdate) {
                            activeInputFieldWithinMultiSelectControl.value = userInputPreMultiSelectUpdate;
                        }
                    }
                });
            }

            function populateMultiSelectDropdown(multiSelectDropdownControl, optionDescriptions, apiData, multiselectType) {
                if (jQuery.inArray("*ALL*", optionDescriptions) === -1) {
                    multiSelectDropdownControl.append('<option value=*ALL*>*ALL*</option>');
                    multiSelectDropdownControl.trigger("chosen:updated");
                }

                if (multiselectType === MULTISELECTTYPES.CATEGORY && jQuery.inArray("BLANK", optionDescriptions) === -1) {
                    multiSelectDropdownControl.append('<option value=BLANK>BLANK</option>');
                    multiSelectDropdownControl.trigger("chosen:updated");
                }

                for (var x = 0; x < apiData.Items.$values.length; x++) {
                    var targetItem = apiData.Items.$values[x];

                    if (jQuery.inArray(targetItem.Description, optionDescriptions) < 0) {
                        var targetPropertyValue = (multiselectType === MULTISELECTTYPES.MEMBER) ? targetItem.CustomerTypeId : targetItem.Code;
                        multiSelectDropdownControl.append('<option value=' + targetPropertyValue + '>' + targetItem.Description + '</option>');
                        multiSelectDropdownControl.trigger("chosen:updated");
                    }
                }
            }

            function populateMultiSelectDropdownForProducts(multiSelectDropdownControl, optionDescriptions, apiData) {
                for (var x = 0; x < apiData.length; x++) {
                    var targetItem = apiData[x];
                    var dropdownOptionDescription = targetItem.Name + " (" + targetItem.ItemId + ")";

                    if (jQuery.inArray(dropdownOptionDescription, optionDescriptions) < 0) {

                        multiSelectDropdownControl.append('<option value=' + targetItem.ItemId + '>' + dropdownOptionDescription + '</option>');
                        multiSelectDropdownControl.trigger("chosen:updated");
                    }
                }
            }
            function interceptSubmit(event, target) {
                event.stopPropagation();
                event.preventDefault();
                return false;
            }
            jQuery(".ContentPanel input")
                .on("keyup keydown",
                    function (e) {
                        if (e.which === 13) {
                            e.preventDefault();
                            e.stopImmediatePropagation();
                            if (!(e.currentTarget.parentNode.parentNode.outerHTML.indexOf('chosen-choices') > 0))
                                jQuery("[id$='SaveAndCloseButton']").click();
                            else
                                jQuery("form").on("submit",
                                interceptSubmit(e, this));
                        }
                    });
        });
            //]]>
    </script>
</asp:Content>
