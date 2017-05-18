<%@ Control Language="c#" Inherits="Asi.Web.UI.Common.CampaignManagement.CampaignList" AutoEventWireup="true" Codebehind="CampaignList.ascx.cs" %>
<asiweb:PanelTemplateControl2 runat="server" ID="MainPanel" Collapsible="false" translate="yes">
    <asiweb:TitleBar Text="Campaigns" runat="server" ></asiweb:TitleBar>
    <div class="CommandBar" style="padding-bottom:0.6em;">
        <asiweb:StyledButton ID="SyncResponsesButton" runat="server" text="Sync. Responses" />
        <asiweb:StyledButton ID="PurgeInactiveButton" runat="server" text="Purge Inactive" />
    </div>
    <div style="clear:both;"></div>
    <asiweb:Lister2 id="CampaignsGrid" 
        DisableQueryEdit="true"
        runat="server"
        AjaxEnabled="true"
        SortingEnabled="true"
        PagingEnabled="true"
        PagerMode="Advanced"
        PageSize="20"
        ColumnReorderingEnabled="false"
        DataSourceDocumentPath="$/CampaignManagement/DefaultSystem/Queries/CampaignList"
        DeleteColumnLocation="End"
        AddButtonLocation="TopRight"
        AddLinkTargetBehavior="SameWindow"
        AddTargetUrl="~/iMIS/ContentManagement/Template.aspx?ContentCode=CM.Campaign&iNewObject=Campaign"
        TargetUrl="~/iMIS/ContentManagement/Template.aspx?ContentCode=CM.Campaign"
        LinkTargetBehavior="SameWindow"
        EditColumnLocation="None"
        SelectColumnLocation="Beginning"        
        EnableClientSideDelete="false"
        UseUniformKey="true"
        AddButtonText="Add a Campaign"                                                       
    />
   
</asiweb:PanelTemplateControl2>