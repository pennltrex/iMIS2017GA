<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Blog_Archive" Codebehind="Archive.ascx.cs" %>
<%@ Import Namespace="Asi" %>

<asiweb:PanelTemplateControl2 ID="ArchivesPanel" runat="server" Collapsible="false" TemplateTitle="Archive" BorderStyle="None">
    <asp:Repeater ID="ArchiveList" runat="server">
        <ItemTemplate>
            <div class="ArchiveListItem"><asp:HyperLink ID="ArchiveLink" runat="server" NavigateUrl='<%# string.Format("~/iCore/Communities/BlogArchive.aspx?iUniformKey={0}&WebsiteKey={1}&ArchiveDate={2:yyyy-MM}", CommunityDocument.AtomKey, Asi.AppContext.CurrentContext.WebsiteKey, DateTime.ParseExact((string)Eval("ArchiveDate"), "MM/yyyy", System.Globalization.CultureInfo.InvariantCulture)) %>' Text='<%# DateTime.ParseExact((string)Eval("ArchiveDate"), "MM/yyyy", System.Globalization.CultureInfo.InvariantCulture).ToString("MMMM yyyy") %>'></asp:HyperLink></div>
        </ItemTemplate>
    </asp:Repeater>
</asiweb:PanelTemplateControl2>