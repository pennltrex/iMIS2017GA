<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InvoiceLinesView.ascx.cs" Inherits="Asi.WebRoot.AsiCommon.Controls.Commerce.Accounting.InvoiceLinesView" %>
<%@ Import Namespace="Asi" %>

<asiweb:BusinessDataGrid2 ID="InvoiceLinesGrid" runat="server" 
    AllowSorting="false" AllowPaging="True" PageSize="100" 
    OnNeedDataSource="InvoiceLinesGridNeedDataSource" OnItemDataBound="InvoiceLinesGridItemDataBound"
    OnItemCreated="InvoiceLinesGridItemCreated">
    <MasterTableView AutoGenerateColumns="false" EnableNoRecordsTemplate="true" DataKeyNames="InvoiceLineId"
        NoMasterRecordsText='<%# ResourceManager.GetPhrase("NoInvoiceLines", "There are no invoice lines.") %>' >          
        <Columns>                          
            <telerik:GridBoundColumn                               
                DataField="Item.ItemCode"
                DataType="System.String"
                HeaderText="Product Code"
                UniqueName="Item.ItemCode" />
            <telerik:GridBoundColumn                               
                DataField="Item.Name"
                DataType="System.String"
                HeaderText="Description"
                UniqueName="Item.Name" />
            <telerik:GridBoundColumn                              
                DataField="Quantity.Amount"
                DataType="System.String"
                HeaderText="Quantity"
                UniqueName="Quantity.Amount" /> 
            <telerik:GridBoundColumn                               
                DataField="UnitPrice"
                DataType="System.String"
                HeaderText="Unit Price"
                UniqueName="UnitPrice"
                ItemStyle-HorizontalAlign="Right" />                                                             
            <telerik:GridBoundColumn                               
                DataField="ExtendedAmount"
                DataType="System.String"
                HeaderText="Ext Price"
                UniqueName="ExtendedAmount"
                ItemStyle-HorizontalAlign="Right" />  
        </Columns>        
    </MasterTableView>    
    <ClientSettings AllowGroupExpandCollapse="false" EnablePostBackOnRowClick="false">
        <Selecting AllowRowSelect="false" />                                 
    </ClientSettings>
</asiweb:BusinessDataGrid2>    
