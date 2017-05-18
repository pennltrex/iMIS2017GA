<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_ContentManagement_SearchResultRow" Codebehind="SearchResultRow.ascx.cs" %>
<div class="SearchResultSummary">
    <div class="ListItemTitle SearchResultLink">
        <asp:HyperLink ID="ResultLink" runat="server" CssClass="ClearFix"><asiweb:BusinessLabel runat="server" ID="ResultTitle"></asiweb:BusinessLabel></asp:HyperLink>
    </div>
    <div class="SearchResult ClearFix">
        <div class="ImageSection" id="ImageSection" runat="server">
            <asp:HyperLink runat="server" ID="ResultImageLink">
                <asp:Image Visible="false" CssClass="SearchResultAdditionalImage" ID="AdditionalImage" runat="server" ></asp:Image>
            </asp:HyperLink>
        </div>
        <div class="Description" runat="server" id="SearchResultsDiv">
            <asp:Label ID="PublicationDateLiteral" runat="server" CssClass="PublishDate"></asp:Label>
            <asp:Label ID="AbstractLabel" runat="server"></asp:Label>
        </div>
        <div id="ResultRankContainer" class="ResultRankLabel" runat="server">
            <asp:Label ID="RankLabel" runat="server"></asp:Label>
        </div>
    </div>
</div>
