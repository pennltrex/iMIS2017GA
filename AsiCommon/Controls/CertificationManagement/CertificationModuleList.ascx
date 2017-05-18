<%@ Control Language="C#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.CertificationManagement.CertificationModuleList" Codebehind="CertificationModuleList.ascx.cs" %>

<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" TemplateTitle="Program components" ShowHeader="True" Collapsible="False" BorderStyle="None">

    <asiweb:Lister2 id="lstCertificationModuleGrid"
        runat="server"
        AjaxEnabled="true"
        Width="100%"
        SortingEnabled="true"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="20"
        ColumnReorderingEnabled="false"
        DataSourceDocumentPath="$/CertificationManagement/DefaultSystem/Queries/CertificationModule/CertificationModuleList"
        DeleteColumnLocation="End"
        AddButtonLocation="TopRight"
        AddLinkTargetBehavior="SameWindow"
        AddTargetUrl="./CertificationModule.aspx"
        EnableClientSideDelete="false"
        TargetUrl="~/iMIS/CertificationManagement/CertificationModule.aspx"
        LinkTargetBehavior="SameWindow"
        EditColumnLocation="None"
        AllowNaturalSort="false"
        SortPropertiesList="Name"
        HideResultsOnInitialLoad="Visible"
        OnItemDeleted="lstCertificationModuleGrid_ItemDeleted"
        OnPreEvaluateQuery="lstCertificationModuleGrid_PreEvaluateQuery"
        OnPreRender="lstCertificationModuleGrid_PreRender"
        OnItemDataBound="lstCertificationModuleGrid_OnItemDataBound"
        CollapsiblePanelTemplate="false"
        SelectColumnLocation="None"
        LinkProperty="Name"
        DisableQueryEdit="true"
    />

</asiweb:PanelTemplateControl2>
