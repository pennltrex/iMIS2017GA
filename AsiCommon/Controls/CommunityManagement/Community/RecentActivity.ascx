<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Community_RecentActivity" Codebehind="RecentActivity.ascx.cs" %>

<asiweb:PanelTemplateControl2 ID="RecentActivityPanel" runat="server" TemplateTitle="Recent activity" Collapsible="false" BorderStyle="None">
    <asp:Repeater ID="RecentActivityList" runat="server" OnItemCreated="RecentActivity_ItemCreated">
        <ItemTemplate>
            <div ID="ListItemPanel" runat="server"></div>
        </ItemTemplate>
        <SeparatorTemplate>
            <hr />
        </SeparatorTemplate>
    </asp:Repeater>
</asiweb:PanelTemplateControl2>