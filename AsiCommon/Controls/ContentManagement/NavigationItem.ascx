<%@ Control Language="C#" AutoEventWireup="True" Inherits="AsiCommon_Controls_ContentManagement_NavigationItem" Codebehind="NavigationItem.ascx.cs" %>
<%@ Register TagPrefix="cm" TagName="NavigationItemStatus" Src="~/AsiCommon/Controls/ContentManagement/NavigationItemStatus.ascx" %>
<%@ Register TagPrefix="cm" TagName="NavigationItemProperties" Src="~/AsiCommon/Controls/ContentManagement/NavigationItemProperties.ascx" %>
<%@ Register TagPrefix="cm" TagName="NavigationItemParameters" Src="~/AsiCommon/Controls/ContentManagement/NavigationItemParameters.ascx" %>
<%@ Register TagPrefix="cm" TagName="NavigationItemWorkflow" Src="~/AsiCommon/Controls/ContentManagement/NavigationItemWorkflow.ascx" %>
<%@ Register TagPrefix="cm" TagName="NavigationItemOptions" Src="~/AsiCommon/Controls/ContentManagement/NavigationItemOptions.ascx" %>
<%@ Register TagPrefix="asi" TagName="AccessSettings" Src="~/AsiCommon/Controls/Shared/SecurityAdmin/AccessSettings.ascx" %>

<asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" TemplateTitle="" DistinguishHeader="False" Collapsible="False" Collapsed="false" BorderStyle="none">
 
    <asiweb:PanelTemplateControl2 ID="StatusPanel" runat="server" Collapsed="true" FieldSet="true" BorderStyle="none">
        <cm:NavigationItemStatus runat="server" ID="StatusControl" UseParentAtomObject="true" />
    </asiweb:PanelTemplateControl2>

    <div class="AutoWidth FloatRight">
        <asiweb:SmartControl ID="BreakControl" runat="server" BoundPropertyName="IsBreak"
            DisplayType="EditableField" DisplayCaption="true" PositionCaption="Right" 
            OnDataChange="BreakControl_DataChange" AutoPostBack="true" style="width:auto" />
    </div>

    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
        MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="false" CausesValidation="False">
        <Tabs>
            <telerik:RadTab Text="Properties" PageViewID="PropertiesPage" Selected="true"/>
            <telerik:RadTab Text="Content parameters" PageViewID="ContentParametersPage" />
            <telerik:RadTab Text="Workflow management" PageViewID="WorkflowManagementPage" />
            <telerik:RadTab Text="Options" PageViewID="OptionsPage" />
            <telerik:RadTab Text="Access settings" PageViewID="AccessSettingsPage" />
        </Tabs>
    </telerik:RadTabStrip> 

    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0"
        CssClass="ContentTabbedDisplay" Style="overflow:auto;" >
    
        <telerik:RadPageView runat="server" ID="PropertiesPage">
            <asiweb:PanelTemplateControl2 ID="PropertiesPanel" runat="server" FieldSet="true" Collapsible="false" BorderStyle="none" ShowTitle="false" ShowHeader="false">
                <cm:NavigationItemProperties runat="server" ID="PropertiesControl" UseParentAtomObject="true" />
            </asiweb:PanelTemplateControl2>
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="ContentParametersPage">
            <asiweb:PanelTemplateControl2 ID="ParameterPanel" runat="server" FieldSet="true" Collapsible="false" BorderStyle="none" ShowTitle="false" ShowHeader="false">
                <cm:NavigationItemParameters runat="server" ID="ParametersControl" UseParentAtomObject="true" />
            </asiweb:PanelTemplateControl2>
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="WorkflowManagementPage">
            <asiweb:PanelTemplateControl2 ID="WorkflowPanel" runat="server" FieldSet="true" Collapsible="false" BorderStyle="none" ShowTitle="false" ShowHeader="false">
                <cm:NavigationItemWorkflow runat="server" ID="WorkflowControl" UseParentAtomObject="true" />
            </asiweb:PanelTemplateControl2>
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="OptionsPage">
            <asiweb:PanelTemplateControl2 ID="OptionsPanel" runat="server" FieldSet="true" Collapsible="false" BorderStyle="none" ShowTitle="false" ShowHeader="false">
                <cm:NavigationItemOptions runat="server" ID="OptionsControl" UseParentAtomObject="true" />
            </asiweb:PanelTemplateControl2>
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="AccessSettingsPage">
            <asi:AccessSettings runat="server" ID="AccessSettingsControl" ShowLegacyRoles="true" ShowMemberTypes="true" UseContentACL="true" Collapsible="false" ShowHeader="false" BorderStyle="none" CollapsePanelSetting="False" ShowTitle="False" ShowBorder="False" />   
        </telerik:RadPageView>

    </telerik:RadMultiPage>
</asiweb:PanelTemplateControl2>
