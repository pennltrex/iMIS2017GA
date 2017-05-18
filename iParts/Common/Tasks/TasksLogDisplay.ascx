<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TasksLogDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.Tasks.TasksLogDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI.HtmlControls" Assembly="System.Web, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true" Translate="Yes">
        <asp:Panel runat="server" CssClass="PanelBody" DefaultButton="FilterButton">
            <div class="PanelField" runat="server" id="TaskNameDiv" Visible="true">
               <asp:Label runat="server" Text="Name contains" AssociatedControlID="NameContainsTextBox" />
               <asiweb:BusinessTextBox ID="NameContainsTextBox" runat="server" Caption="Task" DisplayCaption="True" ToolTip="Task name contains"/>
            </div>
            <div class="PanelField">
               <asp:Label runat="server" Text="Status" AssociatedControlID="StatusSelect" />
               <asiweb:BusinessDropDownList ID="StatusSelect" runat="server" Caption="Status" DisplayCaption="True" ToolTip="Status equals" AutoPostBack="True"
                    OnDataChanged="StatusSelect_OnDataChanged"/>
               <asp:HiddenField ID="HiddenStatus" runat="server" Value=""/>
            </div>
            <div class="PanelField Left" style="display:inline;">  
                <div class="PanelFieldValue">             
                   <asiweb:StyledLabel runat="server" Text="Start date between" CssClass="label" AssociatedControlID="CalendarFromDate"></asiweb:StyledLabel>
                   <asiweb:BusinessCalendar2 ID="CalendarFromDate" runat="server" ToolTip="Start date" />                         
               </div>
                <div class="PanelFieldValue">
                   <asiweb:StyledLabel runat="server" Text="and &nbsp;" AssociatedControlID="CalendarToDate" style="width: auto;"></asiweb:StyledLabel>
                   <asiweb:BusinessCalendar2 ID="CalendarToDate" runat="server" ToolTip="End date" Caption="End date" DisplayCaption="True" PositionCaption="Left"/>
                   <span id="FilterDateRangeErrorMessage" runat="server" hidden class="ValidationError">Invalid date range</span>
                </div>
            </div>
            <div class="PanelField">
                <asiweb:StyledButton runat="server" ID="FilterButton" Text="Filter" OnClientClick="if (!ValidateFilterDateRange()) return false;" OnClick="FilterButtonOnClick" CssClass="PrimaryButton"/>
            </div>
        </asp:Panel>
        <asp:Panel runat="server" ID="ButtonPanel">
            <asp:LinkButton runat="server" ID="ExpandAllButton" Text="Expand All" OnClick="ExpandAllButtonOnClick" CssClass="MarginRight"/>
            <asp:LinkButton runat="server" ID="CollapseAllButton" Text="Collapse All" OnClick="CollapseAllButtonOnClick" />   
        </asp:Panel>
        <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" SkinID="AjaxLoadingPanel" /> 
        <telerik:RadAjaxPanel runat="server" ID="GridContentPanel" LoadingPanelID="LoadingPanel" >
            <asiweb:BusinessDataGrid2 ID="TasksLogGrid" runat="server" AllowSorting="true" AllowPaging="true" PageSize="25"
                OnNeedDataSource="TasksLogGridNeedDataSource" OnItemDataBound="TasksLogGridItemDataBound" OnPageIndexChanged="TasksLogGrid_OnPageIndexChanged"
                OnPageSizeChanged="TasksLogGrid_OnPageSizeChanged" OnSortCommand="TasksLogGrid_OnSortCommand" 
                OnDeleteCommand="TasksLogGridDeleteCommand" CssClass="FullWidth ScrollHorizontal" EnableShowAllButton="False">
                <MasterTableView AutoGenerateColumns="false" EnableNoRecordsTemplate="true" DataKeyNames="TaskLogId" 
                    NoMasterRecordsText='<%# ResourceManager.GetPhrase("NoTaskLogs", "There are no task logs.") %>'>                  
                    <Columns>                        
                        <telerik:GridBoundColumn
                            DataField="TaskName"
                            DataType="System.String"
                            HeaderText="Task"                        
                            AllowSorting="false" 
                            />
                        <telerik:GridBoundColumn
                            DataField="Status"
                            DataType="System.Int32"
                            HeaderText="Status"                            
                            AllowSorting="true"
                            />
                        <telerik:GridBoundColumn
                            DataField="StartTime"
                            DataType="System.DateTime"
                            DataFormatString="{0:G}"
                            HeaderText="Start"                           
                            />
                        <telerik:GridBoundColumn
                            DataField="EndTime"
                            DataType="System.DateTime"
                            DataFormatString="{0:G}"
                            HeaderText="End"                           
                            />
                        <telerik:GridButtonColumn 
                            ConfirmDialogType="RadWindow"
                            UniqueName="DeleteColumn"
                            ConfirmTitle="Delete" 
                            ButtonType="ImageButton" 
                            ImageUrl="~/AsiCommon/Images/icon_delete.png"  
                            CommandName="Delete" 
                            HeaderText="Delete">
                            <ItemStyle Width="25px" CssClass="AlignCenter VAlignMiddle" />
                            <HeaderStyle CssClass="text-hide"></HeaderStyle> 
                        </telerik:GridButtonColumn>                                                                                            
                        <telerik:GridBoundColumn
                            DataField="TaskDefinitionId"
                            DataType="System.String"
                            HeaderText="TaskDefinitionId"                            
                            AllowSorting="false"
                            Visible="true"
                            Display="false"
                            />                        
                    </Columns>
                    <NestedViewTemplate>                      
                        <asiweb:BusinessDataGrid2 ID="TasksLogNestedGrid" runat="server" AllowSorting="false" AllowPaging="true" PageSize="25" CssClass="ChildGridWrapper" 
                            RegisterWithScriptManager="false" OnItemDataBound="TasksLogNestedGridItemDataBound">
                            <MasterTableView AutoGenerateColumns="false" DataKeyNames="TaskLogDetailId" ShowHeader="true" >
                                <Columns>
                                    <telerik:GridBoundColumn
                                        AllowSorting="false"
                                        DataField="EventType"
                                        DataType="System.String"
                                        HeaderText="Event"
                                        />
                                    <telerik:GridBoundColumn
                                        AllowSorting="false"
                                        DataField="Status"
                                        DataType="System.Int32"
                                        HeaderText="Status"
                                        />
                                    <telerik:GridBoundColumn
                                        AllowSorting="false"
                                        DataField="EventDescription"
                                        DataType="System.String"
                                        HeaderText="Details"
                                        />
                                    <telerik:GridBoundColumn
                                        DataField="StartTime"
                                        DataType="System.DateTime"
                                        DataFormatString="{0:G}"
                                        HeaderText="Start"
                                        />
                                    <telerik:GridBoundColumn
                                        DataField="EndTime"
                                        DataType="System.DateTime"
                                        DataFormatString="{0:G}"
                                        HeaderText="End"
                                        />
                                </Columns>
                            </MasterTableView>
                        </asiweb:BusinessDataGrid2>                        
                    </NestedViewTemplate>
                </MasterTableView>
            </asiweb:BusinessDataGrid2>
        </telerik:RadAjaxPanel>
    <div class="PanelField">
        <asp:Button ID="DeleteAllButton" runat="server" Text="Delete Logs" OnClientClick="javascript: return PromptUserForRecordDeletion();" OnClick="DeleteAllButtonOnClick" CssClass="TextButton FloatLeft"/>
        <asp:HtmlInputHidden ID="HiddenDeletionPhrase" runat="server" Value="" />
    </div>          
</asp:Panel>

<script type="text/javascript"> 
    //<![CDATA[
    // Create the event handlers for PageRequestManager
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
    }
    function PageRequestManager_endRequest(sender, args) {
        var postbackElementId = $get(uiId);
        if (postbackElementId != null)
            postbackElementId.disabled = false;
        if (args.get_error() != undefined) {
            var error = args.get_error().name;
            if (error != 'undefined' && error == 'Sys.WebForms.PageRequestManagerServerErrorException')
                args.set_errorHandled(true);

            var postbackElementById = document.getElementById(uiId);
            if (postbackElementById != null)
                postbackElementById.focus();
        }        
    }
    function TasksLogWindowCallback(args) {
        if (args != null) {
            args.BrowserWindow.location.reload(true);
        }
    }

    function pageLoad() {
        validateBillingBetweenDateRange();

        jQuery('div[data-jQueryId="CalendarFromDate"] .radPreventDecorate').change(function (e) {
            validateBillingBetweenDateRange();
        });

        jQuery('div[data-jQueryId="CalendarToDate"] .radPreventDecorate').change(function (e) {
            validateBillingBetweenDateRange();
        });

        function validateBillingBetweenDateRange() {
            var rebillBetweenStartDate = Date.parse(jQuery('div[data-jQueryId="CalendarFromDate"] .riTextBox').val());
            var rebillBetweenEndDate = Date.parse(jQuery('div[data-jQueryId="CalendarToDate"] .riTextBox').val());
            
            if (!rebillBetweenEndDate) {
                jQuery('span[data-jQueryId="FilterDateRangeErrorMessage"]').hide();
                return;
            }

            if (!rebillBetweenStartDate || rebillBetweenEndDate < rebillBetweenStartDate) {
                jQuery('span[data-jQueryId="FilterDateRangeErrorMessage"]').show();
            }
            else {
                jQuery('span[data-jQueryId="FilterDateRangeErrorMessage"]').hide();
            }
        }
    }

    function ValidateFilterDateRange() {
         var isInvalid = jQuery('span[data-jQueryId="FilterDateRangeErrorMessage"]').is(":visible");
         if (isInvalid) {
             return false;
         } else {
             return true;
         }
    }

    function PromptUserForRecordDeletion() {
        var masterTable = $find(jQuery('div[data-jQueryId="TasksLogGrid"]')[0].id).get_masterTableView();

        if (masterTable.get_dataItems().length > 0) {
            return confirm(jQuery('input[data-jQueryId="HiddenDeletionPhrase"]').val());
        }
        else {
            return false;
        }
    }
    //]]>
</script>
