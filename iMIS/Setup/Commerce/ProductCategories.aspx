<%@ Page Language="C#" Title="Product categories" AutoEventWireup="true" CodeBehind="ProductCategories.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.ProductCategories" MasterPageFile="~/Templates/MasterPages/Empty.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
    <asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" Collapsible="false">
        <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" BackgroundTransparency="0" IsSticky="false"
            BackgroundPosition="Center" Skin="Metro" style="position:absolute;top:0;left:0;width:100%;height:100%;"/>
        <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel">                       
            <asiweb:Lister2
                AddButtonEnabled="true"
                AddButtonLocation="TopRight" 
                AddLinkTargetBehavior = "SameWindow"
                AddTargetUrl = "~/imis/Setup/Commerce/ProductCategoriesDialog.aspx"
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
                DisplayPropertiesList="ProductCategory,Description"       
                EnableClientSideDelete="false" 
                EnableViewState="False"
                ExportButtonLocation="None" 
                FormPropertiesList = "ProductCategory,Description"
                HideResultsOnInitialLoad="Visible"
                ID="ProductCategoriesGrid"
                LinkTargetBehavior = "SameWindow"
                LinkTargetHeight="400px"
                LinkTargetWidth="600px"
                OnItemDeleted="ProductCategoriesGridOnItemDeleted" 
                OnNeedDataSource="ProductCategoriesGridOnNeedDataSource" 
                OnItemDataBound="ProductCategoriesGridOnItemDataBound"
                PagerMode="NextPrevAndNumeric" 
                PagingEnabled="true"
                PageSize="20" 
                RefreshButtonLocation="None"
                ReloadOnRefresh = "True" 
                Runat="server" 
                SelectColumnLocation = "End"
                SelectColumnImageUrl = "~/AsiCommon/Images/icon_edit.png"
                SelectColumnButtonType = "Image"
                SortingEnabled="False"
                TargetCloseWindowOnCommit="False"
                TargetPreserveStatefulBusinessContainer="False"
                TargetUrl = "~/imis/Setup/Commerce/ProductCategoriesDialog.aspx"
                TargetUrlKeyParameterName = "iKey"
                ViewStateMode="Disabled"
                Visible="true"
                />                
        </telerik:RadAjaxPanel>
    </asiweb:PanelTemplateControl2>
</asp:Content> 	