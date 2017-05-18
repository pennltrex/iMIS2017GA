<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuickLinksDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.QuickLinks.QuickLinksDisplay" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

 <div id="DivWrapper" runat="server" class="BigButtonWrapper HasImage">
    <asp:Image ID="BigButtonImage" runat="server" style="padding-right: 5px;" />
    <div id="DivRight" runat="server" class="BigButtonLinkList">
        <asp:Repeater ID="LinkRepeater" runat="server" OnItemDataBound="LinkRepeater_ItemDataBound">
            <ItemTemplate>
                <asiweb:BusinessHyperLink ID="Link" runat="server"/>
                <br />
            </ItemTemplate>
        </asp:Repeater>
        <asp:Panel ID="ErrorPanel" runat="server" Visible="false">
            <asp:Label ID="ErrorMessage" runat="server"></asp:Label>
        </asp:Panel>
    </div>
</div>

