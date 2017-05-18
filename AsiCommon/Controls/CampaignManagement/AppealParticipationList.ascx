<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_AppealParticipationList" Codebehind="AppealParticipationList.ascx.cs" %>
<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" TemplateTitle="<%#TemplateTitle%>" Collapsible="false">

    <div class="CommandBar">
        <asiweb:StyledButton ID="NewResponseButton" runat="Server" NavigateFromNavigationPath="&ContentCode=CM.RecordResponse.ContactList"/>
    </div>
    
    <asiweb:Lister2 id="AppealParticipationGrid" 
    runat="server"
    AjaxEnabled="true"
    SortingEnabled="true"
    PagingEnabled="true"
    PagerMode="Advanced"
    PageSize="20"
    ColumnReorderingEnabled="false"
    DataSourceDocumentPath="$/CampaignManagement/DefaultSystem/Queries/AppealParticipationList"
    DeleteColumnLocation="End"
    DeleteColumnText="Remove"
    DeleteConfirmText="Are you sure you want to opt-out of this item?"
    AddButtonLocation="TopRight"
    AddButtonText="Add a Source Code"
    LinkTargetBehavior="SameWindow"
    EditColumnLocation="None"
    SelectColumnLocation="Beginning"        
    EnableClientSideDelete="false"
    UseUniformKey="true"
    AddTargetContentCode="CM.RecordResponse.NewSourceCodeList"
    TargetContentCode="CM.RecordResponse.NewOpportunity"                                                 
    /> 

</asiweb:PanelTemplateControl2>