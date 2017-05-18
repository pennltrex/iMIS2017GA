<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReceiptCreatorDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.ReceiptCreator.ReceiptCreatorDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<div runat="server" id="OptionsPanel">                                 
    <div class="PanelField">
        <div style="display: inline;">
            <asiweb:StyledLabel runat="server" ID="CommunicationLabel" Text='<%# ResourceManager.GetPhrase("ReceiptCreator.CommunicationsDocument", "Receipt template")%>'
            AssociatedControlID="CommunicationSelector"></asiweb:StyledLabel>
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessDropDownList runat="server" ID="CommunicationSelector" RenderPanelField="false" AutoPostBack="true" Required="true"
            ShowNullItem="False" OnSelectedIndexChanged="CommunicationSelector_OnSelectedIndexChanged"/>
        </div>
    </div>                                      
    <div Class="PanelField">                
        <asiweb:StyledLabel runat="server" ID="EmailReceiptsToDonorLabel" Text='<%# ResourceManager.GetPhrase("ReceiptCreator.SendOptions", "Send options")%>'
        CssClass="Label"></asiweb:StyledLabel>
        <div class="PanelFieldValue">    
            <asiweb:StyledRadioButton ID="EmailReceiptsToDonorRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right" 
                Caption='<%# ResourceManager.GetPhrase("EmailReceiptsToDonor", "Email receipts to donor")%>' RenderPanelField="true"
                GroupName="EmailOrPrint" Checked="true"/>
            <asiweb:StyledRadioButton ID="PrintReceiptsRadioButton" runat="server" DisplayCaption="true" PositionCaption="Right" 
                Caption='<%# ResourceManager.GetPhrase("PrintReceipts", "Print receipts")%>' RenderPanelField="true"
                GroupName="EmailOrPrint" Checked="false"/>
        </div>
    </div>  
    <div class="PanelField Right">
        <div class="PanelFieldValue">
            <asiweb:BusinessCheckBox ID="CreateAggregateReceiptsCheckBox" runat="server" RenderPanelField="false"/>
        </div>
        <asiweb:StyledLabel runat="server" ID="AggregateReceiptsLabel" Text='<%# ResourceManager.GetPhrase("ReceiptCreator.Aggregate", "Group gifts from the same donor into a single receipt")%>'
        AssociatedControlID="CreateAggregateReceiptsCheckBox"
        ToolTip='<%# ResourceManager.GetPhrase("ReceiptCreator.GroupReceiptsTip","When enabled a single receipt is issued to each donor for all their gifts.  When disabled a separate receipt is sent for each gift.") %>'> 
        </asiweb:StyledLabel>
    </div>        
    <div style="clear:both;"></div>
    <h3 style="padding-left:2px;"><%# ResourceManager.GetPhrase("ReceiptCreator.ReceiptsToIssue", "Receipts to issue")%></h3>                
</div>

<asiweb:Lister2 ID="ResultsGrid1" runat="server" 
    AjaxEnabled="True" 
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
    />
<asiweb:StyledLabel ID="SourceMessage" runat="server" Visible="false"></asiweb:StyledLabel>

<div class="FloatRight" style="padding-top:10px;">
    <telerik:RadButton ID="GenerateReceipts" runat="server" Text="Generate receipts" 
        OnClick="GenerateReceipts_OnClick"
        EnableBrowserButtonStyle="true" EnableEmbeddedSkins="false" EnableTheming="false" >
    </telerik:RadButton>     
</div>

<telerik:RadScriptBlock ID="RadScriptBlock" runat="server">
<script type="text/javascript">
    //<![CDATA[       
    var prm = window.Sys.WebForms.PageRequestManager.getInstance();
    var generateReceipts = $get("<%#GenerateReceipts.ClientID%>");  
    var generateReceiptsSpan = $get("<%#GenerateReceipts.ClientID%>");
    jQuery("#" + generateReceiptsSpan.id).removeAttr('class');
    var generateReceiptsButton = $get("<%#GenerateReceipts.ClientID%>_input");
    jQuery("#" + generateReceiptsButton.id).attr('class', 'PrimaryButton TextButton');
    
    addLoadEvent(HookEndRequest);
    function HookEndRequest() {
        generateReceiptsButton.disabled = false;
        var resultGrid = jQuery(".rgNoRecords");
        if (resultGrid.length >= 1) {
            generateReceiptsButton.disabled = true;
        }
        prm.add_endRequest(ReceiptCreator_EndRequest);
    }

    function ReceiptCreator_EndRequest() {
        generateReceiptsButton.disabled =false;
        var resultGrid = jQuery(".rgNoRecords");
        if (resultGrid.length >= 1) {
            generateReceiptsButton.disabled = true;
        }    
    }

    function GenerateConfirm(sender, args) {
        args.set_cancel(!window.confirm("Are you sure you want to issue receipts?"));
        if (!args._cancel) {
            var view = $find("<%#ResultsGrid1.ClientID %>_Grid1").get_masterTableView();
            view.set_dataSource([]);
            view.dataBind();
            setTimeout(afterConfirm, 1000);
            setTimeout(afterIssueRequest, 3000);
        }
    }

    function PrintConfirm(sender, args) {      
        args.set_cancel(!window.confirm("Are you sure you want to print receipts?"));
    }

    function afterConfirm() {
        generateReceiptsButton.disabled = true;
    }

    function afterIssueRequest() {
        generateReceiptsButton.disabled = true;
        var view = $find("<%#ResultsGrid1.ClientID %>_Grid1").get_masterTableView();
        view.rebind();
    }
    //]]>
</script>
</telerik:RadScriptBlock>