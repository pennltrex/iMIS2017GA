<%@ Page Language="C#" Inherits="AsiCommon_Controls_ContentManagement_ContentDesigner_ContentRecordEdit" MasterPageFile="~/Templates/MasterPages/empty.master" Codebehind="ContentRecordEdit.aspx.cs" %>
<%@ Register TagPrefix="asi" TagName="UserMessageDisplay" Src="~/AsiCommon/Controls/ContentManagement/UserMessageDisplay.ascx" %>
<%@ Register TagPrefix="cm" TagName="ContentRecordStatus" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentRecordStatus.ascx" %>
<%@ Register TagPrefix="cm" TagName="WebPartLayout" Src="~/AsiCommon/Controls/ContentManagement/WebPartLayout.ascx" %>
<%@ Register TagPrefix="cm" TagName="ContentRecordProperties" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentRecordProperties.ascx" %>
<%@ Register TagPrefix="cm" TagName="ContentRecordWorkflowManagement" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentRecordWorkflowManagement.ascx" %>
<%@ Register TagPrefix="cm" TagName="ContentRecordTagManagement" Src="~/AsiCommon/Controls/ContentManagement/ContentDesigner/ContentRecordTagManagement.ascx" %>
<%@ Register TagPrefix="asi" TagName="AccessSettings" Src="~/AsiCommon/Controls/Shared/SecurityAdmin/AccessSettings.ascx" %>

<script runat="server" language="C#">
    /// <summary>
    /// 
    /// </summary>
    /// <param name="methodName"></param>
    /// <returns></returns>
    [System.Web.Services.WebMethod]
    static public string ContentRecordEditPageMethod(string methodName, string arg1, string arg2, Guid pageInstanceKey)
    {
        Guid contentRecordKey = new Guid(arg1);

        Asi.Business.BusinessContainer container = HttpContext.Current.Cache["PageBusinessContainer_" + pageInstanceKey.ToString()] as Asi.Business.BusinessContainer;
        Asi.Business.ContentManagement.Content contentRecord = Asi.Business.ContentManagement.Content.GetFromContentKey(contentRecordKey, container, false, false);
        if (contentRecord == null)
            return string.Empty;

        string result = string.Empty;
        switch (methodName)
        {
            case "GetExpireDateRO":
                result = contentRecord.GetExpireDateRO(int.Parse(arg2));
                break;
        }
        return result;
    }
</script>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <script type="text/javascript">
        //<![CDATA[
        PageMethods.set_path('<%= Request.FilePath %>');
        
        <asp:PlaceHolder id="JavaScriptPlaceholder" runat="server"></asp:PlaceHolder>
        function LaunchSaveAs() {
            // 'Shared Content' folder hierarchy key - "D5B2E6A6-7824-43C6-ADC9-DA33AD106E97"
            OpenContentForSaveAs( "D5B2E6A6-7824-43C6-ADC9-DA33AD106E97", '<%= AtomObject[0].Name %>', ContentBrowserSaverCallback); 
            return false;
        }
        function ContentBrowserSaverCallback(radWindow)
        {    
            if (!radWindow.result)
                return;
            document.getElementById(FolderHierarchyKeyID).value = radWindow.result;
            document.getElementById(SaveAsFilenameID).value = radWindow.Filename;
            submitForm(document.getElementById(FolderHierarchyKeyID));
            var oWindow = GetRadWindow();    
            
            if (oWindow != null && oWindow.BrowserWindow != null && oWindow.BrowserWindow.objectBrowserClass != null)        
            {
                oWindow.BrowserWindow.objectBrowserClass.refreshRequested = true;
            }
            else if (oWindow != null && oWindow.BrowserWindow != null)
            {
                var browserWin = oWindow.BrowserWindow;  
                var fn = new browserWin.Function("sender","args", "function f(){RefreshRadWindowParent();}"); 
                oWindow.add_close(fn);
            }
   
        }
        //]]>
    </script>
    
    <input type="hidden" id="FolderHierarchyKey" runat="server" name="FolderHierarchyKey" />
    <input type="hidden" id="SaveAsFilename" runat="server" name="SaveAsFileName" onserverchange="SaveAs" />
    <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" TemplateTitle="" DistinguishHeader="False" Collapsible="False" Collapsed="false" BorderStyle="none" CssClass="TemplateManagerArea">
        <asp:ValidationSummary runat="server" ID="ContentEditValidationSummary" DisplayMode="BulletList" Visible="True" EnableClientScript="True" EnableViewState="True" Enabled="True" ShowSummary="True" ViewStateMode="Enabled" HeaderText="" />
    
        <asiweb:PanelTemplateControl2 ID="StatusPanel" runat="server" TemplateTitle="Status" Collapsed="true" FieldSet="true" BorderStyle="none">
            <cm:ContentRecordStatus runat="server" ID="StatusControl" UseParentAtomObject="true" />       
        </asiweb:PanelTemplateControl2>      
  
        <asi:UserMessageDisplay ID="UserMessageDisplayControl" runat="server" />
        <div style="height:5px;display:block;"></div>
        <telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop" SelectedIndex="0" 
            MultiPageID="RadMultiPage1" ShowBaseLine="true" AutoPostBack="false" CausesValidation="false" >
            <Tabs>
                <telerik:RadTab Text="Definition" PageViewID="DefinitionPage" />
                <telerik:RadTab Text="Properties" PageViewID="PropertiesPage" />
                <telerik:RadTab Text="Workflow management" PageViewID="WorkflowPage" />
                <telerik:RadTab Text="Current tags" PageViewID="CurrentTagsPage" />
                <telerik:RadTab Text="Access settings" PageViewID="AccessSettingsPage" />
            </Tabs>
        </telerik:RadTabStrip>   
        <asp:UpdatePanel ID="ContentUpdatePanel" runat="server" UpdateMode="Conditional">
        
            <ContentTemplate>
                       
                <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0"
                    CssClass="ContentTabbedDisplay AddPadding" >
            
                    <telerik:RadPageView runat="server" ID="DefinitionPage">
                        <asiweb:PanelTemplateControl2 ID="WebPartPanel" runat="server" Collapsed="false" FieldSet="true" Collapsible="false" ShowHeader="false" BorderStyle="none">
                            <cm:WebPartLayout runat="server" ID="WebPartControl" UseParentAtomObject="true" UseKeyFromURL="false" />      
                        </asiweb:PanelTemplateControl2>
                    </telerik:RadPageView>

                    <telerik:RadPageView runat="server" ID="PropertiesPage">
                        <asiweb:PanelTemplateControl2 ID="PropertiesPanel" runat="server" Collapsed="false" FieldSet="true" Collapsible="false" ShowHeader="false" BorderStyle="none">
                            <cm:ContentRecordProperties runat="server" ID="PropertiesControl" UseParentAtomObject="true" />    
                        </asiweb:PanelTemplateControl2>   
                    </telerik:RadPageView>
                       
                    <telerik:RadPageView runat="server" ID="WorkflowPage">
                        <asiweb:PanelTemplateControl2 ID="WFPanel" runat="server" Collapsed="false" FieldSet="true" Collapsible="false" ShowHeader="false" BorderStyle="none">
                            <cm:ContentRecordWorkflowManagement runat="server" ID="WFControl" UseParentAtomObject="true" />    
                        </asiweb:PanelTemplateControl2>      
                    </telerik:RadPageView>
            
                    <telerik:RadPageView runat="server" ID="CurrentTagsPage">
                        <asiweb:PanelTemplateControl2 ID="CurrentTagsPanel" runat="server" Collapsed="false" FieldSet="true" Collapsible="false" ShowHeader="false" BorderStyle="none">
                            <asiweb:StyledLabel runat="server" ID="CurrentTagsDisableMessage" Text="Changes to this tab may be performed after 'Save As' completed" Visible='<%# !NeedSaveAndSaveClose %>'/>
                            <cm:ContentRecordTagManagement runat="server" ID="TagManagementControl" UseParentAtomObject="true" />    
                        </asiweb:PanelTemplateControl2> 
                    </telerik:RadPageView>
            
                    <telerik:RadPageView runat="server" ID="AccessSettingsPage">
                        <div class="PanelBody">
                            <asiweb:StyledLabel runat="server" ID="AcessSettingDisabledMessage" Text="Changes to this tab may be performed after 'Save As' completed" 
                                Visible='<%# !NeedSaveAndSaveClose %>' CssClass="AddPadding"/>
                        </div>
                        <asi:AccessSettings runat="server" ID="AccessSettingsControl" ShowMemberTypes="true" UseContentACL="true" Collapsible="false" ShowHeader="false" BorderStyle="none" CollapsePanelSetting="False" ShowTitle="False" ShowBorder="False" />
                    </telerik:RadPageView>
                 
                </telerik:RadMultiPage>

            </ContentTemplate>

        </asp:UpdatePanel>
        
    </asiweb:PanelTemplateControl2> 
   
</asp:Content>