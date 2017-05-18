<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="EditPropertyDialog.aspx.cs" Inherits="Asi.Web.iParts.Common.PanelEditor.EditPropertyDialog" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" %>

<asp:Content id="UDFContent" runat="server" ContentPlaceHolderID="TemplateBody">

<script language="javascript">

    function ConfirmDeleteProperty() {
        answer = confirm("Delete this property?");
        if (!answer)
            return false;
        return true;
    }

    function QueryBrowseClick() {
        var windowTitle = '<%=GetTranslatedPhrase(ResourceManager.GetPhrase("DocumentBrowser","Document Browser")) %>';
        OpenObjectBrowser('iTypeFilter=IQD', SetQueryObject, null, null, null, windowTitle);
    }
    function SetQueryObject(dialogWindow) {
        if (!dialogWindow.result)
            return;
        var result = dialogWindow.result;
        var queryDocumentKey = document.getElementById('<%= QueryDocumentKey.ClientID %>');
        queryDocumentKey.value = result;

        var queryObjectSourceLabel = document.getElementById('<%= QueryObjectSourceLabel.ClientID %>');
        if (dialogWindow.SelectedDocumentName != null && dialogWindow.SelectedDocumentName.length > 0)
            queryObjectSourceLabel.innerText = dialogWindow.SelectedDocumentName;
        else
            queryObjectSourceLabel.innerText = "Name not specified";
        document.getElementById('<%= QuerySelectedButton.ClientID %>').click();
    }
    function QueryRemoveClick() {
        document.getElementById('<%= QueryClearedButton.ClientID %>').click();
    }
</script>

<asiweb:PanelTemplateControl2 ID="designerPanel" runat="server" FieldSet="True" ShowHeader="False" BorderStyle="None">
    <asp:Label runat="server" ID="EditExistingPropertyWarning" CssClass="Info" Visible="False"></asp:Label>
    <div class="PanelField Left">
        <div>
            <asiweb:StyledLabel runat="server" ID="LabelPropertyName" AssociatedControlID="TextBoxPropertyName"></asiweb:StyledLabel>
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessTextBox runat="server" ID="TextBoxPropertyName" CssClass="InputLarge"></asiweb:BusinessTextBox>
        </div>
    </div>
    <div class="PanelField Left">
        <div>
            <asiweb:StyledLabel runat="server" ID="LabelPropertyType" AssociatedControlID="DropDownPropertyType"></asiweb:StyledLabel>
        </div>
        <div class="PanelFieldValue">
            <asiweb:BusinessDropDownList runat="server" ID="DropDownPropertyType"></asiweb:BusinessDropDownList>
        </div>
    </div>
    <div id="PropertyStringLengthDiv" runat="server">
        <div class="PanelField Left">
            <div>
                <asiweb:StyledLabel runat="server" ID="LabelStringLength" AssociatedControlID="TextBoxStringLength"></asiweb:StyledLabel>
            </div>
            <div class="PanelFieldValue">
                <!-- This update panel is here so that an ajax postback will happen whenever the length changes, which
                    makes the length available to the RadGrid when it does its own ajax postback. -->
                <asp:UpdatePanel runat="server"><ContentTemplate>
                <asiweb:BusinessTextBox runat="server" ID="TextBoxStringLength" AutoPostBack="True" CssClass="InputSmall"></asiweb:BusinessTextBox>
                </ContentTemplate></asp:UpdatePanel>
            </div>
        </div>        
    </div>

    <asiweb:BusinessCheckbox runat="server" ID="CheckBoxLogAllChanges" RenderPanelField="True" DisplayCaption="True" PositionCaption="Right"/>
    <div id="ValueListDiv" runat="server">
        <asiweb:BusinessCheckbox runat="server" ID="CheckBoxSelectValueList" RenderPanelField="True" DisplayCaption="True" PositionCaption="Right"/>    
        <div id="SpecifyValueListDiv" runat="server">
            <asiweb:BusinessCheckbox runat="server" ID="CheckBoxAllowMultiSelect" RenderPanelField="True" DisplayCaption="True" PositionCaption="Right"/>
            <div class="AutoWidth PanelField Left">
                <div class="PanelFieldValue">
                    <asiweb:StyledRadioButton ID="RadioButtonQueryValueList" GroupName="ExplicitOrQuery" Checked="true"  
                        AutoPostBack="false" RenderPanelField="false" DisplayCaption="false" runat="server" />
                </div>                
                <div class="PanelFieldLabel">
                    <asiweb:StyledLabel runat="server" ID="LabelQueryValueList" AssociatedControlID="RadioButtonQueryValueList" />&nbsp;&nbsp;
                </div>
                <div class="PanelFieldValue">
                    <asiweb:StyledRadioButton ID="RadioButtonExplicitValueList" GroupName="ExplicitOrQuery" Checked="false" 
                        AutoPostBack="false" RenderPanelField="false" DisplayCaption="false" runat="server" />
                </div>
                <div class="PanelFieldLabel">
                    <asiweb:StyledLabel runat="server" ID="LabelExplicitValueList" AssociatedControlID="RadioButtonExplicitValueList" />
                </div>
            </div>
            <div id="QueryValueListDiv" runat="server">
                <asp:UpdatePanel ID="QueryUpdatePanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="PanelField">
                            <label id="QueryContainerLabel" for="QueryContainer">Query</label>
                               <div class="PanelFieldValue AutoWidth">
                                <input id="QueryDocumentKey" type="hidden" runat="server" />
                                <asp:label id="QueryObjectLabel" runat="server" Text="Query Object" Width="12em" AssociatedControlID="QueryObjectSourceLabel" Visible="false" />
                                <asp:label id="QueryObjectSourceLabel" style="white-space:nowrap;font-style:italic;float:left;padding-right:10px;" runat="server" />
                                <asp:label id="QueryPathErrorLabel" CssClass="Error" Visible="false" runat="server"></asp:label>
                                <asiweb:StyledButton Text="Browse" id="QueryBrowseButton" AutoPostBack="false" onclientclick="QueryBrowseClick();" runat="server" />
                                <asiweb:StyledButton Text="Remove" ID="QueryRemoveButton" AutoPostBack="false" OnClientClick="QueryRemoveClick();" runat="server" />
                                <asp:Button ID="QuerySelectedButton" runat="server" style="display:none;" OnClick="Reload" />
                                <asp:Button ID="QueryClearedButton" runat="server" style="display:none;" OnClick="ClearQuery" />
                            </div>
                        </div>
                        <div id="QueryDataDisplayDiv" runat="server">
                            <div class="PanelField">
                                <asp:label id="DataValueLabel" runat="server" Text="Data Value" AssociatedControlID="DataValue" />
                                <div class="PanelFieldValue">
                                    <asp:DropDownList id="DataValue" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="PanelField">
                                <asp:label id="DisplayValueLabel" runat="server" Text="Display Value" AssociatedControlID="DisplayValue" />
                                <div class="PanelFieldValue">
                                    <asp:DropDownList id="DisplayValue" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div id="ExplicitValueListDiv" class="PanelField Left" runat="server">
                <asp:Button runat="server" id="ExplicitValueListTrigger" OnClick="ExplicitValueListTriggerClick" style="display:none" Text=""></asp:Button>
                    <asp:Label runat="server" ID="ExplicitValueListErrorMessage" CssClass="Error" Visible="False"></asp:Label>
                    <input id="ExplicitValueListData" type="hidden" runat="server"/>
                    <telerik:RadGrid ID="RadGrid1" GridLines="None" runat="server" AllowAutomaticDeletes="False" 
                        AllowAutomaticInserts="False" AllowAutomaticUpdates="False" AllowPaging="False" AllowSorting="False"
                        AutoGenerateColumns="False" OnNeedDataSource="RadGrid1_NeedDataSource" OnItemCommand="RadGrid1_ItemCommand">
                        <MasterTableView Width="100%" CommandItemDisplay="TopAndBottom" DataKeyNames="DataValue"
                            HorizontalAlign="NotSet" AutoGenerateColumns="False" EditMode="InPlace">
                            <CommandItemSettings AddNewRecordText="" RefreshText="" />
                            <Columns>
                                <telerik:GridEditCommandColumn ButtonType="ImageButton" UniqueName="EditCommandColumn">
                                </telerik:GridEditCommandColumn>
                                <telerik:GridBoundColumn DataField="DataValue" HeaderText="Data Value" 
                                    UniqueName="DataValue" ColumnEditorID="GridTextBoxColumnEditor1">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="DisplayValue" HeaderText="Display Value"
                                    UniqueName="DisplayValue" ColumnEditorID="GridTextBoxColumnEditor2">
                                </telerik:GridBoundColumn>
                                <telerik:GridButtonColumn ConfirmText="Delete this value?" ConfirmDialogType="Classic"
                                    ConfirmTitle="Delete" ButtonType="ImageButton" CommandName="Delete" Text="Delete"
                                    UniqueName="DeleteColumn">
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridButtonColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
                    <telerik:GridTextBoxColumnEditor ID="GridTextBoxColumnEditor1" runat="server" TextBoxStyle-Width="150px" />
                    <telerik:GridTextBoxColumnEditor ID="GridTextBoxColumnEditor2" runat="server" TextBoxStyle-Width="150px" />
            </div>
       </div>
    </div>
    <div id="PropertyStringTextBoxModeDiv" runat="server">
        <div class="AutoWidth PanelField Left">
            <div class="PanelFieldValue">
                <asiweb:StyledRadioButton ID="RadioButtonSingleLineTextbox" GroupName="SingleOrMultiLine" Checked="true"  
                    AutoPostBack="false" RenderPanelField="false" DisplayCaption="false" runat="server" />
            </div>
            <div class="PanelFieldLabel">
                <asiweb:StyledLabel runat="server" ID="LabelSingleLineTextbox" AssociatedControlID="RadioButtonSingleLineTextbox" />&nbsp;&nbsp;
            </div>
            <div class="PanelFieldValue">
                <asiweb:StyledRadioButton ID="RadioButtonMultiLineTextbox" GroupName="SingleOrMultiLine" Checked="false" 
                    AutoPostBack="false" RenderPanelField="false" DisplayCaption="false" runat="server" />
            </div>
            <div class="PanelFieldLabel">
                <asiweb:StyledLabel runat="server" ID="LabelMultiLineTextbox" AssociatedControlID="RadioButtonMultiLineTextbox" />
            </div>
        </div>
    </div>
    <div id="PropertyBinaryFileUploadModeDiv" runat="server">
        <div class="PanelField Left">
            <div>
                <asiweb:StyledLabel runat="server" ID="AllowedFileTypesLabel" AssociatedControlID="TextBoxAllowedFileTypes"></asiweb:StyledLabel>
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="TextBoxAllowedFileTypes"></asiweb:BusinessTextBox>
            </div>
        </div>        
    </div>

</asiweb:PanelTemplateControl2>
</asp:Content>