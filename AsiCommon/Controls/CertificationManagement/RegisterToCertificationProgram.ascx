<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CertificationManagement_RegisterToCertificationProgram" Codebehind="RegisterToCertificationProgram.ascx.cs" %>

<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" Collapsible="false" ShowBorder="false">
    <input type="hidden" id="hiddenResult" runat="server" />        
    <asiweb:Lister2 id="Lister1"
      runat="server" 
      AjaxEnabled="true" 
      AddButtonLocation="TopRight"
      LinkTargetBehavior="SameWindow"
      DataSourceDocumentPath="$/CertificationManagement/DefaultSystem/Queries/AnalyzeRegistrantProgress/ContactSearch"
      SelectMultipleEnabled="true"
      ColumnReorderingEnabled="false"
      AddButtonEnabled="false"      
      EnablePostBackOnRowClick="True"
      CollapsiblePanelTemplate="False"
     />
    
    <div class="PanelField FloatRight" runat="server" ID="enrollDateDiv">
        <asiweb:StyledLabel AssociatedControlID="EnrollDate" runat="server" Text="Enrollment date" CssClass="Required"/>
        <asiweb:BusinessCalendar2 ID="EnrollDate" runat="server" ToolTip="Enrollment date" Required="True" ValidateRequestMode="Enabled" />         
        <asiweb:DateTimeValidator runat="server" ControlToValidate="EnrollDate"  />   
        <asiweb:AsiRequiredFieldValidator runat="server" ID="DateValidator" ControlToValidate="EnrollDaterad_Dp" Text="Required"></asiweb:AsiRequiredFieldValidator>          
    </div>
    <div class="PanelField FloatRight" >
        <asiweb:StyledButton ID="btnAddProduct" runat="server" Text="Enroll Selected" CssClass="PrimaryButton" />
        <asiweb:StyledButton ID="btnCancel" runat="server" Text="Cancel" />
    </div>         

</asiweb:PanelTemplateControl2>
<script type="text/javascript">
    var prm = window.Sys.WebForms.PageRequestManager.getInstance();

    addLoadEvent(HookEndRequest);
    function HookEndRequest() {
        EnableDisableControls(false);
        var emptyGrid = jQuery(".rgNoRecords");
        if (emptyGrid.length >= 1 || (jQuery('div[id$=HideResultsMessagePanel]') != 'undefined')) {
            EnableDisableControls(true);
            SetCalendarVisibility(true);
        }        
        prm.add_endRequest(RegisterPrograms_EndRequest);
    }

    function RegisterPrograms_EndRequest() {
        EnableDisableControls(false);
        var emptyGrid = jQuery(".rgNoRecords");
        if (emptyGrid.length >= 1) {
            EnableDisableControls(true);
            SetCalendarVisibility(true);
        }
        else {
            countChecked();
        }
        var selectAllCheckboxCell = jQuery('th[class="rgHeader rgCheck"]').length > 0 ? jQuery('th[class="rgHeader rgCheck"]')[0] : undefined;
        if (selectAllCheckboxCell != undefined) {
            selectAllCheckboxCell.onclick = function() {
                var selectAllCheckbox = jQuery('input[id$=SelectColumnSelectCheckBox]').length > 0 ? jQuery('input[id$=SelectColumnSelectCheckBox]')[0] : undefined;
                SetCalendarVisibility(!selectAllCheckbox.checked);
            };
        }
    }

    function countChecked() {
        var table = jQuery('table[id*="RegisterToCertificationProgram_Lister1"]');
        var n = table.find('input[type="checkbox"]:checked').length;
        if (n > 0)
            SetCalendarVisibility(false);
        else
            SetCalendarVisibility(true);
    }

    function SetCalendarVisibility(hide) {
        var calendarDiv = jQuery('div[id$=enrollDateDiv]');
        if (hide)
            calendarDiv.hide();
        else
            calendarDiv.show();
    }

    function EnableDisableControls(disable) {
        var enrollButton = jQuery('input[id$=btnAddProduct]')[0];
        if (enrollButton != null) {
            if (disable)
                enrollButton.setAttribute('disabled', disable);
            else
                enrollButton.removeAttribute("disabled", 0);
        }        
    }

    function CallBackFunction(radWindow, returnValue) {
        var hiddenResult = document.getElementById('<%# hiddenResult.ClientID %>');
        if (returnValue) {
            hiddenResult.value = returnValue;
            document.forms[0].submit();
        }
    }
</script>