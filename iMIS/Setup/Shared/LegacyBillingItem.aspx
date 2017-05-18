<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Inherits="Asi.Web.UI.Common.Utility.LegacyBillingItem" Codebehind="LegacyBillingItem.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
     
    <telerik:RadAjaxLoadingPanel BackgroundPosition="Center" BackgroundTransparency="0" ID="LoadingPanel" IsSticky="false" runat="server" Skin="Metro" style="position:absolute;top:0;left:0;width:100%;height:100%;" />

    <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel">
                 
        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="false">
            
            <asiweb:Lister2
                AddButtonEnabled="true"                
                AddTargetUrl="~/iCore/System_Settings/Contacts/BillingItem.aspx?iOperation=New"
                AddLinkTargetBehavior="SameWindow" 
                AjaxEnabled="true" 
                AllowGridRowSelectStyle="false" 
                AllowRowSelecting="false" 
                CollapsiblePanelTemplate="false" 
                ColumnReorderingEnabled="false" 
                DataSourceSelectHidden="false"         
                DisableQueryEdit="true"
                DataKeyNames="ItemId"
                EnableClientSideDelete="false" 
                ExportButtonLocation="None" 
                HideResultsOnInitialLoad="Visible"
                ID="ItemGrid"
                OnItemDeleted="OnItemDeleted" 
                OnNeedDataSource="OnNeedDataSource" 
                OnItemDataBound="OnItemDataBound"
                PagerMode="NextPrevAndNumeric" 
                PagingEnabled="true"
                PageSize="20" 
                RefreshButtonLocation="None" 
                runat="server" 
                SelectColumnLocation="None"
                SortingEnabled="true"
                TargetCloseWindowOnCommit="false"
                TargetPreserveStatefulBusinessContainer="false"   
                Visible="true"
               />                
             
        </asiweb:PanelTemplateControl2>

    </telerik:RadAjaxPanel>

    <script type="text/javascript">
        function CallbackRefresh() {
            var gridId = jQuery("[id$='Grid1']").attr('id');
            var masterTable = $find(gridId).get_masterTableView();
            if (masterTable != null)
                masterTable.rebind();
    }
    </script>
    
</asp:Content> 	
