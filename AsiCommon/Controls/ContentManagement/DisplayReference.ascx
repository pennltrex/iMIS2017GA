<%@ Control Language="C#" AutoEventWireup="true" Inherits="AsiCommon_Controls_ContentManagement_DisplayReference" Codebehind="DisplayReference.ascx.cs" %>
<div runat="server" id="ContentLinkDiv" Visible="false">
    <asp:HyperLink ID="ContentLink" runat="server" />
    <asp:Literal ID="DescriptionControl" runat="server" Visible="false"></asp:Literal>
</div>
<asp:Label runat="server" ID="MissingContent" CssClass="Error" Visible="False">The referenced content was not found.</asp:Label>