<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LogViewerForWebServicesDisplay.ascx.cs" Inherits="Asi.Web.iParts.Common.LogViewerForWebServices.LogViewerForWebServicesDisplay" %>
<%@ Register Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" TagPrefix="asiweb" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" />         
    <asp:placeholder id="iPartControlsPlaceholder" Runat="server"></asp:placeholder>    
</asp:Panel>