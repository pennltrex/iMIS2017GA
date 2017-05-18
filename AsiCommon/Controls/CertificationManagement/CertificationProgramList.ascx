<%@ Control Language="C#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.CertificationManagement.CertificationProgramList" Codebehind="CertificationProgramList.ascx.cs" %>

<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" TemplateTitle="Certification programs" ShowHeader="True" Collapsible="False" BorderStyle="None">
    
    <asiweb:Lister2 id="lstCertificationProgramGrid"
        runat="server"
        EnableClientSideDelete="false"
        AjaxEnabled="true"
        SortingEnabled="true"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="20"
        ColumnReorderingEnabled="false"
        DataSourceDocumentPath="$/CertificationManagement/DefaultSystem/Queries/CertificationProgram/Default"
        AddButtonLocation="TopRight"
        AddLinkTargetBehavior="SameWindow"
        AddTargetUrl="./CertificationProgram.aspx"
        TargetUrl="~/iMIS/CertificationManagement/CertificationProgram.aspx"
        LinkTargetBehavior="SameWindow"
        EditColumnLocation="None"
        AllowNaturalSort="false"
        SortPropertiesList="Program Name"
        OnPreRender="lstCertificationProgramGrid_PreRender"
        SelectColumnLocation="None"
        LinkProperty="Program Name"
        DisableQueryEdit="true"
        OnItemDataBound="CertificationProgramList_ItemDataBound"
    />

</asiweb:PanelTemplateControl2>

