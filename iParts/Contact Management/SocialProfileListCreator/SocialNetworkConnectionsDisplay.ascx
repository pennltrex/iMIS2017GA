<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SocialNetworkConnectionsDisplay.ascx.cs" Inherits="Asi.Web.iParts.ContactManagement.SocialProfileListCreator.SocialNetworkConnectionsDisplay" %>

<div id="DivSocialNetworks" runat="server" Visible="false">
    <div class="Section">
        <asp:Panel ID="SocialNetworkConnectionsPanel" runat="server"/> 
    </div>
    <div runat="server" ID="FacebookDisconnectDiv" class="Section" Visible="False">                
        <asp:Image ID="FacebookSocialNetworkImage" runat="server" SkinID="SocialNetworkImage" />      
        Connected to Facebook account: <asp:Label ID="FacebookNameLabel" runat="server" CssClass="Label NoWrap" Visible="False"></asp:Label> <asp:LinkButton ID="FacebookDisconnectButton" OnClick="DisconnectOnClick" OnClientClick="return confirm('Disconnect social network?');" runat="server">Disconnect</asp:LinkButton>
    </div>
    <div runat="server" ID="LinkedInDisconnectDiv" class="Section" Visible="False">                
        <asp:Image ID="LinkedInSocialNetworkImage" runat="server" SkinID="SocialNetworkImage" />      
        Connected to LinkedIn account: <asp:Label ID="LinkedInNameLabel" runat="server" CssClass="Label NoWrap" Visible="False"></asp:Label> <asp:LinkButton ID="LinkedInDisconnectButton" OnClick="DisconnectOnClick" OnClientClick="return confirm('Disconnect social network?');" runat="server">Disconnect</asp:LinkButton>
    </div>
    <div class="Section">
        <asp:Panel ID="PublicProfileLinksPanel" runat="server"/>  
    </div>
</div>