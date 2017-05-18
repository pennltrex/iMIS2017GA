<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Forum_ForumListItem" Codebehind="ForumListItem.ascx.cs" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagName="SubscribeLink" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Common/SubscriptionLink.ascx" %>
<%@ Register TagName="EditLink" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Common/EditLink.ascx" %>
<%@ Register TagName="ApproveDeclineLink" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Common/ApproveDeclineLink.ascx" %>

<div class="CommunityForumItem">
    
    <div class="CommunityNewItem">
        <asp:Label runat="server" ID="NewItemLabel" Visible="false" Text="new" />
    </div> 
        
    <asiweb:BusinessHyperLink runat="server" ID="NameLinkControl" BoundDisplayPropertyName="Title" CssClass="CommunityItemTitle" NavigateType="SameWindow" OnNeedBoundAtom="NameLink_NeedBoundAtom" DoNotTranslateText="True"/>
         
    <asiweb:SmartControl runat="server" BoundPropertyName="Description" ID="DescriptionControl" DisplayType="ReadOnlyField" DisplayCaption="false" CssClass="CommunityItemBody" translate="no" />

    <div class="CommunityItemFooter">
        <div class="CommunityItemActionLinks">
            <asp:HyperLink ID="lnkViewItem" runat="server"/>
            <Communities:SubscribeLink runat="server" ID="SubscribeLink1" />
            <Communities:EditLink runat="server" ID="EditLink1" />
            <asp:LinkButton ID="lnkDeleteItem" runat="server" CssClass="NotPrinted" CausesValidation="false"/>
        </div>
    </div>

</div>