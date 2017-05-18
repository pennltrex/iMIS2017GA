<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PostListItem.ascx.cs" Inherits="Asi.Web.iParts.Common.ContentBlock.PostListItem" %>
<%@ Register TagName="EditLink" TagPrefix="PostManagement" Src="EditLink.ascx" %>
<%@ Register TagName="ReplyLink" TagPrefix="PostManagement" Src="ReplyLink.ascx" %>
<%@ Register TagName="AttachmentManager" TagPrefix="PostManagement" Src="AttachmentManager.ascx" %>
<%@ Register TagName="AttachmentList" TagPrefix="PostManagement" Src="AttachmentList.ascx" %>
<%@ Register tagName="ShareThis" tagPrefix="Social" src="~/iParts/Social/SocialShare/SocialShareDisplay.ascx" %>

<script type="text/javascript">
	//<![CDATA[
	function EditPost_Callback(dialogWindow) {
		if (dialogWindow.IsDirty)
		    top.location.href = top.location.href;
	}
	//]]>
</script>
<asiweb:PanelTemplateControl2 ID="PostPanel" runat="server" Collapsible="false" BorderStyle="None">
    <div class="ClearFix">
	    <h3 style="display:inline;" class="ContentBlockPostTitle">	
		    <asiweb:BusinessHyperLink runat="server" ID="NameLinkControl" BoundPropertyName="AtomKey" BoundDisplayPropertyName="Title" OnNeedBoundAtom="NameLink_NeedBoundAtom" NavigateType="SameWindow" />
		    <asiweb:BusinessHtmlGeneric runat="server" ID="NameTextControl" BoundPropertyName="Title" TagName="div" HtmlEncode="False" />
	    </h3>
	    <Social:ShareThis runat="server" ID="ShareThis1" Collapsible="false" CssClass="ShareThisInline PanelNoPadding Section" />
	    <asp:Label runat="server" ID="NewItemLabel" Visible="false" Text="new" CssClass="Important FloatRight" />
    </div>

    <asp:Panel ID="PostInfoPanel" runat="server" CssClass="PublishDate ClearFix Section">
        <em>
	        <asiweb:StyledLabel runat="server" ID="Posted" />
	        <asiweb:BusinessLabel runat="server" DisplayValue="true" BoundPropertyName="CreatedOn" ID="PostedDateControl" />
	        <asiweb:StyledLabel runat="server" ID="PostedBy"></asiweb:StyledLabel>
	        <asiweb:StyledLabel runat="server" ID="CreatedByUser"></asiweb:StyledLabel>
        </em> 
    </asp:Panel>  

    <asp:Panel ID="BodyControlPanel" runat="server">        
	    <asiweb:BusinessHtmlGeneric runat="server" ID="BodyControl" CssClass="ContentBlockPostBody Section" BoundPropertyName="Body" TagName="div" HtmlEncode="False" />
    </asp:Panel> 

    <PostManagement:AttachmentList runat="server" ID="AttachmentList1" UseParentAtomObject="true" />

    <asp:Panel ID="ReplyInfoPanel" runat="server" CssClass="PublishDate ClearFix FloatRight">  
	    <em><asp:Literal ID="LastCommentControl" runat="server" /></em> 
    </asp:Panel>      

    <div class="FloatRight">
	    <asp:Label ID="ReplyCountLabel" runat="server"/>
	    <asp:LinkButton ID="AddChildLink" runat="server" />
	    <PostManagement:ReplyLink runat="server" ID="ReplyLink1" ReplyOptionsSessionKey='<%# ReplyOptionsSessionKey %>' />
	    <PostManagement:EditLink runat="server" ID="EditLink1" />
	    <asp:LinkButton ID="DeleteItem" runat="server" CssClass="NotPrinted" CausesValidation="false" OnClick="DeleteItem_Click" />
    </div>

    <asp:Button runat="server" id="AddChildPostTrigger" style="display:none" />
</asiweb:PanelTemplateControl2>
