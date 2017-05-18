<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.Migrated_BusinessObjectList" Codebehind="BusinessObjectList.ascx.cs" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asi:PanelTemplateControl2 id="Template" runat="server" Collapsible="false">
    <asiweb:Lister2 id="Grid"
        runat="server"
        AjaxEnabled="true"
        SortingEnabled="true"
        PagingEnabled="true"
        PagerMode="Advanced"
        ColumnReorderingEnabled="false"
        DeleteColumnLocation="End"
        AddButtonLocation="TopRight"
        AddLinkTargetBehavior="NewWindowAllShare"
        LinkTargetBehavior="NewWindowAllShare"
        EditColumnLocation="None"
        SelectColumnLocation="Beginning"
        OnNeedDataSource="Grid_NeedDataSource"
        TargetContentCode="EditBusinessItem"
        EnableClientSideDelete="false"
        TargetPreserveStatefulBusinessContainer="true" 
        RefreshButtonType="Link" 
        RefreshButtonLocation="TopRight"
        RefreshButtonClientID="RefreshButton"
        ReloadOnRefresh="True"
    />
</asi:PanelTemplateControl2>