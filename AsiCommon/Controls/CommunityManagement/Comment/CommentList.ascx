<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Comment_CommentList" Codebehind="CommentList.ascx.cs" %>
<%@ Register Src="~/AsiCommon/Controls/CommunityManagement/Comment/CommentListItem.ascx" TagPrefix="Cmty" TagName="CommentListItem" %>

<asp:Panel ID="ScriptPanel" runat="server">
    <script type="text/javascript">
        function EditComment_Callback(dialogWindow)
        {
            // Trigger a postback when a Topic is added.
            if (dialogWindow.IsDirty)
                InitiateControlEventWithArgument('<%= editCommentTrigger.ClientID %>', "");       
        }
    </script>
</asp:Panel>
<asiweb:PanelTemplateControl2 ID="CommentListPanel" runat="server" Collapsed="false" Collapsible="false" ShowHeader="false" ShowBorder="False" CssClass="PanelNoPadding">
    <asp:Repeater runat="server" ID="CommentListItemRepeater" DataSource="<%#GetCommentList()%>">
        <HeaderTemplate>
            <ul class="CommunityRepeaterList">
        </HeaderTemplate>
        <ItemTemplate>
            <li>
               <Cmty:CommentListItem ID="CommentListItem1" runat="server" UseParentAtomObject="false"
                    AtomObject="<%#new []{(Asi.Atom.IAtom)Container.DataItem}%>"></Cmty:CommentListItem>                    
                    <br />
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
       </FooterTemplate>
    </asp:Repeater>
    
    <asp:Panel ID="pnlPaging" runat="server" class="CommunityListPager" Visible="false"> 
        <asp:HyperLink ID="lnkPrevious" runat="server" CssClass="NotPrinted"/>
        <asp:PlaceHolder ID="listPages" runat="server"/>
        <asp:HyperLink ID="lnkNext" runat="server" CssClass="NotPrinted"/>
        <asp:HyperLink ID="lnkViewAll" runat="server" CssClass="NotPrinted"/>
    </asp:Panel>     
    
    <asp:Button runat="server" id="editCommentTrigger" style="display:none" Text="Edit Submit"/>
</asiweb:PanelTemplateControl2>