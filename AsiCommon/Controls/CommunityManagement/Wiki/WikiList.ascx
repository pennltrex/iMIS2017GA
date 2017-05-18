<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Wiki_WikiList" Codebehind="WikiList.ascx.cs" %>
<%@ Register Src="~/AsiCommon/Controls/CommunityManagement/Wiki/WikiListItem.ascx" TagPrefix="Cmty" TagName="WikiListItem" %>

<asp:Panel ID="ScriptPanel" runat="server">
    <script type="text/javascript">
        function EditWiki_Callback(dialogWindow)
        {
            // Trigger a postback when a Wiki is added.
            if (dialogWindow.IsDirty)
                InitiateControlEventWithArgument('<%= editWikiTrigger.ClientID %>', "");       
        }
    </script>
</asp:Panel>
<asiweb:PanelTemplateControl2 ID="WikiListPanel" runat="server" Collapsed="false" Collapsible="false" BorderStyle="None">
    <div class="CommunityItemActionLinks"> 
        <asp:LinkButton ID="lnkAddWiki" runat="server" CssClass="NotPrinted"/>
    </div>
    <asp:Repeater runat="server" ID="WikiListItemRepeater" DataSource="<%#GetWikiList()%>">
        <HeaderTemplate>
            <ul class="CommunityRepeaterList">
        </HeaderTemplate>
        <ItemTemplate>
            <li>
               <Cmty:WikiListItem ID="WikiListItem1" runat="server" 
                    AtomObject="<%#new[]{(Asi.Atom.IAtom)Container.DataItem}%>"></Cmty:WikiListItem>
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
    <asp:Button runat="server" id="editWikiTrigger" style="display:none" Text="Hidden Button"/>
</asiweb:PanelTemplateControl2>
