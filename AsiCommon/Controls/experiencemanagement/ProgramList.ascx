<%@ Control Language="C#" AutoEventWireup="false" Inherits="Asi.Web.UI.Common.ExperienceManagement.ProgramList" Codebehind="ProgramList.ascx.cs" %>

<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" TemplateTitle="Experience programs" ShowHeader="True" Collapsible="False" BorderStyle="None">

    <asiweb:Lister2 id="lstProgramGrid"
        runat="server"
        AjaxEnabled="true"
        SortingEnabled="true"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="20"
        ColumnReorderingEnabled="false"
        DataSourceDocumentPath="$/ExperienceManagement/DefaultSystem/Queries/Program/Default"
        AddButtonLocation="TopRight"
        AddLinkTargetBehavior="SameWindow"
        AddTargetUrl="./Program.aspx"
        TargetUrl="~/iMIS/ExperienceManagement/Program.aspx"
        LinkTargetBehavior="SameWindow"
        EditColumnLocation="None"
        SelectColumnLocation="None"
        AllowNaturalSort="false"
        SortPropertiesList="Name"
        OnPreRender="lstProgramGrid_PreRender"
        DisableQueryEdit="true"
    />

</asiweb:PanelTemplateControl2>