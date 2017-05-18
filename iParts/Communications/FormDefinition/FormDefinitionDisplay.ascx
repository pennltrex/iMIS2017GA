<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormDefinitionDisplay.ascx.cs"
    Inherits="Asi.Web.iParts.Communications.FormDefinitionDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<style scoped>
    .LocalPadTop
    {
        padding-top: 10px!important;
    }

    .LocalMarginTop
    {
        margin-top: 10px;
    }

    .LocalPadBottom
    {
        padding-bottom: 10px;
    }

    .LocalPadRight
    {
        padding-right: 17px;
    }
</style>

<telerik:RadScriptBlock runat="server">
    <script type="text/javascript">
       
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
            
    function OnAddNew() {
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
                var caption = grid.MasterTableView.getCellByColumnUniqueName(row, "Question");
                if (caption != null) {
                    return confirm('Delete selected question?');
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
                alert('Please select a row.');
                return false;
            }
            else {
                return true;
            }
        }
        return false;
    }

    function OnTypeChange(clientId) {
        var clientIdForListChoices = jQuery('#<%=ClientIdForListChoices.ClientID %>').val();
        jQuery('#' + clientIdForListChoices).hide();
        var dropdown = jQuery("#" + clientId);
        if (dropdown == null) return;
        var choice = jQuery(dropdown).val();
        if (choice == "5") {
            jQuery('#' + clientIdForListChoices).show();
        }
    }

    function OnDefinedSelectionChange(clientId) {
        var clientIdForQueryDiv = jQuery('#<%=ClientIdForQueryDiv.ClientID %>').val();
        var clientIdForValueListDiv = jQuery('#<%=ClientIdForValueListDiv.ClientID %>').val();
        jQuery('#' + clientIdForQueryDiv).hide();
        jQuery("#" + clientIdForValueListDiv).hide();
        var radioButtons = jQuery("#" + clientId);
        if (radioButtons == null) return;
        var choice = jQuery("#" + clientId + " input:checked").val();
        if(choice == "1") {
            jQuery("#" + clientIdForValueListDiv).show();
            QueryRemoveClick();
        }
        if (choice == "2") {
            jQuery('#' + clientIdForQueryDiv).show();
        } 
    }

        function QueryBrowseClick() {
            var windowTitle = '<%=GetTranslatedPhrase(ResourceManager.GetPhrase("DocumentBrowser","Document Browser")) %>';
        OpenObjectBrowser('iTypeFilter=IQD', SetQueryObject, null, null, null, windowTitle);
    }
            
    function SetQueryObject(dialogWindow) {
        if (!dialogWindow.result) {
            return;
        }
        var result = dialogWindow.result;
                
        var clientIdForQueryDocumentKeyControl = jQuery('#<%=ClientIdForQueryDocumentKeyControl.ClientID %>').val();
        var clientIdForQuerySourceLabel = jQuery('#<%=ClientIdForQuerySourceLabelControl.ClientID %>').val();
        var clientIdForQueryHiddenButton = jQuery('#<%=ClientIdForQueryValuesButton.ClientID %>').val();
        var clientIdForQueryDataPicker = jQuery('#<%=ClientIdForQueryDataPicker.ClientID %>').val();
        
        var queryDocumentKey = jQuery('#' + clientIdForQueryDocumentKeyControl);
        jQuery(queryDocumentKey).val(result);
                
        if (dialogWindow.SelectedDocumentPath != null && dialogWindow.SelectedDocumentPath.length > 0) {
            jQuery('#' + clientIdForQuerySourceLabel).text(dialogWindow.SelectedDocumentPath);
            jQuery('#' + clientIdForQueryDataPicker).show();
            jQuery('#' + clientIdForQueryHiddenButton).click();
        }
    }
            
    function QueryRemoveClick() {
        var clientIdForQueryDocumentKeyControl = jQuery('#<%=ClientIdForQueryDocumentKeyControl.ClientID %>').val();
        var clientIdForQuerySourceLabel = jQuery('#<%=ClientIdForQuerySourceLabelControl.ClientID %>').val();
        var clientIdForQueryDocumentPath = jQuery('#<%=ClientIdForQueryDocumentPath.ClientID %>').val();
        var clientIdForQueryDataPicker = jQuery('#<%=ClientIdForQueryDataPicker.ClientID %>').val();

        jQuery('#' + clientIdForQueryDocumentPath).val("");
        jQuery('#' + clientIdForQueryDocumentKeyControl).val("");
        jQuery('#' + clientIdForQuerySourceLabel).text("");
        jQuery('#' + clientIdForQueryDataPicker).hide();
    }
            
    // The Hidden checkbox should be unchecked if Required is checked, and vice versa
    function UncheckOther(thisCheckboxId, otherCheckboxId) {
        if (jQuery('#' + thisCheckboxId).is(':checked'))
            jQuery('#' + otherCheckboxId).removeAttr('checked');
    }

    </script>
</telerik:RadScriptBlock>

<div id="radpaneldiv">
    <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1" SkinID="AjaxLoadingPanel" />
    <telerik:RadAjaxPanel ID="ContentPanel" runat="server" Visible="true" EnableAJAX="true" EnableViewState="true" LoadingPanelID="RadAjaxLoadingPanel1">
        <input id="ClientIdForQueryDocumentKeyControl" type="hidden" runat="server" />
        <input id="ClientIdForQuerySourceLabelControl" type="hidden" runat="server" />
        <input id="ClientIdForQueryValuesButton" type="hidden" runat="server" />
        <input id="ClientIdForQueryDocumentPath" type="hidden" runat="server" />
        <input id="ClientIdForListChoices" type="hidden" runat="server" />
        <input id="ClientIdForQueryDiv" type="hidden" runat="server" />
        <input id="ClientIdForQueryDataPicker" type="hidden" runat="server" />
        <input id="ClientIdForValueListDiv" type="hidden" runat="server" />
        <asp:Label runat="server" ID="labelError" CssClass="Error" Visible="False" translate="yes"></asp:Label>
        <telerik:RadGrid ID="RadGrid1" AllowSorting="True" AutoGenerateColumns="False" AllowPaging="True" runat="server" ShowStatusBar="True"
            AllowMultiRowSelection="False" PageSize="20" AllowMultiRowEdit="False" GridLines="None" CssClass="Grid" ItemStyle-CssClass="GridRow" EnableLinqExpressions="False"
            AlternatingItemStyle-CssClass="GridAlternateRow" HeaderStyle-CssClass="GridHeader" FooterStyle-CssClass="GridFooter" translate="yes">
            <PagerStyle Mode="NextPrevNumericAndAdvanced" />
            <MasterTableView AllowMultiColumnSorting="False" CommandItemDisplay="Top" EditMode="EditForms" DataKeyNames="PropertyId" ClientDataKeyNames="PropertyId" InsertItemPageIndexAction="ShowItemOnCurrentPage">
                <CommandItemTemplate>
                    <div class="FloatRight">
                        <asp:LinkButton ID="btnEditSelected" runat="server" OnClientClick="javascript:return EditItem();" CommandName="EditSelected">
                            <asp:Image ID="Image1" runat="server" SkinID="PanelCommandButtonEdit" AlternateText=" " />
                            <asiweb:BusinessLabel runat="server" ID="EditButtonLabel" Text=<%# ResourceManager.GetPhrase("EditSelected","Edit selected") %> translate="yes"/>
                            &nbsp;&nbsp;
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnUpdateEdited" runat="server" CommandName="UpdateEdited" Visible='<%# RadGrid1.EditIndexes.Count > 0 %>'>
                            <asp:Image ID="Image2" runat="server" SkinID="CheckButton"  AlternateText=" " />
                            <asiweb:BusinessLabel runat="server" ID="UpdateEditedButtonLabel" Text=<%# ResourceManager.GetWord("Save") %> translate="yes"/>
                            &nbsp;&nbsp;
                        </asp:LinkButton>
                        <asp:LinkButton ID="SaveButton" runat="server" CommandName="PerformInsert" Visible='<%# RadGrid1.MasterTableView.IsItemInserted %>'>
                            <asp:Image ID="Image3" runat="server" SkinID="CheckButton"  AlternateText=" " />
                            <asiweb:BusinessLabel runat="server" ID="SaveButtonLabel" Text=<%# ResourceManager.GetWord("Save") %> translate="yes"/>
                            &nbsp;&nbsp;
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnCancel" runat="server" CommandName="CancelAll" CausesValidation="False" Visible='<%# RadGrid1.EditIndexes.Count > 0 || RadGrid1.MasterTableView.IsItemInserted %>'>
                            <asp:Image ID="Image4" runat="server" SkinID="CancelButton" AlternateText=" " />
                            <asiweb:BusinessLabel runat="server" ID="CancelButtonLabel" Text=<%# ResourceManager.GetWord("Cancel") %> translate="yes"/>
                            &nbsp;&nbsp;
                        </asp:LinkButton>
                        <asp:LinkButton ID="AddButton" runat="server" OnClientClick="javascript: OnAddNew();" CommandName="InitInsert" Visible='<%# !RadGrid1.MasterTableView.IsItemInserted %>'>
                            <asp:Image ID="Image5" runat="server" SkinID="PanelCommandButtonAdd" AlternateText=" " />
                            <asiweb:BusinessLabel runat="server" ID="AddButtonLabel" Text=<%# ResourceManager.GetPhrase("AddNew","Add new") %> translate="yes"/>
                            &nbsp;&nbsp;
                        </asp:LinkButton>
                        <!--
                            Reid 6/27/14: Don't remove this commented out button,
                            it's actually referred to in the code behind and removing it will cause
                            a javascript error. 
                            <asp:LinkButton ID="DeleteButton" OnClientClick="javascript: return DeleteItem();" runat="server" CommandName="DeleteSelected">
                                <asp:Image ID="Image6" runat="server" SkinID="PanelCommandButtonDelete" />
                                <span class="RadGridCommandText"><%# Asi.ResourceManager.GetPhrase("DeleteSelected","Delete selected") %></span>
                                &nbsp;&nbsp;
                            </asp:LinkButton>
                        -->
                    </div>
                </CommandItemTemplate>
                <Columns>
                    <telerik:GridTemplateColumn UniqueName="Question" HeaderText="Question" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" DataField="Caption" EditFormHeaderTextFormat="Question" AllowFiltering="True">
                        <ItemTemplate>
                            <div style="white-space: normal;">
                                <asiweb:BusinessLabel ID="GridQuestionLabel" runat="server" ToolTip="Question text." />
                            </div>
                        </ItemTemplate>

                        <EditItemTemplate>
                            <div style="padding-bottom: 5px!important; padding-top: 5px!important;">
                                <telerik:RadTextBox runat="server" ID="GridQuestionTextBox" MaxLength="400" Width="90%" CausesValidation="False" />
                                <asiweb:AsiRequiredFieldValidator ID="GridQuestionRequiredValidator" runat="server"
                                    ControlToValidate="GridQuestionTextBox" EnableClientScript="true" ErrorMessage="Required"
                                    Display="Static" SetFocusOnError="false" CssClass="Important" />
                            </div>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Required" HeaderText="Required" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" DataField="Required" EditFormHeaderTextFormat="Required" AllowFiltering="True">
                        <ItemTemplate>
                            <asiweb:BusinessLabel ID="GridRequiredLabel" runat="server" ToolTip="This question requires a response." translate="yes"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <div style="padding-bottom: 10px!important; padding-top: 5px!important;">
                                <asiweb:BusinessCheckBox ID="GridRequiredCheckBox" runat="server" ToolTip="This question requires a response." />
                            </div>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Hidden" HeaderText="Hidden" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" DataField="Required" EditFormHeaderTextFormat="Hidden" AllowFiltering="True">
                        <ItemTemplate>
                            <asiweb:BusinessLabel ID="GridHiddenLabel" runat="server" ToolTip="This question will not be displayed." translate="yes"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <div style="padding-bottom: 10px!important; padding-top: 5px!important;">
                                <asiweb:BusinessCheckBox ID="GridHiddenCheckBox" runat="server" ToolTip="This question will not be displayed." />
                            </div>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn UniqueName="Type" HeaderText="Answer Type" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" DataField="PropertyTypeName" EditFormHeaderTextFormat="Answer Type" AllowFiltering="True">
                        <ItemTemplate>
                            <asiweb:BusinessLabel ID="GridTypeLabel" runat="server" ToolTip="The web control type used for the question." translate="yes"/>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <div style="padding-bottom: 5px!important;">
                                <div class="LocalPadBottom">
                                    <asiweb:BusinessLabel runat="server" ID="GridWarnTypeLabel" ></asiweb:BusinessLabel>
                                </div>
                                <asiweb:BusinessDropDownList ID="TypeDdl" runat="server" ToolTip="The web control type used for the question." IncludeNullItem="False"></asiweb:BusinessDropDownList>
                                <div id="listChoices" runat="server" class="LocalPadTop" style="display: none">
                                    <div class="LocalPadBottom">
                                        <asiweb:BusinessRadioButtonList ID="GridSourceListRadioButtonList" runat="server" ToolTip="Source for a dropdown list." RepeatDirection="Horizontal"></asiweb:BusinessRadioButtonList>
                                    </div>
                                    <div id="queryDiv" runat="server" style="display: none">
                                        <asp:Panel ID="QueryUpdatePanel" runat="server" CssClass="LocalPadBottom">
                                            <div class="PanelField AutoWidth">
                                                <label id="QueryContainerLabel" for="QueryContainer" style="padding-right: 10px">Query</label>
                                                <asp:Label ID="QueryObjectSourceLabel" Style="white-space: nowrap; font-style: italic; padding-right: 10px" runat="server" EnableViewState="True" />
                                                <asiweb:StyledButton Text="Browse" ID="QueryBrowseButton" AutoPostBack="false" OnClientClick="QueryBrowseClick();" runat="server" />
                                                <asiweb:StyledButton Text="Remove" ID="QueryRemoveButton" AutoPostBack="false" OnClientClick="QueryRemoveClick();" runat="server" />
                                            </div>
                                        </asp:Panel>
                                        <div id="QueryDataPicker" runat="server" class="LocalPadTop ClearFix" style="display: none">
                                            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">
                                                <input type="hidden" id="QueryDocumentKey" runat="server" />
                                                <input type="hidden" id="QueryDocumentPath" runat="server" />
                                                <asp:Label ID="QueryPathErrorLabel" CssClass="Error" Visible="false" runat="server"></asp:Label>
                                                <asp:Button ID="QueryValuesButton" runat="server" OnClick="QueryValuesButton_OnClick" Style="display: none" CausesValidation="False" />
                                                <div class="ClearFix"></div>
                                                <div>
                                                    <asp:Label ID="DisplayValueLabel" runat="server" CssClass="Required" Text="Display Value" AssociatedControlID="DisplayValue" />
                                                    <asp:DropDownList ID="DisplayValue" runat="server"></asp:DropDownList>
                                                </div>
                                                <div class="LocalPadTop">
                                                    <asp:Label ID="DataValueLabel" runat="server" CssClass="Required LocalPadRight" Text="Data Value" AssociatedControlID="DataValue" />
                                                    <asp:DropDownList ID="DataValue" runat="server"></asp:DropDownList>
                                                </div>
                                            </telerik:RadAjaxPanel>
                                        </div>
                                    </div>
                                    <div id="valueListDiv" class="LocalPadTop" style="display: none" runat="server">
                                     <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel2" SkinID="AjaxLoadingPanel" />
                                     <telerik:RadAjaxPanel ID="ValueListUpdatePanel" runat="server" LoadingPanelID="RadAjaxLoadingPanel2">
                                            <div>
                                                <asp:Label ID="Label2" runat="server" Text="Display Value" AssociatedControlID="TBDisplayValue" CssClass="Required"/>
                                                <asp:TextBox ID="TBDisplayValue" runat="server"></asp:TextBox>
                                                <asp:Label ID="DisplayErr" CssClass="Important" Text="Required" runat="server" AssociatedControlID="TBDisplayValue" Visible="False" />
                                            </div>
                                            <br />
                                            <div>
                                                <asp:Label ID="Label1" runat="server" Text="Data Value" AssociatedControlID="TBDataValue" CssClass="Required LocalPadRight" />
                                                <asp:TextBox ID="TBDataValue" runat="server"></asp:TextBox>
                                                <asp:Label ID="DataErr" CssClass="Important" Text="Required" runat="server" AssociatedControlID="TBDataValue" Visible="False" />
                                                <br />
                                                <asiweb:StyledButton CssClass="LocalMarginTop" Text='<%# Asi.ResourceManager.GetPhrase("Add","Add") %>' ID="Grid2AddButton" OnClick="RadGrid2_OnAdd" runat="server" CausesValidation="False" />
                                            </div>
                                            <div class="LocalPadTop">
                                                <asp:Label ID="GridErrorLabel" runat="server" CssClass="Error"></asp:Label>
                                            </div>
                                            <div class="LocalPadTop">
                                                <telerik:RadGrid ID="RadGrid2" GridLines="None" runat="server" AllowAutomaticDeletes="False"
                                                    AllowAutomaticInserts="False" AllowAutomaticUpdates="False" AllowPaging="False" AllowSorting="False"
                                                    AutoGenerateColumns="False" CssClass="Grid" ItemStyle-CssClass="GridRow" EnableLinqExpressions="False"
                                                    AlternatingItemStyle-CssClass="GridAlternateRow" OnItemCommand="RadGrid2_ItemCommand" OnPreRender="RadGrid2_PreRender">
                                                    <MasterTableView Width="100%" CommandItemDisplay="Top" DataKeyNames="Value"
                                                        HorizontalAlign="NotSet" AutoGenerateColumns="False" EditMode="InPlace">
                                                        <CommandItemTemplate>
                                                            <%--  <div class="FloatRight"> removed until we can get record inserts working right
                                                                <asp:LinkButton ID="AddButton" runat="server" CommandName="InitInsert" CausesValidation="False">
                                                                    <asp:Image ID="Image5" runat="server" SkinID="PanelCommandButtonAdd" />
                                                                    <span class="RadGridCommandText"><%# Asi.ResourceManager.GetPhrase("AddNew","Add new") %></span>
                                                                    &nbsp;&nbsp;
                                                                </asp:LinkButton>
                                                            </div>--%>
                                                        </CommandItemTemplate>
                                                        <Columns>
                                                            <telerik:GridBoundColumn DataField="Text" HeaderText="Display Value"
                                                                UniqueName="DisplayValue" ColumnEditorID="GridTextBoxColumnEditor2">
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridBoundColumn DataField="Value" HeaderText="Data Value"
                                                                UniqueName="DataValue" ColumnEditorID="GridTextBoxColumnEditor1">
                                                            </telerik:GridBoundColumn>
                                                            <telerik:GridEditCommandColumn ButtonType="LinkButton" HeaderStyle-Width="10%" UniqueName="Edit" />
                                                            <telerik:GridButtonColumn ConfirmText="Delete this value?" ConfirmDialogType="Classic"
                                                                ConfirmTitle="Delete" ButtonType="LinkButton" CommandName="Delete" Text="Delete"
                                                                UniqueName="DeleteColumn">
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </telerik:GridButtonColumn>
                                                        </Columns>
                                                    </MasterTableView>
                                                </telerik:RadGrid>
                                                <telerik:GridTextBoxColumnEditor TextBoxMaxLength="200" runat="server" ID="GridTextBoxColumnEditor1" EnableViewState="True" ViewStateMode="Enabled" />
                                                <telerik:GridTextBoxColumnEditor TextBoxMaxLength="200" runat="server" ID="GridTextBoxColumnEditor2" EnableViewState="True" ViewStateMode="Enabled" />
                                            </div>
                                        </telerik:RadAjaxPanel>
                                    </div>
                                </div>
                            </div>
                        </EditItemTemplate>
                    </telerik:GridTemplateColumn>
                    <telerik:GridTemplateColumn EditFormHeaderTextFormat="" HeaderText="Order">
                        <HeaderStyle CssClass="text-hide"></HeaderStyle>
                        <ItemTemplate>
                            <asp:ImageButton ID="MoveUpButton" runat="server" CommandName="MoveUp" OnCommand="Grid1_OnMoveCommand" 
                                Visible="<%# RadGrid1.EditIndexes.Count < 1 && !RadGrid1.MasterTableView.IsItemInserted %>" SkinID="MoveItemUpButton" 
                                AlternateText='<%# ResourceManager.GetPhrase("MoveUp", "Move Up") %>'/>
                            <asp:ImageButton ID="MoveDownButton" runat="server" CommandName="MoveDown" OnCommand="Grid1_OnMoveCommand"
                                Visible="<%# RadGrid1.EditIndexes.Count < 1 && !RadGrid1.MasterTableView.IsItemInserted %>" SkinID="MoveItemDownButton"
                                AlternateText='<%# ResourceManager.GetPhrase("MoveDown", "Move Down") %>' />
                        </ItemTemplate>                        
                    </telerik:GridTemplateColumn>
                </Columns>
                <NoRecordsTemplate>
                    <asiweb:BusinessLabel ID="GridNoRecordLabel" runat="server" translate="yes" Text="There are no questions defined."></asiweb:BusinessLabel>
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
                <ClientEvents OnRowClick="RowSelected" OnGridCreated="GridCreated" OnCommand="GridCommand"></ClientEvents>
            </ClientSettings>
        </telerik:RadGrid>
    </telerik:RadAjaxPanel>
</div>

