<%@ Page Language="C#" CodeBehind="CreditInvoice.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.CreditInvoice" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="True" MaintainScrollPositionOnPostback="true" Title="Credit invoices" %>

<asp:Content ID="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">

    <telerik:RadAjaxManagerProxy ID="RadAjaxManagerProxy1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="FindButton">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RefundsGrid" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManagerProxy>
    <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1" SkinID="AjaxLoadingPanel" /> 

    <asiweb:PanelTemplateControl2 ID="CreditInvoicePanelTemplate" runat="server" Collapsible="False" translate="yes">
        
        <telerik:RadTabStrip AutoPostBack="False" ID="CreditInvoiceRadTabStrip" MultiPageID="CreditInvoicePages" OnTabClick="CreditInvoiceRadTabStrip_OnTabClick" runat="server" SelectedIndex="0" Visible="true">
            <Tabs>
                <telerik:RadTab Text="Record refunds" Value="newExport" />
                <telerik:RadTab Text="Export log" Value="exportLog" Enabled="true" />
            </Tabs>
        </telerik:RadTabStrip>
    
        <telerik:RadMultiPage ID="CreditInvoicePages" runat="server" SelectedIndex="0">
            <telerik:RadPageView ID="NewCreditInvoicePage" runat="server" EnableViewState="true" CssClass="ContentTabbedDisplay AddPadding">               
                <asiweb:PanelTemplateControl2 ID="MassWriteOffsPanelTemplate" runat="server" Collapsible="False">               
                    <div class="Section">
                        <div class="PanelField Left">
                            <asiweb:StyledLabel runat="server" ID="BeginDateLabel" AssociatedControlID="BeginDate" />
                            <div class="PanelFieldValue">
                                <asiweb:BusinessCalendar2 runat="server" ID="BeginDate" RenderPanelField="false" DisplayCaption="true" UseSqlDateTimeMinValue="true" ValidateRequestMode="Enabled" onkeydown="if (event.keyCode == 13 && Page_ClientValidate()) { FindPress(); return false} " />
                                <asiweb:DateTimeValidator runat="server" ControlToValidate="BeginDate" Enabled="True"/>                                       
                                <asp:label runat="server" ID="AndLabel" CssClass="AddPaddingHorizontal PanelFieldLabelFont" />
                                <asiweb:BusinessCalendar2 runat="server" ID="EndDate" RenderPanelField="false" DisplayCaption="true" UseSqlDateTimeMinValue="true" ValidateRequestMode="Enabled" onkeydown="if (event.keyCode == 13 && Page_ClientValidate()) { FindPress(); return false} "/>
                                <asiweb:DateTimeValidator runat="server" ControlToValidate="EndDate" Enabled="True"/>
                                <asp:HiddenField runat="server" ID="HiddenDateRangeValidationErrorMsg" />
                                <asp:CustomValidator runat="server" ID="CustomValidatorDate" Display="Dynamic" style="margin-left:50px;" SetFocusOnError="true"/>          
                            </div>   
                        </div>                
                        <asiweb:BusinessTextBox runat="server" ID="InvoiceNumberTextBox" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left" onkeydown="if (event.keyCode == 13 && Page_ClientValidate()) { FindPress(); return false} "/>
                        <asiweb:BusinessTextBox runat="server" ID="BillToIdTextBox" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left" onkeydown="if (event.keyCode == 13 && Page_ClientValidate()) { FindPress(); return false} "/>                                                                                                  
                        <asiweb:BusinessTextBox runat="server" ID="BillToNameTextBox" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left" onkeydown="if (event.keyCode == 13 && Page_ClientValidate()) { FindPress(); return false} "/> 
                        <asiweb:StyledButton CausesValidation="true" CssClass="Button" id="FindButton" onclick="FindButtonButton_OnClicked" runat="server" />                                                               
                    </div>                   
                    <asiweb:Lister2 ID="RefundsGrid" runat="server" PageSize="20" CssClass="FullWidth ScrollHorizontal"
                        OnNeedDataSource="RefundsGrid_NeedDataSource" OnItemDataBound="RefundsGrid_OnItemDataBound" UseClientSelectColumnOnly="True" 
                        SelectColumnLocation="Beginning" SelectMultipleEnabled="True" ColumnReorderingEnabled="false" SortingEnabled="true"  AllowGridRowSelectStyle="True" 
                        DisplayPropertiesList="InvoiceDate,InvoiceNumber,BillToParty.Name,Balance.Amount" CanSelectAll="True" DataKeyNames="InvoiceId" DataSourceIsRealDataSource="True"
                        DisplayPropertiesTitleOverride="Date,Invoice,Bill To,Balance" ExportButtonLocation="TopRight" ExportFormatsAvailable="CSV" ShowHeadersWhenNoRecords="True" EnableShowAllButton="True"
                        HideSelectOnExport="True"
                        />
                    <div runat="server" class="AddPaddingVertical text-right">                        
                        <asiweb:StyledButton CausesValidation="true" CssClass="PrimaryButton download" id="CreateExportButton" disabled="true" onclick="CreateExportButton_OnClicked" runat="server" AutoPostBack="True"/> 
                    </div>                                   
                </asiweb:PanelTemplateControl2>
            </telerik:RadPageView>
                
            <telerik:RadPageView ID="CreditInvoiceListPage" runat="server" EnableViewState="true" CssClass="ContentTabbedDisplay AddPadding">
                <asp:Panel ID="ExportListPanel" runat="server">     
                    <asiweb:BusinessDataGrid2 ID="PastExportsGrid" runat="server" AllowSorting="true" AllowPaging="true" PageSize="20" CssClass="FullWidth ScrollHorizontal"
                        OnNeedDataSource="PastExportsGrid_NeedDataSource" OnItemDataBound="PastExportsGrid_OnItemDataBound">
                        <MasterTableView AutoGenerateColumns="false" EnableNoRecordsTemplate="true" NoMasterRecordsText="No records" TableLayout="Fixed">
                            <SortExpressions>
                                <telerik:GridSortExpression FieldName="CreatedOn" SortOrder="Descending" />
                            </SortExpressions>
                            <Columns>
                                <telerik:GridBoundColumn
                                    DataField="CreatedOn"
                                    DataType="System.DateTime"
                                    HeaderText="Processed On"
                                    UniqueName="CreatedOn">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn
                                    DataField="NumberOfTransactions"
                                    DataType="System.Int32"
                                    HeaderText="Number of Transactions"
                                    UniqueName="NumberOfTransactions"
                                    >
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn
                                    DataField="TotalAmount.Amount"
                                    DataType="System.Decimal"
                                    HeaderText="Amount"
                                    UniqueName="TotalAmount.Amount"
                                    >
                                    </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn
                                    DataField="CreatedByUserId"
                                    DataType="System.String"
                                    HeaderText="Processed By"
                                    UniqueName="CreatedByUserId"
                                    >
                                    </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn UniqueName="DownloadColumn" HeaderText="Download">
                                    <HeaderStyle Width="100px" CssClass="AlignCenter"/>
                                    <ItemStyle Width="100px" CssClass="AlignCenter VAlignMiddle" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="DownloadButton" OnClick="DownloadButton_OnClick" runat="server" ToolTip="Download" Visible="True"/>             
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                    </asiweb:BusinessDataGrid2>     
                </asp:Panel> 
            </telerik:RadPageView>

        </telerik:RadMultiPage>
        
    </asiweb:PanelTemplateControl2>
    
    <div style="clear:both;"></div>
    <asiweb:PanelTemplateControl2 ID="ProgressAreaPanel" runat="server" Collapsible="False" Width="500" CssClass="DisplayNone" translate="yes">      
        <telerik:RadProgressManager ID="RadProgressManager1" runat="server" />
        <telerik:RadProgressArea ID="RadProgressArea1" DisplayCancelButton="False" Skin="Bootstrap" 
            ProgressIndicators="TotalProgressBar,CurrentFileName" runat="server"   
            Width="100%" OnClientProgressUpdating="clientProgressUpdating" ValidateRequestMode="Disabled">                                      
        </telerik:RadProgressArea>
        <div class="RadUploadProgressArea RadUploadProgressArea_Bootstrap">									
	        <ul class="ruProgress">					
	            <li class="ruCurrentFile"><asp:Label runat="server" id="WarningLabel" /></li>
	        </ul>	
        </div> 
    </asiweb:PanelTemplateControl2>
 <script>
    Telerik.Web.UI.RadProgressManager.prototype._showInvalidContentMessage = function () { };
    document.styleSheets[0].insertRule(".ui-widget-overlay {position:fixed;top:0;left:0;width:100%;height:100%;background-color:#000;opacity:0.3;}", 0);
    document.styleSheets[0].insertRule(".ui-dialog {background-color:#FFF;border:1px solid #000;position:fixed;overflow:hidden;z-index:5000;}", 0);

    function clientProgressUpdating(sender, args) {
        document.styleSheets[0].insertRule(".RadUploadProgressArea{visibility:visible!important;width:auto!important;height:auto!important;}", 0);
        document.styleSheets[0].insertRule(".RadUploadProgressArea .ruProgress{border:0!important;color:#000!important;}", 0);

        jQuery('[id$=_ProgressAreaPanel]').dialog({
            autoOpen: true,
            width: 500,
            modal: true
        });

        jQuery(".ui-dialog-titlebar").hide();
        jQuery(".ruProgressHeader").hide();
        jQuery(".ruShadow").removeClass("ruShadow");
        jQuery("[id$=_RadProgressArea1]").show();

        var createExportButton = jQuery("[id$=CreateExportButton]");
        if (createExportButton != null) {
            createExportButton.attr("disabled", true);
            if (args._progressData.OperationComplete === "true") {
                setTimeout(function () { window.location.reload(1); }, 2000);
                createExportButton.removeAttr("disabled");
            }
        }
    }
   
    function ChangeButton(sender) {
        var grid = $find("<%= RefundsGrid.ClientID%>_Grid1");
        var gridSelectedItems = grid.get_selectedItems().length;
        var createExportButton = jQuery("[id$=CreateExportButton]");
        var dashLocation = createExportButton[0].value.indexOf(" : ");
        var buttonText = createExportButton[0].value.substring(0, dashLocation);

        var checkboxChecked = sender.children["0"].children["0"].attributes[6].value;
        if (checkboxChecked === "false")
            gridSelectedItems++;
        else
            gridSelectedItems--;

        if (gridSelectedItems !== 0) {
            createExportButton[0].value = buttonText + " : " + gridSelectedItems;
            if (createExportButton != null) {
                createExportButton.removeAttr("disabled");
            }
        } else {
            createExportButton[0].value = buttonText + " : 0";
            if (createExportButton != null) {
                createExportButton.attr("disabled", true);
            }
        }
    }

    function ChangeButtonAll() {
        var grid = $find("<%= RefundsGrid.ClientID%>_Grid1");
        var gridSelectedItems = grid.get_selectedItems().length;
        var createExportButton = jQuery("[id$=CreateExportButton]");
        var dashLocation = createExportButton[0].value.indexOf(" : ");
        var buttonText = createExportButton[0].value.substring(0, dashLocation);

        if (gridSelectedItems !== 0) {
            createExportButton[0].value = buttonText + " : " + gridSelectedItems;
            if (createExportButton != null) {
                createExportButton.removeAttr("disabled");
            }
        } else {
            createExportButton[0].value = buttonText + " : 0";
            if (createExportButton != null) {
                createExportButton.attr("disabled", true);
            }
        }
    }

    function enterKeyPress(e, button) {
        if (typeof e == 'undefined' && window.event) { e = window.event; }
        if (e != null && e.keyCode === 13) {
            jQuery("[id$=" + button + "]").click();
        }
    }

    function confirmAction(buttonClicked, windowTitle, confirmText) {
        if (buttonClicked == null) return false;
        if (confirmText == null) return false;
        var grid = $find("<%= RefundsGrid.ClientID%>_Grid1");
        var gridSelectedItems = grid.get_selectedItems();
        var message = gridSelectedItems.length + " " + confirmText;

        var createExportButton = jQuery("[id$=CreateExportButton]");
        if (createExportButton != null) {
            createExportButton.attr("disabled", true);
        }
        this.FirePostBack_CallBack = function (result) {
            if (result)
                __doPostBack(buttonClicked, "");
            else if (createExportButton != null) {
                createExportButton.removeAttr("disabled");
            }
        }

        radconfirm(message, this.FirePostBack_CallBack, 350, 250, null, windowTitle);
        return false;
    }
    jQuery(window).load(function () {
        var title = jQuery(".ListerColumnHeader").children().eq(1).attr("title");
        if (title != null)
        jQuery("[role$=checkbox]").attr("title", title);
    });

    function FindPress() {
    var masterTable = $find("<%= RefundsGrid.ClientID %>_Grid1").get_masterTableView();
    masterTable.rebind();
    }

    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
    function EndRequestHandler(sender, args) {
        if (args.get_error() != undefined) {
            args.set_errorHandled(true);
        }
    }
 </script>
</asp:Content>