<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" EnableViewStateMac="false" Title="Manage Shortcuts" Inherits="AsiCommon_Controls_ContentManagement_URLMapping" Codebehind="URLMapping.aspx.cs" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="TemplateBody">
    <asiweb:PanelTemplateControl2 ID="PanelTemplate1" runat="server" TemplateTitle="Shortcuts" Collapsible="false">    
        <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
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

            function DeleteItem() {
                var grid = window.$find("<%= RadGrid1.ClientID %>");
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
                        var urlContent = grid.MasterTableView.getCellByColumnUniqueName(row, "Website");
                        if (urlContent != null) {
                            var val = urlContent.children[0];
                            if (val !== null && val !== 'undefined')
                                var cssClass = val.getAttribute("class");
                            
                            //if the cell is disabled then you cannot delete
                            if (cssClass !== null && cssClass !== 'undefined' && cssClass == "aspNetDisabled"){
                                alert('<%= GetTranslatedPhrase("You cannot delete this shortcut.") %>');
                                return false;
                            } else {
                                return confirm('<%= GetTranslatedPhrase("Delete selected shortcut?") %>');
                            }
                        }
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
                        alert('<%= GetTranslatedPhrase("Please select a row.") %>');
                        return false;
                    }
                    //check if editable by checking on UrlContent disabled property
                    else {
                        var row = grid.MasterTableView.get_selectedItems()[0];
                        var urlContent = grid.MasterTableView.getCellByColumnUniqueName(row, "UrlContent");
                        if (urlContent != null) {
                            var val = urlContent.children[0];
                            if (val !== null && val !== 'undefined')
                                var cssClass = val.getAttribute("class");
                            //if the cell is disabled then you cannot edit
                            if (cssClass !== null && cssClass !== 'undefined' && cssClass == "aspNetDisabled") {
                                alert('<%= GetTranslatedPhrase("You cannot edit this shortcut.") %>');
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
        <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1" SkinID="AjaxLoadingPanel" />  
        <telerik:RadAjaxPanel ID="ContentPanel" runat="server" Visible="true" EnableAJAX="true" EnableViewState="true" LoadingPanelID="RadAjaxLoadingPanel1">        
            <telerik:RadInputManager ID="RadInputManager1" runat="server">
            <telerik:TextBoxSetting BehaviorID="TextBoxBehavior1" EmptyMessage="~/ImisEvents/Conferences/ConferenceList">
                <TargetControls>
                    <telerik:TargetInput ControlID="URLSelector_DocBrowserPath"/>
                </TargetControls>
            </telerik:TextBoxSetting>
            </telerik:RadInputManager>               
            <telerik:RadGrid ID="RadGrid1" AllowSorting="True" AutoGenerateColumns="False" AllowPaging="True" runat="server" ShowStatusBar="True"
                AllowMultiRowSelection="False" PageSize="20" AllowMultiRowEdit="False" GridLines="None" CssClass="Grid" ItemStyle-CssClass="GridRow" EnableLinqExpressions="False"   
                AlternatingItemStyle-CssClass="GridAlternateRow" HeaderStyle-CssClass="GridHeader" FooterStyle-CssClass="GridFooter">
                <PagerStyle Mode="NextPrevNumericAndAdvanced" />
                <MasterTableView AllowMultiColumnSorting="True" CommandItemDisplay="Top" EditMode="EditForms" DataKeyNames="URLMappingKey" ClientDataKeyNames="URLMappingKey" InsertItemPageIndexAction="ShowItemOnCurrentPage">
                    <CommandItemTemplate>
                        <div class="FloatRight">
                            <%--<telerik:RadButton ID="btnEditSelected" SkinID="EditWithText" Text="Edit Selected" />    --%>                
                            <asp:LinkButton ID="btnEditSelected" runat="server" OnClientClick="javascript:return EditItem();" CommandName="EditSelected">
                                <asp:Image runat="server" SkinID="PanelCommandButtonEdit" />
                                <span class="RadGridCommandText"> <%#GetTranslatedPhrase("Edit selected")%> </span>
                                &nbsp;&nbsp;
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnUpdateEdited" runat="server" CommandName="UpdateEdited" Visible='<%# RadGrid1.EditIndexes.Count > 0 %>'>
                                <asp:Image runat="server" SkinID="CheckButton" />
                                <span class="RadGridCommandText"> <%#GetTranslatedPhrase("Save")%> </span>
                                &nbsp;&nbsp;
                            </asp:LinkButton>
                            <asp:LinkButton ID="SaveButton" runat="server" CommandName="PerformInsert" Visible='<%# RadGrid1.MasterTableView.IsItemInserted %>'>
                                <asp:Image runat="server" SkinID="CheckButton" />
                                <span class="RadGridCommandText"> <%#GetTranslatedPhrase("Save")%> </span>
                                &nbsp;&nbsp;
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnCancel" runat="server" CommandName="CancelAll" CausesValidation="False" Visible='<%# RadGrid1.EditIndexes.Count > 0 || RadGrid1.MasterTableView.IsItemInserted %>'>
                                <asp:Image runat="server" SkinID="CancelButton" />
                                <span class="RadGridCommandText"> <%#GetTranslatedPhrase("Cancel")%> </span>
                                &nbsp;&nbsp;
                            </asp:LinkButton>
                            <asp:LinkButton ID="AddButton" runat="server" CommandName="InitInsert" Visible='<%# !RadGrid1.MasterTableView.IsItemInserted %>'>
                                <asp:Image runat="server" SkinID="PanelCommandButtonAdd" />
                                <span class="RadGridCommandText"> <%#GetTranslatedPhrase("Add new")%> </span>
                                &nbsp;&nbsp;
                            </asp:LinkButton>                    
                            <asp:LinkButton ID="DeleteButton" OnClientClick="javascript: return DeleteItem();" runat="server" CommandName="DeleteSelected">
                                <asp:Image runat="server" SkinID="PanelCommandButtonDelete" />
                                <span class="RadGridCommandText"> <%#GetTranslatedPhrase("Delete selected")%> </span>
                                &nbsp;&nbsp;
                            </asp:LinkButton>
                        </div>
                    </CommandItemTemplate> 
                     <Columns>
                        <telerik:GridTemplateColumn UniqueName="Website" HeaderText="For Website" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" DataField="WebsiteTitle" SortExpression="WebsiteTitle" EditFormHeaderTextFormat="For Websites" AllowFiltering="True">
                            <ItemTemplate>
                                <asiweb:BusinessLabel id="WebsiteLabel" runat="server" ToolTip="The website on which this shortcut can be used. Select All Sites to have the shortcut work the same way on every website managed by Navigation Designer."/>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div style="padding-bottom:5px!important;padding-top:5px!important;">
                                    <asiweb:BusinessDropDownList ID="WebsiteDropdownList" runat="server" ToolTip="The website on which this shortcut can be used. Select All Sites to have the shortcut work the same way on every website managed by Navigation Designer."/>
                                </div>
                            </EditItemTemplate>
<%--                            <FilterTemplate>
                                <asiweb:BusinessDropDownList ID="WebsiteFilterDropDown" runat="server"
                                DataTextField="Title" DataValueField="WebsiteKey" AppendDataBoundItems="true" OnSelectedIndexChanged="WebsiteFilterSelectedIndexChanged" AutoPostBack="True" />
                            </FilterTemplate>--%>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="DirectoryNameColumn" HeaderText="Shortcut" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" DataField="DirectoryName" SortExpression="DirectoryName" EditFormHeaderTextFormat="Shortcut">
                            <ItemTemplate>
                                <div style="text-overflow:ellipsis;overflow:hidden;max-width:150px;">
                                    <asiweb:StyledHyperlink id="DirectoryNameLink" runat="server" />
                                </div>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div style="padding-bottom:5px !important;">
                                    <asiweb:BusinessComboBox runat="server" ID="DirectoryNameBox" MaxLength="99" />
                                    <div style="display:block;">
                                        <asiweb:AsiRequiredFieldValidator ID="DirectoryNameRequiredValidator" runat="server" ControlToValidate="DirectoryNameBox" EnableClientScript="true" ErrorMessage="Required" Display="Dynamic" SetFocusOnError="true"></asiweb:AsiRequiredFieldValidator>
                                        <asp:Label ID="ErrorLabel" runat="server" CssClass="Error"></asp:Label>
                                        <asp:CustomValidator ID="UniqueValueValidator" runat="server" ErrorMessage="UniqueError" Display="dynamic"></asp:CustomValidator>
                                    </div>
                                </div>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="UrlContent" HeaderText="URL or Content Record" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" DataField="URL" SortExpression="URL" EditFormHeaderTextFormat="<label>URL or Content Record</label>">
                            <ItemTemplate>
                                <div style="text-overflow:ellipsis;overflow:hidden;width:275px;">
                                    <asiweb:BusinessLabel id="URLLabel" runat="server" />
                                </div>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div runat="server" ID="documentSelector" style="padding-bottom:5px!important;">
                                    <asiweb:BusinessDocumentBrowserControl ID="URLSelector" runat="server" Required="True" RootFolder="@/" Caption="Url or Content Record" />
                                </div>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="URL Parameters" ItemStyle-Wrap="True" HeaderStyle-Wrap="True" DataField="URLParameters" SortExpression="URLParameters" EditFormHeaderTextFormat="URL Parameters">
                            <ItemTemplate>
                                <div style="min-width:150px;">
                                    <asiweb:BusinessLabel id="URLParametersLabel" runat="server" />
                                </div>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div>
                                    <telerik:RadTextBox id="URLParametersText" runat="server" MaxLength="250" TextMode="MultiLine" Width="300px" CssClass="RadGrid PanelFieldValue"/>             
                                </div>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn HeaderText="Description" ItemStyle-Wrap="True" HeaderStyle-Wrap="True" DataField="URLMappingDesc" SortExpression="URLMappingDesc" EditFormHeaderTextFormat="Description">
                            <ItemTemplate>
                                <div style="min-width:150px;">
                                    <asiweb:BusinessLabel id="DescriptionLabel" runat="server" />
                                </div>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div>
                                    <telerik:RadTextBox id="DescriptionText" runat="server" MaxLength="250" TextMode="MultiLine" Width="300px" CssClass="RadGrid PanelFieldValue"/>             
                                </div>
                            </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridTemplateColumn UniqueName="URLMappingType" HeaderText="Type" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" EditFormHeaderTextFormat="Type" DataField="URLMappingType" SortExpression="URLMappingType">
                            <ItemTemplate>
                                <div>
                                    <asiweb:BusinessLabel id="URLMappingTypeLabel" runat="server" ToolTip="The type of shortcut this is."/>
                                </div>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div style="padding-bottom:5px!important;padding-top:5px!important;">
                                    <asiweb:BusinessDropDownList ID="URLMappingTypeDropDown" runat="server" ToolTip="The type of shortcut this is." ShowNullItem="False"/>
                                </div>
                            </EditItemTemplate>
<%--                            <FilterTemplate>
                                <asiweb:BusinessDropDownList ID="TypeFilterDropDown" runat="server" AppendDataBoundItems="true" OnSelectedIndexChanged="TypeFilterSelectedIndexChanged" AutoPostBack="True" />
                            </FilterTemplate>--%>
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
                <ClientSettings EnablePostBackOnRowClick="True">
                    <Selecting AllowRowSelect="True" /> 
                    <ClientEvents OnRowClick="RowSelected" OnGridCreated="GridCreated" OnCommand="GridCommand"></ClientEvents>                                     
                </ClientSettings>
            </telerik:RadGrid>
        </telerik:RadAjaxPanel>      
    </asiweb:PanelTemplateControl2>
</asp:Content>