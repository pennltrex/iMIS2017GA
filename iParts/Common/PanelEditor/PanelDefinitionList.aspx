<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PanelDefinitionList.aspx.cs" Inherits="Asi.Web.iParts.Common.PanelEditor.PanelDefinitionList" Title="Panel definitions" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<asp:Content id="PanelDefinitionContent" runat="server" ContentPlaceHolderID="TemplateBody">
    <asiweb:PanelTemplateControl2 ID="Panel" runat="server" BorderStyle="None" Text="Panel definitions" Collapsible="false">
        <asiweb:Lister2 
            AddButtonLocation="TopRight" 
            AddButtonText="Add panel definition" 
            AddLinkTargetBehavior="SameWindow" 
            AddTargetUrl="~/iParts/Common/PanelEditor/PanelDesignDialog.aspx" 
            AjaxEnabled="false" 
            CollapsiblePanelTemplate="false" 
            ColumnReorderingEnabled="false" 
            DeleteColumnLocation="End"
            DeleteColumnText="Delete" 
            DeleteColumnImageUrl="~/AsiCommon/Images/icon_delete.png"
            DeleteColumnButtonType="Image" 
            DisableQueryEdit="true"           
            EditColumnLocation="None"            
            EnableClientSideDelete="false" 
            ExportButtonLocation="None"
            GridIconColumnCssClass="grid-icon-column" 
            HideResultsOnInitialLoad="Visible" 
            id="PanelDefinitionGrid"
            OnNeedDataSource="NeedDataSource" 
            OnItemDataBound="ItemDataBound" 
            OnItemDeleted="ItemDeleted"
            OnItemCreated="ItemCreated"
            SortPropertiesList="Name"
            PagerMode="Advanced" 
            PagingEnabled="true" 
            runat="server" 
            SelectColumnLocation="None" 
            SortingEnabled="true"
            AllowRowSelecting="false"
            AllowGridRowSelectStyle="false"
            />                
    </asiweb:PanelTemplateControl2>
</asp:Content>
