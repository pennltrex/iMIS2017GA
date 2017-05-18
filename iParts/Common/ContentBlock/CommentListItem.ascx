<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommentListItem.ascx.cs" Inherits="Asi.Web.iParts.Common.ContentBlock.CommentListItem" %>
<%@ Import Namespace="Asi" %>
<%@ Register TagName="EditLink" TagPrefix="PostManagement" Src="EditLink.ascx" %>
<%@ Register TagName="AttachmentList" TagPrefix="PostManagement" Src="AttachmentList.ascx" %>
<%@ Register TagName="AttachmentManager" TagPrefix="PostManagement" Src="AttachmentManager.ascx" %>
<%@ Register TagPrefix="asiweb" Namespace="Asi.Web.UI.WebControls" Assembly="Asi.Web" %>

<asp:literal id="Anchor" Runat="server"/> 
<div class="ClearFix"> 
    <div class="FloatLeft" style="width:100%">				
	    <asiweb:SmartControl runat="server" BoundPropertyName="Title" ID="NameLinkControl" CssClass="ContentBlockCommentTitle" DisplayType="ReadOnlyField" DisplayCaption="false" HtmlEncode="true" Font-Bold="true" />
    </div>		
    <div class="FloatRight">	
	    <asp:Label runat="server" ID="NewItemLabel" Visible="false" Text="new" CssClass="Important" />
    </div>
    <asp:Label runat="server" ID="PendingItemLabel" Visible="false" Text="Awaiting approval" />
</div>
<asp:Panel ID="CommentInfoPanel" runat="server" CssClass="PublishDate ClearFix Section">  

        <asiweb:StyledLabel runat="server" ID="Posted" />
        <asiweb:BusinessLabel runat="server" DisplayValue="true" BoundPropertyName="CreatedOn" ID="PostedDateControl" />
        <asiweb:StyledLabel runat="server" ID="PostedBy" />
        <asiweb:StyledLabel runat="server" ID="CreatedByUser" /> 
  
</asp:Panel>

<asp:Panel ID="BodyControlPanel" runat="server" CssClass="ContentBlockCommentBody">           
    <asiweb:SmartControl runat="server" DisplayType="PlaceHolder" BoundPropertyName="body" ID="BodyControl" OnNeedBoundAtom="BodyControl_NeedBoundAtom"  HtmlEncode="<%# !ReplyOptions.AllowHtml %>" />
</asp:Panel>

<PostManagement:AttachmentList runat="server" ID="AttachmentList1" UseParentAtomObject="true" />

<div class="FloatRight">
    <PostManagement:EditLink runat="server" ID="EditLink1" ReplyOptionsSessionKey='<%# ReplyOptionsSessionKey %>'
        PanelTemplateTitle='<%# ResourceManager.GetPhrase("Edit", "Edit") %>' />
    <asp:LinkButton ID="DeleteItem" runat="server" CssClass="NotPrinted" CausesValidation="false" />
</div>
