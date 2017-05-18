<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.CertificationManagement.CertificationModuleRegistrationList" Codebehind="CertificationModuleRegistrationList.ascx.cs" %>

<script type="text/javascript">   
    // This function is called after creating an Experience is created to refresh the list
    function OpenRegistrtionCallBackFunction(radwindow) {
        if (!radwindow.result)
            return;
        var returnRegistrationWindowHidden = document.getElementById('<%# ReturnRegistrationWindowHidden.ClientID %>');
        returnRegistrationWindowHidden.value = radwindow.result;
        if (radwindow.result != "CancelButton_Click")
            Lister2_Refresh(document.getElementById('<%# lstCertificationModule.ClientID %>'));            
    }
</script>

<asp:HiddenField ID="ReturnRegistrationWindowHidden" runat="server" />

<asiweb:PanelTemplateControl2 id="panel" runat="server" Collapsed="false" FieldSet="true" Collapsible="false" BorderStyle="None">
 
    <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel" runat="server" SkinID="AjaxLoadingPanel" IsSticky="true" />   
    <telerik:RadAjaxPanel ID="ContentPanel" runat="server" Visible="true" EnableAJAX="true" EnableViewState="true" LoadingPanelID="RadAjaxLoadingPanel">      
    
        <div id="divLegendLabels" runat="server">
                
            <div class="FloatRight">
                <asp:LinkButton runat="server" ID="btnCancelRegistration" OnClick="BtnCancelRegistrationClick" OnClientClick="return confirm('Cancel program enrollment?')"></asp:LinkButton>               
            </div>         
        
            <div style="padding-bottom:5px;">
                <asiweb:StyledLabel ID="requirementDescription" runat="server" />
            </div>

            <div class="PanelField Left" runat="server" id="divEnrollmentDate">           
                <asp:label CssClass="Label" ID="lblEnrollmentDate" runat="server" translate="yes" Text="Enrollment date" />           
                <div class="PanelFieldValue" style="height: 1.75em !important">               
                    <asiweb:StyledLabel ID="lblEnrollmentDateValue" runat="server" Width="110px" AssociatedControlID="EnrollmentDateValue" />                   
                    <div runat="server" id="EnrollmentDateSpan" style="display: inline;">
                        <asiweb:BusinessCalendar2 ID="EnrollmentDateValue" runat="server" MaxDate="12-31-9998" ControlType="DatePicker"/>                    
                        <telerik:RadButton ID="EnrollmentDateEditButton" runat="server" Width="17px" Height="17px" translate="yes" Text="Edit" ToolTip="Edit" AutoPostBack="false" CssClass="ButtonActions">
                            <Image ImageUrl="~/AsiCommon/Images/icon_edit.png" HoveredImageUrl="~/AsiCommon/Images/icon_edit.png" />                        
                        </telerik:RadButton> 
                        <telerik:RadButton ID="EnrollmentDateSaveButton" runat="server" Width="17px" Height="17px" Text="Save" translate="yes" ToolTip="Save" CssClass="ButtonActions"
                            OnClick="EnrollmentDateSaveButtonClick">
                            <Image ImageUrl="~/AsiCommon/Images/icon_check.png" />    
                        </telerik:RadButton>   
                        <telerik:RadButton ID="EnrollmentDateCancelButton" runat="server" Width="16px" Height="16px" translate="yes" Text="Cancel" AutoPostBack="false" ToolTip="Cancel" CssClass="ButtonActions">
                            <Image ImageUrl="~/AsiCommon/Images/icon_close.png" />     
                        </telerik:RadButton>
                    </div>                     
                </div>
            </div>
            
            <div class="PanelField Left" runat="server" id="GracePeriodDiv">  
                <asp:label CssClass="Label" ID="lblGracePeriod" runat="server" translate="yes" Text="Grace period begins" />
                <div class="PanelFieldValue" style="height: 1.75em !important">                   
                    <asiweb:StyledLabel ID="lblGracePeriodDate" runat="server" Width="110px" AssociatedControlID="GracePeriodDateValue" />  
                    <asiweb:BusinessCalendar2 ID="GracePeriodDateValue" runat="server" MaxDate="12-31-9998" ControlType="DatePicker"/>                                                                                                                  
                    <telerik:RadButton ID="GracePeriodDateEditButton" runat="server" Width="17px" translate="yes" Height="17px" Text="Edit" ToolTip="Edit" AutoPostBack="false" CssClass="ButtonActions">
                        <Image ImageUrl="~/AsiCommon/Images/icon_edit.png" HoveredImageUrl="~/AsiCommon/Images/icon_edit.png" />                        
                    </telerik:RadButton> 
                    <telerik:RadButton ID="GracePeriodDateSaveButton" runat="server" Width="17px" translate="yes" Height="17px" Text="Save" ToolTip="Save" CssClass="ButtonActions"
                        OnClick="GracePeriodDateSaveButtonClick">
                        <Image ImageUrl="~/AsiCommon/Images/icon_check.png" />    
                    </telerik:RadButton>   
                    <telerik:RadButton ID="GracePeriodDateCancelButton" runat="server" Width="16px" translate="yes" Height="16px" Text="Cancel" AutoPostBack="false" ToolTip="Cancel" CssClass="ButtonActions">
                        <Image ImageUrl="~/AsiCommon/Images/icon_close.png" />     
                    </telerik:RadButton>               
                </div> 
            </div>
                     
            <div class="PanelField Left">  
                <asp:label CssClass="Label" ID="lblProgramCompleteness" runat="server" translate="yes"/>
                <div class="PanelFieldValue" style="height: 1.75em !important">                   
                    <asiweb:StyledLabel ID="lblExpirationDate" runat="server" Width="110px" AssociatedControlID="ExpirationDateValue"/>                   
                    <div runat="server" id="ExpirationDateSpan" style="display: inline;">                                        
                        <asiweb:BusinessCalendar2 ID="ExpirationDateValue" runat="server" MaxDate="12-31-9998" ControlType="DatePicker"/>                                           
                        <telerik:RadButton ID="ExpirationDateEditButton" runat="server" Width="17px" Height="17px" Text="Edit" translate="yes" ToolTip="Edit" AutoPostBack="false" CssClass="ButtonActions">
                            <Image ImageUrl="~/AsiCommon/Images/icon_edit.png" HoveredImageUrl="~/AsiCommon/Images/icon_edit.png" />                        
                        </telerik:RadButton> 
                        <telerik:RadButton ID="ExpirationDateSaveButton" runat="server" Width="17px" Height="17px" translate="yes" Text="Save" ToolTip="Save" CssClass="ButtonActions"
                            OnClick="ExpirationDateSaveButtonClick">
                            <Image ImageUrl="~/AsiCommon/Images/icon_check.png" />    
                        </telerik:RadButton>   
                        <telerik:RadButton ID="ExpirationDateCancelButton" runat="server" Width="16px" Height="16px" translate="yes" Text="Cancel" AutoPostBack="false" ToolTip="Cancel" CssClass="ButtonActions">
                            <Image ImageUrl="~/AsiCommon/Images/icon_close.png" />     
                        </telerik:RadButton>
                    </div>                     
                </div> 
            </div>
                                          
            <div class="PanelField Left">           
                <asp:label CssClass="Label" ID="statusCaption" translate="yes" runat="server" />           
                <div class="PanelFieldValue">
                    <asiweb:StyledLabel Translate="yes" ID="statusValue" runat="server" />
                </div>
            </div>

            <div class="PanelField Left"> 
                <asp:label CssClass="Label" ID="lblUnitsCaption" translate="yes" runat="server"/>
                <div class="PanelFieldValue">
                    <asiweb:StyledLabel ID="lblUnitsLegend" runat="server"/>
                </div>
            </div>
        
            <div class="PanelField Left"> 
                <asp:label CssClass="Label" ID="lblRequiredUnits" translate="yes" runat="server" Text="Required"/>
                <div class="PanelFieldValue">
                    <asiweb:StyledLabel ID="lblRequiredUnitsValue" runat="server"/>
                </div>
            </div>
            
        </div> 
                
    </telerik:RadAjaxPanel>      
          
    <div style="clear:both;"></div>  
    <div class="PanelTitle">
        <asiweb:StyledLabel runat="server" translate="yes" ID="lblRequirements" />
    </div>
    
            <asiweb:Lister2
                id="lstCertificationModule"
                runat="server"
                width="100%"
                AjaxEnabled="false"
                SortingEnabled="false"
                PagingEnabled="true"
                PagerMode="Advanced"
                PageSize="20"   
                ColumnReorderingEnabled="false"
                SelectColumnLocation="None"
                LinkTargetBehavior="NewWindowAllShare"
                TargetUrl="~/Core/AccountManagement/CertificationManagement/OfferingList.aspx"
                ExportButtonLocation="None" 
                RefreshButtonLocation="None"  
                Custom1ColumnLocation="None"
                Custom1TargetBehavior="RaiseEvent"    
                OnItemCustom1Selected="LstCertificationModuleCancelClick"
                OnNeedDataSource="LstCertificationModuleNeedDataSource"
                OnItemDataBound="LstCertificationModuleItemDataBound"
                OnInit="lstCertificationModule_OnInit"
                ExportFormatsAvailable="None" 
                AllowRowSelecting="false" 
                AllowGridRowSelectStyle="false" 
            />
                
</asiweb:PanelTemplateControl2>

<script type="text/javascript"> 
    var enrollmentDateWrapper, enrollmentDateValue, enrollmentDateEditButton, enrollmentDateSaveButton, enrollmentDateCancelButton;
    var gracePeriodDateWrapper, gracePeriodDateValue, gracePeriodDateEditButton, gracePeriodDateSaveButton, gracePeriodDateCancelButton;
    var expirationDateWrapper, expirationDateValue, expirationDateEditButton, expirationDateSaveButton, expirationDateCancelButton;

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(PageRequestManager_endRequest);
    function PageRequestManager_endRequest() {
        DateFieldsInit();
    }
    // Needed to handle the column spans for the stages name and description row
    jQuery(document).ready(function () {
        RemoveTableCells();
        DateFieldsInit();
    });
    function RemoveTableCells() {
        var fCell = jQuery('td[data-cellName=FileAttachmentCell]');
        if (fCell != null)
            fCell.toggle();
        var dCell = jQuery('td[data-cellName=DescriptionCell]');
        if (dCell != null)
            dCell.toggle();
    }
    function DateFieldsInit() {
        enrollmentDateWrapper = jQuery("#<%=EnrollmentDateValue.ClientID %>rad_Dp_wrapper");
        enrollmentDateValue = jQuery("#<%=lblEnrollmentDateValue.ClientID %>");
        enrollmentDateEditButton = jQuery("#<%=EnrollmentDateEditButton.ClientID %>");
        enrollmentDateSaveButton = jQuery("#<%=EnrollmentDateSaveButton.ClientID %>");
        enrollmentDateCancelButton = jQuery("#<%=EnrollmentDateCancelButton.ClientID %>");
        gracePeriodDateWrapper = jQuery("#<%=GracePeriodDateValue.ClientID %>rad_Dp_wrapper");
        gracePeriodDateValue = jQuery("#<%=lblGracePeriodDate.ClientID %>");
        gracePeriodDateEditButton = jQuery("#<%=GracePeriodDateEditButton.ClientID %>");
        gracePeriodDateSaveButton = jQuery("#<%=GracePeriodDateSaveButton.ClientID %>");
        gracePeriodDateCancelButton = jQuery("#<%=GracePeriodDateCancelButton.ClientID %>");
        expirationDateWrapper = jQuery("#<%=ExpirationDateValue.ClientID %>rad_Dp_wrapper");
        expirationDateValue = jQuery("#<%=lblExpirationDate.ClientID %>");
        expirationDateEditButton = jQuery("#<%=ExpirationDateEditButton.ClientID %>");
        expirationDateSaveButton = jQuery("#<%=ExpirationDateSaveButton.ClientID %>");
        expirationDateCancelButton = jQuery("#<%=ExpirationDateCancelButton.ClientID %>");        
        DateFieldSetUp(enrollmentDateWrapper, enrollmentDateValue, enrollmentDateEditButton, enrollmentDateSaveButton, enrollmentDateCancelButton);
        DateFieldSetUp(gracePeriodDateWrapper, gracePeriodDateValue, gracePeriodDateEditButton, gracePeriodDateSaveButton, gracePeriodDateCancelButton);
        DateFieldSetUp(expirationDateWrapper, expirationDateValue, expirationDateEditButton, expirationDateSaveButton, expirationDateCancelButton);    
    }
    function DateFieldSetUp(wrapper, value, editButton, saveButton, cancelButton) {       
        wrapper.hide();
        saveButton.hide();
        cancelButton.hide();
        var dateFieldsEnableButtons = "DateFieldsEnableButtons('" + wrapper.attr('id') + "', '" + value.attr('id') + "', '" + editButton.attr('id') + "', '" + saveButton.attr('id') + "', '" + cancelButton.attr('id') + "')";
        var dateFieldsHideButtons = "DateFieldsHideButtons('" + wrapper.attr('id') + "', '" + value.attr('id') + "', '" + editButton.attr('id') + "', '" + saveButton.attr('id') + "', '" + cancelButton.attr('id') + "')";
        editButton.attr('onclick', dateFieldsEnableButtons);
        editButton.attr('onfocus', dateFieldsEnableButtons);
        cancelButton.attr('onclick', dateFieldsHideButtons);
        cancelButton.click(function() {
            var cancelEnrollmentBtn = jQuery("[id$='btnCancelRegistration']");
            if (cancelEnrollmentBtn != null) setTimeout(function() { cancelEnrollmentBtn.focus(); }, 100);  
        });
    }
    function DateFieldsEnableButtons(wrapper, value, editButton, saveButton, cancelButton) {
        jQuery("#" + wrapper).show();
        jQuery("#" + saveButton).show();
        jQuery("#" + cancelButton).show();
        jQuery("#" + value).hide();
        jQuery("#" + editButton).hide();
        if (wrapper.indexOf("EnrollmentDateValue") >= 0) {
            HideOpposingFields(gracePeriodDateWrapper, gracePeriodDateValue, gracePeriodDateEditButton, gracePeriodDateSaveButton, gracePeriodDateCancelButton);
            HideOpposingFields(expirationDateWrapper, expirationDateValue, expirationDateEditButton, expirationDateSaveButton, expirationDateCancelButton);
        }
        if (wrapper.indexOf("GracePeriodDateValue") >= 0) {
            HideOpposingFields(enrollmentDateWrapper, enrollmentDateValue, enrollmentDateEditButton, enrollmentDateSaveButton, enrollmentDateCancelButton);
            HideOpposingFields(expirationDateWrapper, expirationDateValue, expirationDateEditButton, expirationDateSaveButton, expirationDateCancelButton);
        }
        if (wrapper.indexOf("ExpirationDateValue") >= 0) {
            HideOpposingFields(enrollmentDateWrapper, enrollmentDateValue, enrollmentDateEditButton, enrollmentDateSaveButton, enrollmentDateCancelButton);
            HideOpposingFields(gracePeriodDateWrapper, gracePeriodDateValue, gracePeriodDateEditButton, gracePeriodDateSaveButton, gracePeriodDateCancelButton);
        }
      setTimeout(function() {
          var inputDate = jQuery("[id$='dateInput']"); if(inputDate != null) inputDate.focus(); },100);
    }
    function DateFieldsHideButtons(wrapper, value, editButton, saveButton, cancelButton) {
        jQuery("#" + wrapper).hide();
        jQuery("#" + value).show();
        jQuery("#" + saveButton).hide();
        jQuery("#" + cancelButton).hide();
        jQuery("#" + editButton).show();
    }
    function HideOpposingFields(wrapper, value, editButton, saveButton, cancelButton) {
        jQuery("#" + wrapper.attr('id')).hide();
        jQuery("#" + value.attr('id')).show();
        jQuery("#" + saveButton.attr('id')).hide();
        jQuery("#" + cancelButton.attr('id')).hide();
        jQuery("#" + editButton.attr('id')).show();
    }
</script>
