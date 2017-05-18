<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Blog_BlogList" Codebehind="BlogList.ascx.cs" %>
<%@ Register Src="~/AsiCommon/Controls/CommunityManagement/Blog/BlogListItem.ascx" TagPrefix="Cmty" TagName="BlogListItem" %>

<asp:Panel ID="ScriptPanel" runat="server">
    <script type="text/javascript">
        function EditBlog_Callback(dialogWindow)
        {
            // Trigger a postback when a Blog is added.
            if (dialogWindow.IsDirty)
                InitiateControlEventWithArgument('<%= editBlogTrigger.ClientID %>', "");       
        }
    </script>
</asp:Panel>
<asiweb:PanelTemplateControl2 ID="BlogListPanel" runat="server" Collapsed="false" Collapsible="false" BorderStyle="None">
    <div class="CommunityItemActionLinks"> 
        <asp:LinkButton ID="lnkAddBlog" runat="server" CssClass="NotPrinted"/>
    </div>
    <asp:Repeater runat="server" ID="BlogListItemRepeater" DataSource="<%#GetBlogList()%>">
        <HeaderTemplate>
            <ul class="CommunityRepeaterList">
        </HeaderTemplate>
        <ItemTemplate>
            <li>
                <Cmty:BlogListItem ID="BlogListItem1" runat="server" 
                    AtomObject="<%#new Asi.Atom.IAtom[]{(Asi.Atom.IAtom)Container.DataItem}%>"></Cmty:BlogListItem>
                <hr />
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
       </FooterTemplate>
    </asp:Repeater>
    <div class="CommunityItemActionLinks"> 
        <asp:HyperLink ID="lnkMore" runat="server" CssClass="NotPrinted" Visible="false"/>
    </div>
    <asp:Panel ID="pnlPaging" runat="server" class="CommunityListPager" Visible="false">   
        <asp:HyperLink ID="lnkPrevious" runat="server" CssClass="NotPrinted"/>
        <asp:PlaceHolder ID="listPages" runat="server"/>
        <asp:HyperLink ID="lnkNext" runat="server" CssClass="NotPrinted"/>
        <asp:HyperLink ID="lnkViewAll" runat="server" CssClass="NotPrinted"/>
    </asp:Panel>        
    <asp:Button runat="server" id="editBlogTrigger" style="display:none" Text="Hidden Button"/>
</asiweb:PanelTemplateControl2>
