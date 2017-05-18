<%@ Control Language="C#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.CertificationManagement.ProgramGroupList" Codebehind="ProgramGroupList.ascx.cs" %>

<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" TemplateTitle="Program groups" ShowHeader="True" Collapsible="False" BorderStyle="None">
        
    <asiweb:Lister2 id="lstProgramGroupGrid"
        runat="server"
        EnableClientSideDelete="false"
        AjaxEnabled="true"
        SortingEnabled="true"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="20"
        ColumnReorderingEnabled="false"
        DataSourceDocumentPath="$/CertificationManagement/DefaultSystem/Queries/ProgramGroup/ProgramGroupList"
        AddButtonLocation="TopRight"
        AddLinkTargetBehavior="SameWindow"
        AddTargetUrl="./ProgramGroup.aspx"
        TargetUrl="~/iMIS/CertificationManagement/ProgramGroup.aspx"
        LinkTargetBehavior="SameWindow"
        EditColumnLocation="None"
        AllowNaturalSort="false"
        SortPropertiesList="Name"
        OnPreRender="lstProgramGroupGrid_PreRender"
        SelectColumnLocation="None"
        LinkProperty="Name"
        DisableQueryEdit="true"
        OnItemDataBound="lstProgramGroupGrid_OnItemDataBound"
    />

</asiweb:PanelTemplateControl2>