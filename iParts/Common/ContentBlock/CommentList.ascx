<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommentList.ascx.cs" Inherits="Asi.Web.iParts.Common.ContentBlock.CommentList" %>
<%@ Register Src="CommentListItem.ascx" TagPrefix="Post" TagName="CommentListItem" %>

<asp:Panel ID="ScriptPanel" runat="server">
    <script type="text/javascript">
        //<![CDATA[
        function EditComment_Callback(dialogWindow)
        {
            // Trigger a postback when a Topic is added.
            if (dialogWindow.IsDirty)
                InitiateControlEventWithArgument('<%= editCommentTrigger.ClientID %>', "");
        }
        //]]>
    </script>
</asp:Panel>
<div style="margin:8px;">
<asiweb:PanelTemplateControl ID="CommentListPanel" runat="server" Collapsed="false" Collapsible="false" ShowHeader="false" Width="100%">
    <asp:Repeater runat="server" ID="CommentListItemRepeater" DataSource="<%#GetCommentList()%>">
        <HeaderTemplate>
            <div id='<%= string.Format("{0}_CommentListTable", CommentListItemRepeater.ClientID) %>' class="CommunityRepeaterTable" >
        </HeaderTemplate>
        <ItemTemplate>
               <div><Post:CommentListItem ID="CommentListItem1" runat="server" UseParentAtomObject="false" ReplyOptionsSessionKey='<%# ReplyOptionsSessionKey %>' /></div>
        </ItemTemplate>
        <FooterTemplate>
            </div>
       </FooterTemplate>
    </asp:Repeater>
    
    <asp:Panel ID="PagingPanel" runat="server" Visible="false" CssClass="CommunityListPager">
         <asp:HyperLink ID="Previous" runat="server" CssClass="NotPrinted"></asp:HyperLink>
         <asp:PlaceHolder ID="PagesPanel" runat="server" ></asp:PlaceHolder>
         <asp:HyperLink ID="Next" runat="server" CssClass="NotPrinted"></asp:HyperLink>
         <asp:HyperLink ID="ViewAll" runat="server" CssClass="NotPrinted"></asp:HyperLink>	
    </asp:Panel>     
    
    <asp:Button runat="server" id="editCommentTrigger" style="display:none" Text=""></asp:Button>
</asiweb:PanelTemplateControl>
</div>