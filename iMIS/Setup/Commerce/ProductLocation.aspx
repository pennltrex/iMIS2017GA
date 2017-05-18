<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductLocation.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.ProductLocation" MasterPageFile="~/Templates/MasterPages/Empty.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
    <asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" Collapsible="false">
        <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" BackgroundTransparency="0" IsSticky="false"
            BackgroundPosition="Center" Skin="Metro" style="position:absolute;top:0;left:0;width:100%;height:100%;"/>
        <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel">                                             
            <asiweb:Lister2
                AddButtonEnabled="true"
                AddButtonLocation="TopRight" 
                AddLinkTargetBehavior = "NewWindowEachLink"
                AddTargetUrl = "ProductLocationDialog.aspx"
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
                DisplayPropertiesList="LOCATION_CODE,DESCRIPTION" 
                DisplayPropertiesTitleOverride="Code,Description"          
                EnableClientSideDelete="false" 
                EnableViewState="False"
                ExportButtonLocation="None" 
                FormPropertiesList = "LOCATION_CODE,DESCRIPTION"
                DisabledPropertiesList="LOCATION_CODE"
                HideResultsOnInitialLoad="Visible"
                ID="ProductLocationGrid"
                LinkTargetBehavior = "NewWindowEachLink"
                LinkTargetHeight="400px"
                LinkTargetWidth="600px"
                OnItemDeleted="ProductLocationGridOnItemDeleted" 
                OnNeedDataSource="ProductLocationGridOnNeedDataSource" 
                OnItemDataBound="ProductLocationGridOnItemDataBound"
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
                TargetUrl = "ProductLocationDialog.aspx"
                TargetUrlKeyParameterName = "iKey"
                ViewStateMode="Disabled"
                Visible="true"
                />                             
        </telerik:RadAjaxPanel>
    </asiweb:PanelTemplateControl2>
</asp:Content> 	