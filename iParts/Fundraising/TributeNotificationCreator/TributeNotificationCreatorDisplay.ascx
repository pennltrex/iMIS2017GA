<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TributeNotificationCreatorDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.TributeNotificationCreator.TributeNotificationCreatorDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<telerik:RadAjaxLoadingPanel runat="server" ID="loadingPanel" Transparency="50" IsSticky="False" BackColor="LightGray" 
    BackgroundPosition="Center" Skin="Default"></telerik:RadAjaxLoadingPanel>

<telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="loadingPanel">
<div runat="server" id="OptionsPanel">                                 
    <div class="PanelField">
        <div style="display: inline;">
            <asiweb:StyledLabel runat="server" ID="CommunicationLabel"
            AssociatedControlID="CommunicationSelector"></asiweb:StyledLabel>
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessDropDownList runat="server" ID="CommunicationSelector" RenderPanelField="false" AutoPostBack="true" Required="true" ShowNullItem="False" OnSelectedIndexChanged="CommunicationSelector_OnSelectedIndexChanged"/>
        </div>
    </div>                                      
    <div Class="PanelField">                
        <asiweb:StyledLabel runat="server" ID="EmailNotificationsLabel" Text='<%# GetTranslatedPhrase(ResourceManager.GetPhrase("TributeNotificationCreator.SendOptions", "Send options"))%>'
            CssClass="Label" ></asiweb:StyledLabel>
        <div class="PanelFieldValue AutoWidth">    
            <asiweb:StyledRadioButton ID="EmailNotificationsRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right" 
                Caption='<%# GetTranslatedPhrase(ResourceManager.GetWord("Email"))%>' RenderPanelField="true"
                GroupName="EmailOrPrint" Checked="true"/>
            <asiweb:StyledRadioButton ID="PrintNotificationsRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right" 
                Caption='<%# GetTranslatedPhrase(ResourceManager.GetWord("Print"))%>' RenderPanelField="true"
                GroupName="EmailOrPrint" Checked="false"/>
        </div>
    </div>         
    <div style="clear:both;"></div>
    <h3><asiweb:StyledLabel runat="server" ID="SendHeader" /></h3>                
</div>
<asiweb:Lister2 ID="ResultsGrid1" runat="server" translate="yes"
    AjaxEnabled="False"
    SortingEnabled="true"
    PagingEnabled="true" 
    PagerMode="NextPrevAndNumeric" 
    ColumnReorderingEnabled="false" 
    EnableClientSideDelete="false"
    EditColumnLocation="None" 
    SelectColumnLocation="None" 
    DeleteColumnLocation="None"
    AddButtonEnabled="false" 
    DisableQueryEdit="true" 
    DataSourceSelectText="Select a query"
    DataSourceSelectHidden="false" 
    CollapsiblePanelTemplate="false" 
    RefreshButtonLocation="None" 
    HideResultsOnInitialLoad="Visible"
    Visible="true"
    OnNeedDataSource="ResultsGrid1NeedDataSource"
    AllowRowSelecting="false"
    AllowGridRowSelectStyle="false" 
    ExportButtonLocation="TopRight"
    DataSourceMaxRowCountBeforeWarning="500"
    DataSourceMaxRowCountWarningMessage="The selected query has more than 500 results. Notifications can only be processed in batch sizes of 500 or less. Please filter the results."
    />
<asiweb:StyledLabel ID="SourceMessage" runat="server" Visible="false" translate="yes"></asiweb:StyledLabel>
</telerik:RadAjaxPanel>
<div class="FloatRight" style="padding-top:10px;">
    <%-- Do not add button to RadAjaxPanel or print functionality will break due to Ajaxification/Response.Write conflicts --%>
    <asp:Button ID="GenerateNotificationsButton" runat="server" OnClick="GenerateNotifications_OnClick" 
        CssClass="PrimaryButton TextButton" OnClientClick="if(!GenerateConfirm()) return false;" >
    </asp:Button>     
</div>

<telerik:RadScriptBlock ID="RadScriptBlock" runat="server">
<script type="text/javascript">
    //<![CDATA[    
    var prm = window.Sys.WebForms.PageRequestManager.getInstance();      
    var generateNotificationsButton = $get("<%#GenerateNotificationsButton.ClientID%>");   
    var exportButtonsControl = $get("<%#ResultsGrid1.ClientID %>_TitlePanel");
    var resultsGrid = $get("<%#ResultsGrid1.ClientID %>_Grid1");
    
    addLoadEvent(HookEndRequest);
    function HookEndRequest() {
        EnableDisableControls(false);
        var resultGrid = jQuery(".rgNoRecords");
        var userMessage = jQuery(".AsiMessage");
        if (resultGrid.length >= 1 || userMessage.length >= 1) {
            EnableDisableControls(true);
        }
        prm.add_endRequest(TributeNotificationCreator_EndRequest);
    }

    function TributeNotificationCreator_EndRequest() {
        var resultGrid = jQuery(".rgNoRecords");
        var userMessage = jQuery(".AsiMessage");
        if (userMessage.length >= 1 || resultGrid.length >= 1) {
            EnableDisableControls(true);
        }
        else EnableDisableControls(false);
    }

    function EnableDisableControls(disable) {        
            
            if (!disable) {                
                jQuery("#" + generateNotificationsButton.id).removeClass('aspNetDisabled');
                EnableDisableGridControls(disable);
            } else {                
                jQuery("#" + generateNotificationsButton.id).addClass('aspNetDisabled');
                var userMessage = jQuery(".AsiValidation");
                if (userMessage.length >= 1)
                    EnableDisableGridControls(true);
            }
    }

    function EnableDisableGridControls(disable) {
        var masterTable = jQuery(".rgMasterTable");
        var expandColumns = jQuery("input[id$=_GECBtnExpandColumn]");
        if (masterTable.length <= 0 || expandColumns.length <= 0) return;
        
        if (!disable) {
            masterTable.removeClass('aspNetDisabled');
            jQuery("#" + exportButtonsControl.id).removeClass('DisplayNone');
            expandColumns.removeAttr('disabled');

        } else {
            jQuery("#" + exportButtonsControl.id).addClass('DisplayNone');
            masterTable.addClass('aspNetDisabled');
            expandColumns.attr('disabled', true);

            var sortColumns = jQuery("[id*='btn_ResultsGrid1']");
            if (sortColumns == null || sortColumns.length < 1) return;
            sortColumns.removeAttr('href');
            sortColumns.removeAttr('onclick');
        }
    }

    function GenerateConfirm() {        
        if (window.confirm('<%# GetTranslatedPhrase(ResourceManager.GetPhrase("ConfirmNotification", "Are you sure you want to issue these notifications?"))%>')) {
            setTimeout(afterConfirm, 500);
            return true;
        }
        return false;
    }

    function afterConfirm() {
        jQuery("#" + generateNotificationsButton.id).addClass('aspNetDisabled');
    }
    //]]>
</script>
</telerik:RadScriptBlock>