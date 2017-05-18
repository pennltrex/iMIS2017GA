<%@ Page Language="C#" Title="Publishing servers" Inherits="Asi.Web.UI.ContentManagement.PublishServerList" Codebehind="PublishServerList.aspx.cs" %>



<asp:Content id="Content1" runat="server" ContentPlaceHolderId="TemplateBody">
    <asiweb:PanelTemplateControl2 ID="Panel" runat="server" ShowHeader="true" TemplateTitle="Publishing Servers" Collapsible="false" ScrollBars="None" BorderStyle="None">    
        <script type="text/javascript">
                function AddCallBackFunction(radwindow) {
                    if (radwindow != null)
                    {
                        jQuery('#' + '<%= addTrigger.ClientID %>').click();
                    }
                }
        </script>        
        <asiweb:Lister2 ID="PublishServers" runat="server"    
            AjaxEnabled="true" 
            ExportButtonLocation="None" 
            DeleteColumnLocation="End" 
            AddButtonLocation="TopRight" 
            SelectColumnLocation="Beginning"
            SelectColumnText="Select"
            DeleteColumnText="Delete"
            DeleteColumnImageUrl="~/AsiCommon/Images/icon_delete.png"
            DeleteColumnButtonType="Image" 
            PagingEnabled="true" 
            ColumnReorderingEnabled="true" 
            GroupingEnabled="false" 
            SortingEnabled="true"
            DataSourceAtomComponentName="PublishServer" 
            LinkTargetBehavior="NewWindowAllShare" 
            UseUniformKey="true"
            TargetUrlKeyParameterName="PublishServerCode" 
            TargetUrl="~/iMIS/ContentManagement/PublishServerEdit.aspx" 
            TargetUrlParameters="CloseWindowOnCommit=true"
            AddTargetUrlParameters="CloseWindowOnCommit=true&iOperation=New"
            DisplayPropertiesList="Code,Description,ServerIPAddress,Frequency,PendingRequestsCount,IsDefault"
            OnItemCreated="PublishServers_ItemCreated" 
            OnItemDataBound="PublishServers_ItemDataBound" 
            OnItemDeleted="PublishServers_ItemDeleted"
            ReloadOnRefresh="true"
            AddButtonText="Add server"
            LinkTargetWidth="90%"
            LinkTargetHeight="90%" 
            DialogWindowCallback="AddCallBackFunction"/>       
            <asp:Button runat="server" id="addTrigger" style="display:none" Text="" OnClick="AddTriggerClick"></asp:Button>            
     </asiweb:PanelTemplateControl2>
</asp:Content>
