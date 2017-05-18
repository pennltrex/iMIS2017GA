<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommunicationTypes.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.CommunicationPreferencesEditor.CommunicationTypes" %>

<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asiweb:PanelTemplateControl2 ID="EditPanel" runat="server" ShowHeader="false" Collapsible="false" ScrollBars="None" BorderStyle="None" >

    <asp:Label runat="server" id="CommunicationTypesLabel" Text='<%# ResourceManager.GetPhrase("CommunicationTypes", "Communication types") %>' CssClass="SectionTitle"/> 
   
    <telerik:RadCodeBlock ID="CommunicationTypeCodeBlock" runat="server">
        <script type="text/javascript">
            var editedRow;

            function RowSelected(sender, args) {
                var grid = sender;
                var masterTable = grid.get_masterTableView();
                masterTable.selectItem(args.get_itemIndexHierarchical());
                editedRow = args.get_itemIndexHierarchical();

                //hide the edit button for the system defined communication types
                var mainGrid;
                mainGrid = window.$find("<%= CommunicationTypeRadGrid.ClientID %>");
                var row = mainGrid.MasterTableView.get_selectedItems()[0];
                var propertyValue;
                propertyValue = mainGrid.MasterTableView.getCellByColumnUniqueName(row, "ReasonCode");
                if (propertyValue != null) {
                    var val = propertyValue.innerHTML;
                    if (val.indexOf('Disabled') !== -1 || val.indexOf('disabled') !== -1) {
                        jQuery('a[id*="CommTypeEditSelectedButton"]').hide();
                    } else {
                        jQuery('a[id*="CommTypeEditSelectedButton"]').show();
                    }
                }
            }

            function GridCommand(sender, args) {
                if (args.get_commandName() != "Edit" || args.get_commandName() != "Delete") {
                    editedRow = null;
                }
            }

            function GridCreated(sender) {
                var gridElement = sender.get_element();
            }

            function EditItem() {
                var grid;
                grid = window.$find("<%= CommunicationTypeRadGrid.ClientID %>");

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
                        propertyValue = grid.MasterTableView.getCellByColumnUniqueName(row, "ReasonCode");
                        if (propertyValue != null) {
                            var val = propertyValue.innerHTML;
                            //if the cell is disabled then you cannot edit
                            if (val.indexOf('Disabled') !== -1 || val.indexOf('disabled') !== -1) {
                                alert('You cannot edit this row.');
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
        </script>
    </telerik:RadCodeBlock>

    <asiweb:StyledLabel runat="server" ID="Errors" Visible="false" Text="" CssClass="Error"/>
    
    <div class="PanelField Left">
        <telerik:RadAjaxLoadingPanel ID="CommunicationTypeRadAjaxLoadingPanel" runat="server" SkinID="AjaxLoadingPanel"/>
        <telerik:RadAjaxPanel ID="CommunicationTypeContentPanel" runat="server" Visible="True" EnableAJAX="True" EnableViewState="True" LoadingPanelID="CommunicationTypeRadAjaxLoadingPanel">
            <telerik:RadInputManager ID="CommunicationTypeRadInputManager" runat="server">
            </telerik:RadInputManager>
            <telerik:RadGrid ID="CommunicationTypeRadGrid" runat="server" AllowSorting="True" AutoGenerateColumns="False" AllowPaging="True" ShowStatusBar="True"
                AllowMultiRowSelection="False" PageSize="10" AllowMultiRowEdit="False" GridLines="None" CssClass="Grid" ItemStyle-CssClass="GridRow" EnableLinqExpressions="False"
                AlternatingItemStyle-CssClass="GridAlternateRow" HeaderStyle-CssClass="GridHeader" FooterStyle-CssClass="GridFooter" translate="yes"  >
                <PagerStyle Mode="NextPrevNumericAndAdvanced"/>
                <MasterTableView AllowMultiColumnSorting="True" CommandItemDisplay="Top" DataKeyNames="CommunicationTypeId" ClientDataKeyNames="CommunicationTypeId" EditMode="EditForms" InsertItemPageIndexAction="ShowItemOnCurrentPage" >
                    <SortExpressions>
                        <telerik:GridSortExpression FieldName="IsSystem" SortOrder="Ascending" />
                        <telerik:GridSortExpression FieldName="Status" SortOrder="Descending" />
                        <telerik:GridSortExpression FieldName="ReasonCode" SortOrder="Ascending" />
                    </SortExpressions>
                    <CommandItemTemplate>
                        <div class="FloatRight">
                            <asp:LinkButton ID="CommTypeEditSelectedButton" runat="server" OnClientClick="javascript:return EditItem();" CommandName="EditSelected" translate="yes">
                                <asp:Image ID="Image1" runat="server" AlternateText="Edit" SkinID="PanelCommandButtonEdit" />
                                <asiweb:BusinessLabel runat="server" ID="EditButtonLabel" CssClass="RadGridCommandText" Text=<%# ResourceManager.GetPhrase("EditSelected","Edit selected") %> translate="yes"/>
                                &nbsp;&nbsp;
                            </asp:LinkButton>
                            <asp:LinkButton ID="CommTypeUpdateEditedButton" runat="server" CommandName="UpdateEdited" Visible='<%# CommunicationTypeRadGrid.EditIndexes.Count > 0 %>' >
                                <asp:Image ID="Image2" runat="server" AlternateText="Check"  SkinID="CheckButton" />
                                <asiweb:BusinessLabel runat="server" ID="UpdateEditedButtonLabel" CssClass="RadGridCommandText" Text=<%# ResourceManager.GetWord("Save") %> translate="yes"/>
                                &nbsp;&nbsp;
                            </asp:LinkButton>
                            <asp:LinkButton ID="CommTypeSaveButton" runat="server" CommandName="PerformInsert" Visible='<%# CommunicationTypeRadGrid.MasterTableView.IsItemInserted %>'>
                                <asp:Image ID="Image3" runat="server" AlternateText="Check"  SkinID="CheckButton" />
                                <asiweb:BusinessLabel runat="server" ID="SaveButtonLabel" CssClass="RadGridCommandText" Text=<%# ResourceManager.GetWord("Save") %> translate="yes"/>
                                &nbsp;&nbsp;
                            </asp:LinkButton>
                            <asp:LinkButton ID="CancelButton" runat="server" CommandName="CancelAll" CausesValidation="False" Visible='<%# CommunicationTypeRadGrid.EditIndexes.Count > 0 || CommunicationTypeRadGrid.MasterTableView.IsItemInserted %>'>
                                <asp:Image ID="Image4" runat="server" AlternateText="Cancel"  SkinID="CancelButton" />
                                <asiweb:BusinessLabel runat="server" ID="CancelButtonLabel" CssClass="RadGridCommandText" Text=<%# ResourceManager.GetWord("Cancel") %> translate="yes"/>
                                &nbsp;&nbsp;
                            </asp:LinkButton>
                            <asp:LinkButton ID="CommTypeAddButton" runat="server" CommandName="InitInsert" Visible='<%# !CommunicationTypeRadGrid.MasterTableView.IsItemInserted %>'>
                                <asp:Image ID="Image5" runat="server" AlternateText="Add" SkinID="PanelCommandButtonAdd" />
                                <asiweb:BusinessLabel runat="server" ID="AddButtonLabel" CssClass="RadGridCommandText" Text=<%# ResourceManager.GetPhrase("AddNew","Add new") %> translate="yes"/>
                                &nbsp;&nbsp;
                            </asp:LinkButton>
                            <asp:LinkButton ID="CommTypeDeleteButton" runat="server" CommandName="DeleteSelected" OnClientClick="javascript: return DeleteItem();" Visible="False" >
                                <asp:Image ID="Image6" runat="server" AlternateText="Delete"  SkinID="PanelCommandButtonDelete" />
                                <asiweb:BusinessLabel runat="server" ID="DeleteButtonLabel" CssClass="RadGridCommandText" Text=<%# ResourceManager.GetPhrase("DeleteSelected","Delete selected") %> translate="yes"/>
                                &nbsp;&nbsp;
                            </asp:LinkButton>
                        </div>                        
                    </CommandItemTemplate>
                    <Columns>
                    
                        <telerik:GridTemplateColumn UniqueName="ReasonCode" HeaderText="Type" ItemStyle-Wrap="False" HeaderStyle-Wrap="False" DataField="ReasonCode" SortExpression="ReasonCode" EditFormHeaderTextFormat="Type" AllowFiltering="True">
                            <ItemTemplate>
                                <div style="display:inline;">
                                    <asiweb:BusinessLabel ID="CommunicationReasonLabel" runat="server" />
                                </div>                                
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div class="PanelFieldValue">
                                    <asiweb:BusinessTextBox ID="CommunicationReasonTextBox" runat="server" TextMode="SingleLine" />
                                    <asp:RequiredFieldValidator  ID="CommunicationReasonTextBoxRequiredFieldValidator" runat="server" ForeColor="Red" ErrorMessage='<%# ResourceManager.GetPhrase("Asi.Web.iParts.ContactManagement.CommunicationPreferencesEditor.TypeIsRequired", "Type is required.") %>' ControlToValidate="CommunicationReasonTextBox"></asp:RequiredFieldValidator>
                                </div>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                    
                        <telerik:GridTemplateColumn UniqueName="CommunicationTypeDisplay" HeaderText="Description displayed to users" ItemStyle-Wrap="True" HeaderStyle-Wrap="True" DataField="CommunicationTypeDisplay" EditFormHeaderTextFormat="Description" AllowFiltering="True">
                            <ItemTemplate>
                                <div style="display:inline;">
                                    <asiweb:BusinessLabel ID="CommunicationReasonDisplayLabel" runat="server"/>
                                </div>                                
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div class="PanelFieldValue">
                                    <asiweb:BusinessTextBox ID="CommunicationReasonDisplayTextBox" runat="server" MaxLength="500" Rows="4" TextMode="MultiLine"/>
                                    <asp:RequiredFieldValidator ID="CommunicationReasonDisplayRequiredFieldValidator" runat="server" ForeColor="Red" ErrorMessage='<%# ResourceManager.GetPhrase("Asi.Web.iParts.ContactManagement.CommunicationPreferencesEditor.DescriptionIsRequired", "Description is required.") %>' ControlToValidate="CommunicationReasonDisplayTextBox"></asp:RequiredFieldValidator>
                                </div> 
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                    
                         <telerik:GridTemplateColumn UniqueName="DefaultOptOut" HeaderText="Default subscription" ItemStyle-Wrap="False" HeaderStyle-Wrap="False" DataField="DefaultOptOut" EditFormHeaderTextFormat="Default">
                            <ItemTemplate>
                                <div style="display:inline;">
                                    <asiweb:BusinessLabel ID="OptOutLabel" runat="server"/>                                
                                </div>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div class="PanelFieldValue">
                                    <asiweb:BusinessDropDownList ID="OptOutDropDownList" runat="server" />                                    
                                </div>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>

                       <telerik:GridTemplateColumn UniqueName="Status" HeaderText="Status" ItemStyle-Wrap="False" HeaderStyle-Wrap="False" DataField="Status" SortExpression="Status" EditFormHeaderTextFormat="Status">
                            <ItemTemplate>
                                <div style="display:inline;">
                                    <asiweb:BusinessLabel ID="StatusLabel" runat="server"/>                                
                                </div>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div class="PanelFieldValue">
                                    <asiweb:BusinessDropDownList ID="StatusDropDownList" runat="server" />                                    
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
 </asiweb:PanelTemplateControl2>    