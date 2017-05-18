﻿<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Inherits="Asi.Web.UI.Common.Utility.DueToDueFrom" Codebehind="DueToDueFrom.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
     
    <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" BackgroundTransparency="0" IsSticky="false"
        BackgroundPosition="Center" Skin="Metro" style="position:absolute;top:0;left:0;width:100%;height:100%;"/>

    <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel">
                 
        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="false">
            
            <asiweb:Lister2
                AddButtonEnabled="true"
                AddButtonLocation="TopRight" 
                AddTargetUrl="DueToDueFromDialog.aspx" 
                AjaxEnabled="true" 
                AllowGridRowSelectStyle="false" 
                AllowRowSelecting="false" 
                CollapsiblePanelTemplate="false" 
                ColumnReorderingEnabled="false" 
                DataSourceSelectHidden="false" 
                DeleteColumnLocation="End"
                DeleteButtonCssClass="MiddleCenter"
                DeleteColumnButtonType = "Image"
                DeleteColumnImageUrl="~/AsiCommon/Images/icon_delete.png"             
                DisableQueryEdit="true"
                DataKeyNames="DueFromDueToId"
                DisplayPropertiesList="DueFromDueToId,DueFromAccount,DueToAccount" 
                DisplayPropertiesTitleOverride="Owner/Cash Entity, From Account, To Account"          
                EditColumnLocation="None"             
                EnableClientSideDelete="false" 
                ExportButtonLocation="None" 
                HideResultsOnInitialLoad="Visible"
                ID="DueToDueFromGrid"
                OnItemDeleted="DueToDueFromGridOnItemDeleted" 
                OnNeedDataSource="DueToDueFromGridOnNeedDataSource" 
                OnItemDataBound="DueToDueFromGridOnItemDataBound"
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
                LinkTargetHeight="90%"
                LinkTargetWidth="90%"
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