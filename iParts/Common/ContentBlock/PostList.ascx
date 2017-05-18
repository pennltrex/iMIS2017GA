<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PostList.ascx.cs" Inherits="Asi.Web.iParts.Common.ContentBlock.PostList" %>
<%@ Reference Control="PostListItem.ascx" %>
<%@ Reference Control="PostHome.ascx" %>

<asp:Panel ID="ScriptPanel" runat="server">
    <script type="text/javascript">
        //<![CDATA[
        function AddPost_Callback_<%= ClientID %>(dialogWindow) {
            // Trigger a postback when a Post is added.
            if (dialogWindow.IsDirty)
                window.location.href = window.location.href;
                
        }
        //]]>
    </script>
</asp:Panel>

    <asp:LinkButton ID="AddPost" runat="server" CssClass="NotPrinted" style="display:none"></asp:LinkButton>
    <asp:HyperLink ID="Configure" runat="server" CssClass="NotPrinted" visible="false"></asp:HyperLink>

<asp:Repeater runat="server" ID="PostListItemRepeater" DataSource="<%#GetPostList()%>">
    <HeaderTemplate>
        <div id='<%=string.Format("{0}_PostListTable", ClientID) %>' class="CommunityRepeaterTable">
    </HeaderTemplate>
    <ItemTemplate>
        <div><asp:PlaceHolder runat="server" ID="PostPlaceHolder" /></div>
    </ItemTemplate>
    <FooterTemplate>
        </div>
   </FooterTemplate>
</asp:Repeater>       
<asp:Panel ID="PagingPanel" runat="server" Visible="false"> 
    <table><tr>
        <td><asp:HyperLink ID="Previous" runat="server" CssClass="NotPrinted"></asp:HyperLink></td>
        <td><asp:Panel ID="PagesPanel" runat="server" cssclass="NotPrinted"></asp:Panel></td>
        <td><asp:HyperLink ID="Next" runat="server" CssClass="NotPrinted"></asp:HyperLink></td>
        <td><asp:HyperLink ID="ViewAll" runat="server" CssClass="NotPrinted"></asp:HyperLink></td>
    </tr></table>      
</asp:Panel>        

