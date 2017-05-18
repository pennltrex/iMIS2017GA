<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_ResponseContactList" Codebehind="ResponseContactList.ascx.cs" %>
<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" Collapsible="false">

    <asiweb:Lister2 id="ResponseContactsGrid"
        DisplayQueryEdit="true"
        runat="server"
        AjaxEnabled="true"
        SortingEnabled="true"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="20"
        ColumnReorderingEnabled="false"
        DataSourceDocumentPath="$/CampaignManagement/DefaultSystem/Queries/Respondents"
        DeleteColumnLocation="None"
        AddButtonLocation="None"
        LinkTargetBehavior="SameWindow"
        AddLinkTargetBehavior="SameWindow"
        EditColumnLocation="None"
        SelectColumnLocation="Beginning"        
        EnableClientSideDelete="false"
        UseUniformKey="true"
        AddButtonText="add"
        TargetContentCode="CM.RecordResponse.AppealList"                                                     
        />  
    
</asiweb:PanelTemplateControl2>