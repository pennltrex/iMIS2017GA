<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CampaignManagement_SourceList_SegmentationJobSelector" Codebehind="SegmentationJobSelector.ascx.cs" %>
<asiweb:StyledLabel runat="server" ID="Title" CssClass="mdTitle" Text="Please Select a Segmentation Job" />

<asiweb:Lister2 id="JobsGrid" 
    runat="server"
    AjaxEnabled="false"
    SortingEnabled="true"
    PagingEnabled="true"
    PagerMode="Advanced"
    PageSize="20"
    ColumnReorderingEnabled="false"
    DataSourceDocumentPath="$/SegmentManagement/DefaultSystem/Queries/JobList"
    DeleteColumnLocation="None"
    AddButtonLocation="None"
    EditColumnLocation="None"
    SelectColumnLocation="Beginning"
    SelectColumnText="select"    
    EnableClientSideDelete="false"
    UseUniformKey="true"
    LinkTargetBehavior="RaiseEvent" 
    DisableLoadingQueryFromCache="true"                                                       
/>