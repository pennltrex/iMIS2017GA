<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Common_Preferences" Codebehind="Preferences.ascx.cs" %>

<div class="CommunityItemActionLinks" ID="btnCloseDiv" runat="server" > 
    <asiweb:StyledButton ID="btnClose" runat="server" OnClick="btnClose_Click" CommandButtonType="Ok" Visible="false" />
</div>

<asiweb:PanelTemplateControl2 ID="PreferencesListPanel" runat="server" Collapsed="false" Collapsible="false">

<%-- Disabling ajax on this lister because other controls on the containing page may need
    a refresh when unsubscribing from an item. Like when unsubscribing from a community,
    the left nav 'unsubscribe' link needs to be refreshed. --%>

    <asiweb:Lister2 ID="SubscriptionsLister" runat="server"
    AjaxEnabled="false"
    EditColumnLocation="None" 
    DeleteColumnLocation="End" 
    EnableClientSideDelete="false"
    SelectColumnLocation="None"
    DeleteColumnButtonType="Link" 
    DataKeyNames="CommunityDocumentKey"
    DisplayPropertiesList="Community,Type,Title" 
    DisplayPropertiesTitleOverride="Community,Type,Title"       
    DeleteConfirmText="Are you sure you wish to unsubscribe from this item?"
    OnNeedDataSource="Subscriptions_NeedDataSource" 
    OnItemDeleted="Subscriptions_Unsubscribe"
    NoRecordsText="No items are currently being followed." 
    PagingEnabled="true" 
    PageSize="20"  
    TargetUrlKeyParameterName="iUniformKey"
    OnItemDataBound="SubscriptionsLister_OnItemDataBound"
    TargetUrl="~/iCore/Communities/CommunityLayouts/CommunityNewsFeed.aspx"
    LinkProperty="Title"
    LinkPropertyTargetBehavior="SameWindow"
    />
       
    <asiweb:Lister2 ID="SubscriptionsListerViewOnly" runat="server"
    AjaxEnabled="true"
    EditColumnLocation="None" 
    DeleteColumnLocation="None" 
    EnableClientSideDelete="false"
    SelectColumnLocation="None"
    DataKeyNames="CommunityDocumentKey"
    DisplayPropertiesList="Title" 
    DisplayPropertiesTitleOverride="Title"       
    OnNeedDataSource="Subscriptions_NeedDataSource" 
    NoRecordsText="You are not subscribed to any items." 
    PagingEnabled="true" 
    PageSize="20"  
    TargetUrlKeyParameterName="iUniformKey"
    OnItemDataBound="SubscriptionsLister_OnItemDataBound"
    TargetUrl="~/iCore/Communities/CommunityLayouts/CommunityNewsFeed.aspx"       
    LinkProperty="Title"
    LinkPropertyTargetBehavior="SameWindow"
    />
                   
</asiweb:PanelTemplateControl2> 


<script type="text/javascript">
    // Disable ability to focus/click on the up/down arrows for sorting, as they do not work for some reason (?).
    jQuery(document).ready(function() {
        jQuery(".rgSortAsc").prop("disabled", true);
        jQuery(".rgSortDesc").prop("disabled", true);
    });
</script>