<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Blog_EntryList" Codebehind="EntryList.ascx.cs" %>
<%@ Register Src="~/AsiCommon/Controls/CommunityManagement/Blog/EntryListItem.ascx" TagPrefix="Cmty" TagName="EntryListItem" %>

<script type="text/javascript">
    function EditEntry_Callback(dialogWindow)
    {
        // Trigger a postback when a Entry is added.
        if (dialogWindow.IsDirty)
            InitiateControlEventWithArgument('<%= editEntryTrigger.ClientID %>', "");       
    }
</script>

<asiweb:PanelTemplateControl2 ID="EntryListPanel" runat="server" Collapsed="false" Collapsible="false" BorderStyle="None">

    <div class="CommunityItemActionLinks">
        <asp:LinkButton ID="lnkAddEntry" runat="server" CssClass="NotPrinted"/>
    </div>

    <asp:Repeater runat="server" ID="EntryListItemRepeater" DataSource="<%#GetEntryList()%>">
        <HeaderTemplate>
            <ul class="CommunityRepeaterList">
        </HeaderTemplate>
        <ItemTemplate>
            <li>
                <Cmty:EntryListItem ID="EntryListItem1" runat="server" 
                    AtomObject="<%#new Asi.Atom.IAtom[]{(Asi.Atom.IAtom)Container.DataItem}%>"></Cmty:EntryListItem>
                <hr />
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
    <asp:Button runat="server" id="editEntryTrigger" style="display:none" Text="Entry Submit"/>
</asiweb:PanelTemplateControl2>