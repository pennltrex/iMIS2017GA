<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TasksDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.Tasks.TasksDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1" SkinID="AjaxLoadingPanel" />  
<telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
    <div class="GridTitlePanel">
        <div class="FloatRight">
            <asiweb:Hyperlink runat="server" ID="AddTask" translate="yes" />	    
        </div>
    </div>    
    <asiweb:BusinessDataGrid2 ID="TasksGrid" runat="server" 
        AllowSorting="true" AllowPaging="true" PageSize="20"
        OnNeedDataSource="TasksGridNeedDataSource" OnItemDataBound="TasksGridItemDataBound" 
        OnDeleteCommand="TasksGridDeleteCommand" EnableShowAllButton="false">
        <MasterTableView AutoGenerateColumns="false" EnableNoRecordsTemplate="true" 
            DataKeyNames="TaskDefinitionId" 
            NoMasterRecordsText='<%# ResourceManager.GetPhrase("NoRecords", "There are no records.") %>' >          
            <Columns>
                <telerik:GridBoundColumn
                    AllowSorting="true"
                    DataField="Name"
                    DataType="System.String"
                    HeaderText="Name"
                    UniqueName="Name" />
                <telerik:GridBoundColumn
                    AllowSorting="true"
                    DataField="Description"
                    DataType="System.String"
                    HeaderText="Description"
                    UniqueName="Description" />
                <telerik:GridBoundColumn
                    AllowSorting="True"
                    DataField="TaskType"
                    DataType="System.String"
                    HeaderText="Type"
                    UniqueName="Type" />
                <telerik:GridBoundColumn
                    AllowSorting="true"
                    DataField="IsActive"
                    DataType="System.Boolean"
                    HeaderText="Enabled"
                    UniqueName="IsActive"
                    HeaderStyle-HorizontalAlign="Center" />
                <telerik:GridBoundColumn
                    AllowSorting="true"
                    DataField="UpdateInformation.CreatedOn"
                    DataType="System.DateTime"
                    DataFormatString="{0:d}"
                    HeaderText="Date Created"
                    UniqueName="CreatedOn" />
                <telerik:GridButtonColumn  
                    ConfirmDialogType="RadWindow"
                    ConfirmTitle="Delete" 
                    ButtonType="ImageButton" 
                    ImageUrl="~/AsiCommon/Images/icon_delete.png"  
                    CommandName="Delete" 
                    HeaderText="Delete"
                    UniqueName="DeleteColumn">
                    <ItemStyle CssClass="text-right" />
                    <HeaderStyle CssClass="text-hide"></HeaderStyle>
                </telerik:GridButtonColumn>
            </Columns>        
        </MasterTableView>    
        <ClientSettings AllowGroupExpandCollapse="false" EnablePostBackOnRowClick="false">
            <Selecting AllowRowSelect="false" />                                 
        </ClientSettings>
    </asiweb:BusinessDataGrid2>    
    
</telerik:RadAjaxPanel>   

<script type="text/javascript">
    function DialogWindowCallback() {
        var masterTable = $find("<%#TasksGrid.ClientID%>").get_masterTableView();
        if (masterTable != null)
            masterTable.rebind();
    }
</script> 