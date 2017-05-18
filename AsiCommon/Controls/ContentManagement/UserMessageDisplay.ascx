<%@ Control Language="C#" AutoEventWireup="true" Inherits="Asi.Web.UI.Common.ContentManagement.UserMessageDisplay" Codebehind="UserMessageDisplay.ascx.cs" %>
<asp:Panel id="Messages" CssClass="AsiMessage" Runat="server" Visible="False">
    <asp:Repeater ID="MessagesRepeater" Runat="server">
	    <HeaderTemplate>
		    <ul> <%--Closed off in the Footer--%>
	    </HeaderTemplate>
	    <ItemTemplate>
		    <li runat="server" ID="MessageItem">
			    <asp:Image ID="UserMessageIcon" runat="server" CssClass="iMISUserMessageIcon" />	
		        <asp:Panel ID="UserMessageText" runat="server" CssClass="AsiMessageText" />
		    </li>
	    </ItemTemplate>
	    <FooterTemplate>
		    </ul> <%--Opened in the Header--%>
	    </FooterTemplate>
    </asp:Repeater>
</asp:Panel>