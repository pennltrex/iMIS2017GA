<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Forum_TopicList" Codebehind="TopicList.ascx.cs" %>
<%@ Register Src="~/AsiCommon/Controls/CommunityManagement/Forum/TopicListItem.ascx" TagPrefix="Cmty" TagName="TopicListItem" %>

<asp:Panel ID="ScriptPanel" runat="server">
    <script type="text/javascript">
        function EditTopic_Callback(dialogWindow)
        {
            // Trigger a postback when a Topic is added.
            if (dialogWindow.IsDirty)
                InitiateControlEventWithArgument('<%= editTopicTrigger.ClientID %>', "");       
        }
    </script>
</asp:Panel>
<asiweb:PanelTemplateControl2 ID="TopicListPanel" runat="server" Collapsed="false" Collapsible="false" BorderStyle="None">
    <div class="CommunityItemActionLinks"> 
        <asp:LinkButton ID="lnkAddTopic" runat="server" CssClass="NotPrinted"/>
        <asp:HyperLink ID="lnkConfigure" runat="server" CssClass="NotPrinted"/>
    </div>
    <asp:Repeater runat="server" ID="TopicListItemRepeater" DataSource="<%#GetTopicList()%>">
        <HeaderTemplate>
            <ul class="CommunityRepeaterList">
        </HeaderTemplate>
        <ItemTemplate>
            <li>
                <Cmty:TopicListItem ID="TopicListItem1" runat="server" 
                    AtomObject="<%#new Asi.Atom.IAtom[]{(Asi.Atom.IAtom)Container.DataItem}%>"></Cmty:TopicListItem>
                <hr />
            </li>      
        </ItemTemplate>
        <FooterTemplate>
            </ul>
       </FooterTemplate>
    </asp:Repeater>
       
    <asp:Panel ID="pnlPaging" runat="server" class="CommunityListPager" Visible="false"> 
        <asp:HyperLink ID="lnkPrevious" runat="server" CssClass="NotPrinted"/>
        <asp:PlaceHolder ID="listPages" runat="server" />
        <asp:HyperLink ID="lnkNext" runat="server" CssClass="NotPrinted"/>
        <asp:HyperLink ID="lnkViewAll" runat="server" CssClass="NotPrinted"/>
    </asp:Panel>    
    
    <asp:Button runat="server" id="editTopicTrigger" style="display:none" Text="Hidden Button"/>
</asiweb:PanelTemplateControl2>
