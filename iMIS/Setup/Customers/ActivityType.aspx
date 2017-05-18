﻿<%@ Page Language="C#" Title="Activity types" MasterPageFile="~/Templates/MasterPages/Empty.master" Inherits="Asi.Web.UI.Common.Utility.ActivityType" Codebehind="ActivityType.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
     
    <telerik:RadAjaxLoadingPanel BackgroundPosition="Center" BackgroundTransparency="0" ID="LoadingPanel" IsSticky="false" runat="server" Skin="Metro" style="position:absolute;top:0;left:0;width:100%;height:100%;" />

    <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel">
                 
        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="false">
            
            <asiweb:Lister2
                AddButtonEnabled="true"
                AddButtonLocation="TopRight" 
                AddButtonText="Add new activity type"
                AddTargetUrl="ActivityTypeDialog.aspx"
                AddLinkTargetBehavior="SameWindow" 
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
                DeleteConfirmText="Delete this activity type?"               
                DisableQueryEdit="true"
                DataKeyNames="ActivityTypeId"
                DisplayPropertiesList="Description,ActivityTypeId,AllowUserEdit" 
                DisplayPropertiesTitleOverride="Description,Type,Allow Edit"          
                EditColumnLocation="None"             
                EnableClientSideDelete="false" 
                ExportButtonLocation="None" 
                HideResultsOnInitialLoad="Visible"
                ID="ActivityTypeGrid"
                OnItemDeleted="ActivityTypeOnItemDeleted" 
                OnNeedDataSource="ActivityTypeOnNeedDataSource" 
                OnItemDataBound="ActivityTypeOnItemDataBound"
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