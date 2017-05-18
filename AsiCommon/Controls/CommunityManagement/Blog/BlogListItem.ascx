<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Blog_BlogListItem" Codebehind="BlogListItem.ascx.cs" %>
<%@ Register TagName="SubscribeLink" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Common/SubscriptionLink.ascx" %>
<%@ Register TagName="EditLink" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Common/EditLink.ascx" %>

<div class="CommunityBlogItem">
       
    <div class="CommunityNewItem">
        <asp:Label runat="server" ID="NewItemLabel" Visible="false" Text="new" />
    </div>
         
    <asiweb:BusinessHyperLink runat="server" ID="NameLinkControl" BoundDisplayPropertyName="Title" CssClass="CommunityItemTitle" NavigateType="SameWindow" OnNeedBoundAtom="NameLink_NeedBoundAtom" translate="no" />
       
    <div class="CommunityItemBody">
        <asiweb:SmartControl runat="server" BoundPropertyName="Description" ID="SmartControl4" DisplayType="ReadOnlyField" DisplayCaption="false" HtmlEncode="true" translate="no" />
    </div>
    
    <div class="CommunityItemFooter">
        <div ID="ActionLinks" class="CommunityItemActionLinks" runat="server">
            <asp:HyperLink ID="lnkViewItem" runat="server"/>
            <Communities:SubscribeLink runat="server" ID="SubscribeLink1" />
            <Communities:EditLink runat="server" ID="EditLink1" />
            <asp:LinkButton ID="lnkDeleteItem" runat="server" CssClass="NotPrinted" CausesValidation="false"/>
        </div>
    </div>

</div>
