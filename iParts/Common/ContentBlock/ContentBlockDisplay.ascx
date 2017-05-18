<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContentBlockDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.ContentBlock.ContentBlockDisplay" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>
<%@ Register TagPrefix="asiweb" Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" %>
<%@ Register TagPrefix="ContentBlock" TagName="PostList" Src="PostList.ascx" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true" CssClass="ContentBlock">
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" />    
    <ContentBlock:PostList id="PostList1" runat="server" />
</asp:Panel>       
