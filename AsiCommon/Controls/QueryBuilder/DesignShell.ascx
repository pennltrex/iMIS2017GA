<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.QueryBuilder.DesignShell" Codebehind="DesignShell.ascx.cs" %>

<script type="text/javascript">
    function BSABrowserSaverCallback(radWindow) {    
        if (!radWindow.result)
            return;
        var folderHierarchyKey = document.getElementById('FolderHierarchyKey');
        var saveAsFileName = document.getElementById('SaveAsFilename');
        folderHierarchyKey.value = radWindow.result;
        saveAsFileName.value = radWindow.Filename;
        submitForm(folderHierarchyKey);
        var oWindow = GetRadWindow();    
        var browserWin = oWindow.BrowserWindow;  
        if (oWindow != null && oWindow.BrowserWindow != null && oWindow.BrowserWindow.objectBrowserClass != null) {
            oWindow.BrowserWindow.objectBrowserClass.refreshRequested = true;
        }
        else if (oWindow != null) {
            var fn = new browserWin.Function("sender","args", "function f(){RefreshRadWindowParent();}"); 
            oWindow.add_close(fn);
        } 
    }
    
    function SaveButtonRefresh() {                                   
        var oWindow = GetRadWindow();
        var browserWin = oWindow.BrowserWindow; 
                   
        if (oWindow != null && oWindow.BrowserWindow != null && oWindow.BrowserWindow.objectBrowserClass != null) {
            oWindow.BrowserWindow.objectBrowserClass.refreshRequested = true;
        }
        else if (oWindow != null) {
            var fn = new browserWin.Function("sender","args", "function f(){RefreshRadWindowParent();}"); 
            oWindow.add_close(fn);
        }    
    }
</script>

<div style="padding-top:.7em;" class="Section">
    <div class="FloatLeft">
        <span class="PanelTitle"><asp:label id="TitleLabel" runat="server"></asp:label></span>
    </div>
    <div class="FloatRight">
        <asiweb:BusinessDropDownList ID="EditMode" runat="server" AutoPostBack="true" onselectedindexchanged="ModeDropDownList_SelectedIndexChanged" RenderPanelField="false" DisplayCaption="false"/>
        <asiweb:StyledButton runat="server" ID="SaveAsButton" />
        <asiweb:StyledButton runat="server" ID="SaveButton" OnClick="SaveButtonServerClick" CssClass="PrimaryButton" />
        <asiweb:StyledButton runat="server" ID="CloseButton" OnClick="CloseButtonServerClick" CausesValidation="false" />
    </div>
</div>
<input type="hidden" id="FolderHierarchyKey" runat="server" onserverchange="SaveAs" name="FolderHierarchyKey" ClientIDMode="Static" />
<input type="hidden" id="SaveAsFilename" runat="server" name="SaveAsFileName" ClientIDMode="Static" />
<telerik:RadTabStrip runat="server" ID="RadTabStrip" Orientation="HorizontalTop" SelectedIndex="0"  
    AutoPostBack="true" OnTabClick="RadTabStripTabClick">
    <Tabs>
        <telerik:RadTab Text="Define" PageViewID="DefinePage" Enabled="true" />
        <telerik:RadTab Text="Run" PageViewID="ExecutePage" Enabled="false" />
        <telerik:RadTab Text="Report" PageViewID="ReportPage" Enabled="false" />
        <telerik:RadTab Text="Group" PageViewID="GroupPage" Enabled="false" />
        <telerik:RadTab Text="Security" PageViewID="SecurityPage" Enabled="false" />
    </Tabs>
</telerik:RadTabStrip>                         
<div class="StandardPanel ContentTabbedDisplay" style="padding:1em;border-width:1px;border-style:solid;">
    <asp:placeholder id="ChildControlsPlaceHolder" runat="server"></asp:placeholder>  
</div>   
