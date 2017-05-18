<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_ContentManagement_DisplayTaggedList" Codebehind="DisplayTaggedList.ascx.cs" %>

<asiweb:PanelTemplateControl2 ID="ListTitle" runat="server" Collapsed="false" Collapsible="false" BorderStyle="None" Text="<%# TaggedListItem.ListTitle %>">
    <div class="TaggedListPanel">
        <asp:Repeater ID="TaggedListRepeater" runat="server"
            OnItemCreated="TaggedListRepeaterItemCreated" OnItemDataBound="TaggedListRepeaterItemDataBound">
            <ItemTemplate>
                <asp:PlaceHolder ID="TCTControlPlaceHolder" runat="server"/>
            </ItemTemplate>
            <FooterTemplate>
                <asp:Panel runat="server" translate="yes">
                    <asp:LinkButton ID="PreviousButton" runat="server" Text="previous" OnPreRender="PreviousButtonPreRender" OnClick="PreviousButtonClick" />
                    <asp:LinkButton ID="NextButton" runat="server" Text="next" OnPreRender="NextButtonPreRender" OnClick="NextButtonClick" style="margin-left:20px;"/>
                    <asp:LinkButton ID="ViewAllButton" runat="server" Text="<%# TaggedListItem.ViewAllMessage %>" CssClass="<%# TaggedListItem.ViewAllCssClass %>" OnPreRender="ViewAllButtonPreRender" OnClick="ViewAllButtonClick" style="margin-left: 20px;"/>
                </asp:Panel>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asiweb:PanelTemplateControl2>