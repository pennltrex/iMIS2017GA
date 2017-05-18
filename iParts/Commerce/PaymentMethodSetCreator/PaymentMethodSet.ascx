<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PaymentMethodSet.ascx.cs" Inherits="Asi.Web.iParts.Commerce.PaymentMethodSetCreator.PaymentMethodSet" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asiweb:PanelTemplateControl2 ID="PaymentMethodSetPanel" runat="server" FieldSet="true"
    ShowHeader="true" BorderStyle="None" Text="Payment Method Set" Collapsed="false" Collapsible="false">
    
    <asp:UpdatePanel runat="server" ID="RefreshPanel" UpdateMode="Conditional" ChildrenAsTriggers="False">
    <ContentTemplate>
    <asp:Panel ID="Panel1" runat="server" DefaultButton="SubmitButton" >
        <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1" SkinID="AjaxLoadingPanel" />
        <telerik:RadAjaxPanel ID="ContentPanel" runat="server" Visible="true" EnableAJAX="True" EnableViewState="true" LoadingPanelID="RadAjaxLoadingPanel1">
            <div runat="server" visible="false" id="DivLabelErrorMessage">
            <asp:Label id="LabelErrorMessage" runat="server" cssclass="Error" />
            </div> 
            <div class="PanelField Left">      
                <asiweb:BusinessLabel id="PaymentMethodSetNameLabel" runat="server" Text="Method set" AssociatedControlID="PaymentMethodSetNameTextBox" CssClass="Required"/>       
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox id="PaymentMethodSetNameTextBox" runat="server"/>
                    <asiweb:AsiRequiredFieldValidator ID="PaymentMethodSetNameTextBoxValidator" runat="server"
                        ControlToValidate="PaymentMethodSetNameTextBox" EnableClientScript="true" ErrorMessage="Required"
                        Display="Static" SetFocusOnError="false" CssClass="Important" />   
                </div>
            </div>
            <div class="PanelField Left">        
                <asiweb:BusinessLabel id="PaymentMethodSetDescLabel" runat="server" Text="Description" AssociatedControlID="PaymentMethodSetDescTextBox" CssClass="Required"/>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox id="PaymentMethodSetDescTextBox" runat="server" Rows="2" TextMode="MultiLine"/>
                    <asiweb:AsiRequiredFieldValidator ID="AsiRequiredFieldValidator1" runat="server"
                        ControlToValidate="PaymentMethodSetDescTextBox" EnableClientScript="true" ErrorMessage="Required"
                        Display="Static" SetFocusOnError="false" CssClass="Important" />  
                </div>
            </div>    
  
            <div class="PanelField Left Section">          
                 <asiweb:BusinessLabel id="PaymentMethodSetContextLabel" runat="server" Text="Specific context" AssociatedControlID="PaymentMethodSetContextDropDown"/>
                <div class="PanelFieldValue">
                    <asiweb:BusinessDropDownList ID="PaymentMethodSetContextDropDown" runat="server" ShowNullItem="false" />   
                </div>
            </div> 
    
            <asiweb:BusinessLabel id="BusinessLabel1" runat="server" Text="Payment methods" CssClass="SectionLabel" /><br/>      
            <asp:Label runat="server" ID="labelError" CssClass="Error" Visible="False"></asp:Label>
            <telerik:RadGrid AllowMultiRowEdit="false" AllowMultiRowSelection="false" AllowSorting="false" 
                AlternatingItemStyle-CssClass="GridAlternateRow" AutoGenerateColumns="false" CssClass="Grid" 
                EnableLinqExpressions="false" FooterStyle-CssClass="GridFooter" GridLines="None" HeaderStyle-CssClass="GridHeader" 
                ID="RadGrid1" ItemStyle-CssClass="GridRow" runat="server" ShowStatusBar="false" ShowGroupPanel="false" AllowPaging="False">
              
                <MasterTableView AllowMultiColumnSorting="false" ClientDataKeyNames="PaymentMethodSetDetailId" CommandItemDisplay="Top"
                    DataKeyNames="PaymentMethodSetDetailId" EditMode="EditForms" ShowHeader="true"
                    InsertItemPageIndexAction="ShowItemOnCurrentPage">
            
                    <CommandItemStyle HorizontalAlign="right" />
                    <CommandItemTemplate>
                        <asp:LinkButton ID="btnEditSelected" runat="server" OnClientClick="javascript:return EditItem();" CommandName="EditSelected">
                            <asp:Image ID="Image1" runat="server" SkinID="PanelCommandButtonEdit" AlternateText="edit" />
                            <span class="RadGridCommandText"><%# GetTranslatedPhrase(ResourceManager.GetPhrase("EditSelected","Edit selected")) %></span>
                            &nbsp;&nbsp;
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnUpdateEdited" runat="server" CommandName="UpdateEdited" Visible='<%# RadGrid1.EditIndexes.Count > 0 %>'>
                            <asp:Image ID="Image2" runat="server" SkinID="CheckButton"  AlternateText="update" />
                            <span class="RadGridCommandText"><%# GetTranslatedPhrase(ResourceManager.GetWord("Save")) %></span>
                            &nbsp;&nbsp;
                        </asp:LinkButton>
                        <asp:LinkButton ID="SaveButton" runat="server" CommandName="PerformInsert" Visible='<%# RadGrid1.MasterTableView.IsItemInserted %>'>
                            <asp:Image ID="Image3" runat="server" SkinID="CheckButton"  AlternateText="insert" />
                            <span class="RadGridCommandText"><%# GetTranslatedPhrase(ResourceManager.GetWord("Save")) %></span>
                            &nbsp;&nbsp;
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnCancel" runat="server" CommandName="CancelAll" CausesValidation="False" Visible='<%# RadGrid1.EditIndexes.Count > 0 || RadGrid1.MasterTableView.IsItemInserted %>' OnClientClick="CancelRow()">
                            <asp:Image ID="Image4" runat="server" SkinID="CancelButton"  AlternateText="cancel"/>
                            <span class="RadGridCommandText"><%# GetTranslatedPhrase(ResourceManager.GetWord("Cancel")) %></span>
                            &nbsp;&nbsp;
                        </asp:LinkButton>
                        <asp:LinkButton ID="AddButton" runat="server" CommandName="InitInsert" Visible='<%# !RadGrid1.MasterTableView.IsItemInserted %>' OnClientClick="AddNewRow()">
                            <asp:Image ID="Image5" runat="server" SkinID="PanelCommandButtonAdd"  AlternateText="add"/>
                            <span class="RadGridCommandText"><%# GetTranslatedPhrase(ResourceManager.GetPhrase("AddNew","Add new")) %></span>
                            &nbsp;&nbsp;
                        </asp:LinkButton>                    
                        <asp:LinkButton ID="DeleteButton" OnClientClick="javascript: return DeleteItem();" runat="server" CommandName="DeleteSelected">
                            <asp:Image ID="Image6" runat="server" SkinID="PanelCommandButtonDelete"  AlternateText="delete" />
                            <span class="RadGridCommandText"><%# GetTranslatedPhrase(ResourceManager.GetPhrase("DeleteSelected","Delete selected")) %></span>
                            &nbsp;&nbsp;
                        </asp:LinkButton>                          
                    </CommandItemTemplate>
                                      
                    <Columns>
                
                        <telerik:GridTemplateColumn UniqueName="DisplayNameColumn" HeaderText="Display Name" EditFormHeaderTextFormat="Display Name" ItemStyle-Wrap="true" HeaderStyle-Wrap="false" DataField="DisplayName" SortExpression="DisplayName" AllowFiltering="True">
                            <ItemTemplate>
                                <asiweb:BusinessLabel id="DisplayNameLabel" runat="server"/>
                            </ItemTemplate>                   
                            <EditItemTemplate>
                                <div style="padding-bottom:5px!important;padding-top:5px!important;">
                                    <asiweb:BusinessTextBox runat="server" ID="DisplayNameTextBox" CausesValidation="False" /> 
                                </div>                      
                            </EditItemTemplate>                                       
                        </telerik:GridTemplateColumn>
                                
                        <telerik:GridTemplateColumn UniqueName="PayMethodIdColumn" HeaderText="Payment Method" EditFormHeaderTextFormat="Payment Method" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" DataField="PayMethodId" SortExpression="PayMethodId" >
                            <ItemTemplate>
                                <asiweb:BusinessLabel id="PayMethodLabel" runat="server"/>    
                            </ItemTemplate>                                      
                            <EditItemTemplate>
                                <div style="padding-bottom:5px!important;">
                                    <asiweb:BusinessDropDownList runat="server" ID="PayMethodIdSelect" ShowNullItem="false" />
                                    <asp:CustomValidator ID="UniqueValueValidator" runat="server" ErrorMessage="UniqueError" Display="dynamic"></asp:CustomValidator>
                                </div>                     
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                                                                             
                        <telerik:GridTemplateColumn UniqueName="IsDefault" HeaderText="Default" EditFormHeaderTextFormat="Default" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" DataField="IsDefault" SortExpression="IsDefault" >                   
                            <ItemTemplate>
                                <asiweb:BusinessLabel id="IsDefaultLabel" runat="server"/>     
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div style="padding-bottom: 10px!important;">                                              
                                    <asiweb:BusinessCheckBox ID="IsDefaultCheckBox" runat="server" />                               
                                </div>                              
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn> 
                    
                       <telerik:GridTemplateColumn EditFormHeaderTextFormat="" HeaderText="Position">
                            <ItemTemplate>
                                <asp:ImageButton ID="MoveUpButton" runat="server" CommandName="MoveUp" OnCommand="Grid1_OnMoveCommand" 
                                    Visible="<%# RadGrid1.EditIndexes.Count < 1 && !RadGrid1.MasterTableView.IsItemInserted %>" SkinID="MoveItemUpButton" 
                                    ToolTip='<%# ResourceManager.GetPhrase("MoveUp", "Move Up") %>' AlternateText="move up"/>
                                <asp:ImageButton ID="MoveDownButton" runat="server" CommandName="MoveDown" OnCommand="Grid1_OnMoveCommand"
                                    Visible="<%# RadGrid1.EditIndexes.Count < 1 && !RadGrid1.MasterTableView.IsItemInserted %>" SkinID="MoveItemDownButton"
                                    ToolTip='<%# ResourceManager.GetPhrase("MoveDown", "Move Down") %>' AlternateText="move down" />
                            </ItemTemplate>
                            <ItemStyle Width="75px" />
                            <HeaderStyle Width="75px" />
                        </telerik:GridTemplateColumn>
                           
                    </Columns> 
                     
                    <NoRecordsTemplate>
                        <asiweb:BusinessLabel ID="NoRecordLabel" runat="server" Text="(None)"></asiweb:BusinessLabel>
                    </NoRecordsTemplate> 

                    <EditFormSettings>
                        <FormTableItemStyle Wrap="False"></FormTableItemStyle>
                        <FormMainTableStyle GridLines="None" CellSpacing="0" CellPadding="5" Width="100%" />
                        <FormTableStyle GridLines="None" CellSpacing="0" CellPadding="0" Width="75%" />
                        <FormTableAlternatingItemStyle Wrap="False"></FormTableAlternatingItemStyle>
                        <FormStyle Width="100%"></FormStyle>
                        <EditColumn UniqueName="EditCommandColumn1" UpdateText="Save" CancelText="Cancel" InsertText="Save" ButtonType="PushButton">
                        </EditColumn>
                    </EditFormSettings> 
                                
                </MasterTableView>

                <ClientSettings>
                    <Selecting AllowRowSelect="True" /> 
                    <ClientEvents OnRowClick="RowSelected" OnGridCreated="GridCreated" OnCommand="GridCommand" ></ClientEvents>                                     
                </ClientSettings>
        
            </telerik:RadGrid>        
        </telerik:RadAjaxPanel>
        </asp:Panel>
    </ContentTemplate>    
    </asp:UpdatePanel> 

    <div id="commandButtons" class="ButtonPanel NotPrinted" runat="server" style="padding-top:1em;padding-bottom:0.5em;bottom:0;">
        <div class="CommandBar">           
            <asp:Button ID="SubmitButton" runat="server" OnClick="SubmitClick" causesvalidation="true" CssClass="TextButton PrimaryButton" />
            <asp:Button ID="ResetCancelButton" runat="server" OnClick="ResetCancel_Click" causesvalidation="false" CssClass="TextButton" /> 
        </div>           
    </div> 
    
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script type="text/javascript">      
        var submitButton = $get("<%#SubmitButton.ClientID%>");
        
        function AddNewRow() {
            submitButton.disabled = "disabled";
            submitButton.disabled = true;
            submitButton.setAttribute("disabled", true);
        }

        function CancelRow() {
            submitButton.disabled = false;
            submitButton.removeAttribute("disabled", 0);
        }

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
                submitButton.disabled = false;
                submitButton.removeAttribute("disabled", 0);
            }
        }

        function GridCreated(sender) {
            var gridElement = sender.get_element();           
        }

        function DeleteItem() {
            var grid = window.$find("<%= RadGrid1.ClientID %>");
            if (grid != null) {
                var selItem = grid.get_selectedItems();
                //if nothing selected
                if (selItem.length == 0) {
                    alert('Please select a row.');
                    return false;
                }
                else {
                    return confirm('Delete selected payment method?');
                }
            }
            return false;
        }

        function EditItem() {
            var grid = window.$find("<%= RadGrid1.ClientID %>");
            if (grid != null) {
                var selItem = grid.get_selectedItems();
                //if nothing selected
                if (selItem.length == 0) {
                    alert('Please select a row.');
                    return false;
                }
                else {                    
                    submitButton.disabled = "disabled";
                    submitButton.disabled = true;
                    submitButton.setAttribute("disabled", true);
                    return true;
                }
            }
            return false;
        }       
    </script>
    </telerik:RadCodeBlock>      
    
</asiweb:PanelTemplateControl2>