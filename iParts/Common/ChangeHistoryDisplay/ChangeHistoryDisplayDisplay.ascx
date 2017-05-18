<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChangeHistoryDisplayDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.ChangeHistoryDisplay.ChangeHistoryDisplayDisplay" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asiweb:Lister2 ID="ResultsGrid" runat="server" AjaxEnabled="true" SortingEnabled="true"
    PagingEnabled="true" ColumnReorderingEnabled="false" EnableClientSideDelete="false"
    EditColumnLocation="None" SelectColumnLocation="None" DeleteColumnLocation="None"
    AddButtonEnabled="false" DisableQueryEdit="true" OnNeedDataSource="ResultsGrid_NeedDataSource"
    CollapsiblePanelTemplate="false" RefreshButtonLocation="TopRight" />

