<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Community_CommunityList" Codebehind="CommunityList.ascx.cs" %>
<telerik:RadAjaxPanel runat="server">
    <asiweb:PanelTemplateControl2 ID="CommunityListPanel" runat="server" Collapsed="false" Collapsible="false" BorderStyle="None">
        <div style="clear:both;">
        <asiweb:Lister2 id="CommunitiesList" runat="server"
            AjaxEnabled="false"
            SortingEnabled="true"
            PagingEnabled="true"
            PagerMode="Advanced"
            PageSize="20"           
            ColumnReorderingEnabled="false"
            EnableClientSideDelete="false"
            EditColumnLocation="None"
            GridIconColumnCssClass="grid-icon-column"
            SelectColumnLocation="End"
            SelectColumnText="Edit"
            SelectColumnImageUrl="~/AsiCommon/Images/icon_edit.png"
            SelectColumnButtonType="Image"
            DeleteColumnLocation="End"
            DeleteColumnText="Delete" 
            DeleteColumnImageUrl="~/AsiCommon/Images/icon_delete.png"
            DeleteColumnButtonType="Image"                                     
            AddButtonEnabled="true"
            AddTargetUrl="~/iMIS/CommunityManagement/CommunityConfigure.aspx"
            AddTargetUrlParameters="iNewObject=CommunityDocument&iNewObjectType=Community"
            AddButtonLocation="TopRight"                                     
            LinkProperty="Title"
            LinkPropertyTargetBehavior="SameWindow"
            LinkPropertyTargetUrl="~/iCore/Communities/CommunityLayouts/CommunityNewsFeed.aspx" 
            TargetUrl="~/iMIS/CommunityManagement/CommunityConfigure.aspx"
            DataKeyNames="CommunityDocumentKey"
            LinkTargetBehavior="NewWindowAllShare"
            AddLinkTargetBehavior="NewWindowAllShare"
            UseUniformKey="true"  
            DataSourceIsRealDataSource="true"
            ExportButtonLocation="TopRight"
            DisplayPropertiesList="Title,Description"
            DisplayPropertiesTitleOverride="Name,Description"
            OnItemDataBound="CommunitiesList_OnItemDataBound"
            OnExport="CommunitiesList_Export"
        />

        <div style="display: none;">
            <%-- Lister below is for exporting data --%>
            <asiweb:Lister2 ID="lstExportableCommunityList" runat="server" Title="Community list"
                AddButtonEnabled="false" DeleteColumnLocation="None" AjaxEnabled="false"
                EditColumnLocation="None" ExportButtonLocation="None" GroupingEnabled="false"
                SelectColumnLocation="None" SortingEnabled="false" PagingEnabled="false" 
                DataSourceIsRealDataSource="true"
                DisplayPropertiesList="Title,Description" DisplayPropertiesTitleOverride="Name,Description" />
        </div>
    </div>
    </asiweb:PanelTemplateControl2>
    <div runat="server" id="DivErrors" visible="false">
        <asp:Label ID="ErrorLabel" runat="server" CssClass="Error" />
    </div>
</telerik:RadAjaxPanel>