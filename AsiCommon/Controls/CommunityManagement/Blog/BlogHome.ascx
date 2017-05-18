<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Blog_BlogHome" Codebehind="BlogHome.ascx.cs" %>
<%@ Register TagName="BlogListItem" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Blog/BlogListItem.ascx" %>
<%@ Register TagName="EntryList" TagPrefix="Communities" Src="~/AsiCommon/Controls/CommunityManagement/Blog/EntryList.ascx" %>

<script type="text/javascript">
    function EditBlog_Callback(dialogWindow)
    {
        // Trigger a postback when a Blog is added.
        if (dialogWindow.IsDirty)
            InitiateControlEventWithArgument('<%= editBlogTrigger.ClientID %>', "");       
    }
</script>

<div style="width:98%;">
    <asiweb:StyledLabel runat="server" ID="errorLabel" Visible="False" CssClass="iMISUserMessageInformation" /> 
    <asiweb:PanelTemplateControl2 ID="BlogPanel" runat="server" Collapsed="false" Collapsible="false" BorderStyle="None">        
        <Communities:BlogListItem runat="server" ID="BlogListItem1" EnableRepliesLink="false" UseParentAtomObject="true" ShowLastComment="false" OnItemDeleted="BlogListItem_Deleted" />        
        <Communities:EntryList runat="server" ID="EntryList1" UseParentAtomObject="true" />
    </asiweb:PanelTemplateControl2>    
    <asp:Button runat="server" id="editBlogTrigger" style="display:none" Text="Hidden Button"></asp:Button>
</div>
