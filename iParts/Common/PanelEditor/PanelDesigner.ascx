<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="PanelDesigner.ascx.cs" Inherits="Asi.Web.iParts.Common.PanelEditor.PanelDesigner" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="Asi.Soa.Core.DataContracts" %>
<%@ Import Namespace="Asi.Web.iParts.Common.PanelEditor" %>
<%@ Register Assembly="Telerik.Web.UI" TagPrefix="telerik" Namespace="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" %>

<telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" Transparency="50" IsSticky="false"
    BackColor="LightGray" BackgroundPosition="Center" >
</telerik:RadAjaxLoadingPanel>
<telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel">
    <asiweb:PanelTemplateControl2 ID="designerPanel" runat="server" FieldSet="True" ShowHeader="False" BorderStyle="None">
        <asp:Label id="successMessage" runat="server" Visible="false" CssClass="Info" />
        <asp:Label id="errorMessage" runat="server" Visible="false" CssClass="Error" />
        <input type="hidden" id="HiddenPanelDefinition" runat="server" />
        <asp:Panel runat="server" ID="PanelDesignerPanel" class="StandardPanel" BorderStyle="None" translate="yes">
        <div class="PanelField Left">
            <div style="display: inline;">
                <asiweb:StyledLabel runat="server" ID="LabelPanelName" AssociatedControlID="TextBoxPanelName"></asiweb:StyledLabel>
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="TextBoxPanelName" CssClass="InputLarge"></asiweb:BusinessTextBox>
                <asp:RequiredFieldValidator runat="server" ID="ValidatorPanelName" ControlToValidate="TextBoxPanelName" CssClass="Important">
                </asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="PanelField Left">
            <div style="display: inline;">
                <asiweb:StyledLabel runat="server" ID="LabelPanelDescription" AssociatedControlID="TextBoxPanelDescription"></asiweb:StyledLabel>
            </div>
            <div class="PanelFieldValue">
                <asiweb:BusinessTextBox runat="server" ID="TextBoxPanelDescription" CssClass="InputXLarge"></asiweb:BusinessTextBox>
            </div>
        </div>
        <div class="AutoWidth">
            <asiweb:StyledRadioButton ID="RadioButtonShowSingle" GroupName="SingleOrMulti" Checked="true"  
                PositionCaption="Right" AutoPostBack="false" RenderPanelField="true" DisplayCaption="true" runat="server" />
        </div>
        <div class="AutoWidth">
            <asiweb:StyledRadioButton ID="RadioButtonShowMultiple" GroupName="SingleOrMulti" Checked="false" 
                PositionCaption="Right" AutoPostBack="false" RenderPanelField="true" DisplayCaption="true" runat="server" />
        </div>   
        <div class="AutoWidth" style="display:none;" id="ColumnActionButtons">
            <div style="float:left;">
                <asiweb:StyledLabel runat="server" ID="LabelTreeView" AssociatedControlID="TreeTables" RenderPanelField="true"></asiweb:StyledLabel>
            </div> 
            <div style="float:right;padding-right:15px;">
                <asp:ImageButton runat="server" ID="ButtonColumnsPlus" ImageUrl="~/images/buttons/plus.png" OnClientClick="panelDesignerInstance.AddColumn(); return false;" />
                <asp:ImageButton runat="server" ID="ButtonColumnsPlusGray" ImageUrl="~/images/buttons/plusgray.png" OnClientClick="return false;" />     
                <asp:ImageButton runat="server" ID="ButtonColumnsMinus" ImageUrl="~/images/buttons/minus.png" OnClientClick="panelDesignerInstance.RemoveColumn(); return false;" />
                <asp:ImageButton runat="server" ID="ButtonColumnsMinusGray" ImageUrl="~/images/buttons/minusgray.png" OnClientClick="return false;" />
            </div>         
        </div> 
        <div style="clear: both;"></div>                    
        <div translate="no" id="ParentDiv">                        
            <telerik:RadSplitter ID="RadSplitterMain" runat="server" RenderMode="Lightweight"
            Width="100%" ResizeWithBrowserWindow="true" VisibleDuringInit="false"
            OnClientLoaded="SplitterLoaded" OnClientResized="SplitterResize">
            
                <telerik:RadPane ID="RadPaneTree" runat="server" MinWidth="100" Width="200" MaxWidth="400" ShowContentDuringLoad="false"
                    ResizeWithBrowserWindow="True" VisibleDuringInit="False"
                    PersistScrollPosition="True" RenderMode="Lightweight">       
        
                    <telerik:RadTreeView ID="TreeTables" runat="server" EnableDragAndDropBetweenNodes="false" EnableDragAndDrop="true" 
                        MultipleSelect="true" BorderStyle="None" translate="no">
                        <ContextMenus>
                            <telerik:RadTreeViewContextMenu runat="server" ID="SourceMenuExistingItem" ClickToOpen="True">
                                <Items>
                                    <telerik:RadMenuItem Text="" Value="editSource" Enabled="false"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="" Value="deleteSource"></telerik:RadMenuItem>
                                </Items>
                            </telerik:RadTreeViewContextMenu>
                            <telerik:RadTreeViewContextMenu runat="server" ID="SourceMenuNewItem" ClickToOpen="True">
                                <Items>
                                    <telerik:RadMenuItem Text="" Value="editSource"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="" Value="deleteSource"></telerik:RadMenuItem>
                                </Items>
                            </telerik:RadTreeViewContextMenu>
                            <telerik:RadTreeViewContextMenu runat="server" ID="PropertiesMenuExistingItem" ClickToOpen="True">
                                <Items>
                                    <telerik:RadMenuItem Text="" Value="editExistingProperty"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="" Value="deleteProperty"></telerik:RadMenuItem>
                                </Items>
                            </telerik:RadTreeViewContextMenu>
                            <telerik:RadTreeViewContextMenu runat="server" ID="PropertiesMenuNewItem" ClickToOpen="True">
                                <Items>
                                    <telerik:RadMenuItem Text="" Value="editNewProperty"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="" Value="deleteProperty"></telerik:RadMenuItem>
                                </Items>
                            </telerik:RadTreeViewContextMenu>
                            <telerik:RadTreeViewContextMenu runat="server" ID="DisabledMenu" ClickToOpen="True">
                                <Items>
                                    <telerik:RadMenuItem Text="" Value="editDisable" Enabled="false"></telerik:RadMenuItem>
                                    <telerik:RadMenuItem Text="" Value="deleteDisable" Enabled="false"></telerik:RadMenuItem>
                                </Items>
                            </telerik:RadTreeViewContextMenu>
                            <telerik:RadTreeViewContextMenu runat="server" ID="EmptyMenu" Enabled="false">
                            </telerik:RadTreeViewContextMenu>
                        </ContextMenus>
                    </telerik:RadTreeView>
                      
                </telerik:RadPane>

                <telerik:RadSplitBar ID="RadSplitterBar" runat="server" CollapseMode="Both" /> 
                         
                <telerik:RadPane ID="RadPaneContent" runat="server" ShowContentDuringLoad="false"
                    ResizeWithBrowserWindow="true" VisibleDuringInit="false"
                    PersistScrollPosition="true" RenderMode="Lightweight" Scrolling="Both">
                               
                    <telerik:RadGrid ID="GridLayout" runat="server" OnNeedDataSource="GridLayoutNeedDataSource" AutoGenerateColumns="false" 
                        ShowHeader="false" OnItemCreated="GridLayoutItemCreated">
                        <MasterTableView TableLayout="Auto">
                            <Columns>
                                <telerik:GridTemplateColumn ItemStyle-Height="100%" ItemStyle-Width="33%" 
                                ItemStyle-BorderColor="LightGray" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px" >
                                    <ItemTemplate>
                                        <div id="ColumnContent0" onmousedown="panelDesignerInstance.CellMouseDown(this, event)" runat="server" 
                                            style="width:100%; height:100%; display:none">
                                            <table style="width:100%">
                                                <tr>
                                                    <td style="border-style:none;">
                                                        <asiweb:StyledLabel ID="ColumnTableField0"  runat="server"></asiweb:StyledLabel>
                                                        <asp:HiddenField ID="ColumnHidden0" runat="server" />
                                                    </td>
                                                    <td style="text-align:right;border-style:none;">
                                                        <asp:ImageButton ID="ColumnDelete0" runat="server" ImageUrl="~/images/buttons/remove_cell.png" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <table style="width:100%">
                                                <tr>
                                                    <td style="border-style:none; width:10px">
                                                        <asiweb:StyledLabel ID="ColumnLabelLabel0" runat="server" Text="Label" translate="yes"></asiweb:StyledLabel>
                                                    </td>
                                                    <td style="border-style:none;">
                                                        <div id="ColumnLabelTextBoxDiv" style="max-width:200px" onmousedown="panelDesignerInstance.CellMouseDown(this, event)">
                                                            <asp:TextBox ID="ColumnLabelTextBox0" Width="100%" runat="server" />
                                                        </div>
                                                    </td>
                                                    <td style="border-style:none;" colspan="4"></td>
                                                </tr>
                                                <tr>
                                                    <td style="border-style:none;">
                                                        <asp:CheckBox ID="ColumnReadOnlyCheckbox0" runat="server" />
                                                    </td>
                                                    <td style="border-style:none;">
                                                        <asiweb:StyledLabel ID="ColumnReadOnlyLabel0" runat="server" Text="Read-only" translate="yes"></asiweb:StyledLabel>
                                                    </td>
                                                    <td style="border-style:none;"></td>  
                                                    <td style="border-style:none;">
                                                        <asiweb:StyledLabel ID="ColumnDisplayBooleanTypeLabel0" runat="server" Text="Display as" translate="yes"></asiweb:StyledLabel>
                                                    </td>
                                                    <td style="border-style:none;">
                                                        <asp:DropDownList ID="ColumnDisplayBooleanTypeList0" runat="server" />                                                       
                                                    </td>                                                
                                                    <td style="border-style:none;"></td>                                               
                                                </tr>
                                                <tr>
                                                    <td style="border-style:none;">
                                                        <asp:CheckBox ID="ColumnRequiredCheckbox0" runat="server" />
                                                    </td>
                                                    <td style="border-style:none;">
                                                        <asiweb:StyledLabel ID="ColumnRequiredLabel0" runat="server" Text="Required" translate="yes"></asiweb:StyledLabel>
                                                    </td>
                                                    <td style="border-style:none;"></td>                                                       
                                                </tr>
                                                <tr>
                                                    <td style="border-style:none;">
                                                        <asp:CheckBox ID="ColumnHideInNormalViewCheckbox0" runat="server" />
                                                    </td>
                                                    <td style="border-style:none;">
                                                        <asiweb:StyledLabel ID="ColumnHideInNormalViewLabel0" runat="server" Text="Hide in summary view" translate="yes"></asiweb:StyledLabel>
                                                    </td>
                                                    <td style="border-style:none;"></td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div id="EmptyColumnContent0" runat="server" style="display:block; height:95px">&nbsp;</div>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn ItemStyle-Height="100%" ItemStyle-Width="33%"
                                ItemStyle-BorderColor="LightGray" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                                    <ItemTemplate>
                                        <div id="ColumnContent1" onmousedown="panelDesignerInstance.CellMouseDown(this, event)" runat="server" 
                                            style="width:100%; height:100%; display:none">
                                            <table style="width:100%">
                                                <tr>
                                                    <td style="border-style:none;">
                                                        <asiweb:StyledLabel ID="ColumnTableField1" runat="server"></asiweb:StyledLabel>
                                                        <asp:HiddenField ID="ColumnHidden1" runat="server" />
                                                    </td>
                                                    <td style="text-align:right;border-style:none;">
                                                        <asp:ImageButton ID="ColumnDelete1" runat="server" ImageUrl="~/images/buttons/remove_cell.png" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <table style="width:100%">
                                                <tr>
                                                    <td style="border-style:none; width:10px">
                                                        <asiweb:StyledLabel ID="ColumnLabelLabel1" runat="server" Text="Label" translate="yes"></asiweb:StyledLabel>
                                                    </td>
                                                    <td style="border-style:none;">
                                                        <div id="ColumnLabelTextBoxDiv" style="max-width:200px" onmousedown="panelDesignerInstance.CellMouseDown(this, event)">
                                                            <asp:TextBox ID="ColumnLabelTextBox1" Width="100%" runat="server" />
                                                        </div>
                                                    </td>
                                                    <td style="border-style:none;" colspan="4"></td>
                                                </tr>
                                                <tr>
                                                    <td style="border-style:none;">
                                                        <asp:CheckBox ID="ColumnReadOnlyCheckbox1" runat="server" />
                                                    </td>
                                                    <td style="border-style:none;">
                                                        <asiweb:StyledLabel ID="ColumnReadOnlyLabel1" runat="server" Text="Read-only" translate="yes"></asiweb:StyledLabel>
                                                    </td>
                                                    <td style="border-style:none;"></td> 
                                                    <td style="border-style:none;">
                                                        <asiweb:StyledLabel ID="ColumnDisplayBooleanTypeLabel1" runat="server" Text="Display as" translate="yes"></asiweb:StyledLabel>
                                                    </td>    
                                                    <td style="border-style:none;">
                                                        <asp:DropDownList ID="ColumnDisplayBooleanTypeList1" runat="server" />
                                                    </td>                                                
                                                    <td style="border-style:none;"></td>                                             
                                                </tr>
                                                <tr>
                                                    <td style="border-style:none;">
                                                        <asp:CheckBox ID="ColumnRequiredCheckbox1" runat="server" />
                                                    </td>
                                                    <td style="border-style:none;">
                                                        <asiweb:StyledLabel ID="ColumnRequiredLabel1" runat="server" Text="Required" translate="yes"></asiweb:StyledLabel>
                                                    </td>
                                                    <td style="border-style:none;"></td>                                                    
                                                </tr>
                                                <tr>
                                                    <td style="border-style:none;">
                                                        <asp:CheckBox ID="ColumnHideInNormalViewCheckbox1" runat="server" />
                                                    </td>
                                                    <td style="border-style:none;">
                                                        <asiweb:StyledLabel ID="ColumnHideInNormalViewLabel1" runat="server" Text="Hide in summary view" translate="yes"></asiweb:StyledLabel>
                                                    </td>
                                                    <td style="border-style:none;"></td>
                                                </tr>                                            
                                            </table>
                                        </div>
                                        <div id="EmptyColumnContent1" runat="server" style="display:block">&nbsp;</div>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                                <telerik:GridTemplateColumn ItemStyle-Height="100%" ItemStyle-Width="33%"
                                ItemStyle-BorderColor="LightGray" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1px">
                                    <ItemTemplate>
                                        <div id="ColumnContent2" onmousedown="panelDesignerInstance.CellMouseDown(this, event)" runat="server" 
                                            style="width:100%; height:100%; display:none">
                                            <table style="width:100%">
                                                <tr>
                                                    <td style="border-style:none;">
                                                        <asiweb:StyledLabel ID="ColumnTableField2" runat="server"></asiweb:StyledLabel>
                                                        <asp:HiddenField ID="ColumnHidden2" runat="server" />
                                                    </td>
                                                    <td style="text-align:right;border-style:none;">
                                                        <asp:ImageButton ID="ColumnDelete2" runat="server" ImageUrl="~/images/buttons/remove_cell.png" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <table style="width:100%">
                                                <tr>
                                                    <td style="border-style:none; width:10px">
                                                        <asiweb:StyledLabel ID="ColumnLabelLabel2" runat="server" Text="Label" translate="yes"></asiweb:StyledLabel>
                                                    </td>
                                                    <td style="border-style:none;">
                                                        <div id="ColumnLabelTextBoxDiv" style="max-width:200px" onmousedown="panelDesignerInstance.CellMouseDown(this, event)">
                                                            <asp:TextBox ID="ColumnLabelTextBox2" Width="100%" runat="server" />
                                                        </div>
                                                    </td>
                                                    <td style="border-style:none;" colspan="4"></td>
                                                </tr>
                                                <tr>
                                                    <td style="border-style:none;">
                                                        <asp:CheckBox ID="ColumnReadOnlyCheckbox2" runat="server" />
                                                    </td>
                                                    <td style="border-style:none;">
                                                        <asiweb:StyledLabel ID="ColumnReadOnlyLabel2" runat="server" Text="Read-only" translate="yes"></asiweb:StyledLabel>
                                                    </td>
                                                    <td style="border-style:none;"></td> 
                                                    <td style="border-style:none;">
                                                        <asiweb:StyledLabel ID="ColumnDisplayBooleanTypeLabel2" runat="server" Text="Display as" translate="yes"></asiweb:StyledLabel>
                                                    </td>
                                                    <td style="border-style:none;">
                                                        <asp:DropDownList ID="ColumnDisplayBooleanTypeList2" runat="server" />
                                                    </td>                                                
                                                    <td style="border-style:none;"></td>                                              
                                                </tr>
                                                <tr>
                                                    <td style="border-style:none;">
                                                        <asp:CheckBox ID="ColumnRequiredCheckbox2" runat="server" />
                                                    </td>
                                                    <td style="border-style:none;">
                                                        <asiweb:StyledLabel ID="ColumnRequiredLabel2" runat="server" Text="Required" translate="yes"></asiweb:StyledLabel>
                                                    </td>
                                                    <td style="border-style:none;"></td>                                                    
                                                </tr>
                                                <tr>
                                                    <td style="border-style:none;">
                                                        <asp:CheckBox ID="ColumnHideInNormalViewCheckbox2" runat="server" />
                                                    </td>
                                                    <td style="border-style:none;">
                                                        <asiweb:StyledLabel ID="ColumnHideInNormalViewLabel2" runat="server" Text="Hide in summary view" translate="yes"></asiweb:StyledLabel>
                                                    </td>
                                                    <td style="border-style:none;"></td>
                                                </tr>                                           
                                            </table>
                                        </div>
                                        <div id="EmptyColumnContent2" runat="server" style="display:block">&nbsp;</div>
                                    </ItemTemplate>
                                </telerik:GridTemplateColumn>
                            </Columns>
                        </MasterTableView>
                    </telerik:RadGrid>
       
		        </telerik:RadPane>

	        </telerik:RadSplitter>                                         
        </div>   
        </asp:Panel>
    </asiweb:PanelTemplateControl2>
</telerik:RadAjaxPanel>

<script type="text/javascript">
    
    jQuery(window).load(function () {
        jQuery("#ColumnActionButtons").show();
    });

    var panelDesignerInstance = new PanelDesignerClass();
    panelDesignerInstance.GridLayoutId = "<%#GridLayout.ClientID%>";
    panelDesignerInstance.RadioButtonShowSingleId = "<%#RadioButtonShowSingle.ClientID%>";
    panelDesignerInstance.RadioButtonShowMultipleId = "<%#RadioButtonShowMultiple.ClientID%>";
    panelDesignerInstance.TreeTablesId = "<%#TreeTables.ClientID%>";
    panelDesignerInstance.HiddenPanelDefinitionId = "<%#HiddenPanelDefinition.ClientID%>";
    panelDesignerInstance.ButtonColumnsPlusId = "<%#ButtonColumnsPlus.ClientID%>";
    panelDesignerInstance.ButtonColumnsMinusId = "<%#ButtonColumnsMinus.ClientID%>";
    panelDesignerInstance.ButtonColumnsPlusGrayId = "<%#ButtonColumnsPlusGray.ClientID%>";
    panelDesignerInstance.ButtonColumnsMinusGrayId = "<%#ButtonColumnsMinusGray.ClientID%>";
    panelDesignerInstance.PropertyTypeStringValue = "<%#((int)BusinessObjectPropertyType.String).ToString(CultureInfo.InvariantCulture)%>";
    panelDesignerInstance.PropertyTypeDecimalValue = "<%#((int)BusinessObjectPropertyType.Decimal).ToString(CultureInfo.InvariantCulture)%>";

    function ShowLoadingPanel() {
        var nameField = document.getElementById("<%#TextBoxPanelName.ClientID%>");        
        if (nameField.value.length == 0) return;
        var currentLoadingPanel = $find("<%#LoadingPanel.ClientID%>");
        var currentUpdatedControlId = "<%#designerPanel.ClientID %>";
        currentLoadingPanel.show(currentUpdatedControlId);
    }

    function ValidateSources() {
        var valid = panelDesignerInstance.ValidateSources();
        if (!valid)
            return false;

        ShowLoadingPanel();
        return true;
    }

    function SplitterLoaded(splitter) {
        var reHeight = SetSplitterHeight();
        splitter.set_height(reHeight);
    }

    function SplitterResize(splitter) {
        var reHeight = SetSplitterHeight();
        splitter.set_height(reHeight);
    }

    function SetSplitterHeight() {
        var windowHeight = 0;
        if (jQuery(window).height() != null) {          
            windowHeight = jQuery(window).height();            
        }
        return windowHeight;
    }
</script>

