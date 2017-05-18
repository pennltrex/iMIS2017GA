<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BillGenerationBillingRunDetail.ascx.cs" Inherits="Asi.WebRoot.iMIS.Setup.Billing.BillGenerationBillingRunDetail" %>

<asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="true">    
    <asiweb:PanelTemplateColumn ID="PanelTemplateColumn1" runat="server" Width="40em" translate="yes">
        <asiweb:StyledLabel runat="server" ID="message"/>      
        <div class="PanelField Left">
            
            <div class="PanelField Left">
                <asiweb:StyledLabel runat="server" ID="BillCycleDropdownLabel" AssociatedControlID="BillingCycleDropDownList" CssClass="Required" />
                <div class="PanelFieldValue">
                    <asiweb:BusinessDropDownList DisplayCaption="False" ID="BillingCycleDropDownList" IncludeNullItem="True" PositionCaption="Left" 
                        RenderPanelField="False" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="BillingCycleDropDownList_OnSelectedIndexChanged"/> 
                    <asp:CustomValidator runat="server" id="BillCycleDropdownValidator" Display="Dynamic" 
                                 ErrorMessage="Billing cycle is required" OnServerValidate="BillCycleDropdownValidator_OnServerValidate"/> 
                </div>
            </div>
            
            <div class="PanelField Left">
                <asiweb:StyledLabel ID="BillingTypLabel" CssClass="Required" runat="server" RenderPanelField="False" AssociatedControlID="RenewalsCheckBox"></asiweb:StyledLabel>    
               
                <div class="PanelFieldValue">
                    <asiweb:BusinessCheckBox DisplayCaption="False" ID="RenewalsCheckBox" RenderPanelField="False" runat="server" />
                </div>
                <asiweb:StyledLabel runat="server" ID="RenewalsCheckboxLabel" CssClass="AutoWidth" AssociatedControlID="RenewalsCheckBox" />              
                
                <div class="PanelFieldValue">
                    <asiweb:BusinessCheckBox DisplayCaption="False" ID="RebillCheckBox" RenderPanelField="False" runat="server" AutoPostBack="True" Checked="False" OnCheckedChanged="RebillCheckBox_OnCheckedChanged" />
                </div>
                <asiweb:StyledLabel runat="server" ID="RebillCheckboxLabel" AssociatedControlID="RebillCheckBox" CssClass="AutoWidth" />  
                <asp:CustomValidator runat="server" id="BillingTypeValidator" Display="Dynamic" 
                                 ErrorMessage="Billing type is required" OnServerValidate="BillingTypeValidator_OnServerValidate"/>    
            </div>
            
            <div class="PanelField Left">
                <asiweb:StyledLabel runat="server" ID="BillDateLabel" AssociatedControlID="BillDate" CssClass="Required" />
                <div class="PanelFieldValue">
                    <asiweb:BusinessCalendar2 runat="server" ID="BillDate" RenderPanelField="False" DisplayCaption="False" UseSqlDateTimeMinValue="true" /> 
                    <asp:CustomValidator runat="server" id="BillDateValidator" Display="Dynamic" 
                                 ErrorMessage="Bill date is required" OnServerValidate="BillDateValidator_OnServerValidate"/>
                </div>
            </div>
            
            <div class="PanelField Left">
                <div class="PanelFieldValue">
                    <asiweb:BusinessCalendar2 runat="server" ID="EffectiveDateCalendar" RenderPanelField="True" DisplayCaption="true" UseSqlDateTimeMinValue="true" />    
                </div>
                <asiweb:StyledLabel runat="server" ID="EffectiveDateMessage" CssClass="Info" /> 
            </div>
            
            <div id="BillBetweenControlPanel" class="PanelField Left" runat="server">
                <asiweb:StyledLabel runat="server" ID="BillDateBetweenLabel" AssociatedControlID="BillDateBetweenStartBusinessCalendar" />
                <div class="PanelFieldValue">
                    <asiweb:BusinessCalendar2 runat="server" ID="BillDateBetweenStartBusinessCalendar" RenderPanelField="False" DisplayCaption="true" UseSqlDateTimeMinValue="true" />     
                </div>
                
                <asiweb:StyledLabel runat="server" ID="BillDateBetweenAndLabel" AssociatedControlID="BillDateBetweenEndBusinessCalendar" CssClass="AutoWidth" />
                <div class="PanelFieldValue">
                    <asiweb:BusinessCalendar2 runat="server" ID="BillDateBetweenEndBusinessCalendar" RenderPanelField="False" DisplayCaption="true" UseSqlDateTimeMinValue="true" />         
                </div>
                
                <span id="BillBetweenDateRangeErrorMessage" runat="server" hidden class="ValidationError">Invalid date range</span>
                <asiweb:StyledLabel runat="server" ID="BillDateBetweenMessage" class="Info"/>        
            </div>
        </div>   
        
        <div class="ShowFieldset" style="width:875px;">
            <fieldset>
                <legend>
		            <span id="OtherOptionsLegendLabel" runat="server" class="SectionLabel"></span> 
		        </legend>             
                  
                <asiweb:BusinessCheckBox DisplayCaption="True" id="OnlyBillContactsIncludedInQueryCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" 
                    AutoPostBack="True" Checked="False" OnCheckedChanged="OnlyBillContactsIncludedInQueryCheckBox_OnCheckedChanged" />  
                
                <div id="OnlyBillContactsInQueryControlPanel" class="PanelField" runat="server">
                    <div class="SubItems" ID="QueryPathControl" runat="server">
                        <asiweb:StyledLabel runat="server" ID="LinkTargetLabel" CssClass="AutoWidth" AssociatedControlID="PathToQueryTextBox" PositionCaption="Left" />
                        <div class="PanelFieldValue InputMediumWrapper">   
                                        
                            <asiweb:BusinessDocumentBrowserControl ID="PathToQueryTextBox" OnDataChanged="PathToQueryTextBox_OnDataChanged" AutoPostBack="True" runat="server" 
                                DocumentHierarchyPath="$/Common/Queries/Billing" DisplayCaption="False" RenderPanelField="False" RootFolder="$" AllowUpwardNavigation="False" ShowAddress="False" 
                                DocumentTypesAllowed="IQD"/>
                            <asp:CustomValidator runat="server" id="PathToQueryCustomValidator" Display="Dynamic" 
                                 ErrorMessage="The selected query does not contain a contact ID column." OnServerValidate="PathToQueryCustomValidator_OnServerValidate"/>

                            <div id="EditQueryPanel" class="PanelField" runat="server">
                                <asp:LinkButton runat="server" ID="EditSourceQueryLinkButton" ></asp:LinkButton>   
                            </div>
                            <div class="PanelField">
                                <asp:LinkButton runat="server" ID="CreateNewQueryLinkButton"></asp:LinkButton>    
                            </div>    
                        </div>   
                    </div>
                </div>
                          
                <asiweb:BusinessCheckBox DisplayCaption="True" id="OnlyBillContactsInChapterCheckBox" PositionCaption="Right" AutoPostBack="True" Checked="False" RenderPanelField="true" 
                    runat="server" OnCheckedChanged="OnlyBillContactsInChapterCheckBox_OnCheckedChanged" />
                
                <div id="OnlyBillContactsToChapterControlPanel" runat="server" class="PanelField">
                    <div class="SubItems">
                        <asiweb:StyledLabel runat="server" ID="ChapterLabel" CssClass="AutoWidth" AssociatedControlID="ChaptersDropdownList" Text="Chapter" PositionCaption="Left" />
                        <div class="PanelFieldValue">
                            <asiweb:BusinessDropDownList runat="server" ID="ChaptersDropdownList" IncludeNullItem="False"/> 
                        </div>
                        
                        <asiweb:StyledLabel runat="server" ID="ChapterMessageLabel" class="Info" RenderPanelField="True"/> 
                    </div>
                </div>

                <asiweb:BusinessCheckBox DisplayCaption="True" id="DoNotProrateCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" />
                <asiweb:BusinessCheckBox DisplayCaption="True" id="DoNotApplyCreditsCheckBox" PositionCaption="Right" RenderPanelField="true" runat="server" /> 
            </fieldset>    
        </div>    
        
        <div class="FloatLeft" style="padding-top:10px;">
            <asp:Button ID="GenerateBillRenewalsButton" runat="server" OnClientClick="if (!ValidateRebillDateRange()) return false;" OnClick="GenerateBillRenewalsButton_OnClick"  
                CssClass="PrimaryButton TextButton"></asp:Button>     
        </div>
    </asiweb:PanelTemplateColumn>    
</asiweb:PanelTemplateControl2>
    
 <script type="text/javascript">
     //<![CDATA[
     jQuery(document).ready(function () {
        validateBillingBetweenDateRange();

        jQuery("#<%= BillDateBetweenStartBusinessCalendar.ClientID %>").change(function (e) {
            validateBillingBetweenDateRange();
        });

        jQuery("#<%= BillDateBetweenEndBusinessCalendar.ClientID %>").change(function (e) {
            validateBillingBetweenDateRange();
        });

        function validateBillingBetweenDateRange() {
            var rebillBetweenStartDate = jQuery("#<%= BillDateBetweenStartBusinessCalendar.ClientID %>" + "rad_Dp_dateInput").val();
            var rebillBetweenEndDate = jQuery("#<%= BillDateBetweenEndBusinessCalendar.ClientID %>" + "rad_Dp_dateInput").val();

            if (!rebillBetweenEndDate) {
                jQuery("#<%= BillBetweenDateRangeErrorMessage.ClientID %>").hide(); 
                return;
            }

            if (!rebillBetweenStartDate || rebillBetweenEndDate < rebillBetweenStartDate) {
                jQuery("#<%= BillBetweenDateRangeErrorMessage.ClientID %>").show();
            }
            else {
               jQuery("#<%= BillBetweenDateRangeErrorMessage.ClientID %>").hide();    
            }
        }
     });

     function ValidateRebillDateRange() {
         var isInvalid = jQuery("#<%= BillBetweenDateRangeErrorMessage.ClientID%>").is(":visible");
         if (isInvalid) {
             return false;
         } else {
             return true;
         }
     }
    //]]>
 </script>