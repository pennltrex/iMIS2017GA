<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Task.ascx.cs" Inherits="Asi.Web.iParts.Common.Tasks.Task" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asi" TagName="TasksLog" Src="TasksLogDisplay.ascx" %>

<style scoped>.Disabled .reToolCell, .reLeftVerticalSide, .reRightVerticalSide, .reTlbVertical {display: none;}</style>
<asiweb:PanelTemplateControl2 ID="TaskEdit" runat="server" ShowHeader="false" BorderStyle="None" CssClass="TaskDefinition">
<div runat="server" Translate="Yes">
    <asp:Label id="LabelErrorMessage" runat="server" visible="false" cssclass="Error" />     
    <div class="PanelField ">
        <div class="PanelFieldValue AutoWidth FloatNone">
            <asp:CheckBox ID="TaskEnabledCheckBox" runat="server" TextAlign="Right" CssClass="PanelFieldLabel" />
        </div>
        <div class="PanelFieldValue AutoWidth FloatNone">
            <asp:CheckBox ID="IsSystemCheckBox" runat="server" TextAlign="Right" CssClass="PanelFieldLabel" />
        </div>
    </div>

    <div class="PanelField Left">
        <div style="display:inline;">
            <asiweb:StyledLabel AssociatedControlID="TaskNameTextBox" ID="TaskNameLabel" runat="server" CssClass="Required" />
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessTextBox CssClass="InputXLarge" ID="TaskNameTextBox" Required="true" runat="server" />
            <asiweb:AsiRequiredFieldValidator ID="TaskNameRfv" runat="server" ControlToValidate="TaskNameTextBox" Display="Dynamic" /> 
        </div>
    </div>

    <div class="PanelField Left">
        <div style="display:inline;">
            <asiweb:StyledLabel AssociatedControlID="TaskDescriptionTextBox" ID="TaskDescriptionLabel" runat="server" />
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessTextBox CssClass="InputXXLarge" ID="TaskDescriptionTextBox" Required="False" Rows="4" runat="server" TextMode="MultiLine" />
        </div>
    </div>
    
    <div class="PanelField Left">
        <div style="display:inline;">
            <asiweb:StyledLabel AssociatedControlID="TaskTypeSelect" ID="TaskTypeLabel" runat="server" />
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessDropDownList ID="TaskTypeSelect" Required="true" runat="server" OnDataChanged="SetTabVisibility" />
            <asiweb:StyledButton runat="server" ID="RunTaskNow" Text="Run task now" OnClick="RunTaskNow_OnClick"/>
        </div>
    </div>
     
    <div style="clear:both;"></div>
    <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1" SkinID="AjaxLoadingPanel" />
              
    <telerik:RadTabStrip runat="server" ID="RadTabStrip" SelectedIndex="0" MultiPageID="RadMultiPage" ShowBaseLine="true">
        <Tabs>
            <telerik:RadTab Text="Triggers" PageViewID="TriggersPageView" />
            <telerik:RadTab Text="Conditions" PageViewID="ConditionsPageView" />
            <telerik:RadTab Text="Actions" PageViewID="ActionsPageView" />
            <telerik:RadTab Text="Alert" PageViewID="AlertPageView" />
            <telerik:RadTab Text="Data sources" PageViewID="DataSourcesPageView" />
            <telerik:RadTab Text="Logs" PageViewID="LogsPageView" />
        </Tabs>
    </telerik:RadTabStrip>              
    <telerik:RadMultiPage ID="RadMultiPage" runat="server" SelectedIndex="0" CssClass="ContentTabbedDisplay">           
        <telerik:RadPageView runat="server" ID="TriggersPageView" >
            <asiweb:PanelTemplateControl2 ID="TriggersPanelTemplateControl" runat="server" Collapsible="false">               
                <div class="GridTitlePanel">
                    <div style="float:right">
                        <asp:LinkButton runat="server" ID="AddTrigger" translate="yes" Text="Add trigger" OnClick="AddNewTrigger_Click" />	    
                    </div>
                </div>                
                <telerik:RadAjaxPanel ID="TriggersRadAjaxPanel" runat="server" Visible="true" EnableAJAX="true" EnableViewState="true" LoadingPanelID="RadAjaxLoadingPanel1">                                
                    <asiweb:BusinessDataGrid2 ID="TaskTriggersGrid" runat="server" 
                    AllowSorting="false" AllowPaging="True" PageSize="100" 
                    OnNeedDataSource="TaskTiggersGridNeedDataSource" OnItemDataBound="TaskTriggersGridItemDataBound"
                    OnDeleteCommand="TaskTriggersGridDeleteCommand" OnItemCreated="TaskTriggersGridItemCreated"
                    OnEditCommand="TaskGridEditCommand">
                    <MasterTableView AutoGenerateColumns="false" EnableNoRecordsTemplate="true" DataKeyNames="TriggerId"
                        NoMasterRecordsText='<%# ResourceManager.GetPhrase("NoDataSource", "There are no triggers.") %>' >          
                        <Columns>                          
                            <telerik:GridBoundColumn                               
                                DataField="Details"
                                DataType="System.String"
                                HeaderText="Details"
                                UniqueName="Details" />
                            <telerik:GridBoundColumn                               
                                DataField="Type"
                                DataType="System.String"
                                HeaderText="Type"
                                UniqueName="Type" />
                            <telerik:GridBoundColumn                              
                                DataField="StartDate"
                                DataType="System.String"
                                HeaderText="Start Date"
                                UniqueName="StartDate" /> 
                            <telerik:GridBoundColumn                               
                                DataField="Enabled"
                                DataType="System.String"
                                HeaderText="Enabled"
                                UniqueName="Enabled"
                                HeaderStyle-HorizontalAlign="Center" />                                                             
                            <telerik:GridButtonColumn  
                                ButtonType="ImageButton" 
                                ImageUrl="~/AsiCommon/Images/icon_edit.png"  
                                UniqueName="Edit" 
                                CommandName="Edit" 
                                HeaderText="Edit"
                                Text="Edit">
                                <HeaderStyle CssClass="text-hide"></HeaderStyle>
                                <ItemStyle Width="25px" CssClass="AlignCenter VAlignMiddle" /> 
                            </telerik:GridButtonColumn>                                                           
                            <telerik:GridButtonColumn 
                                ConfirmDialogType="RadWindow"
                                UniqueName="DeleteColumn"
                                ButtonType="ImageButton" 
                                ImageUrl="~/AsiCommon/Images/icon_delete.png"  
                                CommandName="Delete" 
                                HeaderText="Delete"
                                Text="Remove" >
                                <HeaderStyle CssClass="text-hide"></HeaderStyle>
                                <ItemStyle Width="25px" CssClass="AlignCenter VAlignMiddle" />                                        
                            </telerik:GridButtonColumn>
                        </Columns>        
                    </MasterTableView>    
                    <ClientSettings AllowGroupExpandCollapse="false" EnablePostBackOnRowClick="false">
                        <Selecting AllowRowSelect="false" />                                 
                    </ClientSettings>
                </asiweb:BusinessDataGrid2>                 
                </telerik:RadAjaxPanel>
            </asiweb:PanelTemplateControl2>
        </telerik:RadPageView> 
        <telerik:RadPageView runat="server" ID="ConditionsPageView">
            <asiweb:PanelTemplateControl2 ID="ConditionsPanelTemplateControl" runat="server" Collapsible="false">                   
                <p runat="server" id="InstructionText"></p>                                      
                <div class="GridTitlePanel">
                    <div style="float:right">
                        <asp:LinkButton runat="server" ID="AddDataSource" translate="yes" Text="Add data source" OnClick="AddNewCondition_Click" />	    
                    </div>
                </div>
                <telerik:RadAjaxPanel ID="ConditionsRadAjaxPanel" runat="server" Visible="true" EnableAJAX="true" EnableViewState="true" LoadingPanelID="RadAjaxLoadingPanel1">                                
                    <asiweb:BusinessDataGrid2 ID="TaskEvaluationsGrid" runat="server" 
                    AllowSorting="false" AllowPaging="True" PageSize="100"
                    OnNeedDataSource="TaskEvaluationsGridNeedDataSource" OnItemDataBound="TaskEvaluationsGridItemDataBound"
                    OnDeleteCommand="TaskEvaluationsGridDeleteCommand" OnItemCreated="TaskEvaluationsGridItemCreated"
                    OnEditCommand="TaskGridEditCommand">
                    <MasterTableView AutoGenerateColumns="false" EnableNoRecordsTemplate="true" DataKeyNames="DataSourceId"
                        NoMasterRecordsText='<%# ResourceManager.GetPhrase("NoDataSource", "There are no data sources.") %>' >          
                        <Columns>
                            <telerik:GridBoundColumn
                                DataField="Name"
                                DataType="System.String"
                                HeaderText="Data Source"
                                UniqueName="Name" />
                            <telerik:GridBoundColumn
                                DataField="Type"
                                DataType="System.String"
                                HeaderText="Type"
                                UniqueName="Type" />                                
                            <telerik:GridButtonColumn  
                                ButtonType="ImageButton" 
                                ImageUrl="~/AsiCommon/Images/icon_edit.png"  
                                UniqueName="Edit" 
                                CommandName="Edit"
                                HeaderText="Edit" 
                                Text="Edit">
                                <HeaderStyle CssClass="text-hide"></HeaderStyle>
                                <ItemStyle Width="25px" CssClass="AlignCenter VAlignMiddle" /> 
                            </telerik:GridButtonColumn>                                                           
                            <telerik:GridButtonColumn 
                                ConfirmDialogType="RadWindow"
                                ConfirmTitle="Delete" 
                                ButtonType="ImageButton" 
                                ImageUrl="~/AsiCommon/Images/icon_delete.png"  
                                CommandName="Delete" 
                                UniqueName="DeleteColumn"
                                HeaderText="Delete"
                                Text="Remove" >
                                <HeaderStyle CssClass="text-hide"></HeaderStyle>
                                <ItemStyle Width="25px" CssClass="AlignCenter VAlignMiddle" />                                        
                            </telerik:GridButtonColumn>
                        </Columns>        
                    </MasterTableView>    
                    <ClientSettings AllowGroupExpandCollapse="false" EnablePostBackOnRowClick="false">
                        <Selecting AllowRowSelect="false" />                                 
                    </ClientSettings>
                </asiweb:BusinessDataGrid2>                 
                </telerik:RadAjaxPanel>            
                <asiweb:StyledRadioButton ID="RunTaskOption1" runat="server" DisplayCaption="true" PositionCaption="Right" 
                    RenderPanelField="true" GroupName="RunTask" Checked="true" Visible="false" />
                <asiweb:StyledRadioButton ID="RunTaskOption2" runat="server" DisplayCaption="true" PositionCaption="Right" 
                    RenderPanelField="true" GroupName="RunTask" Checked="false" Visible="false" />                                            
            </asiweb:PanelTemplateControl2>
        </telerik:RadPageView>               
        <telerik:RadPageView runat="server" ID="ActionsPageView">
            <asiweb:PanelTemplateControl2 ID="ActionsPanelTemplateControl" runat="server" Collapsible="false">
                <div class="GridTitlePanel">
                    <div style="float:right">
                        <asp:LinkButton runat="server" ID="AddAction" translate="yes" Text="Add action" OnClick="AddNewAction_Click" />	    
                    </div>                  
                </div>                 
                <asp:UpdatePanel runat="server" ID="RefreshPanel" UpdateMode="Conditional" ChildrenAsTriggers="False">
                    <ContentTemplate>                   
                        <telerik:RadAjaxPanel ID="TaskActionsRadAjaxPanel" runat="server" Visible="true" EnableAJAX="true" EnableViewState="true" LoadingPanelID="RadAjaxLoadingPanel1">                                              
                            <asiweb:BusinessDataGrid2 ID="TaskActionsGrid" runat="server" 
                                AllowSorting="false" AllowPaging="True" PageSize="100" UseEditForms="false" 
                                OnNeedDataSource="TaskActionsGridNeedDataSource" OnItemDataBound="TaskActionsGridItemDataBound"
                                OnDeleteCommand="TaskActionsGridDeleteCommand" OnItemCreated="TaskActionsGridItemCreated"
                                OnEditCommand="TaskGridEditCommand">                                                         
                                <MasterTableView AllowMultiColumnSorting="false" 
                                    ClientDataKeyNames="ActionId"    
                                    AutoGenerateColumns="false" 
                                    EnableNoRecordsTemplate="true" 
                                    DataKeyNames="ActionId"
                                    NoMasterRecordsText='<%# ResourceManager.GetPhrase("NoActions", "There are no actions.") %>'                                      
                                    InsertItemPageIndexAction="ShowItemOnCurrentPage" ShowHeader="true">                                                                                                           
                                    <Columns>                
                                        <telerik:GridBoundColumn
                                            DataField="Type"
                                            DataType="System.String"
                                            HeaderText="Type"
                                            UniqueName="Type" />
                                        <telerik:GridBoundColumn
                                            DataField="Description"
                                            DataType="System.String"
                                            HeaderText="Details"
                                            UniqueName="Description" />                                            
                                        <telerik:GridButtonColumn  
                                            ButtonType="ImageButton" 
                                            ImageUrl="~/AsiCommon/Images/icon_edit.png"  
                                            UniqueName="Edit" 
                                            CommandName="Edit" 
                                            HeaderText="Edit"
                                            Text="Edit">
                                            <HeaderStyle CssClass="text-hide"></HeaderStyle>
                                            <ItemStyle Width="25px" CssClass="MiddleCenter" /> 
                                        </telerik:GridButtonColumn>                                                           
                                        <telerik:GridButtonColumn 
                                            ConfirmDialogType="RadWindow"
                                            ConfirmTitle="Delete" 
                                            ButtonType="ImageButton" 
                                            ImageUrl="~/AsiCommon/Images/icon_delete.png"  
                                            CommandName="Delete" 
                                            HeaderText="Remove"
                                            Text="Remove"
                                            UniqueName="DeleteColumn"  >
                                            <HeaderStyle CssClass="text-hide"></HeaderStyle>
                                            <ItemStyle Width="25px" CssClass="MiddleCenter" />                                        
                                        </telerik:GridButtonColumn>                                                                                                   
                                        <telerik:GridTemplateColumn UniqueName="MoveButtonsColumn" EditFormHeaderTextFormat="">
                                            <ItemTemplate>
                                                <asp:ImageButton ID="MoveUpButton" runat="server" CommandName="MoveUp" OnCommand="TaskActions_OnMoveCommand" 
                                                    Visible="<%# TaskActionsGrid.EditIndexes.Count < 1 && !TaskActionsGrid.MasterTableView.IsItemInserted %>" SkinID="MoveItemUpButton" 
                                                    ToolTip='<%# ResourceManager.GetPhrase("MoveUp", "Move Up") %>'/>
                                                <asp:ImageButton ID="MoveDownButton" runat="server" CommandName="MoveDown" OnCommand="TaskActions_OnMoveCommand"
                                                    Visible="<%# TaskActionsGrid.EditIndexes.Count < 1 && !TaskActionsGrid.MasterTableView.IsItemInserted %>" SkinID="MoveItemDownButton"
                                                    ToolTip='<%# ResourceManager.GetPhrase("MoveDown", "Move Down") %>' />
                                            </ItemTemplate>
                                            <ItemStyle Width="25px" CssClass="MiddleCenter" />
                                        </telerik:GridTemplateColumn>                           
                                    </Columns>                                                                                                                      
                                </MasterTableView>
                                <ClientSettings>
                                    <Selecting AllowRowSelect="false" />        
                                </ClientSettings>                                                                                                
                            </asiweb:BusinessDataGrid2>        
                        </telerik:RadAjaxPanel>                                              
                    </ContentTemplate>    
                </asp:UpdatePanel>                                                   
            </asiweb:PanelTemplateControl2>
        </telerik:RadPageView>
        <telerik:RadPageView runat="server" ID="AlertPageView">
            <asiweb:PanelTemplateControl2 ID="NotificationPanelTemplateControl" runat="server" Collapsible="false">                 
                <div class="PanelField Left">
                    <div style="display:inline;">
                        <asiweb:StyledLabel AssociatedControlID="NotificationDataSourcesSelector" ID="DataSourcesLabel" runat="server" />
                    </div>
                    <div class="PanelFieldValue AutoWidth">   
                        <asiweb:MultiSelectControl2 runat="server" ID="NotificationDataSourcesSelector" RenderPanelField="False" AutoPostBack="true"  /> <asp:LinkButton runat="server" ID="AddNewDataSource" translate="yes" Text="Add new data source" OnClick="AddNewCondition_Click"/>
                    </div>
                </div>               
                <div class="PanelField ">
                    <div class="PanelFieldValue AutoWidth FloatNone">
                        <asp:CheckBox ID="AddToNotificationSetCheck" runat="server" TextAlign="Right" CssClass="PanelFieldLabel" AutoPostBack="False" />
                    </div>
                    <div class="PanelFieldValue AutoWidth" runat="server" ID="NotificationSetDiv" style="padding-left:24px;">   
                        <asiweb:MultiSelectControl2 runat="server" ID="NotificationSetSelector" RenderPanelField="False" AutoPostBack="False"  /> <asp:LinkButton runat="server" ID="AddNewNotificationSet" translate="yes" Text="Add new set" OnClick="AddNewAlertSet_Click"/>
                    </div>
                </div>                
                <div class="PanelField ">
                    <div class="PanelFieldValue AutoWidth FloatNone">
                        <asp:CheckBox ID="ContactViewingOwnRecordCheckBox" runat="server" TextAlign="Right" CssClass="PanelFieldLabel" />
                    </div>
                </div>
                <asiweb:PanelTemplateControl2 id="AlertsMessageTemplates" runat="server" Text="Alert Message" ShowHeader="true" Collapsed="false" Collapsible="false" BorderWidth="0" translate="yes">
                    <telerik:RadTabStrip runat="server" ID="RadTabStripAlerts" SelectedIndex="0" MultiPageID="RadMultiPageAlerts" 
                        ShowBaseLine="true" CausesValidation="false" CssClass="RadTabStripAlerts">
                        <Tabs>
                            <telerik:RadTab Text="Default" PageViewID="DefaultPageView" />
                            <telerik:RadTab Text="Personalized" PageViewID="PersonalizedPageView" />
                        </Tabs>
                    </telerik:RadTabStrip>	
                    <telerik:RadMultiPage ID="RadMultiPageAlerts" runat="server" SelectedIndex="0" CssClass="ContentTabbedDisplay">
                        <telerik:RadPageView runat="server" ID="DefaultPageView" CssClass="panel-body">                                                                            
                            <asiweb:BusinessHtmlEditor ID="TaskNotificationDefaultTemplateHtml" runat="server" CssClass="ContentHtmlEditor" EnableTextareaMode="false" 
                                Height="300" Width="100%" style="width:100%!important;" AutoResizeHeight="true" />                                                          	
                        </telerik:RadPageView>
                        <telerik:RadPageView runat="server" ID="PersonalizedPageView" CssClass="panel-body">                                                                             
                            <asiweb:BusinessHtmlEditor ID="TaskNotificationPersonalizedTemplateHtml" runat="server" CssClass="ContentHtmlEditor" EnableTextareaMode="false" 
                                Height="300" Width="100%" style="width:100%!important;" AutoResizeHeight="true" />                                                          	
                        </telerik:RadPageView>
                    </telerik:RadMultiPage> 
                </asiweb:PanelTemplateControl2>
                <div style="clear: both;"></div>                                                                             
            </asiweb:PanelTemplateControl2>
        </telerik:RadPageView>          
        <telerik:RadPageView runat="server" ID="DataSourcesPageView">
            <asiweb:PanelTemplateControl2 ID="DataSourcesPanelTemplateControl" runat="server" Collapsible="false">   
                <p>
                    <asp:Label runat="server" ID="DataSourcesDescriptionLabel">
                  <% GetTranslatedPhrase("A list of all of the data sources used in this task. From this list you can add, remove or edit data sorces that may be used in other parts of the task."); %>
                    </asp:Label>
                </p>
                <div class="GridTitlePanel">
                    <div style="float:right">
                        <asp:LinkButton runat="server" ID="ManageAddDataSource" translate="yes" Text="Add data source" OnClick="AddNewDataSource_Click" />	    
                    </div>
                </div>
                <telerik:RadAjaxPanel ID="DataSourcesRadAjaxPanel" runat="server" Visible="true" EnableAJAX="true" EnableViewState="true" LoadingPanelID="RadAjaxLoadingPanel1">                                
                    
                    <asiweb:BusinessDataGrid2 ID="DataSourcesDataGrid" runat="server" 
                        AllowSorting="false" AllowPaging="True" PageSize="100"
                        OnNeedDataSource="DataSourcesGridNeedDataSource" OnItemDataBound="DataSourcesGridItemDataBound"
                        OnDeleteCommand="DataSourcesGridDeleteCommand" OnItemCreated="DataSourcesGridItemCreated"
                        OnEditCommand="TaskGridEditCommand">
                    <MasterTableView AutoGenerateColumns="false" EnableNoRecordsTemplate="true" DataKeyNames="DataSourceId"
                        NoMasterRecordsText='<%# ResourceManager.GetPhrase("NoDataSource", "There are no data sources.") %>' >          
                        <Columns>
                            <telerik:GridBoundColumn
                                DataField="Name"
                                DataType="System.String"
                                HeaderText="Data Source"
                                UniqueName="Name" />
                            <telerik:GridBoundColumn
                                DataField="Type"
                                DataType="System.String"
                                HeaderText="Type"
                                UniqueName="Type" />                                
                            <telerik:GridButtonColumn  
                                ButtonType="ImageButton" 
                                ImageUrl="~/AsiCommon/Images/icon_edit.png"  
                                UniqueName="Edit" 
                                CommandName="Edit" 
                                HeaderText="Edit"
                                Text="Edit">
                                <HeaderStyle CssClass="text-hide"></HeaderStyle>
                                <ItemStyle Width="25px" CssClass="AlignCenter VAlignMiddle" /> 
                            </telerik:GridButtonColumn>                                                           
                            <telerik:GridButtonColumn 
                                ConfirmDialogType="RadWindow"
                                ConfirmTitle="Delete" 
                                ButtonType="ImageButton" 
                                ImageUrl="~/AsiCommon/Images/icon_delete.png"  
                                CommandName="Delete" 
                                UniqueName="DeleteColumn"
                                HeaderText="Delete"
                                Text="Remove" >
                                <HeaderStyle CssClass="text-hide"></HeaderStyle>
                                <ItemStyle Width="25px" CssClass="AlignCenter VAlignMiddle" />                                        
                            </telerik:GridButtonColumn>
                        </Columns>        
                    </MasterTableView>    
                    <ClientSettings AllowGroupExpandCollapse="false" EnablePostBackOnRowClick="false">
                        <Selecting AllowRowSelect="false" />                                 
                    </ClientSettings>
                </asiweb:BusinessDataGrid2>                 
                </telerik:RadAjaxPanel>                                                                      
            </asiweb:PanelTemplateControl2>
        </telerik:RadPageView>                    
        <telerik:RadPageView runat="server" ID="LogsPageView">          
            <asi:TasksLog ID="tasksLog" runat="server" 
                DoNotRenderInDesignMode="true" 
                ShowBorder="false"
                ShowHeader="false"
                Collapsible="false"
                FilterByParentTask="true"
                />                       
        </telerik:RadPageView>           
    </telerik:RadMultiPage>
     
    <div id="commandButtons" class="ButtonPanel NotPrinted" runat="server" 
        style="position:fixed;bottom:14px;right:20px;z-index:99;cursor:pointer;border:0;visibility:visible;overflow:hidden;display:block;padding:0;background-color:#fff;">
        <div class="CommandBar">           
            <asp:Button causesvalidation="true" CssClass="TextButton PrimaryButton" ID="SaveButton" UseSubmitBehavior="False" OnClick="SaveClick" runat="server" Text="Save" />
            <asp:Button causesvalidation="true" CssClass="TextButton" ID="SaveAs" UseSubmitBehavior="False" OnClick="SaveAsClick" runat="server" Text="Save As" />
            <asp:Button causesvalidation="false" CssClass="TextButton" ID="ResetCancelButton" OnClick="ResetCancelClick" runat="server" Text="Close" /> 
        </div>           
    </div>     
    <asp:Button runat="server" ID="ClosedDialogHiddenButton" style="display:none" Text="Submit" OnClick="ClosedDialogClick"></asp:Button>
    <script>
        //<![CDATA[
        // Create instance of Asi_Web_iParts_Common_Task for this control
        if(typeof(<%=JavaScriptManagerVar%>)=='undefined') {
            <%=JavaScriptManagerVar%> = new Asi_Web_iParts_Common_Task('<%=TaskNotificationDefaultTemplateHtml.ClientID%>', 
            '<%=TaskNotificationPersonalizedTemplateHtml.ClientID%>', 
            '<%=ContactViewingOwnRecordCheckBox.ClientID%>', 
            'null', 
            '<%=BaseUrl%>',
            '<%=AddToNotificationSetCheck.ClientID%>', 
            '<%=NotificationSetDiv.ClientID%>'
        );          
        }
        function <%=ClientID%>_OnRadEditorLoad(editor) {
            <%=JavaScriptManagerVar%>.TaskNotificationDefaultTemplateHtml = editor;
            <%=JavaScriptManagerVar%>.TaskNotificationPersonalizedTemplateHtml = editor;
        }
        function <%=ClientID%>_OnRadEditorModeChange(editor, args) {
            // enable the insertField & insertLink dropdown when in html mode
            if (editor.get_mode() == 2) {
                setTimeout(function () {
                    var insertFieldDropDown = editor.getToolByName("<%=ClientID%>_InsertField");
                    if (insertFieldDropDown!=null) insertFieldDropDown.set_enabled(true);
                    var insertLinkDropDown = editor.getToolByName("<%=ClientID%>_InsertLink");
                    if (insertLinkDropDown!=null) insertLinkDropDown.set_enabled(false);
                }, 0);
            }
        }     
        if (Telerik.Web.UI.Editor != null) {
            Telerik.Web.UI.Editor.CommandList["<%=ClientID%>_InsertField"] = <%=JavaScriptManagerVar%>.InsertPlaceHolder;       
            Telerik.Web.UI.Editor.CommandList["<%=ClientID%>_InsertLink"] = <%=JavaScriptManagerVar%>.InsertLinksPlaceHolder;
        } 

        function OnClientLoad(editor, args) {
            var links = editor.get_contentArea().getElementsByTagName("a");
            for (i = 0; i < links.length; i++) {
                links[i].href = "javascript: void(0)";                
            }
            editor.get_contentAreaElement().className = "Disabled"; 
            editor.get_contentArea().className = "Disabled"; 
            editor.get_textArea().className = "Disabled"; 
        }
        //]]>
    </script>  
    
    <script type="text/javascript"  >
        if (Telerik.Web.UI.RadGrid != null)
            Telerik.Web.UI.RadGrid.prototype._detachDomEvents = function () {
                if (this._events) {
                    if (this._onKeyDownDelegate) {
                        $removeHandler(this.get_element(), "keydown", this._onKeyDownDelegate);
                        this._onKeyDownDelegate = null;
                    }
                    if (this._onKeyPressDelegate) {
                        $removeHandler(this.get_element(), "keypress", this._onKeyPressDelegate);
                        this._onKeyPressDelegate = null;
                    }
                    if (this._onMouseMoveDelegate) {
                        $removeHandler(this.get_element(), "mousemove", this._onMouseMoveDelegate);
                        this._onMouseMoveDelegate = null;
                    }
                }
            }
        function CloseWindowCallBackFunction(radwindow) {
            if (radwindow != null && !radwindow.IsDirty) {
                __doPostBack("<%= ClosedDialogHiddenButton.UniqueID %>", radwindow.Argument);
            }
        }
        </script>
</div>   
</asiweb:PanelTemplateControl2>
