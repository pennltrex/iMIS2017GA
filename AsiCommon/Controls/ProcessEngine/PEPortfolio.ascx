<%@ Control Language="c#" AutoEventWireup="True" Inherits="Asi.Web.UI.Common.ProcessEngine.PEPortfolioControl" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="PEPortfolio.ascx.cs" %>
<%@ Register TagPrefix="uc1" TagName="PEController" Src="PEController.ascx" %>

<script language="javascript" type="text/javascript">
	<asp:PlaceHolder id="JavaScriptPlaceholder" runat="server"></asp:PlaceHolder>
	<asp:Literal id="JavascriptLiteral1" runat="server" />

    var urlParams = '';

    function BSABrowserSaver()
    {
        OpenObjectSaver(urlParams, BSABrowserSaverCallback);
    }
    
    function BSABrowserSaverCallback(BSABrowserWindow)
    {
        if (!BSABrowserWindow.result)
            return;
		// The SaveAsFilename is now being set in the btnSave_Click method
		$get(FolderHierarchyKeyID).value = BSABrowserWindow.result;
		$get(SaveAsFilenameID).value = BSABrowserWindow.Filename;
		submitForm($get(FolderHierarchyKeyID));
        var oWindow = GetRadWindow();
        if (oWindow != null && oWindow.BrowserWindow != null && oWindow.BrowserWindow.objectBrowserClass != null) 
        {
            oWindow.BrowserWindow.objectBrowserClass.refreshRequested = true;
        }          
    }
    function SaveButtonRefresh()
    {
        var oWindow = GetRadWindow();
        var browserWin = oWindow.BrowserWindow;  
        if (oWindow != null && oWindow.BrowserWindow != null && oWindow.BrowserWindow.objectBrowserClass != null)        
        {
            oWindow.BrowserWindow.objectBrowserClass.refreshRequested = true;
        }   
        else if (oWindow != null)
        {
            var fn = new browserWin.Function("sender","args", "function f(){RefreshRadWindowParent();}"); 
            oWindow.add_close(fn);  
        }
   }
    function BSABrowserSaverAndClose()
    {
        OpenObjectSaver(urlParams, BSABrowserSaverAndCloseCallback);
    }
   
    function RefreshParentList()
    {
        var oWindow = GetRadWindow();
        if (oWindow != null && oWindow.BrowserWindow != null && oWindow.BrowserWindow.objectBrowserClass != null)        
        {
            oWindow.BrowserWindow.objectBrowserClass.refreshRequested = true;
        }   
    }
   
    function BSABrowserSaverAndCloseCallback(BSABrowserWindow)
    {
        BSABrowserSaverCallback(BSABrowserWindow, BSABrowserWindow.result);
        var oWindow = GetRadWindow();
        if (oWindow != null && oWindow.BrowserWindow != null && oWindow.BrowserWindow.objectBrowserClass != null)        
        {
            oWindow.BrowserWindow.objectBrowserClass.refreshRequested = true;
        }  
        oWindow.Close(null);  
    }
    
    function RefreshParentRadWindow()
    {
        var oWindow = GetRadWindow();
        if (oWindow != null && oWindow.BrowserWindow != null)
        {
            var url = oWindow.BrowserWindow.location.href;
            oWindow.BrowserWindow.location.href = url;
        }
    }
</script>
 
<input type="hidden" id="FolderHierarchyKey" runat="server" onserverchange="SaveAs" name="FolderHierarchyKey" />
<input type="hidden" id="SaveAsFilename" runat="server" name="SaveAsFileName" />

<div class="AddPadding ClearFix">
    <div class="FloatLeft">
        <asp:Label ID="TitleLabel" runat="server" CssClass="PanelTitle"></asp:Label>
    </div>
    <div class="FloatRight">
        <asiweb:StyledButton runat="server" ID="btnSaveAs" />
        <asiweb:StyledButton runat="server" ID="btnSave" CommandButtonType="Save" OnClick="btnSave_Click" CssClass="PrimaryButton" />
        <asiweb:StyledButton runat="server" ID="btnCancel" CommandButtonType="Cancel" OnClick="btnCancel_Click" />
    </div>
</div>
<telerik:RadTabStrip runat="server" ID="RadTabStrip1" Orientation="HorizontalTop"
    SelectedIndex="0" ShowBaseLine="true" AutoPostBack="true">
    <Tabs>
        <telerik:RadTab Text="Define" PageViewID="tabDefine" Enabled="true" />
        <telerik:RadTab Text="Run" PageViewID="tabRun" Enabled="true" />
        <telerik:RadTab Text="Security" PageViewID="tabSecurity" Enabled="true" />
    </Tabs>
</telerik:RadTabStrip>

<asp:PlaceHolder ID="ErrorMsgPlaceHolder" runat="server"></asp:PlaceHolder>
<asp:PlaceHolder ID="Message" runat="server"></asp:PlaceHolder>
<div id="content" class="ContentTabbedDisplay AddPadding">
    <uc1:PEController ID="PEController1" runat="server"></uc1:PEController>
</div>
