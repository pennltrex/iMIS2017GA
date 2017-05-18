<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PostHome.ascx.cs" Inherits="Asi.Web.iParts.Common.ContentBlock.PostHome" %>
<%@ Register TagName="PostListItem" TagPrefix="PostManagement" Src="PostListItem.ascx" %>
<%@ Register TagName="CommentList" TagPrefix="PostManagement" Src="CommentList.ascx" %>

<script type="text/javascript">
    //<![CDATA[
    function EditPost_Callback(dialogWindow)
    {
        if (dialogWindow.IsDirty) {
            top.location.href = top.location.href;
        }       
    }
    //]]>
</script>

<asiweb:PanelTemplateControl2 ID="PostPanel" runat="server" Collapsed="false" Collapsible="false" CssClass="ContentBlockPost" ShowBorder="True">
    <PostManagement:PostListItem runat="server" ID="PostListItem1" UseParentAtomObject="true" ShowLastComment="false" 
        OnItemDeleted="PostListItem_Deleted" ReplyOptionsSessionKey='<%# ReplyOptionsSessionKey %>' 
        ShowAddChildLink='<%# ReplyOptions.AllowChildPosts %>' TagKeys='<%# TagKeys %>' DefaultHtmlSessionKey='<%# DefaultHtmlSessionKey %>' />
    <asiweb:StyledHyperlink ID="ParentPostLink" runat="server" Text='<%# Asi.ResourceManager.GetWord("Up") %>' />
    <asp:Repeater ID="ChildPostList" runat="server" OnItemDataBound="ChildPostList_ItemDataBound">
        <HeaderTemplate>                
            <ul class="ChildPostList">
        </HeaderTemplate>
        <ItemTemplate>
            <li><asiweb:StyledHyperLink id="ChildPostLink" runat="server" /></li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>
    <a name="Comments"></a>
    <PostManagement:CommentList runat="server" ID="CommentList1" UseParentAtomObject="true" ReplyOptionsSessionKey='<%# ReplyOptionsSessionKey %>' />
</asiweb:PanelTemplateControl2>
<asp:Button runat="server" id="EditPostTrigger" style="display:none" Text=""></asp:Button>   

