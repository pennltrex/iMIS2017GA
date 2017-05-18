<%@ Page Language="C#" Title="Freight zones" AutoEventWireup="true" CodeBehind="FreightZone.aspx.cs" Inherits="Asi.Web.UI.Common.Utility.FreightZone" MasterPageFile="~/Templates/MasterPages/Empty.master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="TemplateBody" runat="server">
     
    <script>
        function ShowLoadingPanel() {
            jQuery("#<%#LoadingPanel.ClientID%>").show();
        }
    </script>
    <telerik:RadAjaxLoadingPanel runat="server" ID="LoadingPanel" BackgroundTransparency="0" IsSticky="false"
        BackgroundPosition="Center" Skin="Metro" style="position:absolute;top:0;left:0;width:100%;height:100%;"/>

    <telerik:RadAjaxPanel runat="server" LoadingPanelID="LoadingPanel" >
    
        <asiweb:PanelTemplateControl2 ID="FreightZonePanel" runat="server" FieldSet="true"
            BorderStyle="None" Collapsed="false" Collapsible="false">
                  
                    <asiweb:Lister2  
                        AddButtonEnabled="true" 
                        AddButtonType="Link"
                        AddLinkTargetBehavior="SameWindow"
                        AddButtonLocation="TopRight" 
                        AddTargetUrl="FreightZoneDialog.aspx"
                        AjaxEnabled="true" 
                        CollapsiblePanelTemplate="false" 
                        ColumnReorderingEnabled="false" 
                        DataKeyNames="ZoneTableId"
                        DeleteColumnLocation="End"
                        DeleteConfirmText="Delete this zone?"
                        DeleteButtonCssClass="FloatRight"
                        DeleteColumnButtonType = "Image"
                        DeleteColumnImageUrl="~/AsiCommon/Images/icon_delete.png"
                        DisableQueryEdit="true" 
                        DisplayPropertiesList="ZoneTableId,Name,DefaultZoneId,UpdatedDateTime" 
                        DisplayPropertiesTitleOverride="Zone Table,Title,Default Zone,Updated"
                        EditColumnLocation="None" 
                        EnableClientSideDelete="false"
                        EnableViewState = "false"
                        ID="FreightZoneGrid"
                        OnItemDeleted="FreightZoneGridOnItemDeleted"
                        OnItemDataBound="FreightZoneGridOnItemDataBound"
                        OnNeedDataSource="FreightZoneGridNeedDataSource" 
                        PagingEnabled="true" 
                        ReloadOnRefresh="True"
                        runat="server" 
                        SelectColumnLocation="None" 
                        SortingEnabled="true" 
                        TargetPreserveStatefulBusinessContainer="false"
                        />
            
        </asiweb:PanelTemplateControl2>
    </telerik:RadAjaxPanel>

</asp:Content> 