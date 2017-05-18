<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="EngagementScoreFormulaEdit.ascx.cs" Inherits="Asi.Web.iParts.Communications.EngagementScoreFormulaList.EngagementScoreFormulaEdit" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<script type="text/javascript">
    // display any alerts that were returned by the server during ajax postback
    jQuery(function () {
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            var msg = jQuery("#<%=clientsideAlerts.ClientID%>").val();
            if (msg && msg.length > 0) {
                jQuery("#<%=clientsideAlerts.ClientID%>").val("");
                alert(msg);
            }
        });
    });
</script>

<asiweb:PanelTemplateControl ID="EngagementScorePanel" runat="server" FieldSet="true"
    ShowHeader="true" BorderStyle="None" Text="New score formula" Collapsed="false" Collapsible="false">
    <asp:UpdatePanel runat="server" ID="RefreshPanel" UpdateMode="Conditional" ChildrenAsTriggers="False">
    <ContentTemplate>
        <asp:Panel ID="Panel1" runat="server" DefaultButton="SubmitButton">
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" SkinID="AjaxLoadingPanel" />
            <telerik:RadAjaxPanel ID="ContentPanel" runat="server" EnableAJAX="True" EnableViewState="true" LoadingPanelID="RadAjaxLoadingPanel1" Visible="true">
            <div id="DivLabelErrorMessage" runat="server" visible="false"><asp:Label ID="LabelErrorMessage" runat="server" cssclass="Error" /></div> 
            <span style="display: none;"><asp:TextBox runat="server" id="clientsideAlerts"></asp:TextBox></span>
            <div class="PanelField Right">
                <div class="PanelFieldValue">
			        <asiweb:BusinessCheckBox ID="FormulaEnabledCheckBox" runat="server" PositionCaption="Right" DisplayCaption="True" RenderPanelField="True" AutoPostBack="True"
                        OnCheckedChanged="FormulaEnabledCheckBox_OnCheckedChanged"/>
		        </div>
            </div>               
            <asiweb:BusinessDropDownList ID="SystemTypeDropDown" runat="server" ShowNullItem="False" PositionCaption="Left" DisplayCaption="True" RenderPanelField="True" />                                            
            <div class="PanelField Left">
                <asiweb:BusinessLabel ID="EngagementScoreNameLabel" runat="server" AssociatedControlID="EngagementScoreTextBoxName" 
                    Text=<%# GetTranslatedPhrase(ResourceManager.GetPhrase("DisplayScoreName","Score name")) %> CssClass="Required"/>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox ID="EngagementScoreTextBoxName" runat="server" CssClass="InputXLarge" />
                    <asiweb:AsiRequiredFieldValidator ID="EngagementScoreTextBoxNameValidator" runat="server" ControlToValidate="EngagementScoreTextBoxName" CssClass="Important" Display="Static" EnableClientScript="true" ErrorMessage="Required" SetFocusOnError="false" />
                </div>
            </div>
            <div class="PanelField Left">
                <asiweb:BusinessLabel ID="EngagementScoreDescriptionLabel" runat="server" AssociatedControlID="EngagementScoreTextBoxDescription" 
                    Text=<%# GetTranslatedPhrase(ResourceManager.GetPhrase("DisplayDescription","Description")) %> CssClass="Required"/>
                <div class="PanelFieldValue">
                    <asiweb:BusinessTextBox ID="EngagementScoreTextBoxDescription" runat="server" CssClass="InputXXLarge" Rows="4" TextMode="MultiLine" />
                    <asiweb:AsiRequiredFieldValidator ID="NotificationDescRequiredFieldValidator" runat="server" ControlToValidate="EngagementScoreTextBoxDescription" CssClass="Important" Display="Static" EnableClientScript="true" ErrorMessage="Required" SetFocusOnError="false" />
                </div>
            </div>  
            <div class="PanelField Left">
                <div class="LabelSpacer">
                    <asp:Button ID="RecalculationButton" runat="server" OnClientClick="if(!AreYouSureAboutRecalculate()) return false;" OnClick="Recalculate_Click" 
                        Text=<%# GetTranslatedPhrase(ResourceManager.GetPhrase("RecalculateHistoricalScores","Recalculate Historical Scores")) %> CssClass="TextButton" />
                </div>
            </div>
            <div class="PanelField Left">
                <div class="LabelSpacer">
                    <asiweb:StyledLabel runat="server" ID="DisabledInformationLabel" Visible="False" CssClass="Info"></asiweb:StyledLabel>
                </div>
            </div>
            <span class="Label" id="GridLabelSpan" runat="server" >Score components</span>
                <asp:Label ID="labelError" runat="server" CssClass="Error" Visible="False"></asp:Label>
                <telerik:RadGrid ID="RadGrid1" runat="server" AllowMultiRowEdit="false" AllowMultiRowSelection="false" 
                    AllowPaging="False" AllowSorting="false" AllowAutomaticInserts="False" AllowAutomaticUpdates="False"
                    AlternatingItemStyle-CssClass="GridAlternateRow" AutoGenerateColumns="false" CssClass="Grid" 
                    EnableLinqExpressions="false" FooterStyle-CssClass="GridFooter" GridLines="None" 
                    HeaderStyle-CssClass="GridHeader" ItemStyle-CssClass="GridRow" ShowGroupPanel="false" ShowStatusBar="false">
                    
                    <MasterTableView AllowMultiColumnSorting="false" ClientDataKeyNames="ScoreComponentId" CommandItemDisplay="Top" 
                        DataKeyNames="ScoreComponentId" EditMode="EditForms" InsertItemPageIndexAction="ShowItemOnCurrentPage" ShowHeader="true">
                        <CommandItemStyle HorizontalAlign="right" />
                        <CommandItemTemplate>
                            <asp:LinkButton ID="AddButton" runat="server" CommandName="InitInsert" OnClientClick="AddNewRow()" Visible="<%# !ComponentGridInEditMode %>">
                                <asp:Image ID="AddButtonImage" runat="server" SkinID="PanelCommandButtonAdd" AlternateText="Add"/>
                                <span class="RadGridCommandText"><%# GetTranslatedPhrase(ResourceManager.GetPhrase("AddNew","Add new")) %></span>
                                &#160;&#160;
                            </asp:LinkButton>
                        </CommandItemTemplate>
                        
                        <Columns>
                            <telerik:GridTemplateColumn DataField="ScoreComponentId" EditFormHeaderTextFormat="" HeaderStyle-Wrap="false" HeaderText="Name" ItemStyle-Wrap="false" SortExpression="ScoreComponentId" UniqueName="ScoreComponentIdColumn">
                                <ItemTemplate>
                                 <asiweb:BusinessLabel ID="ScoreComponentDisplayNameDisplay" runat="server" />
                                </ItemTemplate>                                      
                                <EditItemTemplate>
                                    <div class="PanelField Left">
                                        <asiweb:BusinessLabel ID="ScoreComponentTextBoxDisplayNameLabel" runat="server" AssociatedControlID="ScoreComponentTextBoxDisplayName" 
                                            Text=<%# GetTranslatedPhrase(ResourceManager.GetPhrase("DisplayName","Name")) %> Translate="Yes" />
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessTextBox ID="ScoreComponentTextBoxDisplayName" runat="server" CssClass="InputXLarge" />
                                            <asiweb:AsiRequiredFieldValidator ID="ScoreComponentTextBoxDisplayNameValidator" runat="server" ControlToValidate="ScoreComponentTextBoxDisplayName" CssClass="Important" Display="Dynamic" EnableClientScript="true" ErrorMessage="Name Value Required" SetFocusOnError="false" />
                                            <asp:CustomValidator ID="NameCustomValidator" runat="server" CssClass="Important" Display="Dynamic" ControlToValidate="ScoreComponentTextBoxDisplayName"
                                                OnServerValidate="ValidateName" />
                                        </div>
                                    </div>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn> 
                            <telerik:GridTemplateColumn DataField="DataSourceId" EditFormHeaderTextFormat="" HeaderStyle-Wrap="false" 
                                HeaderText="IQA Query" ItemStyle-Wrap="false" SortExpression="ScoreComponentId" UniqueName="IqaQueryLabel">
                                <ItemTemplate>
                                    <asiweb:BusinessLabel ID="ScoreComponentIqaQueryDisplay" runat="server" />
                                </ItemTemplate>                                    
                                <EditItemTemplate>
                                    <div class="PanelField Left">
                                        <div style="display:inline;">
                                            <asiweb:StyledLabel ID="ScoreComponentIqaQueryLabel" runat="server" AssociatedControlID="ScoreComponentTextBoxIqaQuery"  
                                                Text=<%# GetTranslatedPhrase(ResourceManager.GetPhrase("DisplayIQAQuery","IQA Query")) %> />
                                        </div>
                                        <div class="PanelFieldValue ">
                                            <asiweb:BusinessDocumentBrowserControl ID="ScoreComponentTextBoxIqaQuery" runat="server" AllowUpwardNavigation="False" CssClass="InputXLargeWrapper" DocumentHierarchyPath=<%# DocumentHierarchyPath %> DocumentTypesAllowed="IQD" RootFolder="$" ShowAddress="False" AutoPostBack="True" OnDataChanged="ScoreComponentTextBoxIqaQuery_OnDataChanged"/>
                                            <asiweb:StyledLabel ID="QueryValidationMessage" runat="server" CssClass="Error" Visible="False"/>
                                            <asiweb:StyledLabel ID="QueryInfoMessage" runat="server" CssClass="Info" Visible="False"/>
                                        </div>
                                    </div>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn> 
                            <telerik:GridTemplateColumn DataField="Function" EditFormHeaderTextFormat="" HeaderStyle-Wrap="false" HeaderText="Score Calculation" ItemStyle-Wrap="false" SortExpression="ScoreComponentId" UniqueName="ScoreCalculationLabel">
                                <ItemTemplate>
                                    <asiweb:BusinessLabel ID="ScoreComponentScoreCalculationDisplay" runat="server" />
                                </ItemTemplate>                                 
                                <EditItemTemplate> 
                                    <div class="PanelField Left">
                                        <asiweb:BusinessLabel ID="ScoreComponentDropDownFunctionLabel" runat="server" AssociatedControlID="ScoreComponentDropDownFunction"  
                                            Text=<%# GetTranslatedPhrase(ResourceManager.GetPhrase("DisplayScoreCalculation","Score Calculation")) %> Translate="Yes"/>
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessDropDownList ID="ScoreComponentDropDownFunction" runat="server" ShowNullItem="False" 
                                                AutoPostBack="true" OnSelectedIndexChanged="ScoreComponentDropDownFunction_OnSelectedIndexChanged" Translate="Yes"/>
                                            <asp:CustomValidator ID="FunctionCustomValidator" runat="server" CssClass="Important" Display="Dynamic" ControlToValidate="ScoreComponentDropDownFunction"
                                                OnServerValidate="ValidateFunction" />
                                        </div>
                                    </div>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn> 
                            <telerik:GridTemplateColumn DataField="PropertyName" EditFormHeaderTextFormat="" HeaderStyle-Wrap="false" HeaderText="" ItemStyle-Wrap="false" UniqueName="ScorePropertyName">
                                <EditItemTemplate>
                                    <div class="PanelField Left">
                                        <asiweb:BusinessLabel ID="ScoreComponentDropDownFunctionPropertyNameLabel" runat="server" AssociatedControlID="ScoreComponentDropDownFunctionPropertyName"  
                                            Text=<%# GetTranslatedPhrase(ResourceManager.GetPhrase("DisplayColumnToSum","Column to sum")) %> Translate="Yes"/>
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessDropDownList ID="ScoreComponentDropDownFunctionPropertyName" runat="server" ShowNullItem="True" />
                                            <asiweb:AsiRequiredFieldValidator runat="server" ID="PropertyNameRequiredValidator" ControlToValidate="ScoreComponentDropDownFunctionPropertyName" CssClass="Important" 
                                                Display="Dynamic" EnableClientScript="true" ErrorMessage="Property Required" SetFocusOnError="false" />
                                        </div>
                                    </div>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                            <telerik:GridTemplateColumn DataField="Multiplier" EditFormHeaderTextFormat="" HeaderStyle-Wrap="false" HeaderText="Multiplier" ItemStyle-Wrap="false" SortExpression="ScoreComponentId" UniqueName="MultiplierLabel">
                                <ItemTemplate>
                                    <asiweb:BusinessLabel ID="ScoreComponentMultiplierDisplay" runat="server" />
                                </ItemTemplate>  
                                <EditItemTemplate>
                                    <div class="PanelField Left">
                                        <asiweb:BusinessLabel ID="ScoreComponentTextBoxMultiplierLabel" runat="server" AssociatedControlID="ScoreComponentTextBoxMultiplier"  
                                            Text=<%# GetTranslatedPhrase(ResourceManager.GetPhrase("DisplayMultiplier","Multiplier")) %> Translate="Yes"/>
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessTextBox ID="ScoreComponentTextBoxMultiplier" runat="server" CssClass="InputSmall" />
                                            <asp:Label runat="server" CssClass="Info" Text=<%# GetTranslatedPhrase(ResourceManager.GetPhrase("MultiplierInfoMessage","Score calculated from IQA query is multiplied by this value.")) %>/>
                                            <asiweb:AsiRequiredFieldValidator ID="MultiplierValidator" runat="server" ControlToValidate="ScoreComponentTextBoxMultiplier" CssClass="Important" Display="Dynamic" EnableClientScript="true" ErrorMessage="Multiplier Required" SetFocusOnError="false" />
                                            <asp:RangeValidator runat="server" ID="MultiplierRangeValidator" ControlToValidate="ScoreComponentTextBoxMultiplier" Type="Double" MinimumValue="-1000000" MaximumValue="1000000"
                                                CssClass="Important" Display="Dynamic" EnableClientScript="true" 
                                                ErrorMessage=<%# GetTranslatedPhrase(ResourceManager.GetPhrase("MultiplierValidationMessage","multiplier must be a number between -1000000 and 1000000")) %> SetFocusOnError="false" />
                                        </div>
                                    </div>
                                </EditItemTemplate>
                        </telerik:GridTemplateColumn>
                        <telerik:GridEditCommandColumn 
                            EditImageUrl="~/AsiCommon/Images/icon_edit.png" 
                            ButtonType="ImageButton" 
                            UniqueName="EditCommandColumn">
                            <ItemStyle Width="25px" CssClass="AlignCenter VAlignMiddle" /> 
                        </telerik:GridEditCommandColumn> 
                        <telerik:GridButtonColumn 
                                UniqueName="Delete"
                                ConfirmDialogType="Classic"
                                ConfirmTitle="Delete" 
                                ButtonType="ImageButton" 
                                ImageUrl="~/AsiCommon/Images/icon_delete.png"  
                                CommandName="Delete" 
                                Text="Remove"
                                ConfirmText="Are you sure you wish to remove this score component?" >
                                <ItemStyle Width="25px" CssClass="AlignCenter VAlignMiddle" />                                        
                        </telerik:GridButtonColumn>
                    </Columns>   
                        <EditFormSettings >
                            <FormTableItemStyle Wrap="False"/>
                            <FormMainTableStyle GridLines="None" CellSpacing="0" CellPadding="5" />
                            <FormTableStyle GridLines="None" CellSpacing="0" CellPadding="5" />
                            <FormTableAlternatingItemStyle Wrap="False"/>
                            <FormStyle Width="100%"/>
                            <EditColumn UniqueName="EditCommandColumn" ButtonType="PushButton" 
                                InsertText="Save" 
                                CancelText="Cancel" 
                                UpdateText="Save" ></EditColumn> 
                        </EditFormSettings>
                     
                    <NoRecordsTemplate>
                        <asiweb:BusinessLabel ID="NoRecordLabel" runat="server" 
                            Text="(None)" Translate="Yes"></asiweb:BusinessLabel>
                    </NoRecordsTemplate>
                     
                                
                </MasterTableView>

                <ClientSettings><Selecting AllowRowSelect="True" /><ClientEvents OnCommand="GridCommand" OnGridCreated="GridCreated" OnRowClick="RowSelected"></ClientEvents>                                     
                </ClientSettings>
        
            </telerik:RadGrid>
            <br/>
            <br/>    
            <span class="Label" id="CategoryGridLabelSpan" runat="server" >Categories</span>
            <asp:Label ID="CategoryLabelError" runat="server" CssClass="Error" Visible="False"></asp:Label>
            <telerik:RadGrid ID="RadGrid2" runat="server" AllowMultiRowEdit="false" AllowMultiRowSelection="false" 
                    AllowPaging="False" AllowSorting="false" AllowAutomaticInserts="False" AllowAutomaticUpdates="False"
                    AlternatingItemStyle-CssClass="GridAlternateRow" AutoGenerateColumns="false" CssClass="Grid" 
                    EnableLinqExpressions="false" FooterStyle-CssClass="GridFooter" GridLines="None" 
                    HeaderStyle-CssClass="GridHeader" ItemStyle-CssClass="GridRow" ShowGroupPanel="false" ShowStatusBar="false">   
                 <MasterTableView AllowMultiColumnSorting="false" ClientDataKeyNames="EngagementCategoryId" CommandItemDisplay="Top" 
                        DataKeyNames="EngagementCategoryId" EditMode="EditForms" InsertItemPageIndexAction="ShowItemOnCurrentPage" ShowHeader="true">
                        <CommandItemStyle HorizontalAlign="right" />
                        <CommandItemTemplate>
                            <asp:LinkButton ID="AddCategoryButton" runat="server" CommandName="InitInsert" OnClientClick="AddNewRow()" 
                                Visible="<%# !CategoryGridInEditMode %>" >
                                <asp:Image ID="AddCategoryButtonImage" runat="server" SkinID="PanelCommandButtonAdd" AlternateText="Add"/>
                                <span class="RadGridCommandText"><%# GetTranslatedPhrase(ResourceManager.GetPhrase("AddNew","Add new")) %></span>
                                &#160;&#160;
                            </asp:LinkButton>
                        </CommandItemTemplate>
                        <Columns>
                            <telerik:GridTemplateColumn DataField="IsEnabled" EditFormHeaderTextFormat="" HeaderStyle-Wrap="false" 
                                HeaderText="Enabled" ItemStyle-Wrap="false" SortExpression="IsEnabled" UniqueName="IsEnabledLabel">
                                <ItemTemplate>
                                    <asiweb:BusinessLabel ID="CategoryIsEnabled" runat="server" />                                  
                                </ItemTemplate>                                    
                                <EditItemTemplate>
                                    <div class="PanelField Right">
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessCheckBox ID="CategoryEnabledCheckbox" runat="server" PositionCaption="Right" 
                                                DisplayCaption="True" RenderPanelField="True" Caption=<%# GetTranslatedPhrase(ResourceManager.GetPhrase("Enabled","Enabled")) %> Checked="True"/>
                                        </div>
                                    </div>
                                </EditItemTemplate>
                                <HeaderStyle Width="75px" CssClass="AlignCenter VAlignMiddle" />
                                <ItemStyle Width="75px" CssClass="AlignCenter VAlignMiddle" />                                
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn DataField="EngagementCategoryId" EditFormHeaderTextFormat="" HeaderStyle-Wrap="false" 
                                HeaderText="Category Name" ItemStyle-Wrap="false" SortExpression="EngagementCategoryId" 
                                UniqueName="EngagementCategoryIdColumn">
                                <ItemTemplate>
                                    <asiweb:BusinessLabel ID="CategoryNameDisplay" runat="server" />
                                </ItemTemplate>                                      
                                <EditItemTemplate>
                                    <div class="PanelField Left">
                                        <asiweb:BusinessLabel ID="CategoryTextBoxNameLabel" runat="server" AssociatedControlID="CategoryTextBoxName" 
                                            Text=<%# GetTranslatedPhrase(ResourceManager.GetPhrase("DisplayName","Name")) %> Translate="Yes" />
                                        <div class="PanelFieldValue">
                                            <asiweb:BusinessTextBox ID="CategoryTextBoxName" runat="server" CssClass="InputXLarge" />
                                            <asiweb:AsiRequiredFieldValidator ID="CategoryTextBoxNameValidator" runat="server" ControlToValidate="CategoryTextBoxName" CssClass="Important" Display="Dynamic" EnableClientScript="true" ErrorMessage="Required" SetFocusOnError="false" />
                                            <asp:CustomValidator ID="CategoryNameCustomValidator" runat="server" CssClass="Important" Display="Dynamic" ControlToValidate="CategoryTextBoxName"
                                                OnServerValidate="ValidateCategoryName" />
                                        </div>
                                    </div>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                         
                            <telerik:GridTemplateColumn DataField="Color" EditFormHeaderTextFormat="" HeaderStyle-Wrap="false" Visible="True" 
                                HeaderText="" ItemStyle-Wrap="false" SortExpression="" UniqueName="ColorColumn">
                                <ItemTemplate>
                                 <asiweb:BusinessLabel ID="ColorDisplay" runat="server" />
                                </ItemTemplate>                                      
                                <EditItemTemplate >
                                    <div class="PanelField Left" Visible="True" runat="server">
                                        <asiweb:BusinessLabel ID="ColorLabel" runat="server" AssociatedControlID="colorpicker" 
                                            Text=<%# GetTranslatedPhrase(ResourceManager.GetPhrase("Color","Color")) %> Translate="Yes"  />
                                        <div class="PanelFieldValue">
                                            <input id="colorpicker" runat="server" />
                                        </div>
                                    </div>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>

                            <telerik:GridTemplateColumn DataField="Criteria" EditFormHeaderTextFormat="" HeaderStyle-Wrap="false" 
                                HeaderText="Criteria" ItemStyle-Wrap="false" SortExpression="" UniqueName="CriteriaLabel">
                                <ItemTemplate>
                                    <asiweb:BusinessLabel ID="CategoryCriteria" runat="server" />
                                </ItemTemplate> 
                                <EditItemTemplate>
                                        <span class="Label" id="CriteriaGridSpan" runat="server" ><%# GetTranslatedPhrase(ResourceManager.GetPhrase("Criteria","Criteria")) %></span>
                                        <telerik:RadGrid ID="CriteriaGrid" runat="server" AllowMultiRowEdit="True" AllowMultiRowSelection="false" 
                                            AllowPaging="False" AllowSorting="false" AllowAutomaticInserts="False" AllowAutomaticUpdates="False"
                                            AlternatingItemStyle-CssClass="GridAlternateRow" AutoGenerateColumns="false" CssClass="Grid" 
                                            EnableLinqExpressions="false" FooterStyle-CssClass="GridFooter" GridLines="None"
                                            HeaderStyle-CssClass="GridHeader" ItemStyle-CssClass="GridRow" ShowGroupPanel="false" ShowStatusBar="false"
                                            OnNeedDataSource="CriteriaGrid_OnNeedDataSource"
                                            OnItemDataBound="CriteriaGrid_OnItemDataBound"
                                            OnItemCreated="CriteriaGrid_OnItemCreated"
                                            OnItemCommand="CriteriaGrid_OnItemCommand">
                                            <MasterTableView CommandItemDisplay="Top" >
                                                <CommandItemSettings ShowAddNewRecordButton="False" ShowCancelChangesButton="False">
                                                </CommandItemSettings>
                                                <CommandItemStyle HorizontalAlign="right" />
                                                <CommandItemTemplate>
                                                    <asp:LinkButton ID="AddCriterionButton" runat="server" CommandName="InitInsert" OnClientClick="AddNewRow()" >
                                                        <asp:Image ID="AddCriterionButtonImage" runat="server" SkinID="PanelCommandButtonAdd" AlternateText="Add"/>
                                                        <span class="RadGridCommandText"><%# GetTranslatedPhrase(ResourceManager.GetPhrase("AddNew","Add new")) %></span>
                                                        &#160;&#160;
                                                    </asp:LinkButton>
                                                </CommandItemTemplate>
                                                <Columns>
                                                    <telerik:GridTemplateColumn ColumnEditorID="BasisTypeColumn" DataField="BasisType" HeaderText="Basis"
                                                        UniqueName="BasisTypeColumnName">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="BasisTypeList" runat="server"/>
                                                            <asp:CustomValidator ID="BasisTypeListValidator" runat="server" CssClass="Important" 
                                                                Display="Dynamic" ControlToValidate="BasisTypeList"
                                                                OnServerValidate="ValidateBasis" />
                                                         </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ColumnEditorID="ComparisonColumn" DataField="Comparison" HeaderText="Comparison"
                                                        UniqueName="ComparisonColumnName">
                                                        <ItemTemplate>
                                                            <asp:DropDownList ID="CriteriaComparisonList" runat="server"/>
                                                            <asp:CustomValidator ID="CriteriaComparisonListValidator" runat="server" CssClass="Important" 
                                                                Display="Dynamic" ControlToValidate="CriteriaComparisonList"
                                                                OnServerValidate="ValidateCriteriaComparison" />
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridTemplateColumn ColumnEditorID="ValueColumn" DataField="Value" HeaderText="Value"
                                                        UniqueName="ValueColumnName">
                                                        <ItemTemplate>
                                                            <asiweb:BusinessTextBox ID="CriterionValueTextBox" runat="server" />
                                                            <asiweb:AsiRequiredFieldValidator ID="CriteriaValueValidator" ControlToValidate="CriterionValueTextBox"
                                                                runat="server" CssClass="Important" Display="Static" EnableClientScript="true" ErrorMessage="Required"/>
                                                            <asp:RangeValidator runat="server" ControlToValidate="CriterionValueTextBox" Type="Double" 
                                                                CssClass="Important" Display="Dynamic" Text="Number required"
                                                                MinimumValue="-1000000000" MaximumValue="1000000000"></asp:RangeValidator>
                                                        </ItemTemplate>
                                                    </telerik:GridTemplateColumn>
                                                    <telerik:GridButtonColumn 
                                                          ConfirmDialogType="Classic"
                                                          ConfirmTitle="Delete" 
                                                          ButtonType="ImageButton" 
                                                          ImageUrl="~/AsiCommon/Images/icon_delete.png"  
                                                          CommandName="Delete" 
                                                          Text="Remove"
                                                          ConfirmText="Are you sure you wish to remove this criterion?" >
                                                       <ItemStyle Width="25px" CssClass="AlignCenter VAlignMiddle" />                                        
                                                    </telerik:GridButtonColumn>
                                                </Columns>
                                                <EditFormSettings>
                                                    <EditColumn InsertText="" CancelText=""></EditColumn>
                                                </EditFormSettings>
                                                <NoRecordsTemplate>
                                                    <asiweb:BusinessLabel ID="NoCriteriaFoundLabel" runat="server" Text="(None)" Translate="Yes"></asiweb:BusinessLabel>
                                                </NoRecordsTemplate>
                                            </MasterTableView>  
                                        </telerik:RadGrid>
                                        <br/>
                                </EditItemTemplate>
                            </telerik:GridTemplateColumn>
                         
                        <telerik:GridEditCommandColumn 
                            EditImageUrl="~/AsiCommon/Images/icon_edit.png" 
                            ButtonType="ImageButton" 
                            UniqueName="EditCategoryCommandColumn">
                            <ItemStyle Width="25px" CssClass="AlignCenter VAlignMiddle" /> 
                        </telerik:GridEditCommandColumn> 
                        <telerik:GridButtonColumn 
                                ConfirmDialogType="Classic"
                                ConfirmTitle="Delete" 
                                ButtonType="ImageButton" 
                                ImageUrl="~/AsiCommon/Images/icon_delete.png"  
                                CommandName="Delete" 
                                Text="Remove"
                                ConfirmText="Are you sure you wish to remove this category?" >
                                <ItemStyle Width="25px" CssClass="AlignCenter VAlignMiddle" />                                        
                        </telerik:GridButtonColumn>
                            <telerik:GridTemplateColumn UniqueName="MoveButtonsColumn" EditFormHeaderTextFormat="" >
                                <ItemTemplate>
                                    <asp:ImageButton ID="MoveUpButton" runat="server" CommandName="MoveUp" OnCommand="Grid2_OnMoveCommand" 
                                        Visible="<%# RadGrid2.EditIndexes.Count < 1 && !RadGrid2.MasterTableView.IsItemInserted %>" SkinID="MoveItemUpButton" 
                                        AlternateText="Move up"
                                        ToolTip='<%# ResourceManager.GetPhrase("MoveUp", "Move Up") %>'/>
                                    <asp:ImageButton ID="MoveDownButton" runat="server" CommandName="MoveDown" OnCommand="Grid2_OnMoveCommand"
                                        Visible="<%# RadGrid2.EditIndexes.Count < 1 && !RadGrid2.MasterTableView.IsItemInserted %>" SkinID="MoveItemDownButton"
                                        AlternateText="Move down"
                                        ToolTip='<%# ResourceManager.GetPhrase("MoveDown", "Move Down") %>' />
                                </ItemTemplate>
                                <ItemStyle Width="25px" />
                                <HeaderStyle Width="25px" />
                            </telerik:GridTemplateColumn>
                    </Columns>   
                        <EditFormSettings >
                            <FormTableItemStyle Wrap="False"/>
                            <FormMainTableStyle GridLines="None" CellSpacing="0" CellPadding="5" />
                            <FormTableStyle GridLines="None" CellSpacing="0" CellPadding="5" />
                            <FormTableAlternatingItemStyle Wrap="False"/>
                            <FormStyle Width="100%"/>
                            <EditColumn UniqueName="EditCategoryCommandColumn" ButtonType="PushButton" 
                                InsertText="Save" 
                                CancelText="Cancel" 
                                UpdateText="Save" ></EditColumn> 
                        </EditFormSettings>

                    <NoRecordsTemplate>
                        <asiweb:BusinessLabel ID="NoCategoryRecordsLabel" runat="server" Text="(None)" Translate="Yes"></asiweb:BusinessLabel>
                    </NoRecordsTemplate>
                </MasterTableView>

                <ClientSettings><Selecting AllowRowSelect="True" /><ClientEvents OnCommand="GridCommand" OnGridCreated="GridCreated" OnRowClick="RowSelected"></ClientEvents>                                     
                </ClientSettings>
            </telerik:RadGrid>  
        </telerik:RadAjaxPanel>
        </asp:Panel>
    </ContentTemplate>    
    </asp:UpdatePanel> 

    <div id="commandButtons" class="ButtonPanel NotPrinted" runat="server" style="padding-top:1em;padding-bottom:0.5em;bottom:0;">
        <div class="CommandBar">
            <asp:Button ID="SubmitButton" runat="server" OnClick="SubmitClick" causesvalidation="true" CssClass="TextButton PrimaryButton" />
            <asp:Button ID="SaveAs" runat="server" OnClientClick="if(!AreYouSureAboutClone()) return false;" OnClick="SaveAsClick" causesvalidation="true" CssClass="TextButton"  UseSubmitBehavior="False" />
            <asp:Button ID="ResetCancelButton" runat="server" OnClick="ResetCancel_Click" causesvalidation="false" CssClass="TextButton" />
        </div>           
    </div> 
    
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script src='spectrum.js'></script>
        <script type="text/javascript">
           
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(bindPicker);
        bindPicker();

        function bindPicker() {
            var colorPicker = jQuery("input[id*=colorpicker]");
            if (colorPicker.length > 0) {
                colorPicker.spectrum({
                    flat: false,
                    allowEmpty: true,
                    showInput: true,
                    showInitial: true,
                    showAlpha: false,
                    preferredFormat: "hex",
                    cancelText: "<%= ColorPickerPhraseCancel %>",
                    chooseText: "<%= ColorPickerPhraseChoose %>",
                    clearText: "<%= ColorPickerPhraseClearColorSelection %>",
                    noColorSelectedText: "<%= ColorPickerPhraseNoColorSelected %>"
                });
            }
        }

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
      
            function AreYouSureAboutRecalculate() {
                return confirm("<%= RecalculateWarning %>");
            }

            function AreYouSureAboutClone() {
                return confirm("<%= CloneWarning %>");
            }
        </script>
    </telerik:RadCodeBlock>      
    
</asiweb:PanelTemplateControl>