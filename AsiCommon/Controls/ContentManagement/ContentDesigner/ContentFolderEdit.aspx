<%@ Page Language="C#" Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_ContentFolderEdit" Codebehind="ContentFolderEdit.aspx.cs" %>
<%@ Register TagPrefix="cm" TagName="ContentFolderStatus" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentRecordStatus.ascx" %>
<%@ Register TagPrefix="cm" TagName="ContentFolderProperties" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentFolderProperties.ascx" %>
<%@ Register TagPrefix="cm" TagName="ContentFolderWorkflowManagement" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentFolderWorkflowManagement.ascx" %>
<%@ Register TagPrefix="cm" TagName="ContentFolderTagManagement" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentFolderTagManagement.ascx" %>
<%@ Register TagPrefix="asi" TagName="AccessSettings" Src="~/AsiCommon/Controls/Shared/SecurityAdmin/AccessSettings.ascx" %>

<script language="C#" runat="server">
    protected override void EnsureChildUserControls()
    {
        base.EnsureChildUserControls();
        
        AddChildUserControl(PropertiesControl);
        AddChildUserControl(WFControl);
        AddChildUserControl(TagManagementControl);
        AddChildUserControl(AccessSettingsControl);
    }
</script>

<asp:Content ID="MainContent" runat="server" ContentPlaceHolderID="TemplateBody">

    <asiweb:PanelTemplateControl ID="StatusPanel" runat="server" TemplateTitle="Status" Collapsed="true" FieldSet="true" BorderStyle="none">
        <cm:ContentFolderStatus runat="server" ID="StatusControl" UseParentAtomObject="true" />
    </asiweb:PanelTemplateControl>

    <telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
        MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="false" >
        <Tabs>
            <telerik:RadTab Text="Properties" PageViewID="PropertiesPage" />
            <telerik:RadTab Text="Workflow Management" PageViewID="WorkflowPage" />
            <telerik:RadTab Text="Current Tags" PageViewID="CurrentTagsPage" />
            <telerik:RadTab Text="Access Settings" PageViewID="AccessSettingsPage" />
        </Tabs>
    </telerik:RadTabStrip> 

    <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0"
        CssClass="ContentTabbedDisplay" Style="margin-top:-1px" >
    
        <telerik:RadPageView runat="server" ID="PropertiesPage">
            <asiweb:PanelTemplateControl ID="PropertiesPanel" runat="server" TemplateTitle="Properties" Collapsed="false" FieldSet="true" Collapsible="false" ShowHeader="false" BorderStyle="none">
                <cm:ContentFolderProperties runat="server" ID="PropertiesControl" UseParentAtomObject="true" />    
            </asiweb:PanelTemplateControl>  
        </telerik:RadPageView>
    
        <telerik:RadPageView runat="server" ID="WorkflowPage">
            <asiweb:PanelTemplateControl ID="WFPanel" runat="server" TemplateTitle="Workflow Management" Collapsed="false" FieldSet="true" Collapsible="false" ShowHeader="false" BorderStyle="none">
                <cm:ContentFolderWorkflowManagement runat="server" ID="WFControl" UseParentAtomObject="true" />    
            </asiweb:PanelTemplateControl>  
        </telerik:RadPageView>
    
        <telerik:RadPageView runat="server" ID="CurrentTagsPage">
            <asiweb:PanelTemplateControl ID="CurrentTagsPanel" runat="server" TemplateTitle="Current Tags" Collapsed="false" FieldSet="true" Collapsible="false" ShowHeader="false" BorderStyle="none">
                <cm:ContentFolderTagManagement runat="server" ID="TagManagementControl" UseParentAtomObject="true" />    
            </asiweb:PanelTemplateControl>  
        </telerik:RadPageView>
    
        <telerik:RadPageView runat="server" ID="AccessSettingsPage">
            <asi:AccessSettings ID="AccessSettingsControl" runat="server" UseContentACL="true" Collapsible="false" ShowHeader="false" BorderStyle="none" CollapsePanelSetting="False" ShowTitle="False" ShowBorder="False"/>
        </telerik:RadPageView>
 
    </telerik:RadMultiPage>

</asp:Content>

