<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Blog_EntryListItem" Codebehind="EntryListItem.ascx.cs" %>
<%@ Register TagName="SubscribeLink" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Common/SubscriptionLink.ascx" %>
<%@ Register TagName="EditLink" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Common/EditLink.ascx" %>
<%@ Register TagName="AttachmentManager" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Common/AttachmentManager.ascx" %>
<%@ Register TagName="AttachmentList" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Common/AttachmentList.ascx" %>

<div class="CommunityEntryItem">
   
    <div class="CommunityNewItem">
        <asp:Label runat="server" ID="NewItemLabel" Visible="false" Text="new" />
    </div>

	<div class="CommunityProfileTitle">
        <div class="CommunityProfilePicture">
            <asp:hyperlink id="ProfileImageUrl" runat="server">
                <asp:Image runat="server" ID="ProfileImage" AlternateText="Profile image" />
            </asp:HyperLink>
        </div>
        <div class="CommunityTitleDate">           
            <asiweb:BusinessHyperLink runat="server" ID="NameLinkControl" OnPreRender="ReplaceSpecialCharacters" BoundDisplayPropertyName="Title" CssClass="CommunityItemTitle" OnNeedBoundAtom="NameLink_NeedBoundAtom" NavigateType="SameWindow" HtmlEncode="true" translate="no" />
            <div class="CommunityDateLine">
                By 
                <asp:hyperlink id="ContentItemAuthorUrl" runat="server">
                    <asiweb:SmartControl runat="server" BoundPropertyName="CreatedByUserKey" ID="PostedByControl" DataTextField="FullName" DisplayType="ReadOnlyField" DisplayCaption="false" CssClass="CommunityItemAuthor" />   
                </asp:hyperlink>  
                on <asiweb:SmartControl runat="server" BoundPropertyName="CreatedOn" ID="PostedDateControl" DisplayType="ReadOnlyField" DisplayCaption="false" CssClass="CommunityItemDate" />
            </div>      
        </div> 
	</div> 
    <div style="clear:both"></div>

    <div id="DivCommunityParentLink" class="CommunityParentLink" runat="server" translate="no">
        <asiweb:BusinessHyperLink runat="server" ID="ParentLinkControl" BoundPropertyName="AtomKey" BoundDisplayPropertyName="Title" OnNeedBoundAtom="ParentLink_NeedBoundAtom" NavigateType="SameWindow" NavigateUrlFormatString="~/iCore/Communities/BlogDefault.aspx?iUniformKey={0}" HtmlEncode="true" />
    </div>
    
    <div class="CommunityItemBody">
        <asiweb:BusinessHtmlGeneric runat="server" ID="BodyControl" BoundPropertyName="Body" TagName="div" HtmlEncode="<%# !CommunityDocument.AllowHtmlInPosts %>"  />
    </div>
    
    <div class="CommunityItemAttachments">
        <Communities:AttachmentList runat="server" ID="AttachmentList1" UseParentAtomObject="true" />
    </div>

    <div class="CommunityItemFooter">
        <div class="CommunityLastComment">
            <asp:Literal ID="LastCommentControl" runat="server" />
        </div>
        <div class="CommunityItemActionLinks">
            <asp:HyperLink ID="lnkViewItem" runat="server"/>
            <Communities:SubscribeLink runat="server" ID="SubscribeLink1" />
            <asp:HyperLink ID="lnkReportItem" runat="server" CssClass="NotPrinted"/>
            <Communities:EditLink runat="server" ID="EditLink1" />
            <asp:LinkButton ID="lnkDeleteItem" runat="server" CssClass="NotPrinted" CausesValidation="false"/>
        </div>
    </div>
</div>
