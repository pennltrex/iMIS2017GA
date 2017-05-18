<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.ExperienceManagement.ExperienceDefinitionList" Codebehind="ExperienceDefinitionList.ascx.cs" %>

<asiweb:PanelTemplateControl runat="server" ID="MainPanel" TemplateTitle="Current Experiences" Collapsible="False" BorderStyle="None">

    <asiweb:Lister2 id="lstExperienceDefinitionGrid"
        runat="server"

        AjaxEnabled="true"
        SortingEnabled="true"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="20"
        ColumnReorderingEnabled="false"
        DataSourceDocumentPath="$/ExperienceManagement/DefaultSystem/Queries/ExperienceDefinition/ExperienceDefinitionList"
        AddButtonLocation="TopRight"
        AddLinkTargetBehavior="SameWindow"
        AddTargetUrl="./ExperienceDefinition.aspx"
        TargetUrl="~/iMIS/ExperienceManagement/ExperienceDefinition.aspx"
        LinkTargetBehavior="SameWindow"
        EditColumnLocation="None"
        AllowNaturalSort="false"
        SortPropertiesList="Name"
        OnPreEvaluateQuery="lstExperienceDefinitionGrid_PreEvaluateQuery"
        SelectColumnLocation="None"
        LinkProperty="Name"
        DisableQueryEdit="true"
    />

</asiweb:PanelTemplateControl>