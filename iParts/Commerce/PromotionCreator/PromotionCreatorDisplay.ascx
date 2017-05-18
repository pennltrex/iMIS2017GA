<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PromotionCreatorDisplay.ascx.cs" Inherits="Asi.Web.iParts.Commerce.PromotionCreator.PromotionCreatorDisplay" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="Asi" %>
<%@ Import Namespace="Asi.Soa.Commerce.DataContracts" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<asp:UpdatePanel ID="GridUpdatePanel" runat="server" UpdateMode="Always">
<ContentTemplate>
   <asiweb:BusinessDataGrid2 runat="server" ID="PromotionGrid" Visible="true"  EnableViewstate="true" AutoPostBack="true"  AllowPaging="true" PageSize="30" 
                                        
                                        OnNeedDataSource="PromotionsGrid_NeedDataSource"
                                        OnItemDataBound="PromotionsGrid_OnItemDataBound"
                                        OnItemCommand="PromotionsGrid_ItemCommand">
        <MasterTableView AutoGenerateColumns="false" CommandItemDisplay="Top" AllowSorting="True"  NoMasterRecordsText='<%# ResourceManager.GetPhrase("Asi.Web.iParts.Commerce.PromotionCreator.NoPromotions", "There are no promotions.") %>'>
            <SortExpressions>
                <telerik:GridSortExpression runat="server" FieldName="PromotionName" SortOrder="Ascending"/>
             
            </SortExpressions>
            <CommandItemSettings  ShowAddNewRecordButton="false" />
            <CommandItemStyle HorizontalAlign="right"  />
                
                <Columns>
                    <telerik:GridHyperLinkColumn  HeaderText="Promotional Code Name" SortExpression="PromotionName" UniqueName="PromotionName" 
                    DataNavigateUrlFields="PromotionId"    
                    DataType="System.String"
                        DataTextField="PromotionName" > 
                    </telerik:GridHyperLinkColumn>
                    <telerik:GridBoundColumn 
                    DataField="PromotionCode"
                    DataType="System.String"
                    HeaderText="Promotion Code"
                    UniqueName="DiscountCodeName"
                    AllowSorting="True"
                    /> 
                     <telerik:GridBoundColumn 
                    DataField="BeginDate"
                    DataType="System.DateTime"
                    DataFormatString="{0:d}"
                    HeaderText="Begin Date"
                    UniqueName="DiscountBeginDate"
                    AllowSorting="True"
                    /> 
                     <telerik:GridBoundColumn 
                    DataField="EndDate"
                    DataType="System.DateTime"
                    DataFormatString="{0:d}"
                    HeaderText="End Date"
                    UniqueName="DiscountEndDate"
                    AllowSorting="True"
                    /> 
                    <telerik:GridTemplateColumn UniqueName="DeleteColumn">
                    <ItemTemplate>
                        <asp:ImageButton ID="DeleteImageButton" SkinID="PanelCommandButtonDelete" runat="server" CausesValidation="false" CommandArgument='<%# DataBinder.Eval( Container.DataItem, "PromotionId", "{0}" )%>'/>
                    </ItemTemplate>
                    </telerik:GridTemplateColumn>
                </Columns>
              
        </MasterTableView>         
    </asiweb:BusinessDataGrid2>  

    
    <%-- We can't display a RadGrid in design mode, so use a placeholder instead --%>
    <table runat="server" ID="DesignModePlaceholder" Visible="False" class="SimpleTable">
        <tr>
            <th>Promotional Code Name</th>
            <th>Promotion Code</th>
            <th>Begin Date</th>
            <th>End Date</th>
            <th>Delete?</th>
        </tr>
        <tr>
            <td>Name</td>
            <td>CODE</td>
            <td><%#DateTime.Today.ToString("d", CultureInfo.CurrentCulture) %></td>
            <td><%#DateTime.Today.AddMonths(1).ToString("d", CultureInfo.CurrentCulture) %></td>
            <td><asp:Image runat="server" SkinID="PanelCommandButtonDelete" /></td>
        </tr>
    </table> 
</ContentTemplate>
</asp:UpdatePanel>

