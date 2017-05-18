<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_ResponseNewSourceCodeList" Codebehind="ResponseNewSourceCodeList.ascx.cs" %>
<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" Collapsible="false">

    <asiweb:Lister2 id="NewSourceCodeGrid" 
    runat="server"
    AjaxEnabled="true"
    SortingEnabled="true"
    PagingEnabled="true"
    PagerMode="Advanced"
    PageSize="20"
    ColumnReorderingEnabled="false"
    DataSourceDocumentPath="$/CampaignManagement/DefaultSystem/Queries/SourceCodeList"
    DeleteColumnLocation="None"
    AddButtonLocation="None"
    LinkTargetBehavior="SameWindow"
    EditColumnLocation="None"
    SelectColumnLocation="Beginning"        
    EnableClientSideDelete="false"
    UseUniformKey="true"
    TargetContentCode="CM.RecordResponse.NewOpportunity"                                                     
    /> 
      
</asiweb:PanelTemplateControl2>