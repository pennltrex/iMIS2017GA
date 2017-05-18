<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Community_CommunitySummary" Codebehind="CommunitySummary.ascx.cs" %>
<%@ Register TagName="SubscribeLink" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Common/SubscriptionLink.ascx" %>
<%@ Register TagName="EditLink" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Common/EditLink.ascx" %>

<div class="CommunitySummaryBlock">
    <div class="CommunitySummaryImage">
        <asp:Image ID="CommunitySummaryImageControl" runat="server" />
    </div>
    
    <asiweb:BusinessHyperLink runat="server" ID="NameLinkControl" BoundPropertyName="AtomKey" BoundDisplayPropertyName="Title" CssClass="CommunityItemTitle" OnNeedBoundAtom="NameLink_NeedBoundAtom" NavigateType="SameWindow" translate="no" />
    <asiweb:SmartControl runat="server" BoundPropertyName="Description" ID="DescriptionControl" DisplayType="ReadOnlyField" DisplayCaption="false" CssClass="CommunityItemDescription ClearFix" translate="no" />
</div>

<asp:Panel ID="CommunitySideBarPanel" CssClass="CommunitySideBarTitle" runat="server">
    <div class="Section CommunityActionButtons">
        <div><Communities:SubscribeLink runat="server" ID="SubscribeLink1" UseCamelCase="true" UseButtonForLink="true" FollowCommunityOn="True"/></div>
        <div><Communities:EditLink runat="server" ID="EditLink1" UseCamelCase="true" /></div>
        <div><asp:HyperLink ID="NewEntryControl" runat="server" CssClass="NotPrinted" /></div>
    </div>

    <div class="Section" runat="server" ID="CommunitySearchWrapper">
        <asiweb:SimpleSearchField ID="CommunitySearchField" runat="server" AdvancedLinkVisible="false" InputCssClass="CommunitySideBarSearch" />
    </div>

    <div runat="server" ID="CommunityLinksBlock" class="CommunityLinksBlock">
        <asp:HyperLink ID="HomeLink" runat="server" Text="Home" />
        <asp:HyperLink ID="BlogsLink" runat="server" Text="Blogs" />
        <asp:HyperLink ID="ForumsLink" runat="server" Text="Discussions" />
        <asp:HyperLink ID="LibraryLink" runat="server" Text="Resource library" />
        <asp:HyperLink ID="WikisLink" runat="server" Text="Wikis" />
        <asp:HyperLink ID="RosterLink" runat="server" Text="Participants" />
        <asp:HyperLink ID="SecurityLink" runat="server" Text="Security" />
    </div>
</asp:Panel>
