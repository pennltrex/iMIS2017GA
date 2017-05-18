<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MainDisplay.ascx.cs" Inherits="Asi.Web.iParts.Fundraising.GiftAidDeclaration.MainDisplay" %>
<%@ Register Assembly="Asi.Web" Namespace="Asi.Web.UI.WebControls" TagPrefix="asiweb" %>

<asp:Panel ID="ContentPanel" runat="server" Visible="true">
    <asiweb:TitleBar ID="TitleBar" Text="<%#PageTitle%>" OptionsMenuBehavior="AlwaysDisplay" runat="server" />

    <asiweb:PanelTemplateControl ID="mainPanel" Text="Gift Aid" runat="server" FieldSet="true"
            ShowHeader="false" BorderStyle="None"  >
        
        <asp:placeholder id="controlsPlaceholder" Runat="server"></asp:placeholder>
    
    </asiweb:PanelTemplateControl>
</asp:Panel>