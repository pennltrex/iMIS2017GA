<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OpenInvoiceListDisplayDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.OpenInvoiceListDisplay.OpenInvoiceListDisplayDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<script type="text/javascript">
    function RefreshList() {
        $('<%# RefreshList.ClientID %>').click();
    }
</script>
<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <telerik:RadAjaxPanel runat="server">
        <asiweb:BusinessDataGrid2 ID="OpenInvoicesGrid" OnPreRender="OpenInvoicesGrid_PreRender" runat="server" AllowSorting="true" AllowPaging="true" PageSize="100"
            OnNeedDataSource="OpenInvoicesGridNeedDataSource" OnItemDataBound="OpenInvoicesGridItemDataBound">
            <MasterTableView AutoGenerateColumns="false" EnableNoRecordsTemplate="true" DataKeyNames="InvoiceId">
                <Columns>
                    <telerik:GridTemplateColumn
                        HeaderText="Pay"
                        ItemStyle-Width="5%"
                        UniqueName="PayInvoice">
                        <ItemTemplate>
                            <asiweb:StyledLabel ID="PayInvoiceLabel" runat="server" AssociatedControlID="PayInvoiceCheckBox" CssClass="screen-reader-text" />
                            <asp:CheckBox ID="PayInvoiceCheckBox" runat="server" OnCheckedChanged="PayInvoiceCheckBoxCheckedChanged" AutoPostBack="true" />
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>
                   <telerik:GridHyperLinkColumn
                        DataTextField="InvoiceNumber"
                        DataNavigateUrlFields="InvoiceId"
                        DataType="System.Int32"
                        HeaderText="Invoice"
                        UniqueName="InvoiceNumber" />
                     <telerik:GridBoundColumn
                        DataField="InvoiceNumber"
                        DataType="System.Int32"
                       HeaderText="Invoice"
                        UniqueName="InvoiceNo"
                        />
                    <telerik:GridBoundColumn
                        DataField="InvoiceDate"
                        DataType="System.DateTime"
                        DataFormatString="{0:d}"
                        HeaderText="Date"
                        UniqueName="InvoiceDate"
                        />
                    <telerik:GridBoundColumn
                        DataField="Description"
                        DataType="System.String"
                        HeaderText="Description"
                        UniqueName="Description" />
                    <telerik:GridBoundColumn
                        DataField="DueDate"
                        DataType="System.DateTime"
                        DataFormatString="{0:d}"
                        HeaderText="Due Date"
                        UniqueName="DueDate" />
                    <telerik:GridBoundColumn
                        DataField="InvoiceAmount.Amount"
                        DataType="System.Decimal"
                        DataFormatString="{0:F2}"
                        HeaderText="Amount"
                        HeaderStyle-HorizontalAlign="Center"
                        UniqueName="InvoiceAmount"
                        AllowSorting="True"
                         />
                    <telerik:GridBoundColumn
                        DataField="Balance.Amount"
                        DataType="System.Decimal"
                        DataFormatString="{0:F2}"
                        HeaderText="Balance Due"
                        HeaderStyle-HorizontalAlign="Center"
                        UniqueName="Balance"
                        AllowSorting="True" />
                </Columns>
                <NestedViewTemplate>
                    <asp:Panel runat="server" CssClass="ChildGridWrapper">
                        <asiweb:BusinessDataGrid2 ID="InvoiceLinesGrid" runat="server" AllowSorting="true" AllowPaging="true" PageSize="10" 
                            OnItemDataBound="NestedGridItemDataBound" OnNeedDataSource="NestedGridNeedDataSource">
                            <MasterTableView AutoGenerateColumns="false" DataKeyNames="InvoiceLineId" ShowHeader="true" ShowFooter="false">
                                <Columns>
                                    <telerik:GridTemplateColumn ItemStyle-Width="5%">
                                        <HeaderTemplate>
                                            <asp:Literal runat="server" Text="&nbsp;" />
                                        </HeaderTemplate>
                                    </telerik:GridTemplateColumn>
                                    <telerik:GridBoundColumn
                                        AllowSorting="false"
                                        DataField="Item.Name"
                                        DataType="System.String"
                                        HeaderText="Item"
                                        UniqueName="InvoiceLineDescription" />
                                    <telerik:GridBoundColumn
                                        AllowSorting="false"
                                        DataField="ExtendedAmount"
                                        DataType="System.String"
                                        HeaderText="Amount"
                                        HeaderStyle-HorizontalAlign="Center"
                                        ItemStyle-HorizontalAlign="Right"
                                        UniqueName="InvoiceLineAmount" />
                                </Columns>
                            </MasterTableView>
                        </asiweb:BusinessDataGrid2>
                    </asp:Panel>
                </NestedViewTemplate>
            </MasterTableView>
        </asiweb:BusinessDataGrid2>
        <asp:Panel runat="server" CssClass="OpenInvoicesTotals">
            <asiweb:StyledLabel translate="yes" ID="TotalBalanceDueLabel" runat="server" DisplayCaption="true" PositionCaption="Left" RenderPanelField="true"
                Caption='<%# ResourceManager.GetPhrase("TotalBalanceDue", "Total Balance Due") %>' /> 
            <div class="SelectedTotal">
                <asiweb:StyledLabel translate="yes"  ID="TotalSelectedLabel" runat="server" DisplayCaption="true" PositionCaption="Left" RenderPanelField="true"
                    Caption='<%# ResourceManager.GetPhrase("TotalSelected", "Total Selected") %>' />  
            </div>
            <asiweb:StyledButton ID="CartButton" runat="server" CssClass="PrimaryButton" OnClick="CartButtonOnClick" />
        </asp:Panel>
        <asiweb:StyledButton ID="RefreshList" runat="server" OnClick="RefreshList_Click" style="display:none;" />
    </telerik:RadAjaxPanel>

</asp:Panel>
