<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PanelEditorDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.PanelEditor.PanelEditorDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register tagPrefix="Panel" tagName="Editor" src="PanelEdit.ascx" %>

<telerik:RadAjaxLoadingPanel data-ajax-loading-panel="main" ID="radAjaxLoadingPanel1" runat="server" SkinID="AjaxLoadingPanel" /> 
<telerik:RadAjaxPanel ID="radAjaxPanel1" runat="server" LoadingPanelID="radAjaxLoadingPanel1" EnableAJAX="true" ClientEvents-OnResponseEnd="responseEnd" >
    <asp:Button runat="server" id="refreshTrigger" OnClick="RefreshTriggerClick" style="display: none;" Text="text"></asp:Button>
    <asp:Button runat="server" id="EditPanelTrigger" OnClick="EditPanelTriggerClick" style="display: none;" Text="text"></asp:Button>     
    <asp:Panel ID="readOnlyPanel" runat="server" translate="yes">       
        <asp:Panel id="singleInstancePanel" runat="server" CssClass="FullWidth"></asp:Panel>
        <asp:Panel id="multipleInstancePanel" runat="server">
            <asiweb:Lister2 id="multipleInstanceList" runat="server"
                AjaxEnabled="false"
                SortingEnabled="true"
                PagingEnabled="true"
                PagerMode="NextPrevAndNumeric"
                PageSize="20"
                ColumnReorderingEnabled="false"
                EnableClientSideDelete="false"
                GridIconColumnCssClass="grid-icon-column"
                EditColumnLocation="None"
                SelectColumnLocation="End"
                SelectColumnText="Edit"
                SelectColumnImageUrl="~/AsiCommon/Images/icon_edit.png"
                SelectColumnButtonType="Image"
                DeleteColumnLocation="End"
                DeleteColumnText="Delete" 
                DeleteColumnImageUrl="~/AsiCommon/Images/icon_delete.png"
                DeleteColumnButtonType="Image"                              
                AddButtonEnabled="false"                                    
                TargetUrl="seeCodeBehind"
                AddLinkTargetBehavior="NewWindowAllShare"
                DataSourceIsRealDataSource="true"
                UseUniformKey="false"
                TargetCloseWindowOnCommit="false"
                AllowRowSelecting="false"
                AllowGridRowSelectStyle="false"
                EnableBreakWord="true"                 
            />            
	        <script type="text/javascript">
        	    //<![CDATA[
        	    function _<%#PanelDefinitionId.Replace("-","") %>_DownloadFileClick(inputNumber) {
        	        jQuery(document).ready(function () {
        	            jQuery("a[data-hiddenfile=" + inputNumber + "]")[0].click();	                    
        	        });
        	    }
        	</script>                                    
        </asp:Panel>
        <asp:Panel CssClass="AddPadding" ID="multipleInstanceDesignTimePanel" runat="server" Visible="false">
            <asp:Label ID="multipleInstanceDesignTimeLabel" runat="server" Text="Label"></asp:Label>
        </asp:Panel>
    </asp:Panel>              
    <Panel:Editor ID="panelEditor" PanelDefinitionId="<%#PanelDefinitionId %>" runat="server" Visible="False" />
    <asiweb:StyledLabel CssClass="AddPadding" ID="NoPanelSelectedLabel" runat="server" translate="yes" Visible="false"></asiweb:StyledLabel>     
</telerik:RadAjaxPanel>