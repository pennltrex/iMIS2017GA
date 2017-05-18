<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AuthorizationProvidersDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.AuthorizationProviders.AuthorizationProvidersDisplay" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
<script type="text/javascript">
    //<![CDATA[
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
                //check if selected can be deleted
            else {
                var row = grid.MasterTableView.get_selectedItems()[0];
                var caption = grid.MasterTableView.getCellByColumnUniqueName(row, "AuthorizationProviderNameColumn");
                if (caption != null) {
                    return confirm('Delete selected provider?');
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
    //]]>
</script>
</telerik:RadScriptBlock>

<h3 style="padding-left:2px;">
    <asp:Label runat="server" translate="yes" text="Authorization providers"/>
</h3>

<telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1" SkinID="AjaxLoadingPanel" />
<telerik:RadAjaxPanel ID="ContentPanel" runat="server" Visible="true" EnableAJAX="false" EnableViewState="true" LoadingPanelID="RadAjaxLoadingPanel1">
 
    <telerik:RadGrid AllowMultiRowEdit="False" AllowMultiRowSelection="False" AllowPaging="False" AllowSorting="false" 
        AlternatingItemStyle-CssClass="GridAlternateRow" AutoGenerateColumns="False" CssClass="Grid" 
        EnableLinqExpressions="False" FooterStyle-CssClass="GridFooter" GridLines="None" HeaderStyle-CssClass="GridHeader" 
        ID="RadGrid1" ItemStyle-CssClass="GridRow" runat="server" ShowStatusBar="false" ShowGroupPanel="false" translate="yes">
              
        <MasterTableView AllowMultiColumnSorting="false" CommandItemDisplay="Top" ShowHeader="true" EditMode="InPlace" DataKeyNames="AuthorizationProviderId" ClientDataKeyNames="AuthorizationProviderId" InsertItemPageIndexAction="ShowItemOnCurrentPage">    
                            
            <CommandItemTemplate>
                
                <div class="FloatRight" style="padding-right:3px;">
                    
                    <asp:LinkButton ID="btnEditSelected" runat="server" OnClientClick="javascript:return EditItem();" CommandName="EditSelected" Visible='<%# !RadGrid1.DataSource.Equals(string.Empty) %>'>
                        <asp:Image ID="Image1" runat="server" SkinID="PanelCommandButtonEdit" AlternateText="Edit selected" />
                        <asiweb:BusinessLabel runat="server" ID="EditButtonLabel" Text=<%# ResourceManager.GetPhrase("EditSelected","Edit selected") %> translate="yes"/>
                            &nbsp;&nbsp;
                    </asp:LinkButton>
                    
                    <asp:LinkButton ID="btnUpdateEdited" runat="server" CommandName="UpdateEdited" Visible='<%# RadGrid1.EditIndexes.Count > 0 %>'>
                        <asp:Image ID="Image2" runat="server" SkinID="CheckButton" AlternateText="Save" />
                        <asiweb:BusinessLabel runat="server" ID="UpdateEditedButtonLabel" Text=<%# ResourceManager.GetWord("Save") %> translate="yes"/>
                            &nbsp;&nbsp;
                    </asp:LinkButton>
                    
                    <asp:LinkButton ID="SaveButton" runat="server" CommandName="PerformInsert" Visible='<%# RadGrid1.MasterTableView.IsItemInserted %>'>
                        <asp:Image ID="Image3" runat="server" SkinID="CheckButton" AlternateText="Save" />
                        <asiweb:BusinessLabel runat="server" ID="SaveButtonLabel" Text=<%# ResourceManager.GetWord("Save") %> translate="yes"/>
                            &nbsp;&nbsp;
                    </asp:LinkButton>
                    
                    <asp:LinkButton ID="btnCancel" runat="server" CommandName="CancelAll" CausesValidation="False" Visible='<%# RadGrid1.EditIndexes.Count > 0 || RadGrid1.MasterTableView.IsItemInserted %>'>
                        <asp:Image ID="Image4" runat="server" SkinID="CancelButton" AlternateText="Cancel" />
                        <asiweb:BusinessLabel runat="server" ID="CancelButtonLabel" Text=<%# ResourceManager.GetWord("Cancel") %> translate="yes"/>
                            &nbsp;&nbsp;
                    </asp:LinkButton>
                    
                    <asp:LinkButton ID="AddButton" runat="server" translate="yes" OnClientClick="javascript: OnAddNew();" CommandName="InitInsert" Visible='<%# !RadGrid1.MasterTableView.IsItemInserted %>'>
                        <asp:Image ID="Image5" runat="server" SkinID="PanelCommandButtonAdd" AlternateText="Add New" />
                        <asiweb:BusinessLabel runat="server" ID="AddButtonLabel" Text=<%# ResourceManager.GetPhrase("AddNew","Add new") %> translate="yes"/>
                            &nbsp;&nbsp;
                    </asp:LinkButton>                       
                    
                    <asp:LinkButton ID="DeleteButton" OnClientClick="javascript: return DeleteItem();" runat="server" CommandName="DeleteSelected" Visible='<%# !RadGrid1.DataSource.Equals(string.Empty) %>'>
                        <asp:Image ID="Image6" runat="server" SkinID="PanelCommandButtonDelete" AlternateText="Delete selected" />
                        <asiweb:BusinessLabel runat="server" ID="DeleteButtonLabel" Text=<%# ResourceManager.GetPhrase("DeleteSelected","Delete selected") %> translate="yes"/>
                            &nbsp;&nbsp;
                    </asp:LinkButton>                           
                </div>

            </CommandItemTemplate>
                                                           
            <Columns>
                                                   
                <telerik:GridTemplateColumn UniqueName="AuthorizationProviderNameColumn" HeaderText="Provider" ItemStyle-Wrap="true" HeaderStyle-Wrap="false" DataField="AuthorizationProviderName" SortExpression="AuthorizationProviderName" AllowFiltering="False">
                    
                    <ItemTemplate>
                        <asiweb:BusinessLabel ID="AuthorizationProviderNameLabel" runat="server" />                   
                    </ItemTemplate>
                    
                    <EditItemTemplate>
                        <asiweb:BusinessDropDownList runat="server" ID="AuthorizationProviderNameSelect" ShowNullItem="false" />                    
                    </EditItemTemplate>

                </telerik:GridTemplateColumn>

                <telerik:GridTemplateColumn UniqueName="AppIdColumn" HeaderText="App Id" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" DataField="AppId" SortExpression="AppId">
                    
                    <ItemTemplate>
                        <asiweb:BusinessLabel ID="AppIdLabel" runat="server" Width="100%" />                      
                    </ItemTemplate>

                    <EditItemTemplate>
                        <span class="Required">&nbsp;&nbsp;</span>
                        <asiweb:BusinessTextBox runat="server" ID="AppIdText" Width="75%" />
                        <asiweb:AsiRequiredFieldValidator ControlToValidate="AppIdText" Display="Dynamic" ID="AppIdTextValidatorRfv" runat="server" />
                        <asp:CustomValidator ID="AppIdTextValidator" runat="server" ControlToValidate="AppIdText" Display="Dynamic" />                                            
                    </EditItemTemplate>

                </telerik:GridTemplateColumn>
                
                <telerik:GridTemplateColumn UniqueName="AppSecretColumn" HeaderText="App Secret" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" DataField="AppSecret" SortExpression="AppSecret">
                    
                    <ItemTemplate>
                        <asiweb:BusinessLabel ID="AppSecretLabel" runat="server" Width="100%" />                     
                    </ItemTemplate> 
                                       
                    <EditItemTemplate>
                        <span class="Required">&nbsp;&nbsp;</span>
                        <asiweb:BusinessTextBox runat="server" ID="AppSecretText" Width="75%" />  
                        <asiweb:AsiRequiredFieldValidator ControlToValidate="AppSecretText" Display="Dynamic" ID="AppSecretTextValidatorRfv" runat="server" />
                        <asp:CustomValidator ID="AppSecretTextValidator" runat="server" ControlToValidate="AppSecretText" Display="Dynamic" />                                                                   
                    </EditItemTemplate>

                </telerik:GridTemplateColumn>

                <telerik:GridTemplateColumn UniqueName="IsEnabledColumn" HeaderText="Enabled" ItemStyle-Wrap="false" HeaderStyle-Wrap="false" DataField="IsEnabled" SortExpression="IsEnabled" >
                    
                    <ItemTemplate>
                        <div style="display:table;text-align:center;width:50px;">
                            <div style="display:table-cell;vertical-align:middle;">                                               
                                <asiweb:BusinessLabel ID="IsEnabledLabel" runat="server" />  
                            </div>
                        </div>                              
                    </ItemTemplate>
                    
                     <EditItemTemplate>
                        <div style="display:table;text-align:center;width:50px;">
                            <div style="display:table-cell;vertical-align:middle;">                                               
                                <asiweb:BusinessCheckBox ID="IsEnabledCheckBox" runat="server" />
                            </div>
                        </div>                              
                    </EditItemTemplate>                   

                </telerik:GridTemplateColumn> 
                            
            </Columns> 
                     
            <NoRecordsTemplate>
                <asiweb:BusinessLabel ID="NoRecordLabel" runat="server" translate="yes" Text="(None)"></asiweb:BusinessLabel>
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

        <ClientSettings AllowGroupExpandCollapse="false">
            <Selecting AllowRowSelect="true" /> 
            <ClientEvents OnGridCreated="GridCreated" OnCommand="GridCommand"></ClientEvents>                                     
        </ClientSettings>
        
        <GroupingSettings ShowUnGroupButton="false"></GroupingSettings>

    </telerik:RadGrid>
        
</telerik:RadAjaxPanel>

<br/>

<div id="LinkAccountDiv" runat="server" class="PanelField AutoWidth Right">
    <div class="PanelFieldValue">
        <asp:CheckBox id="LinkAccountCheckBox" runat="server" AutoPostBack="true" />
    </div>
    <div style="display:inline;">
        <asiweb:StyledLabel AssociatedControlID="LinkAccountCheckBox" id="LinkAccountLabel" runat="server" translate="yes">Prompt to link social media account to an existing or new iMIS account</asiweb:StyledLabel>
    </div>
</div>

<div class="PanelField Top" runat="server" Visible="false" id="HtmlForPromptDiv" style="padding-left:21px;">
    <div class="PanelFieldLabel">
        <asiweb:StyledLabel AssociatedControlID="HtmlForPrompt" ID="HtmlForPromptLabel" runat="server" translate="yes" Text="HTML for prompt"/>
    </div>
    <div class="PanelFieldValue">
        <asiweb:BusinessHtmlEditor ID="HtmlForPrompt" runat="server" CssClass="ContentHtmlEditor" EnableTextareaMode="true" 
            Height="200" Width="780" style="width:780px!important;" />       
    </div>
</div>

<div class="PanelField AutoWidth Right" runat="server" id="PromptForNewContactInformationCheckBoxDiv" style="padding-left:21px;">
    <div class="PanelFieldValue">
        <input id="PromptForNewContactInformationCheckBox" name="PromptForNewContactInformationCheckBox" runat="server" type="checkbox" />
    </div>
    <div style="display:inline;">
        <asiweb:StyledLabel AssociatedControlID="PromptForNewContactInformationCheckBox" id="PromptForNewContactInformationLabel" runat="server" translate="yes">Prompt for new contact information when creating an account with social media</asiweb:StyledLabel>
    </div>
</div>      