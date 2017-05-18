<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommitteeList.ascx.cs" Inherits="Asi.Web.UI.Common.CommitteeManagement.CommitteeList" %>

<asp:Button runat="server" id="RefreshTrigger1" style="display:none" OnClick="RefreshResultGrid" Text="text" />
<telerik:RadAjaxPanel runat="server">
    <asiweb:PanelTemplateControl2 ID="CommitteesListPanel" runat="server" Collapsed="false" Collapsible="false" BorderStyle="None">
        <div style="clear:both;">
        <asiweb:Lister2 id="CommitteesList" runat="server"
            AjaxEnabled="True"
            SortingEnabled="true"
            PagingEnabled="true"
            PagerMode="Advanced"
            PageSize="20"           
            ColumnReorderingEnabled="false"
            EnableClientSideDelete="false"
            GridIconColumnCssClass="grid-icon-column"
            EditColumnLocation="None"
            SelectColumnLocation="End"
            SelectColumnText="Edit"
            SelectColumnImageUrl="~/AsiCommon/Images/icon_edit.png"
            SelectColumnButtonType="Image"
            DeleteColumnLocation="End"
            DeleteColumnText="Delete" 
            DeleteColumnImageUrl="~/AsiCommon/Images/icon_delete.png"
            DeleteColumnButtonType="Image"                                     
            AddTargetUrl="~/AsiCommon/Controls/CommitteeManagement/CommitteeAddEditDisplay.aspx"                                    
            LinkProperty="Name"
            LinkPropertyTargetBehavior="SameWindow"
            DataKeyNames="GroupId"
            LinkTargetBehavior="NewWindowAllShare"
            AddLinkTargetBehavior="NewWindowAllShare"
            UseUniformKey="true"  
            DataSourceIsRealDataSource="true"
            ExportButtonLocation="TopRight"
            OnItemDataBound="CommitteesList_OnItemDataBound"
            OnExport="CommitteesList_Export"
            OnItemDeleted="CommitteesList_ItemDeleted"
            OnNeedDataSource="CommitteesList_NeedDataSource" 
            
        />

        <div style="display: none;">
            <%-- Lister below is for exporting data --%>
            <asiweb:Lister2 ID="lstExportableCommitteeList" runat="server" Title="Committee list"
                AddButtonEnabled="false" DeleteColumnLocation="None" AjaxEnabled="false"
                EditColumnLocation="None" ExportButtonLocation="None" GroupingEnabled="false"
                SelectColumnLocation="None" SortingEnabled="false" PagingEnabled="false" 
                DataSourceIsRealDataSource="true"
                DisplayPropertiesList="Name,Description" DisplayPropertiesTitleOverride="Name,Description" />
        </div>
    </div>
    </asiweb:PanelTemplateControl2>
    <div runat="server" id="DivErrors" visible="false">
        <asp:Label ID="ErrorLabel" runat="server" CssClass="Error" />
    </div>
</telerik:RadAjaxPanel>