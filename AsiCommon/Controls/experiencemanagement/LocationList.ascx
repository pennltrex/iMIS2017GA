<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.ExperienceManagement.LocationList" Codebehind="LocationList.ascx.cs" %>

<asiweb:PanelTemplateControl2 runat="server" Collapsible="false" TemplateTitle="Provider locations" BorderStyle="None">
 
    <asiweb:Lister2
        AddButtonLocation="TopRight" 
        AddButtonText="Add a location" 
        AddLinkTargetBehavior="SameWindow" 
        AddTargetUrl="~/iMIS/ExperienceManagement/LocationEdit.aspx" 
        AjaxEnabled="true" 
        ColumnReorderingEnabled="false" 
        DataSourceDocumentPath="$/ExperienceManagement/DefaultSystem/Queries/Locations/LocationList" 
        DeleteColumnLocation="End" 
        EditColumnLocation="None" 
        ID="lstLocations" 
        LinkTargetBehavior="SameWindow" 
        OnItemDeleted="lstLocations_ItemDeleted" 
        PagerMode="Advanced" 
        PageSize="20" 
        PagingEnabled="true" 
        runat="server" 
        SelectColumnLocation="None" 
        SortingEnabled="true" 
        TargetUrl="~/iMIS/ExperienceManagement/LocationEdit.aspx"
        UseUniformKey="True"
        LinkProperty="Name"
        DisableQueryEdit="true"
          />
    
</asiweb:PanelTemplateControl2>