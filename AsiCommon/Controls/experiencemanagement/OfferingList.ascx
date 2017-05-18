<%@ Import namespace="Asi.Web.UI.WebControls"%>
<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.Controls.ExperienceManagement.OfferingList" Codebehind="OfferingList.ascx.cs" %>

<asiweb:PanelTemplateControl2 runat="server" Collapsible="False" BorderStyle="None">

    <asiweb:Lister2 id="lstOfferingGrid"
        runat="server"
        AjaxEnabled="true"
        SortingEnabled="true"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="20"
        ColumnReorderingEnabled="false"
        DataSourceDocumentPath="$/ExperienceManagement/DefaultSystem/Queries/Offering/OfferingsList"
        DeleteColumnLocation="End"
        AddButtonLocation="TopRight"
        AddLinkTargetBehavior="SameWindow"
        AddTargetUrl="~/iMIS/ExperienceManagement/Offering.aspx"
        TargetUrl="~/iMIS/ExperienceManagement/Offering.aspx"
        LinkTargetBehavior="SameWindow"
        EditColumnLocation="None"
        EnableClientSideDelete="false"
        AllowNaturalSort="false"
        SortPropertiesList="Name"
        OnPreEvaluateQuery="lstOfferingGrid_PreEvaluateQuery"
        OnItemDeleted="lstOfferingGrid_ItemDeleted"
        SelectColumnLocation="None"
        LinkProperty="Name"
        DisableQueryEdit="true"
    />

</asiweb:PanelTemplateControl2>