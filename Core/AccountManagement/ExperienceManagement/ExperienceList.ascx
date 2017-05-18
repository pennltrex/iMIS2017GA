<%@ Control Language="C#" AutoEventWireup="true" 
    Inherits="Asi.Bae.Web.Customer.AccountManagement.ExperienceManagement.ExperienceList" Codebehind="~/Core/AccountManagement/ExperienceManagement/ExperienceList.ascx.cs" %>

<asiweb:PanelTemplateControl ID="ExperiencesPanel" runat="server" Collapsible="False" BorderStyle="None">
    <asiweb:StyledLabel ID="ExperienceListChooseLegend" runat="server" CssClass="PanelTitle"></asiweb:StyledLabel>    
    <asiweb:Lister2 id="ExperiencesLister" runat="server"
        AjaxEnabled="true"
        LinkTargetBehavior="SameWindow"
        SortingEnabled="true"
        ColumnReorderingEnabled="false"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="10"
        Width="98%"

        AllowNaturalSort="false"
        SortPropertiesList="Name"

        SelectColumnLocation="Beginning"
        UseUniformKey="false"
        TargetUrl="ExperienceOfferingList.aspx"
        TargetUrlKeyParameterName = "iExperienceDefinitionKey"
	    TargetTemplateType="D"

        AddTargetUrl="~/Core/AccountManagement/CustomerExperiencesEdit.aspx?TemplateType=D"

        SelectMode="true"
        SelectMultipleEnabled="false"
        
        DataSourceDocumentPath="$/ExperienceManagement/DefaultSystem/Queries/ExperienceDefinition/ActiveExperienceList"

        OnPreEvaluateQuery="ExperienceLister_PreEvaluateQuery"
    />
</asiweb:PanelTemplateControl>