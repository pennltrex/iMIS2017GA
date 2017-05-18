<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Common_RecentActivity" Codebehind="RecentActivity.ascx.cs" %>
<asiweb:PanelTemplateControl2 ID="RecentEntriesPanel" runat="server" Collapsible="false" BorderStyle="None">
    <asp:Repeater ID="RecentEntryList" runat="server">
        <ItemTemplate>
            <div class="RecentActivityItem"><asp:HyperLink ID="RecentItemLink" runat="server" translate="no"
                NavigateUrl='<%# Asi.Business.CommunityManagement.CommunityDocument.GetRelativeLink((Asi.Business.CommunityManagement.CommunityDocument)Container.DataItem,"&viewall=true") %>' Text='<%# System.Web.HttpUtility.HtmlEncode((string)Eval("Title")) %>'></asp:HyperLink></div>
        </ItemTemplate>
    </asp:Repeater>
</asiweb:PanelTemplateControl2>