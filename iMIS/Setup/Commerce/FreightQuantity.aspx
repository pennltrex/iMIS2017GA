<%@ Page Language="C#" Inherits="Asi.Web.UI.Common.Utility.FreightQuantity" CodeBehind="FreightQuantity.aspx.cs" MasterPageFile="~/Templates/MasterPages/Empty.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
    <asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" Collapsible="false">
        <telerik:RadTabStrip Orientation="HorizontalTop" ID="RadTabStrip1" runat="server" OnTabClick="RadTabStrip1_OnTabClick" SelectedIndex="2" MultiPageID="RadMultiPage1" ShowBaseLine="true">
            <Tabs>
                <telerik:RadTab translate="yes" Text="By weight"></telerik:RadTab>
                <telerik:RadTab translate="yes" Text="By total value"></telerik:RadTab>
                <telerik:RadTab translate="yes" Text="By total quantity"></telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage ID="RadMultiPage1" CssClass="ContentTabbedDisplay AddPadding" SelectedIndex="0" runat="server">
            <telerik:RadPageView ID="RadPageView2" Visible="True" runat="server">
            
                <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" BackgroundTransparency="0" IsSticky="false"
                    BackgroundPosition="Center" Skin="Metro" style="position:absolute;top:0;left:0;width:100%;height:100%;"/>

                <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel">
                       
                    <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="false">
            
                        <asiweb:Lister2
                            AddButtonEnabled="true"
                            AddButtonLocation="TopRight" 
                            AddLinkTargetBehavior = "NewWindowEachLink"
                            AddTargetUrl = "FreightQuantityDialog.aspx"
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
                            DisplayPropertiesList="MIN_QTY,RATE" 
                            DisplayPropertiesTitleOverride="Total quantity range,Rate"          
                            EnableClientSideDelete="false" 
                            EnableViewState="False"
                            ExportButtonLocation="None" 
                            FormPropertiesList = "MIN_QTY,RATE"
                            HideResultsOnInitialLoad="Visible"
                            ID="FreightQuantityGrid"
                            LinkTargetBehavior = "NewWindowEachLink"
                            LinkTargetHeight="400px"
                            LinkTargetWidth="600px"
                            OnItemDeleted="FreightQuantityGridOnItemDeleted" 
                            OnNeedDataSource="FreightQuantityGridOnNeedDataSource" 
                            OnItemDataBound="FreightQuantityGridOnItemDataBound"
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
                            TargetUrl = "FreightQuantityDialog.aspx"
                            TargetUrlKeyParameterName = "iKey"
                            ViewStateMode="Disabled"
                            Visible="true"
                           />                
             
                    </asiweb:PanelTemplateControl2>

                </telerik:RadAjaxPanel>

            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </asiweb:PanelTemplateControl2>
</asp:Content> 	