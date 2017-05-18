<%@ Page Language="C#" Title="Order types" AutoEventWireup="true" CodeBehind="OrderTypes.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.OrderTypes" MasterPageFile="~/Templates/MasterPages/Empty.master"%>
<%@ Import Namespace="Asi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
     
    <script>
        function ShowLoadingPanel() {
            jQuery("#<%#LoadingPanel.ClientID%>").show();
        }
    </script>
    <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" BackgroundTransparency="0" IsSticky="false"
        BackgroundPosition="Center" Skin="Metro" style="position:absolute;top:0;left:0;width:100%;height:100%;"/>

    <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel" >
    
        <asiweb:PanelTemplateControl2 ID="OrderTypesPanel" runat="server" FieldSet="true"
            BorderStyle="None" Text="Order types" Collapsed="false" Collapsible="false">
                  
                    <asiweb:Lister2 ID="RadGrid1" 
                        AddButtonEnabled="true" 
                        AddButtonType="Link"
                        AddButtonLocation="TopRight" 
                        AjaxEnabled="true" 
                        CollapsiblePanelTemplate="false" 
                        ColumnReorderingEnabled="false" 
                        DeleteColumnLocation="End"
                        DeleteConfirmText="Delete this order type?"
                        DeleteButtonCssClass="FloatRight"
                        DeleteColumnButtonType = "Image"
                        DeleteColumnImageUrl="~/AsiCommon/Images/icon_delete.png"
                        OnItemDeleted="RadGrid1OnItemDeleted"
                        DisableQueryEdit="true" 
                        EditColumnLocation="None" 
                        EnableClientSideDelete="false"
                        OnNeedDataSource="RadGrid1NeedDataSource" 
                        PagingEnabled="true" 
                        runat="server" 
                        SelectColumnLocation="None" 
                        SortingEnabled="true" 
                        TargetPreserveStatefulBusinessContainer="false"
                        DataKeyNames="OrderTypeCode"
                        OnItemDataBound="RadGrid1OnItemDataBound"
                        DisplayPropertiesList="OrderTypeCode,Description,InvoiceDescription" 
                        DisplayPropertiesTitleOverride="Code,Description,Invoice Description"
                        DialogWindowCallback="CallbackRefresh" 
                        ReloadOnRefresh="True"
                        />
            
        </asiweb:PanelTemplateControl2>
    </telerik:RadAjaxPanel>

</asp:Content> 