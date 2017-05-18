<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InvoiceListDisplayDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.InvoiceListDisplay.InvoiceListDisplayDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Import Namespace="Asi" %>


        

<!-- TODO: Remove this label, and add your own UI elements. -->
<asp:Panel ID="ContentPanel" runat="server" Visible="true">
  
    <asiweb:BusinessDataGrid2 runat="server" ID="InvoicesGrid"  OnNeedDataSource="InvoiceGrid_OnNeedDataSource" OnItemDataBound="InvoiceGrid_OnItemDataBound" AlternatingItemStyle-CssClass="GridAlternateRow" HeaderStyle-CssClass="GridHeader" FooterStyle-CssClass="GridFooter" AllowMultiRowSelection="False" AllowPaging="true" PageSize="10" AllowMultiRowEdit="False" GridLines="None" CssClass="Grid" ItemStyle-CssClass="GridRow">
         <MasterTableView  AllowSorting="True" NoMasterRecordsText='<%# ResourceManager.GetPhrase("Asi.Web.iParts.Commerce.InvoiceListDisplay.NoInvoicesToDisplay", "There are no invoices for the current user.") %>' AutoGenerateColumns="false" CommandItemDisplay="Top" DataKeyNames="InvoiceId"  >
             <CommandItemTemplate >
                <div class="FloatRight">
                    <asp:LinkButton ID="btnReverseSelected" CommandName="Reverse" OnClientClick='<%# ReverseButton %>' runat="server"  >
                        <div class="IconSprite EditIcon RadGridCommandIcon">&nbsp;</div>
                        <div class="RadGridCommandText">Reverse selected</div>
                    </asp:LinkButton>&nbsp;&nbsp;
                </div>
             </CommandItemTemplate>
             <SortExpressions>
                 <telerik:GridSortExpression FieldName="InvoiceBalance" SortOrder="Ascending" />
                 <telerik:GridSortExpression FieldName="InvoiceDate" SortOrder="Ascending" />
             </SortExpressions>
              <Columns>
                  <telerik:GridBoundColumn DataField="InvoiceID"
                    DataType="System.String"
                    Display="False"
                    ItemStyle-Width="13%"  
                    UniqueName="InvoiceID"
                      />
                  <telerik:GridBoundColumn DataField="InvoiceNumber"
                    DataType="System.Int32"
                    HeaderText="Invoice number"
                    UniqueName="InvoiceNumber"
                    ItemStyle-Width="10%"  
                    /> 
                    <telerik:GridBoundColumn DataField="Description"
                    DataType="System.String"
                    HeaderText="Description"
                    UniqueName="InvoiceDescription"
                    ItemStyle-Width="33%"  
                    /> 
                    <telerik:GridBoundColumn DataField="InvoiceAmount.Amount"
                    DataType="System.Decimal"
                    DataFormatString="{0:F2}"  
                    HeaderText="Amount"
                    UniqueName="InvoiceAmount"
                    ItemStyle-Width="10%"  
                    />
                     <telerik:GridBoundColumn DataField="Balance.Amount"
                    DataType="System.Decimal"
                    DataFormatString="{0:F2}" 
                    HeaderText="Balance Owing"
                    UniqueName="InvoiceBalance"
                    ItemStyle-Width="11%"  
                    />  
                    <telerik:GridBoundColumn DataField="PaymentAdjustmentAmount.Amount"
                    DataType="System.Decimal"
                    DataFormatString="{0:F2}" 
                    HeaderText="Reversed Amount"
                    UniqueName="ReversedAmount"
                    ItemStyle-Width="14%"  
                    />  
                    <telerik:GridBoundColumn DataField="InvoiceDate"
                    DataType="System.DateTime"
                    DataFormatString="{0:d}"  
                    HeaderText="Invoice Date"
                    UniqueName="InvoiceDate"
                    />
              </Columns>
         </MasterTableView>
         <ClientSettings>
            <Selecting AllowRowSelect="True" /> 
                                                
        </ClientSettings>
   </asiweb:BusinessDataGrid2>
    <br/>
   <asiweb:BusinessLabel runat="server" ID="StatusLabel"></asiweb:BusinessLabel>
</asp:Panel>


