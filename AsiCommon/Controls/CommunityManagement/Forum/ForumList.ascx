<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Forum_ForumList" TargetSchema="http://schemas.microsoft.com/intellisense/ie5" Codebehind="ForumList.ascx.cs" %>
<%@ Register Src="~/AsiCommon/Controls/CommunityManagement/Forum/ForumListItem.ascx" TagPrefix="Cmty" TagName="ForumListItem" %>

<asp:Panel ID="ScriptPanel" runat="server">
    <script type="text/javascript">
        function EditForum_Callback(dialogWindow)
        {
            // Trigger a postback when a forum is added.
            if (dialogWindow.IsDirty)
                InitiateControlEventWithArgument('<%= editForumTrigger.ClientID %>', "");
        } 
    </script>
</asp:Panel>
<asiweb:PanelTemplateControl2 ID="ForumListPanel" runat="server" Collapsed="false" Collapsible="false" BorderStyle="None">
    
    <div class="CommunityItemActionLinks"> 
        <asp:LinkButton ID="lnkAddForum" runat="server" CssClass="NotPrinted"/>
    </div>
    
    <asp:Repeater runat="server" ID="ForumListItemRepeater" DataSource="<%#GetForumList()%>">
        <HeaderTemplate>
            <ul class="CommunityRepeaterList">
        </HeaderTemplate>
        <ItemTemplate>
            <li>
                <Cmty:ForumListItem ID="ForumListItem1" runat="server" 
                    AtomObject="<%#new Asi.Atom.IAtom[]{(Asi.Atom.IAtom)Container.DataItem}%>"></Cmty:ForumListItem>
                <hr />
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
       </FooterTemplate>
    </asp:Repeater> 
    
    <div class="CommunityItemActionLinks"> 
        <asp:HyperLink ID="lnkMore" runat="server" CssClass="NotPrinted" Visible="false"></asp:HyperLink>
    </div>
    
    <asp:Panel ID="pnlPaging" runat="server" class="CommunityListPager" Visible="false"> 
        <asp:HyperLink ID="lnkPrevious" runat="server" CssClass="NotPrinted"/>
        <asp:PlaceHolder ID="listPages" runat="server"/>
        <asp:HyperLink ID="lnkNext" runat="server" CssClass="NotPrinted"/>
        <asp:HyperLink ID="lnkViewAll" runat="server" CssClass="NotPrinted"/>
    </asp:Panel>
     
    <asp:Button runat="server" id="editForumTrigger" style="display:none" Text="Forum Submit"/>  
</asiweb:PanelTemplateControl2>
