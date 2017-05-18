<%@ Control Language="c#" Inherits="Asi.Web.UI.ResultViewer.ResultViewerFinder" Codebehind="ResultViewerFinder.ascx.cs" %>
<%@ Register TagPrefix="asi" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>
<asi:paneltemplatecontrol id="FinderPanelTemplateControl" runat="server" Collapsible="false">
    <asi:Lister2 id="ResultGrid"
            runat="server"
            AjaxEnabled="true"
            SortingEnabled="true"
            PagingEnabled="true"
            PagerMode="Advanced"
            ColumnReorderingEnabled="false"
            LinkTargetBehavior="SameWindow"
            EditColumnLocation="None"
            SelectColumnLocation="Beginning"
            EnableClientSideDelete="false"
            OnNeedDataSource="Grid_NeedDataSource"
        />
 </asi:paneltemplatecontrol>