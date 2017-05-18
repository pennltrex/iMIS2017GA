<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreightRate.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.FreightRate" MasterPageFile="~/Templates/MasterPages/Empty.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
    <asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" Collapsible="false">
        <telerik:RadTabStrip Orientation="HorizontalTop" ID="RadTabStrip1" runat="server" OnTabClick="RadTabStrip1_OnTabClick" SelectedIndex="0" MultiPageID="RadMultiPage1" ShowBaseLine="true">
            <Tabs>
                <telerik:RadTab translate="yes" Text="By weight"></telerik:RadTab>
                <telerik:RadTab translate="yes" Text="By total value"></telerik:RadTab>
                <telerik:RadTab translate="yes" Text="By total quantity"></telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage ID="RadMultiPage1" CssClass="ContentTabbedDisplay AddPadding" runat="server" SelectedIndex="0">
            <telerik:RadPageView ID="RadPageView3" runat="server" >
            
                <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" BackgroundTransparency="0" IsSticky="false"
                    BackgroundPosition="Center" Skin="Metro" style="position:absolute;top:0;left:0;width:100%;height:100%;"/>

                <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel">
                       
                    <asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" FieldSet="false">
            
                        <asp:Button runat="server" id="RefreshTrigger1" style="display:none" OnClick="RefreshFreightRateGrid" Text="text" />
                        <div ID="ShippingMethodDropDownDiv" class="ClearFix PanelField Left" runat="server">
                            <div class="PanelFieldLabel">
                                <asiweb:StyledLabel ID="ShippingMethodLabel" AssociatedControlID="ShippingMethodDropDown" runat="server" Text="Shipping method" Translate="yes"></asiweb:StyledLabel>
                            </div> 
                            <div class="PanelFieldValue">           
                                <asiweb:BusinessDropDownList runat="server" ID="ShippingMethodDropDown" OnSelectedIndexChanged="ShippingMethod_OnSelectedIndexChanged" AutoPostBack="true" />
                            </div>
                        </div>
            
                        <asiweb:Lister2
                            AddButtonEnabled="true"
                            AddButtonLocation="TopRight" 
                            AddLinkTargetBehavior ="NewWindowEachLink"
                            AddTargetUrl = "FreightRateDialog.aspx"
                            AjaxEnabled="true" 
                            AllowGridRowSelectStyle="false" 
                            AllowRowSelecting="false" 
                            CollapsiblePanelTemplate="false" 
                            ColumnReorderingEnabled="false"
                            DataSourceIsRealDataSource="True"
                            DeleteColumnLocation="End"
                            DeleteConfirmText="Delete this rate?"
                            DeleteButtonCssClass="FloatRight"
                            DeleteColumnButtonType = "Image"
                            DeleteColumnImageUrl="~/AsiCommon/Images/icon_delete.png"             
                            DisableQueryEdit="false"
                            DisplayPropertiesList="ZoneId,MinimumWeight,Rate" 
                            DisplayPropertiesTitleOverride="Zone,Weight,Rate"
                            EditColumnLocation="End"          
                            EditColumnImageUrl="~/AsiCommon/Images/icon_edit.png"
                            EditColumnButtonType="Image"
                            EnableClientSideDelete="false" 
                            EnableViewState="False"
                            ExportButtonLocation="None"
                            ID="FreightRateGrid"
                            LinkTargetHeight="400px"
                            LinkTargetWidth="600px"
                            OnItemEdited="FreightRateGrid_OnItemEdited"
                            OnItemDeleted="FreightRateGridOnItemDeleted" 
                            OnNeedDataSource="FreightRateGridOnNeedDataSource" 
                            OnItemDataBound="FreightRateGridOnItemDataBound"
                            OnItemCreated="FreightRateGrid_OnItemCreated"
                            PagingEnabled="true"
                            RefreshButtonLocation="None"
                            ReloadOnRefresh = "True" 
                            Runat="server" 
                            SortingEnabled="true"
                            TargetPreserveStatefulBusinessContainer="False"
                            ViewStateMode="Disabled"
                           />                
             
                    </asiweb:PanelTemplateControl2>

                </telerik:RadAjaxPanel>

            </telerik:RadPageView>
        </telerik:RadMultiPage>
    </asiweb:PanelTemplateControl2>
</asp:Content> 	