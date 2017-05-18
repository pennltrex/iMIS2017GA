<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Blog_EntryHome" Codebehind="EntryHome.ascx.cs" %>
<%@ Register TagName="EntryListItem" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Blog/EntryListItem.ascx" %>
<%@ Register TagName="CommentList" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Comment/CommentList.ascx" %>
<%@ Register TagName="CommentConfigure" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Comment/CommentConfigure.ascx" %>

<script type="text/javascript">
    function EditEntry_Callback(dialogWindow)
    {
        // Trigger a postback when a Entry is added.
        if (dialogWindow.IsDirty)
            InitiateControlEventWithArgument('<%= editEntryTrigger.ClientID %>', "");       
    }
</script>

<div style="width:98%;">
    <asiweb:PanelTemplateControl2 ID="EntryPanel" runat="server" Collapsed="false" Collapsible="false" BorderStyle="None">
        <Communities:EntryListItem runat="server" ID="EntryListItem1" EnableRepliesLink="false" UseParentAtomObject="true" ShowLastComment="false" OnItemDeleted="EntryListItem_Deleted" />
        <a id="Comments" tabindex="-1"></a>
        <Communities:CommentList runat="server" ID="CommentList1" UseParentAtomObject="true" DisableCommentItemStyle="True" />
    </asiweb:PanelTemplateControl2>
    <div class="NotPrinted CommunityReplyForm" >
        <Communities:CommentConfigure runat="server" ID="CommentConfigure1" InlineMode="true" />
    </div>
    <asp:Button runat="server" id="editEntryTrigger" style="display:none" Text="Entry Submit"></asp:Button>
</div>

