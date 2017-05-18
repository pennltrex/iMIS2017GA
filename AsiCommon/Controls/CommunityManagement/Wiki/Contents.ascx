<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_CommunityManagement_Wiki_Contents" Codebehind="Contents.ascx.cs" %>

<asiweb:PanelTemplateControl2 ID="ContentsPanel" runat="server" Collapsible="false" TemplateTitle="Contents" CssClass="ContentsPanel" BorderStyle="None">
    <asp:Repeater ID="ContentsList" runat="server">
        <HeaderTemplate>
            <div class="ContentsListHeader"><asiweb:BusinessHyperLink ID="ContentsHeaderLink" runat="server" NavigateUrl='<%# Asi.Business.CommunityManagement.CommunityDocument.GetRelativeLink(CommunityDocument) %>' Text='<%# CommunityDocument.Title %>' DoNotTranslateText="True"></asiweb:BusinessHyperLink></div>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="ContentsListItem"><asiweb:BusinessHyperLink ID="RecentItemLink" runat="server" DoNotTranslateText="True"
                NavigateUrl='<%# Asi.Business.CommunityManagement.CommunityDocument.GetRelativeLink((Asi.Business.CommunityManagement.CommunityDocument)Container.DataItem,"&viewall=true") %>' Text='<%# GetPageNumber(1, Container) + " " + System.Web.HttpUtility.HtmlEncode((string)Eval("Title")) %>'></asiweb:BusinessHyperLink></div>
        </ItemTemplate>
    </asp:Repeater>
</asiweb:PanelTemplateControl2>