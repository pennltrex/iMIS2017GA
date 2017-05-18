<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.UserControlBase" %>
<asiweb:PanelTemplateControl2 ID="PanelTemplateControl1" runat="server" Collapsible="false" TemplateTitle="Manage providers" ShowBorder="False">
    
<%-- CW - 8/11/2015 - Impersonation is a part of the public view which has been deprecated --%>
<%--    <asiweb:Lister2 
        ID="lstProviders"
        runat="server"
        AjaxEnabled="false"
        SortingEnabled="true"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="20"
        ColumnReorderingEnabled="false"
        DataSourceDocumentPath="$/ExperienceManagement/DefaultSystem/Queries/ContactListerQueryForLocations/Default"
        DeleteColumnLocation="None"
        AddButtonLocation="None"
        UseUniformKey="false"
        DataKeyNames="iMIS_ID"
        TargetUrl="~/Core/Admin/Impersonation.aspx"
        LinkTargetBehavior="SameWindow"
        EditColumnLocation="None"
        SelectColumnLocation="Beginning"
        />--%>

</asiweb:PanelTemplateControl2>