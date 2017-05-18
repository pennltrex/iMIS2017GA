<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Common_SubscriberList" Codebehind="SubscriberList.ascx.cs" %>
<asiweb:PanelTemplateControl2 ID="SubscribersGroupPanel" runat="server" Collapsible="true" Collapsed="false" FieldSet="false" BorderStyle="None">
    <asiweb:Lister2 runat="server" ID="CurrentMembersLister" 
    Title="" 
    AjaxEnabled="true"
    ExportButtonLocation="TopRight" 
    EditColumnLocation="None"
    EnableClientSideDelete="false" 
    ColumnReorderingEnabled="false"
    SelectColumnLocation="None"
    SortingEnabled="true"
    PagingEnabled="true" 
    PagerMode="Simple" 
    PageSize="10" 
    DataKeyNames="GroupMemberKey" 
    DisplayPropertiesList="Sort Name" 
    DisplayPropertiesTitleOverride="Name" 
    OnItemDataBound="CurrentMembersLister_OnItemDataBound"/>
    <br />
</asiweb:PanelTemplateControl2>
