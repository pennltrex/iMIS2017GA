<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemPriceRuleEdit.aspx.cs" Inherits="Asi.Web.iParts.Commerce.ItemCreator.ItemPriceRuleEdit" %>
<%@ Import Namespace="Asi" %>
<%@Register tagPrefix="asiweb" namespace="Asi.Web.UI.WebControls" assembly="Asi.Web"  %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>


<asp:Content ID="ContentPanel" runat="server" ContentPlaceHolderID="TemplateBody">
    <asiweb:PanelTemplateControl ID="EditPanel" runat="server" ShowHeader="true" Collapsible="false" ScrollBars="None" BorderStyle="None" >
        
        <telerik:RadCodeBlock ID="MappingRadCodeBlock" runat="server">
            <script type="text/javascript">
            <!--
            var editedRow;
            function RowSelected(sender, args) {
                var grid = sender;
                var masterTable = grid.get_masterTableView();
                masterTable.selectItem(args.get_itemIndexHierarchical());
                editedRow = args.get_itemIndexHierarchical();
            }

            function GridCommand(sender, args) {
                if (args.get_commandName() != "Edit" || args.get_commandName() != "Delete") {
                    editedRow = null;
                }
            }

            function GridCreated(sender) {
                var gridElement = sender.get_element();
            }

            function DeleteItem(radGrid) {
                var grid;
                if(radGrid=="value")
                    grid = window.$find("<%= ValueMapRadGrid.ClientID %>");
                else if (radGrid=="range")
                    grid = window.$find("<%= RangeMapRadGrid.ClientID %>");
            if (grid != null) {
                var selItem = grid.get_selectedItems();
                //if nothing selected
                if (selItem.length == 0) {
                    alert('Please select a row.');
                    return false;
                }
                    //check if selected is deletable
                else {
                    var row = grid.MasterTableView.get_selectedItems()[0];
                    var propertyValue;
                    if(radGrid=="value")
                        propertyValue = grid.MasterTableView.getCellByColumnUniqueName(row, "PropertyValue");
                    else if (radGrid=="range")
                        propertyValue = grid.MasterTableView.getCellByColumnUniqueName(row, "BeginValue");
                    if (propertyValue != null) {
                        var val = propertyValue.innerHTML;
                        //if the cell is disabled then you cannot delete
                        if (val.indexOf('disabled') !== -1) {
                            alert('You cannot delete this value.');
                            return false;
                        } else {
                            return confirm('Delete selected value?');
                        }
                    }
                }
            }
            return false;
        }

        function EditItem(radGrid) {
            var grid;
            if(radGrid=="value")
                grid = window.$find("<%= ValueMapRadGrid.ClientID %>");
                else if (radGrid=="range")
                    grid = window.$find("<%= RangeMapRadGrid.ClientID %>");
            if (grid != null) {
                var selItem = grid.get_selectedItems();
                //if nothing selected
                if (selItem.length == 0) {
                    alert('Please select a row.');
                    return false;
                }
                    //check if editable by checking on UrlContent disabled property
                else {
                    var row = grid.MasterTableView.get_selectedItems()[0];
                    var propertyValue;
                    if(radGrid=="value")
                        propertyValue = grid.MasterTableView.getCellByColumnUniqueName(row, "PropertyValue");
                    else if (radGrid=="range")
                        propertyValue = grid.MasterTableView.getCellByColumnUniqueName(row, "BeginValue");
                    if (propertyValue != null) {
                        var val = propertyValue.innerHTML;
                        //if the cell is disabled then you cannot edit
                        if (val.indexOf('disabled') !== -1) {
                            alert('You cannot edit this value.');
                            return false;
                        }
                        else {
                            return true;
                        }
                    }
                    return false;
                }
            }
            return false;
        }        
        -->
        </script>
    </telerik:RadCodeBlock>

    <div runat="server" ID="MainContentWrapper" translate="yes">
        <asp:Label ID="LabelErrorMessage" runat="server" visible="false" cssclass="Error" /> 
        <asiweb:BusinessRadioButtonList ID="RuleTypeRadioButtonList" OnSelectedIndexChanged="RuleTypeRadioButtonList_SelectedIndexChanged" AutoPostBack="True" runat="server" DisplayCaption="True" Caption="Rule type" 
            RenderPanelField="True" CssClass="AutoWidth">
            <asp:ListItem Text="Use the value of a numeric property as the price" Value="0" Selected="True"/>
            <asp:ListItem Text="Map property values to prices" Value="1" Enabled="True"/>
            <asp:ListItem Text="Map numeric ranges to prices" Value="2" Enabled="True"/>
        </asiweb:BusinessRadioButtonList>
        
        <div class="PanelField Left">
            <div style="display: inline;">
                <asiweb:StyledLabel runat="server" ID="SourceLabel" CssClass="Required" Text='<%# ResourceManager.GetPhrase("Source", "Source")%>'
                    AssociatedControlID="SourceDropDownList"></asiweb:StyledLabel>
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessDropDownList ID="SourceDropDownList" runat="server" RenderPanelField="False" Required="True"
                    OnSelectedIndexChanged="SourceDropDownList_SelectedIndexChanged" AutoPostBack="True" />
                <asiweb:AsiRequiredFieldValidator ID="SourceDropDownListRequired" runat="server" ControlToValidate="SourceDropDownList" CssClass="Important" Display="Dynamic" SetFocusOnError="True"></asiweb:AsiRequiredFieldValidator>
            </div>
        </div>
        <div class="PanelField Left">
            <div style="display: inline;">
                <asiweb:StyledLabel runat="server" ID="PropertyLabel" CssClass="Required" Text='<%# ResourceManager.GetPhrase("Property", "Property")%>'
                    AssociatedControlID="PropertyDropDownList"></asiweb:StyledLabel>
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessDropDownList ID="PropertyDropDownList" runat="server" RenderPanelField="False" Required="True" 
                    OnSelectedIndexChanged="PropertyDropDownList_SelectedIndexChanged" AutoPostBack="True" />
                <asiweb:AsiRequiredFieldValidator ID="PropertyDropDownListRequired" runat="server" ControlToValidate="PropertyDropDownList" CssClass="Important" Display="Dynamic" SetFocusOnError="True"></asiweb:AsiRequiredFieldValidator>
            </div>
        </div>
        <div class="PanelField Left">
            <div style="display: inline;">
                <asiweb:StyledLabel runat="server" ID="StyledLabel1" CssClass="Required" Text='<%# ResourceManager.GetPhrase("Defaultprice", "Default price")%>'
                    AssociatedControlID="DefaultPriceTextBox"></asiweb:StyledLabel>
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox ID="DefaultPriceTextBox" runat="server" RenderPanelField="False" Required="True"
                    Enabled="False" />
                <asiweb:AsiRequiredFieldValidator ID="DefaultPriceTextBoxRequired" runat="server" ControlToValidate="DefaultPriceTextBox" CssClass="Important" Display="Dynamic" SetFocusOnError="True"></asiweb:AsiRequiredFieldValidator>
                <asp:RangeValidator runat="server" ID="DefaultPriceTextBoxRange" Type="Currency" ControlToValidate="DefaultPriceTextBox"
                                                        Display="Dynamic" MinimumValue="0" MaximumValue="1000000"
                                                        CssClass="Important" ErrorMessage='<%# ResourceManager.GetPhrase("PriceOutOfRange", "Must be a currency amount between 0 and 1000000.")%>' />
            </div>
        </div>

        <div class="PanelField Left">
            <telerik:RadAjaxLoadingPanel ID="ValueMapRadAjaxLoadingPanel" runat="server" SkinID="AjaxLoadingPanel"/>
            <telerik:RadAjaxPanel ID="ValueMapContentPanel" runat="server" Visible="True" EnableAJAX="True" EnableViewState="True" LoadingPanelID="ValueMapRadAjaxLoadingPanel">
                <telerik:RadInputManager ID="ValueMapRadInputManager" runat="server">
                </telerik:RadInputManager>
                <telerik:RadGrid ID="ValueMapRadGrid" runat="server" AllowSorting="True" AutoGenerateColumns="False" AllowPaging="True" ShowStatusBar="True"
                    AllowMultiRowSelection="False" PageSize="10" AllowMultiRowEdit="False" GridLines="None" CssClass="Grid" ItemStyle-CssClass="GridRow" EnableLinqExpressions="False"
                    AlternatingItemStyle-CssClass="GridAlternateRow" HeaderStyle-CssClass="GridHeader" FooterStyle-CssClass="GridFooter"   >
                    <PagerStyle Mode="NextPrevNumericAndAdvanced"/>
                    <MasterTableView AllowMultiColumnSorting="True" CommandItemDisplay="Top" DataKeyNames="Value" ClientDataKeyNames="Value" EditMode="EditForms" InsertItemPageIndexAction="ShowItemOnCurrentPage" >
                        <SortExpressions>
                            <telerik:GridSortExpression FieldName="Value" SortOrder="Ascending" />
                        </SortExpressions>
                        <CommandItemTemplate>
                            <div class="FloatRight">
                                <asp:LinkButton ID="ValueRangeEditSelectedButton" runat="server" OnClientClick="javascript:return EditItem('value');" CommandName="EditSelected" >
                                    <asp:Image runat="server" AlternateText="Edit" SkinID="PanelCommandButtonEdit" />
                                    <span class="RadGridCommandText"><%# Asi.ResourceManager.GetPhrase("EditSelected","Edit selected") %></span>&nbsp;&nbsp;
                                </asp:LinkButton>
                                <asp:LinkButton ID="ValueUpdateEditedButton" runat="server" CommandName="UpdateEdited" Visible='<%# ValueMapRadGrid.EditIndexes.Count > 0 %>' >
                                    <asp:Image runat="server" AlternateText="Check"  SkinID="CheckButton" />
                                    <span class="RadGridCommandText"><%# Asi.ResourceManager.GetWord("Save") %></span>&nbsp;&nbsp;
                                </asp:LinkButton>
                                <asp:LinkButton ID="ValueSaveButton" runat="server" CommandName="PerformInsert" Visible='<%# ValueMapRadGrid.MasterTableView.IsItemInserted %>'>
                                    <asp:Image runat="server" AlternateText="Check"  SkinID="CheckButton" />
                                    <span class="RadGridCommandText"><%# Asi.ResourceManager.GetWord("Save") %></span>&nbsp;&nbsp;
                                </asp:LinkButton>
                                <asp:LinkButton ID="CancelButton" runat="server" CommandName="CancelAll" CausesValidation="False" Visible='<%# ValueMapRadGrid.EditIndexes.Count > 0 || ValueMapRadGrid.MasterTableView.IsItemInserted %>'>
                                    <asp:Image runat="server" AlternateText="Cancel"  SkinID="CancelButton" />
                                    <span class="RadGridCommandText"><%# Asi.ResourceManager.GetWord("Cancel") %></span>&nbsp;&nbsp;
                                </asp:LinkButton>
                                <asp:LinkButton ID="ValueAddButton" runat="server" CommandName="InitInsert" Visible='<%# !ValueMapRadGrid.MasterTableView.IsItemInserted %>'>
                                    <asp:Image runat="server" AlternateText="Add" SkinID="PanelCommandButtonAdd" />
                                    <span class="RadGridCommandText"><%# Asi.ResourceManager.GetPhrase("AddNew","Add new") %></span>&nbsp;&nbsp;
                                </asp:LinkButton>
                                <asp:LinkButton ID="ValueDeleteButton" runat="server" CommandName="DeleteSelected" OnClientClick="javascript: return DeleteItem('value');" >
                                    <asp:Image runat="server" AlternateText="Delete"  SkinID="PanelCommandButtonDelete" />
                                    <span class="RadGridCommandText"><%# Asi.ResourceManager.GetPhrase("DeleteSelected","Delete selected") %></span>&nbsp;&nbsp;
                                </asp:LinkButton>
                            </div>                        
                        </CommandItemTemplate>
                        <Columns>
                            <telerik:GridTemplateColumn UniqueName="PropertyValue" HeaderText="Property Value" ItemStyle-Wrap="False" HeaderStyle-Wrap="False" DataField="DisplayText" SortExpression="DisplayText" EditFormHeaderTextFormat="Property Value" AllowFiltering="True">
                                <ItemTemplate>
                                    <div style="min-width:150px;">
                                        <asiweb:BusinessLabel ID="DisplayTextLabel" runat="server"/>
                                    </div>                                
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessDropDownList ID="DisplayTextDropDownList" runat="server" />
                                    </div>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="Amount" HeaderText="Price" ItemStyle-Wrap="False" HeaderStyle-Wrap="False" DataField="MappedAmount" SortExpression="MappedAmount" EditFormHeaderTextFormat="Price">
                                <ItemTemplate>
                                    <div style="min-width:150px;">
                                        <asiweb:BusinessLabel ID="PriceLabel" runat="server"/>                                    
                                    </div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessTextBox ID="PriceTextbox" runat="server" TextMode="SingleLine" Width="100px"/>                                    
                                    </div>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                        <NoRecordsTemplate>
                            <asiweb:BusinessLabel ID="NoRecordLabel" runat="server" Text="None" ></asiweb:BusinessLabel>
                        </NoRecordsTemplate>
                        <EditFormSettings>
                            <FormTableItemStyle Wrap="False"/>
                            <FormMainTableStyle GridLines="None" CellSpacing="0" CellPadding="5" Width="100%"/>
                            <FormTableStyle GridLines="None" CellSpacing="0" CellPadding="0" Width="75%" />
                            <FormTableAlternatingItemStyle Wrap="False"/>
                            <FormStyle Width="100%"/>
                            <EditColumn UniqueName="EditCommandColumn1" UpdateText="Save" CancelText="Cancel" InsertText="Save" ButtonType="PushButton"/>
                        </EditFormSettings>
                    </MasterTableView>
                    <ClientSettings>
                        <Selecting AllowRowSelect="True" /> 
                        <ClientEvents OnRowClick="RowSelected" OnGridCreated="GridCreated" OnCommand="GridCommand"/>                                     
                    </ClientSettings>
                </telerik:RadGrid>
            </telerik:RadAjaxPanel>    
        </div>

        <div class="PanelField Left">
            <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" SkinID="AjaxLoadingPanel"/>
            <telerik:RadAjaxPanel ID="RangeMapContentPanel" runat="server" Visible="True" EnableAJAX="True" EnableViewState="True" LoadingPanelID="RangeMapRadAjaxLoadingPanel">
                <telerik:RadInputManager ID="RangeMapRadInputManager" runat="server">
                </telerik:RadInputManager>
                <telerik:RadGrid ID="RangeMapRadGrid" runat="server" AllowSorting="True" AutoGenerateColumns="False" AllowPaging="True" ShowStatusBar="True"
                    AllowMultiRowSelection="False" PageSize="10" AllowMultiRowEdit="False" GridLines="None" CssClass="Grid" ItemStyle-CssClass="GridRow" EnableLinqExpressions="False"
                    AlternatingItemStyle-CssClass="GridAlternateRow" HeaderStyle-CssClass="GridHeader" FooterStyle-CssClass="GridFooter"   >
                    <PagerStyle Mode="NextPrevNumericAndAdvanced"/>
                    <MasterTableView AllowMultiColumnSorting="True" CommandItemDisplay="Top" DataKeyNames="RangeBeginValue" ClientDataKeyNames="RangeBeginValue" EditMode="EditForms" InsertItemPageIndexAction="ShowItemOnCurrentPage" >
                        <SortExpressions>
                            <telerik:GridSortExpression FieldName="RangeBeginValue" SortOrder="Ascending" />
                        </SortExpressions>
                        <CommandItemTemplate>
                            <div class="FloatRight">
                                <asp:LinkButton ID="RangeEditSelectedButton" runat="server" OnClientClick="javascript:return EditItem('range');" CommandName="EditSelected" >
                                    <asp:Image runat="server" AlternateText="Edit" SkinID="PanelCommandButtonEdit" />
                                    <span class="RadGridCommandText"><%# Asi.ResourceManager.GetPhrase("EditSelected","Edit selected") %></span>&nbsp;&nbsp;
                                </asp:LinkButton>
                                <asp:LinkButton ID="RangeUpdateEditedButton" runat="server" CommandName="UpdateEdited" Visible='<%# RangeMapRadGrid.EditIndexes.Count > 0 %>' >
                                    <asp:Image runat="server" AlternateText="Check"  SkinID="CheckButton" />
                                    <span class="RadGridCommandText"><%# Asi.ResourceManager.GetWord("Save") %></span>&nbsp;&nbsp;
                                </asp:LinkButton>
                                <asp:LinkButton ID="RangeSaveButton" runat="server" CommandName="PerformInsert" Visible='<%# RangeMapRadGrid.MasterTableView.IsItemInserted %>'>
                                    <asp:Image runat="server" AlternateText="Check"  SkinID="CheckButton" />
                                    <span class="RadGridCommandText"><%# Asi.ResourceManager.GetWord("Save") %></span>&nbsp;&nbsp;
                                </asp:LinkButton>
                                <asp:LinkButton ID="CancelButton" runat="server" CommandName="CancelAll" CausesValidation="False" Visible='<%# RangeMapRadGrid.EditIndexes.Count > 0 || RangeMapRadGrid.MasterTableView.IsItemInserted %>'>
                                    <asp:Image runat="server" AlternateText="Cancel"  SkinID="CancelButton" />
                                    <span class="RadGridCommandText"><%# Asi.ResourceManager.GetWord("Cancel") %></span>&nbsp;&nbsp;
                                </asp:LinkButton>
                                <asp:LinkButton ID="RangeAddButton" runat="server" CommandName="InitInsert" Visible='<%# !RangeMapRadGrid.MasterTableView.IsItemInserted %>'>
                                    <asp:Image runat="server" AlternateText="Add" SkinID="PanelCommandButtonAdd" />
                                    <span class="RadGridCommandText"><%# Asi.ResourceManager.GetPhrase("AddNew","Add new") %></span>&nbsp;&nbsp;
                                </asp:LinkButton>
                                <asp:LinkButton ID="RangeDeleteButton" runat="server" CommandName="DeleteSelected" OnClientClick="javascript: return DeleteItem('range');" >
                                    <asp:Image runat="server" AlternateText="Delete"  SkinID="PanelCommandButtonDelete" />
                                    <span class="RadGridCommandText"><%# Asi.ResourceManager.GetPhrase("DeleteSelected","Delete selected") %></span>&nbsp;&nbsp;
                                </asp:LinkButton>
                            </div>                        
                        </CommandItemTemplate>
                        <Columns>
                            <telerik:GridTemplateColumn UniqueName="BeginValue" HeaderText="Starting value" ItemStyle-Wrap="False" HeaderStyle-Wrap="False" DataField="RangeBeginValue" SortExpression="RangeBeginValue" EditFormHeaderTextFormat="Starting value" AllowFiltering="True">
                                <ItemTemplate>
                                    <div style="min-width:150px;">
                                        <asiweb:BusinessLabel ID="StartingValueLabel" runat="server"/>
                                    </div>                                
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessTextBox ID="StartingValueTextBox" runat="server"/>
                                    </div>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="BasePrice" HeaderText="Base price" ItemStyle-Wrap="False" HeaderStyle-Wrap="False" DataField="BaseAmount" SortExpression="BaseAmount" EditFormHeaderTextFormat="Base price">
                                <ItemTemplate>
                                    <div style="min-width:150px;">
                                        <asiweb:BusinessLabel ID="BasePriceLabel" runat="server"/>                                    
                                    </div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessTextBox ID="BasePriceTextbox" runat="server" ClientIDMode="Static" TextMode="SingleLine" Width="100px"/>                                    
                                    </div>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn UniqueName="PricePerUnit" HeaderText="Price per unit" ItemStyle-Wrap="False" HeaderStyle-Wrap="False" DataField="AdditionalUnitAmount" SortExpression="AdditionalUnitAmount" EditFormHeaderTextFormat="Price per unit">
                                <ItemTemplate>
                                    <div style="min-width:150px;">
                                        <asiweb:BusinessLabel ID="PricePerUnitLabel" runat="server"/>                                    
                                    </div>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <div class="PanelFieldValue">
                                        <asiweb:BusinessTextBox ID="PricePerUnitTextbox" runat="server" TextMode="SingleLine" Width="100px"/>                                    
                                    </div>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                        </Columns>
                        <NoRecordsTemplate>
                            <asiweb:BusinessLabel ID="NoRecordLabel2" runat="server" Text="None" ></asiweb:BusinessLabel>
                        </NoRecordsTemplate>
                        <EditFormSettings>
                            <FormTableItemStyle Wrap="False"/>
                            <FormMainTableStyle GridLines="None" CellSpacing="0" CellPadding="5" Width="100%"/>
                            <FormTableStyle GridLines="None" CellSpacing="0" CellPadding="0" Width="75%" />
                            <FormTableAlternatingItemStyle Wrap="False"/>
                            <FormStyle Width="100%"/>
                            <EditColumn UniqueName="EditCommandColumn2" UpdateText="Save" CancelText="Cancel" InsertText="Save" ButtonType="PushButton"/>
                        </EditFormSettings>
                    </MasterTableView>
                    <ClientSettings>
                        <Selecting AllowRowSelect="True" /> 
                        <ClientEvents OnRowClick="RowSelected" OnGridCreated="GridCreated" OnCommand="GridCommand"/>                                     
                    </ClientSettings>
                </telerik:RadGrid>
            </telerik:RadAjaxPanel>    
        </div>
        </div>
    </asiweb:PanelTemplateControl>                        
</asp:Content>
