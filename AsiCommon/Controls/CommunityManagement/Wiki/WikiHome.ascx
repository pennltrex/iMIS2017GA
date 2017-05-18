<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Wiki_WikiHome" Codebehind="WikiHome.ascx.cs" %>
<%@ Register TagName="WikiListItem" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Wiki/WikiListItem.ascx" %>
<%@ Register TagName="CommentList" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Comment/CommentList.ascx" %>
<%@ Register TagName="CommentConfigure" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Comment/CommentConfigure.ascx" %>

<script type="text/javascript">
    function EditWiki_Callback(dialogWindow)
    {
        // Trigger a postback when a Wiki is added.
        if (dialogWindow.IsDirty)
            InitiateControlEventWithArgument('<%= editWikiTrigger.ClientID %>', "");       
    }
</script>
<div style="width:98%;"> 
    <asiweb:PanelTemplateControl2 ID="WikiPanel" runat="server" Collapsed="false" Collapsible="false" BorderStyle="None">
        <Communities:WikiListItem runat="server" ID="WikiListItem1" EnableRepliesLink="false" UseParentAtomObject="true" ShowLastComment="false" OnItemDeleted="WikiListItem_Deleted" />
        <a name="Comments"></a>
        <div class="CommunityWikiItem"> 
            <Communities:CommentList runat="server" ID="CommentList1" UseParentAtomObject="true" />
        </div>
    </asiweb:PanelTemplateControl2>
    <div class="NotPrinted CommunityWikiReplyForm" >
        <Communities:CommentConfigure runat="server" ID="CommentConfigure1" InlineMode="true" />
    </div>
    <asp:Button runat="server" id="editWikiTrigger" style="display:none" Text="Hidden Button"></asp:Button>
</div>


