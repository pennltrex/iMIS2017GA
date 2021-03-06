﻿<%@ Page Language="C#" MasterPageFile="~/Templates/MasterPages/Empty.master" Inherits="Asi.Web.UI.Common.Utility.GatewayAccount" Codebehind="GatewayAccount.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
     
    <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" BackgroundTransparency="0" IsSticky="false"
        BackgroundPosition="Center" Skin="Metro" style="position:absolute;top:0;left:0;width:100%;height:100%;"/>

    <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel">
                 
        <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="false">
            
            <asiweb:Lister2
                AddButtonEnabled="true"
                AddButtonLocation="TopRight"                
                AddTargetUrl="GatewayAccountDialog.aspx" 
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
                DataKeyNames="AccountId"
                DisplayPropertiesList="AccountId,Description,AdministratorEmail,AuthorizationUrl" 
                DisplayPropertiesTitleOverride="Account Code,Description,Email,Host Url"          
                EditColumnLocation="None"             
                EnableClientSideDelete="false" 
                ExportButtonLocation="None" 
                HideResultsOnInitialLoad="Visible"
                ID="AccountsGrid"
                OnItemDeleted="AccountsGridOnItemDeleted" 
                OnNeedDataSource="AccountsGridOnNeedDataSource" 
                OnItemDataBound="AccountsGridOnItemDataBound"
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
                DialogWindowCallback="CallbackRefresh"/>                
             
        </asiweb:PanelTemplateControl2>

    </telerik:RadAjaxPanel>

    <script type="text/javascript">
        function CallbackRefresh() {
        if (window != null)
            window.location.href = window.location.href;
    }
    </script>
    
</asp:Content> 	