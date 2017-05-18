<%@ Page Language="C#" CodeBehind="MassWriteOffs.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.MassWriteOffs" MasterPageFile="~/Templates/MasterPages/Empty.master" AutoEventWireup="True" MaintainScrollPositionOnPostback="true" Title="Mass write-offs" %>

<asp:Content ID="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">
    
    <telerik:RadAjaxManagerProxy ID="RadAjaxManagerProxy1" runat="server">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="FindButton">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="WriteOffsGrid" LoadingPanelID="RadAjaxLoadingPanel1" />
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManagerProxy>
    <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1" SkinID="AjaxLoadingPanel" /> 

    <asiweb:PanelTemplateControl2 ID="MassWriteOffsPanelTemplate" runat="server" Collapsible="False">
        <asp:Panel ID="NewPanel" runat="server" Visible="true">
            <div class="Section">                        
                <asiweb:BusinessCalendar2 runat="server" ID="InvoiceEndDate" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left" />
                <div>
                    <asiweb:BusinessTextBox runat="server" ID="CutOffAmount" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left" onkeydown="if (event.keyCode == 13 && Page_ClientValidate()) { FindPress(); return false} "/>
                    <asp:CompareValidator id="CheckFormat1" runat="server" ControlToValidate="CutOffAmount" CultureInvariantValues="true" Operator="DataTypeCheck" Type="Currency" Display="Dynamic" />    
                </div>
                
                <asiweb:BusinessDropDownList runat="server" ID="InvoiceType" RenderPanelField="True" DisplayCaption="True" PositionCaption="Left" />
                <asiweb:StyledButton CausesValidation="true" id="FindButton" runat="server" Text="Find" OnClick="FindButton_OnClick"/>
            </div>

            <asiweb:Lister2 ID="WriteOffsGrid" runat="server" PageSize="20" CssClass="FullWidth ScrollHorizontal"
                OnNeedDataSource="WriteOffsGrid_NeedDataSource" OnItemDataBound="WriteOffsGrid_OnItemDataBound" UseClientSelectColumnOnly="True"
                SelectColumnLocation="Beginning" SelectMultipleEnabled="True" ColumnReorderingEnabled="false" SortingEnabled="true" AllowGridRowSelectStyle="True" EnableViewState="True"
                DisplayPropertiesList="InvoiceDate,InvoiceNumber,BillToParty.Name,Description,Balance.Amount" CanSelectAll="True" DataKeyNames="InvoiceId" DataSourceIsRealDataSource="True"
                DisplayPropertiesTitleOverride="Date,Invoice,Bill To,Description,Balance" ExportButtonLocation="TopRight" ExportFormatsAvailable="CSV" ShowHeadersWhenNoRecords="True" EnableShowAllButton="True"
                HideSelectOnExport="True" AjaxEnabled="false"
                />

            <div runat="server" class="AddPaddingVertical text-right">                        
                <asiweb:StyledButton CssClass="PrimaryButton" id="RecordWriteOffsButton" disabled="true" onclick="RecordWriteOffsButton_OnClicked" runat="server" AutoPostBack="True"/>
            </div>
        </asp:Panel>
    </asiweb:PanelTemplateControl2>
    
    <div style="clear:both;"></div>
    <asiweb:PanelTemplateControl2 ID="ProgressAreaPanel" runat="server" Collapsible="False" Width="500" CssClass="DisplayNone">      
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

         var recordButton = jQuery("[id$=RecordWriteOffsButton]");
         if (recordButton != null) {
             recordButton.attr("disabled", true);
             if (args._progressData.OperationComplete === "true") {
                 setTimeout(function () { window.location.reload(1); }, 2000);
                 recordButton.removeAttr("disabled");
             }
         }
     }
     
     function FindPress() {
        var masterTable = $find("<%= WriteOffsGrid.ClientID %>_Grid1").get_masterTableView();
        masterTable.rebind();
     }

     function ChangeButton(sender) {
         var grid = $find("<%= WriteOffsGrid.ClientID%>_Grid1");
         var gridSelectedItems = grid.get_selectedItems().length;
         var recordButton = jQuery("[id$=RecordWriteOffsButton]");
         var dashLocation = recordButton[0].value.indexOf(" : ");
         var buttonText = recordButton[0].value.substring(0, dashLocation);

         var checkboxChecked = sender.children["0"].children["0"].attributes[6].value;
         if (checkboxChecked === "false")
             gridSelectedItems++;
         else
             gridSelectedItems--;

         if (gridSelectedItems !== 0){
             recordButton[0].value = buttonText + " : " + gridSelectedItems;
             if (recordButton != null) {
                 recordButton.removeAttr("disabled");
             }
         }else{
             recordButton[0].value = buttonText + " : 0";
             if (recordButton != null) {
                 recordButton.attr("disabled", true);
             }
         }
    }

     function ChangeButtonAll() {
         var grid = $find("<%= WriteOffsGrid.ClientID%>_Grid1");
         var gridSelectedItems = grid.get_selectedItems().length;
         var recordButton = jQuery("[id$=RecordWriteOffsButton]");
         var dashLocation = recordButton[0].value.indexOf(" : ");
         var buttonText = recordButton[0].value.substring(0, dashLocation);

         if (gridSelectedItems !== 0) {
             recordButton[0].value = buttonText + " : " + gridSelectedItems;
             if (recordButton != null) {
                 recordButton.removeAttr("disabled");
             }
         } else {
             recordButton[0].value = buttonText + " : 0";
             if (recordButton != null) {
                 recordButton.attr("disabled", true);
             }
         }
     }

     function confirmAction(buttonClicked, windowTitle, confirmText) {
         if (buttonClicked == null) return false;
         if (confirmText == null) return false;
         var grid = $find("<%= WriteOffsGrid.ClientID%>_Grid1");
         var gridSelectedItems = grid.get_selectedItems();
         var message = gridSelectedItems.length + " " + confirmText;

         this.FirePostBack_CallBack = function (result) {
             if (result)
                 __doPostBack(buttonClicked, "");
         }

         radconfirm(message, this.FirePostBack_CallBack, 350, 250, null, windowTitle);
         return false;
     }    
     jQuery(window).load(function () {
         var title = jQuery(".ListerColumnHeader").children().eq(1).attr("title");
         if (title != null)
            jQuery("[role$=checkbox]").attr("title", title);
     });
     Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
     function EndRequestHandler(sender, args) {
         if (args.get_error() != undefined) {
             args.set_errorHandled(true);
         }
     }
 </script>
</asp:Content>