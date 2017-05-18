<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Comment_CommentListItem" Codebehind="CommentListItem.ascx.cs" %>
<%@ Register TagName="EditLink" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Common/EditLink.ascx" %>
<%@ Register TagName="AttachmentList" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Common/AttachmentList.ascx" %>
<%@ Register TagName="AttachmentManager" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Common/AttachmentManager.ascx" %>
<%@ Register TagName="ApproveDeclineLink" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Common/ApproveDeclineLink.ascx" %>

<div class="CommunityCommentItem">
    <asp:literal id="ltrlAnchor" Runat="server"/> 
     
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
            <strong><asp:Label runat="server" ID="NameLinkControl2" translate="no" /></strong>
            <asiweb:SmartControl runat="server" BoundPropertyName="Title" ID="NameLinkControl" DisplayType="ReadOnlyField" DisplayCaption="false" CssClass="CommunityItemTitle" HtmlEncode="true" Visible="False" translate="no" />
            <div class="CommunityDateLine">
                By 
                <asp:hyperlink id="ContentItemAuthorUrl" runat="server">
                    <asiweb:SmartControl runat="server" BoundPropertyName="CreatedByUserKey" ID="PostedByControl" DataTextField="FullName" DisplayType="ReadOnlyField" DisplayCaption="false" CssClass="CommunityItemAuthor" />            
                </asp:hyperlink>     
                on <asiweb:SmartControl runat="server" BoundPropertyName="CreatedOn" ID="PostedDateControl" DisplayType="ReadOnlyField" DisplayCaption="false" CssClass="CommunityItemDate" /> 
            </div>      
        </div> 
	</div> 

    <div class="CommunityAwaitingApprovalItem">
        <asp:Label runat="server" ID="PendingItemLabel" Visible="false" Text="awaiting approval" />
    </div>
    <div class="CommunityApproveDeclineLink">
        <Communities:ApproveDeclineLink runat="server" ID="ApproveLink1" Visible="false" />
        <Communities:ApproveDeclineLink runat="server" ID="DeclineLink1" Visible="false" />
    </div>    

    <div id="DivCommunityParentLink" class="CommunityParentLink" runat="server" translate="no">
        <asiweb:BusinessHyperLink runat="server" ID="ParentLinkControl" BoundPropertyName="AtomKey" BoundDisplayPropertyName="Title" OnNeedBoundAtom="ParentLink_NeedBoundAtom" NavigateType="SameWindow" HtmlEncode="true" />
    </div>
    
    <div class="CommunityItemBody">     
         <asiweb:BusinessHtmlGeneric runat="server" ID="BodyControl" BoundPropertyName="Body" TagName="div" HtmlEncode="<%# !CommunityDocument.AllowHtmlInPosts %>"  />
    </div>
    
    <div class="CommunityItemAttachments">
        <Communities:AttachmentList runat="server" ID="AttachmentList1" UseParentAtomObject="true" />
    </div>

    <div class="CommunityItemFooter">
        <div class="CommunityItemActionLinks">
            <asp:HyperLink ID="lnkReportItem" runat="server" CssClass="NotPrinted"/>
            <Communities:EditLink runat="server" ID="EditLink1" />
            <asp:LinkButton ID="lnkDeleteItem" runat="server" CssClass="NotPrinted" CausesValidation="false"/>
        </div>
    </div>
</div>
