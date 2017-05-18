<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_Navigation_PageClusterNavigation" Codebehind="PageClusterNavigation.ascx.cs" %>
<div id="clusterNavBarHead" class="PanelHead"><asp:Literal ID="ClusterNavPanelTitle" runat="server" /></div>
<div id="clusterNavBarBody">
    <asp:Repeater ID="ClusterLinksRepeater" runat="server" OnItemDataBound="Repeater_ItemDataBound">
        <ItemTemplate>
            <asp:HyperLink ID="ClusterLink" runat="server" CssClass="navlink" style="border-style:none;font-size:1em;"></asp:HyperLink>
        </ItemTemplate>
    </asp:Repeater>
</div>