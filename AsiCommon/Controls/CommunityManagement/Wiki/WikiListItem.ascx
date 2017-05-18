<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Wiki_WikiListItem" Codebehind="WikiListItem.ascx.cs" %>
<%@ Register TagName="SubscribeLink" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Common/SubscriptionLink.ascx" %>
<%@ Register TagName="EditLink" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Common/EditLink.ascx" %>

<div class="CommunityWikiItem">
    
    <div class="CommunityNewItem">
        <asp:Label runat="server" ID="NewItemLabel" Visible="false" Text="new" />
    </div>

    <asiweb:BusinessHyperLink runat="server" ID="NameLinkControl" BoundDisplayPropertyName="Title" CssClass="CommunityItemTitle" OnNeedBoundAtom="NameLink_NeedBoundAtom" NavigateType="SameWindow" translate="no" />
    	
    <div class="CommunityDateLine">
        By 
        <asp:hyperlink id="ContentItemAuthorUrl" runat="server">
            <asiweb:SmartControl runat="server" BoundPropertyName="CreatedByUserKey" ID="PostedByControl" DataTextField="FullName" DisplayType="ReadOnlyField" DisplayCaption="false" CssClass="CommunityItemAuthor" />
        </asp:hyperlink>     
        on <asiweb:SmartControl runat="server" BoundPropertyName="CreatedOn" ID="PostedDateControl" DisplayType="ReadOnlyField" DisplayCaption="false" CssClass="CommunityItemDate" />             
    </div>       
       
    <asiweb:SmartControl runat="server" BoundPropertyName="Body" ID="BodyControl" DisplayType="ReadOnlyField" DisplayCaption="false" CssClass="CommunityItemBody" HIControlType="HTMLEditor" />

    <div class="CommunityItemFooter">
        <div class="CommunityItemActionLinks">
            <asp:HyperLink ID="lnkViewItem" runat="server"/>
            <Communities:SubscribeLink runat="server" ID="SubscribeLink1" />
            <asp:HyperLink ID="lnkReportItem" runat="server" CssClass="NotPrinted"/>
            <Communities:EditLink runat="server" ID="EditLink1" />
            <asp:LinkButton ID="lnkDeleteItem" runat="server" CssClass="NotPrinted" CausesValidation="false"/>
        </div>
    </div>
</div>
