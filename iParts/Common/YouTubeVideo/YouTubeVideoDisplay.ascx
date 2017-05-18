<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="YouTubeVideoDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.YouTubeVideo.YouTubeVideoDisplay" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">    
    <asiweb:TitleBar ID="TitleBar" runat="server" Text="<%#PageTitle%>" />    
    <div id="youTube" runat="server">
        <iframe ID="youtubeFrame" runat="server" ></iframe>
    </div>
    <div id="designModePlaceHolder" runat="server" Visible="false">
        <div style="display:table-cell;vertical-align:middle;">YouTube Placeholder</div>
    </div>
</asp:Panel>       
