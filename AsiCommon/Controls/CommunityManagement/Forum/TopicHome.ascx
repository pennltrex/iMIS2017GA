<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Forum_TopicHome" Codebehind="TopicHome.ascx.cs" %>
<%@ Register TagName="TopicListItem" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Forum/TopicListItem.ascx" %>
<%@ Register TagName="CommentList" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Comment/CommentList.ascx" %>
<%@ Register TagName="CommentConfigure" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Comment/CommentConfigure.ascx" %>

<script type="text/javascript">
    function EditTopic_Callback(dialogWindow)
    {
        // Trigger a postback when a Topic is added.
        if (dialogWindow.IsDirty)
            InitiateControlEventWithArgument('<%= editTopicTrigger.ClientID %>', "");       
    }
</script>
<div> 
    <asp:Panel ID="TopicPanel" runat="server">
        <Communities:TopicListItem runat="server" ID="TopicListItem1" EnableRepliesLink="false" UseParentAtomObject="true" ShowLastComment="false" OnItemDeleted="TopicListItem_Deleted" />
        <a name="Comments"></a>
        <Communities:CommentList runat="server" ID="CommentList1" UseParentAtomObject="true" />     
    </asp:Panel>
    <div class="NotPrinted CommunityReplyForm" runat="server" id="ReplyFormDiv" >
        <Communities:CommentConfigure runat="server" ID="CommentConfigure1" InlineMode="true" />
    </div>
    <asp:Button runat="server" id="editTopicTrigger" style="display:none" Text="Hidden Button"></asp:Button>   
</div>