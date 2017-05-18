<%@ Import namespace="Asi.Web.UI.WebControls"%>
<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Bae.Web.Customer.AccountManagement.ExperienceManagement.ExperienceProgramList" Codebehind="ExperienceProgramList.ascx.cs" %>

<asiweb:PanelTemplateControl ID="panel" runat="server" Collapsible="False">

    <asiweb:StyledLabel id="chooseLabel" runat="server"></asiweb:StyledLabel>

    <asiweb:Lister2 
        id="lstExperienceProgram"
        runat="server"

        AjaxEnabled="true"
        Width="98%"
        SortingEnabled="true"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="20"
        ColumnReorderingEnabled="false"
 
        DataSourceDocumentPath="$/ExperienceManagement/DefaultSystem/Queries/Program/ExperienceProgramList"

        LinkTargetBehavior="SameWindow"
        
        TargetUrlKeyParameterName="iProgramKey"

        SelectColumnLocation="Beginning"
        TargetUrl="~/Core/AccountManagement/ExperienceManagement/ExperienceList.aspx"

        EnableClientSideDelete="false"

        AllowNaturalSort="false"
        SortPropertiesList="Program Name"
    />
</asiweb:PanelTemplateControl>
